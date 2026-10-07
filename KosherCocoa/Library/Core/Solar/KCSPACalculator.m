//
//  KCSPACalculator.m
//  KosherCocoa
//
//  Created by Pikachu on 10/7/26.
//

#import "KCSPACalculator.h"
#import "trigonometry.h"

/**
 *  Indicates what type of solar event (sunrise, sunset, noon or midnight) is being calculated.
 */
typedef NS_ENUM(NSInteger, KCSolarEvent) {
    /** A solar event related to sunrise */ KCSolarEventSunrise,
    /** A solar event related to sunset */ KCSolarEventSunset,
    /** A solar event related to noon */ KCSolarEventNoon,
    /** A solar event related to midnight */ KCSolarEventMidnight
};

@interface KCSPACalculator ()

- (double)getUTCSunRiseSet:(nonnull NSDate *)localDate geoLocation:(nonnull KCGeoLocation *)geoLocation zenith:(double)zenith adjustForElevation:(BOOL)adjustForElevation solarEvent:(KCSolarEvent)solarEvent;
- (double)solveRiseSet:(nonnull NSDate *)localDate geoLocation:(nonnull KCGeoLocation *)geoLocation adjustedZenith:(double)adjustedZenith solarEvent:(KCSolarEvent)solarEvent;
- (double)solveNoonMidnight:(double)julianDay lonWest:(double)lonWest solarEvent:(KCSolarEvent)solarEvent;
- (void)solarCoords:(double)julianDayUT into:(double[6])coords;
- (void)topocentric:(double)julianDayUT latitude:(double)latitude longitude:(double)longitude elevationMeters:(double)elevationMeters into:(double[3])topo;
- (double)topocentricTrueZenith:(double)julianDayUT latitude:(double)latitude longitude:(double)longitude elevationMeters:(double)elevationMeters;
- (double)refractionCorrection:(double)trueElevation;
- (double)equationOfTime:(double)julianDayUT;
- (double)getJulianDay:(nonnull NSDate *)date;
- (nullable NSDateComponents *)yearMonthAndDayFromDate:(nonnull NSDate *)date;
- (double)meanObliquity:(double)jme;
- (void)nutation:(double)jce into:(double[2])nut;
- (double)estimateDeltaT:(double)julianDay;

@end

@implementation KCSPACalculator
{
    BOOL _applyDeltaT;
    NSNumber * _Nullable _deltaTOverride;
    double _pressure;
    double _temperature;
}

- (id)initWithGeoLocation:(KCGeoLocation *)geolocation
{
    
    self = [super init];
    
    if (self)
    {
        [self setCalculatorName:@"NREL Solar Position Algorithm"];
        
        //
        //  If there's no GeoLocation, then
        //  create one for where the equator
        //  and the prime meridian meet.
        //
        
        
        if (!geolocation)
        {
            
            //
            //  Create the default KCGeoLocation
            //
            
            KCGeoLocation *tempG = [[KCGeoLocation alloc] initWithName:@"Default" andLatitude:0.0 andLongitude:0.0 andTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0.0]];
            
            //
            //  Assign it to the geoLoc object
            //
            
            geolocation = tempG;
            
        }
        
        //
        //  Store the geoLocation object
        //
        
        _geoLocation = geolocation;
        
        //
        //  SPA settings at their canonical defaults. These are not
        //  configurable in this port; see the header for the deviation note.
        //
        
        _applyDeltaT = YES;
        _deltaTOverride = nil;
        _pressure = 1013.25;
        _temperature = 10.0;
    }
    
    return self;
}

- (double)UTCSunriseForDate:(nonnull NSDate *)date andZenith:(double)zenith adjustForElevation:(BOOL)adjustForElevation {
    return [self getUTCSunRiseSet:date geoLocation:_geoLocation zenith:zenith adjustForElevation:adjustForElevation solarEvent:KCSolarEventSunrise];
}

- (double)UTCSunsetForDate:(nonnull NSDate *)date andZenith:(double)zenith adjustForElevation:(BOOL)adjustForElevation {
    return [self getUTCSunRiseSet:date geoLocation:_geoLocation zenith:zenith adjustForElevation:adjustForElevation solarEvent:KCSolarEventSunset];
}

/**
 *  Calculate UTC sunrise or sunset (or any twilight angle) in 24-hour format. The horizon geometry (refraction, the
 *  sun's radius and the elevation dip) is supplied entirely by the parent adjustZenith:forElevation:onDate:, so the SPA
 *  topocentric solution is solved for the un-refracted, parallax-corrected center of the Sun reaching that zenith.
 *
 *  @param localDate the date.
 *  @param geoLocation the observer location.
 *  @param zenith the (un-adjusted) zenith; adjusted by the parent before use.
 *  @param adjustForElevation whether to include the geometric elevation dip.
 *  @param solarEvent KCSolarEventSunrise or KCSolarEventSunset.
 *  @return the UTC time in hours, or NAN if the event does not occur (polar day / night).
 */
- (double)getUTCSunRiseSet:(NSDate *)localDate geoLocation:(KCGeoLocation *)geoLocation zenith:(double)zenith adjustForElevation:(BOOL)adjustForElevation solarEvent:(KCSolarEvent)solarEvent {
    double elevation = adjustForElevation ? self.geoLocation.altitude : 0;
    double adjustedZenith = [self adjustZenith:zenith forElevation:elevation onDate:localDate];
    double riseSet = [self solveRiseSet:localDate geoLocation:geoLocation adjustedZenith:adjustedZenith solarEvent:solarEvent];
    if (isnan(riseSet)) {
        return NAN;
    }
    riseSet = riseSet / 60;
    return fmod(fmod(riseSet, 24) + 24, 24);
}

/**
 *  Solve for the UTC time, in minutes after 0:00, at which the topocentric (parallax-corrected, un-refracted) center
 *  of the Sun reaches adjustedZenith. A first guess is taken from the closed-form hour-angle equation (geocentric
 *  declination at local noon), then refined by a secant iteration on the full SPA topocentric zenith.
 *
 *  @param localDate the date.
 *  @param geoLocation the observer location.
 *  @param adjustedZenith the target zenith (already including refraction / radius / dip from the parent).
 *  @param solarEvent KCSolarEventSunrise or KCSolarEventSunset.
 *  @return UTC minutes after 0:00, or NAN if the event does not occur.
 */
- (double)solveRiseSet:(NSDate *)localDate geoLocation:(KCGeoLocation *)geoLocation adjustedZenith:(double)adjustedZenith solarEvent:(KCSolarEvent)solarEvent {
    double jdDay = [self getJulianDay:localDate];
    double lonWest = -geoLocation.longitude;
    double lat = geoLocation.latitude;
    double elevation = geoLocation.altitude;

    // Closed-form first guess using the geocentric declination at local apparent noon.
    double noonMin = [self solveNoonMidnight:jdDay lonWest:lonWest solarEvent:KCSolarEventNoon];
    double noonCoords[6];
    [self solarCoords:jdDay + noonMin / 1440.0 into:noonCoords];
    double declNoon = noonCoords[1];
    double eot = [self equationOfTime:jdDay + noonMin / 1440.0];
    double cosH0 = (cosDeg(adjustedZenith) - sinDeg(lat) * sinDeg(declNoon))
            / (cosDeg(lat) * cosDeg(declNoon));
    if (cosH0 < -1.0 || cosH0 > 1.0) {
        return NAN; // sun never reaches this zenith (polar day / night)
    }
    double h0 = acosDeg(cosH0); // degrees, positive
    double signedH0 = (solarEvent == KCSolarEventSunrise) ? h0 : -h0; // Java names this "signed"; renamed since "signed" is a C keyword
    double guess = 720 + 4 * (lonWest - signedH0) - eot; // minutes

    // Secant refinement on f(t) = topocentricTrueZenith(t) - adjustedZenith.
    double t0 = guess;
    double t1 = guess + 0.5;
    double f0 = [self topocentricTrueZenith:jdDay + t0 / 1440.0 latitude:lat longitude:geoLocation.longitude elevationMeters:elevation] - adjustedZenith;
    double f1 = [self topocentricTrueZenith:jdDay + t1 / 1440.0 latitude:lat longitude:geoLocation.longitude elevationMeters:elevation] - adjustedZenith;
    for (int i = 0; i < 12 && fabs(f1) > 1e-9; i++) {
        double denom = (f1 - f0);
        if (denom == 0) {
            break;
        }
        double t2 = t1 - f1 * (t1 - t0) / denom;
        t0 = t1; f0 = f1;
        t1 = t2;
        f1 = [self topocentricTrueZenith:jdDay + t1 / 1440.0 latitude:lat longitude:geoLocation.longitude elevationMeters:elevation] - adjustedZenith;
    }
    return t1;
}

/**
 *  Solar transit (noon) or anti-transit (midnight) in UTC minutes after 0:00, using the high-accuracy SPA equation
 *  of time. Parallax has a negligible (sub-second) effect on transit time, so the geocentric equation of time is used.
 *
 *  @param julianDay the (UT) Julian day for 0:00.
 *  @param lonWest the observer longitude in degrees, positive west.
 *  @param solarEvent KCSolarEventNoon or KCSolarEventMidnight.
 *  @return UTC minutes after 0:00.
 */
- (double)solveNoonMidnight:(double)julianDay lonWest:(double)lonWest solarEvent:(KCSolarEvent)solarEvent {
    // Rigorous meridian solve: find the UT at which the Sun's apparent hour angle equals 0 (transit / noon)
    // or 180 (anti-transit / midnight).
    double lonEast = -lonWest;
    double targetHourAngle = (solarEvent == KCSolarEventNoon) ? 0.0 : 180.0;
    double dayFraction = ((solarEvent == KCSolarEventNoon) ? 0.5 : 1.0) - lonEast / 360.0;
    for (int i = 0; i < 3; i++) {
        double sc[6];
        [self solarCoords:julianDay + dayFraction into:sc];
        double alpha = sc[0]; // apparent right ascension (degrees)
        double nu = sc[3];    // apparent sidereal time at Greenwich (degrees)
        double hourAngle = fmod(fmod(nu + lonEast - alpha - targetHourAngle, 360) + 540, 360) - 180; // [-180, 180)
        dayFraction -= hourAngle / 360.0; // the Sun's hour angle advances 360 deg per solar day
    }
    return dayFraction * 1440.0; // UTC minutes after 0:00
}

/**
 *  Compute the Sun's geocentric apparent coordinates and the apparent sidereal time for the given UT Julian day.
 *
 *  @param julianDayUT the UT Julian day (including fractional day).
 *  @param coords on return: {alpha (geocentric apparent RA, deg 0-360), delta (geocentric apparent declination, deg),
 *         epsilon (true obliquity, deg), nu (apparent Greenwich sidereal time, deg 0-360), radius (AU),
 *         lambda (apparent longitude, deg)}.
 */
- (void)solarCoords:(double)julianDayUT into:(double[6])coords {
    double deltaTSeconds = _applyDeltaT ? (_deltaTOverride != nil ? [_deltaTOverride doubleValue] : [self estimateDeltaT:julianDayUT]) : 0.0;
    double jde = julianDayUT + deltaTSeconds / 86400.0;
    double jce = (jde - kJulianDayJan_1_2000) / kJulianDaysPerCentury;
    double jc = (julianDayUT - kJulianDayJan_1_2000) / kJulianDaysPerCentury;
    double jme = jce / 10.0;

    double earthL = toDegrees(sumVSOPSeries(kEarthLOrders, kEarthLCounts, kEarthLOrderCount, jme));
    double earthB = toDegrees(sumVSOPSeries(kEarthBOrders, kEarthBCounts, kEarthBOrderCount, jme));
    double radius = sumVSOPSeries(kEarthROrders, kEarthRCounts, kEarthROrderCount, jme); // AU

    double theta = fmod(earthL + 180.0, 360.0);   // geocentric longitude
    double beta = -earthB;                      // geocentric latitude

    double nut[2];
    [self nutation:jce into:nut];               // {deltaPsi, deltaEps} in degrees
    double epsilon = [self meanObliquity:jme] + nut[1];
    double aberration = -20.4898 / (3600.0 * radius); // degrees
    double lambda = theta + nut[0] + aberration;      // apparent longitude

    // apparent sidereal time at Greenwich
    double nu0 = 280.46061837 + 360.98564736629 * (julianDayUT - kJulianDayJan_1_2000)
            + 0.000387933 * jc * jc - jc * jc * jc / 38710000.0;
    nu0 = fmod(fmod(nu0, 360) + 360, 360);
    double nu = nu0 + nut[0] * cosDeg(epsilon);

    double alpha = toDegrees(atan2(
            sinDeg(lambda) * cosDeg(epsilon) - tanDeg(beta) * sinDeg(epsilon),
            cosDeg(lambda)));
    alpha = fmod(fmod(alpha, 360) + 360, 360);
    double delta = asinDeg(sinDeg(beta) * cosDeg(epsilon)
            + cosDeg(beta) * sinDeg(epsilon) * sinDeg(lambda));

    coords[0] = alpha;
    coords[1] = delta;
    coords[2] = epsilon;
    coords[3] = nu;
    coords[4] = radius;
    coords[5] = lambda;
}

/**
 *  Full SPA topocentric reduction (observer parallax + atmospheric refraction).
 *
 *  @param julianDayUT the UT Julian day.
 *  @param latitude observer latitude in degrees.
 *  @param longitude observer longitude in degrees, positive east.
 *  @param elevationMeters observer elevation in meters.
 *  @param topo on return: {trueElevation (topocentric, no refraction, deg), observedElevation
 *         (refraction-corrected, deg), azimuth (eastward from north, deg 0-360)}.
 */
- (void)topocentric:(double)julianDayUT latitude:(double)latitude longitude:(double)longitude elevationMeters:(double)elevationMeters into:(double[3])topo {
    double sc[6];
    [self solarCoords:julianDayUT into:sc];
    double alpha = sc[0], delta = sc[1], nu = sc[3], radius = sc[4];

    double h = fmod(nu + longitude - alpha, 360.0); // observer local hour angle (deg), positive west
    h = fmod(h + 360, 360);

    // equatorial horizontal parallax of the sun
    double xi = 8.794 / (3600.0 * radius); // degrees
    double u = atan(0.99664719 * tanDeg(latitude));
    double x = cos(u) + (elevationMeters / 6378140.0) * cosDeg(latitude);
    double y = 0.99664719 * sin(u) + (elevationMeters / 6378140.0) * sinDeg(latitude);

    double deltaAlpha = toDegrees(atan2(-x * sinDeg(xi) * sinDeg(h),
            cosDeg(delta) - x * sinDeg(xi) * cosDeg(h)));
    double deltaPrime = toDegrees(atan2(
            (sinDeg(delta) - y * sinDeg(xi)) * cosDeg(deltaAlpha),
            cosDeg(delta) - x * sinDeg(xi) * cosDeg(h))); // topocentric declination
    double hPrime = h - deltaAlpha; // topocentric local hour angle

    double e0 = asinDeg(sinDeg(latitude) * sinDeg(deltaPrime)
            + cosDeg(latitude) * cosDeg(deltaPrime) * cosDeg(hPrime)); // true (no refraction)

    double deltaE = [self refractionCorrection:e0]; // degrees
    double e = e0 + deltaE;                    // observed elevation

    double gamma = toDegrees(atan2(sinDeg(hPrime),
            cosDeg(hPrime) * sinDeg(latitude) - tanDeg(deltaPrime) * cosDeg(latitude)));
    double azimuth = fmod(gamma + 180.0, 360.0); // eastward from north
    azimuth = fmod(azimuth + 360, 360);

    topo[0] = e0;
    topo[1] = e;
    topo[2] = azimuth;
}

/**
 *  Topocentric true (un-refracted) zenith of the Sun's center, used by the rise/set solver so that refraction
 *  is supplied solely by the parent adjustZenith:forElevation:onDate:.
 *
 *  @param julianDayUT the UT Julian day.
 *  @param latitude observer latitude in degrees.
 *  @param longitude observer longitude in degrees, positive east.
 *  @param elevationMeters observer elevation in meters.
 *  @return the topocentric true zenith in degrees.
 */
- (double)topocentricTrueZenith:(double)julianDayUT latitude:(double)latitude longitude:(double)longitude elevationMeters:(double)elevationMeters {
    double topo[3];
    [self topocentric:julianDayUT latitude:latitude longitude:longitude elevationMeters:elevationMeters into:topo];
    return 90.0 - topo[0];
}

/**
 *  The SPA atmospheric-refraction correction (Reda and Andreas) in degrees. The horizon refraction parameter is the
 *  parent's refraction, and the pressure / temperature are the canonical defaults (not configurable in this port),
 *  so the model matches the canonical class's defaults.
 *
 *  @param trueElevation the true (un-refracted) topocentric elevation in degrees.
 *  @return the refraction correction in degrees to add to the true elevation.
 */
- (double)refractionCorrection:(double)trueElevation {
    double atmosRefract = self.refraction; // parent's configurable horizon refraction (degrees), default 34'
    // Fixed solar-radius constant (~16'), used only as a coarse below-horizon cutoff for refraction -
    // deliberately NOT the date-based apparent radius, since the seasonal ~16" variation is irrelevant to this gate.
    double sunRadius = self.solarRadius;
    if (trueElevation < -1.0 * (sunRadius + atmosRefract)) {
        return 0.0; // sun fully below the refracted horizon
    }
    return (_pressure / 1010.0) * (283.0 / (273.0 + _temperature))
            * 1.02 / (60.0 * tanDeg(trueElevation + 10.3 / (trueElevation + 5.11)));
}

/**
 *  The equation of time (apparent minus mean solar time) in minutes of time (Meeus chapter 28), built from the SPA
 *  geocentric apparent right ascension.
 *
 *  @param julianDayUT the UT Julian day.
 *  @return the equation of time in minutes.
 */
- (double)equationOfTime:(double)julianDayUT {
    double sc[6];
    [self solarCoords:julianDayUT into:sc];
    double alpha = sc[0], epsilon = sc[2];
    double deltaTSeconds = _applyDeltaT ? (_deltaTOverride != nil ? [_deltaTOverride doubleValue] : [self estimateDeltaT:julianDayUT]) : 0.0;
    double jme = ((julianDayUT + deltaTSeconds / 86400.0) - kJulianDayJan_1_2000) / kJulianDaysPerCentury / 10.0;
    double l0 = 280.4664567 + jme * (360007.6982779 + jme * (0.03032028
            + jme * (1.0 / 49931.0 - jme * (1.0 / 15300.0 + jme / 2000000.0))));
    l0 = fmod(fmod(l0, 360) + 360, 360);
    double nut[2];
    [self nutation:((julianDayUT + deltaTSeconds / 86400.0) - kJulianDayJan_1_2000) / kJulianDaysPerCentury into:nut];
    double deltaPsi = nut[0];
    double e = l0 - 0.0057183 - alpha + deltaPsi * cosDeg(epsilon); // degrees
    e = fmod(fmod(e + 180, 360) + 360, 360) - 180;
    return e * 4.0;
}

- (double)getJulianDay:(NSDate *)date {
    NSDateComponents *components = [self yearMonthAndDayFromDate:date];
    
    NSInteger year = components.year;
    NSInteger month = components.month;
    NSInteger day = components.day;

    if (month <= 2) {
        year -= 1;
        month += 12;
    }
    int a = ((int) year) / 100;//loses precison but that is how the java port does it
    int b = 2 - a + a / 4;

    return floor(365.25 * (year + 4716)) + floor(30.6001 * (month + 1)) + day + b - 1524.5;
}

// Mark: - Method to get day, month, and year

//
//  Break up a date object into day, month, year
//

- (nullable NSDateComponents *)yearMonthAndDayFromDate:(nonnull NSDate *)date
{
    
    //
    //  Create a calendar
    //
    
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    //
    //  Set up the date components
    //
    
    NSDateComponents *parts = [gregorianCalendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:date];
    
    return parts;
    
}

/**
 *  The mean obliquity of the ecliptic in degrees (SPA / Meeus 22.2 polynomial in U = JME/10).
 *
 *  @param jme Julian millennia of ephemeris time since J2000.0.
 *  @return mean obliquity in degrees.
 */
- (double)meanObliquity:(double)jme {
    double u = jme / 10.0;
    double seconds = 84381.448 - 4680.93 * u - 1.55 * u * u + 1999.25 * pow(u, 3) - 51.38 * pow(u, 4)
            - 249.67 * pow(u, 5) - 39.05 * pow(u, 6) + 7.12 * pow(u, 7) + 27.87 * pow(u, 8)
            + 5.79 * pow(u, 9) + 2.45 * pow(u, 10);
    return seconds / 3600.0;
}

/**
 *  Principal nutation terms in longitude (deltaPsi) and obliquity (deltaEps), returned in degrees (Meeus chapter 22,
 *  abridged).
 *
 *  @param jce Julian centuries of ephemeris time since J2000.0.
 *  @param nut on return: {deltaPsi, deltaEps} in degrees.
 */
- (void)nutation:(double)jce into:(double[2])nut {
    double t = jce;
    double omega = 125.04452 - 1934.136261 * t + 0.0020708 * t * t + t * t * t / 450000.0;
    double lSun = 280.4665 + 36000.7698 * t;
    double lMoon = 218.3165 + 481267.8813 * t;
    double deltaPsiArcsec = -17.20 * sinDeg(omega) - 1.32 * sinDeg(2 * lSun)
            - 0.23 * sinDeg(2 * lMoon) + 0.21 * sinDeg(2 * omega);
    double deltaEpsArcsec = 9.20 * cosDeg(omega) + 0.57 * cosDeg(2 * lSun)
            + 0.10 * cosDeg(2 * lMoon) - 0.09 * cosDeg(2 * omega);
    nut[0] = deltaPsiArcsec / 3600.0;
    nut[1] = deltaEpsArcsec / 3600.0;
}

/**
 *  Estimate Delta-T = TT-UT in seconds (Espenak and Meeus polynomials). Approximate but good to a few seconds for
 *  the modern era.
 *
 *  @param julianDay the (UT) Julian day.
 *  @return Delta-T in seconds.
 */
- (double)estimateDeltaT:(double)julianDay {
    double year = 2000.0 + (julianDay - kJulianDayJan_1_2000) / 365.25;
    double t;
    if (year >= 2005 && year < 2050) {
        t = year - 2000;
        return 62.92 + 0.32217 * t + 0.005589 * t * t;
    } else if (year >= 1986 && year < 2005) {
        t = year - 2000;
        return 63.86 + 0.3345 * t - 0.060374 * t * t + 0.0017275 * t * t * t
                + 0.000651814 * pow(t, 4) + 0.00002373599 * pow(t, 5);
    } else if (year >= 1961 && year < 1986) {
        t = year - 1975;
        return 45.45 + 1.067 * t - t * t / 260.0 - t * t * t / 718.0;
    } else if (year >= 2050 && year < 2150) {
        return -20 + 32 * pow((year - 1820) / 100.0, 2) - 0.5628 * (2150 - year);
    } else {
        double u = (year - 1820) / 100.0;
        return -20 + 32 * u * u;
    }
}


// ---------------------------------------------------------------------------------------------------------------
// Abridged VSOP87 Earth series (Meeus Appendix III). {A, B, C}; value = sum of A*cos(B + C*tau), tau in Julian
// millennia, result in 1e-8 rad (L, B) or 1e-8 AU (R). Validated to ~0.1" against Meeus's worked example.
// ---------------------------------------------------------------------------------------------------------------

/**
 *  Evaluate a VSOP87 series sum over n (sum of terms A*cos(B + C*tau)) * tau^n with coefficients in 1e-8 of the
 *  native unit (radians or AU).
 *
 *  @param orders the per-order term tables.
 *  @param counts the number of terms in each order.
 *  @param numOrders the number of orders.
 *  @param tau time in Julian millennia from J2000.0 (JME).
 *  @return the evaluated quantity (radians or AU).
 */
static double sumVSOPSeries(const double (*orders[])[3], const size_t counts[], size_t numOrders, double tau) {
    double total = 0.0;
    double tauPow = 1.0;
    for (size_t n = 0; n < numOrders; n++) {
        double sum = 0.0;
        for (size_t i = 0; i < counts[n]; i++) {
            sum += orders[n][i][0] * cos(orders[n][i][1] + orders[n][i][2] * tau);
        }
        total += sum * tauPow;
        tauPow *= tau;
    }
    return total / 1.0e8;
}

static const double EARTH_L0[][3] = {
            {175347046, 0, 0}, {3341656, 4.6692568, 6283.07585}, {34894, 4.6261, 12566.1517},
            {3497, 2.7441, 5753.3849}, {3418, 2.8289, 3.5231}, {3136, 3.6277, 77713.7715},
            {2676, 4.4181, 7860.4194}, {2343, 6.1352, 3930.2097}, {1324, 0.7425, 11506.7698},
            {1273, 2.0371, 529.6910}, {1199, 1.1096, 1577.3435}, {990, 5.233, 5884.927},
            {902, 2.045, 26.298}, {857, 3.508, 398.149}, {780, 1.179, 5223.694},
            {753, 2.533, 5507.553}, {505, 4.583, 18849.228}, {492, 4.205, 775.523},
            {357, 2.920, 0.067}, {317, 5.849, 11790.629}, {284, 1.899, 796.298},
            {271, 0.315, 10977.079}, {243, 0.345, 5486.778}, {206, 4.806, 2544.314},
            {205, 1.869, 5573.143}, {202, 2.458, 6069.777}, {156, 0.833, 213.299},
            {132, 3.411, 2942.463}, {126, 1.083, 20.775}, {115, 0.645, 0.980},
            {103, 0.636, 4694.003}, {102, 0.976, 15720.839}, {102, 4.267, 7.114},
            {99, 6.21, 2146.17}, {98, 0.68, 155.42}, {86, 5.98, 161000.69},
            {85, 1.30, 6275.96}, {85, 3.67, 71430.70}, {80, 1.81, 17260.15},
            {79, 3.04, 12036.46}, {75, 1.76, 5088.63}, {74, 3.50, 3154.69},
            {74, 4.68, 801.82}, {70, 0.83, 9437.76}, {62, 3.98, 8827.39},
            {61, 1.82, 7084.90}, {57, 2.78, 6286.60}, {56, 4.39, 14143.50},
            {56, 3.47, 6279.55}, {52, 0.19, 12139.55}, {52, 1.33, 1748.02},
            {51, 0.28, 5856.48}, {49, 0.49, 1194.45}, {41, 5.37, 8429.24},
            {41, 2.40, 19651.05}, {39, 6.17, 10447.39}, {37, 6.04, 10213.29},
            {37, 2.57, 1059.38}, {36, 1.71, 2352.87}, {36, 1.78, 6812.77},
            {33, 0.59, 17789.85}, {30, 0.44, 83996.85}, {30, 2.74, 1349.87},
            {25, 3.16, 4690.48}
};

static const double EARTH_L1[][3] = {
            {628331966747.0, 0, 0}, {206059, 2.678235, 6283.07585}, {4303, 2.6351, 12566.1517},
            {425, 1.590, 3.523}, {119, 5.796, 26.298}, {109, 2.966, 1577.344},
            {93, 2.59, 18849.23}, {72, 1.14, 529.69}, {68, 1.87, 398.15},
            {67, 4.41, 5507.55}, {59, 2.89, 5223.69}, {56, 2.17, 155.42},
            {45, 0.40, 796.30}, {36, 0.47, 775.52}, {29, 2.65, 7.11},
            {21, 5.34, 0.98}, {19, 1.85, 5486.78}, {19, 4.97, 213.30},
            {17, 2.99, 6275.96}, {16, 0.03, 2544.31}, {16, 1.43, 2146.17},
            {15, 1.21, 10977.08}, {12, 2.83, 1748.02}, {12, 3.26, 5088.63},
            {12, 5.27, 1194.45}, {12, 2.08, 4694.00}, {11, 0.77, 553.57},
            {10, 1.30, 6286.60}, {10, 4.24, 1349.87}, {9, 2.70, 242.73},
            {9, 5.64, 951.72}, {8, 5.30, 2352.87}, {6, 2.65, 9437.76},
            {6, 4.67, 4690.48}
};

static const double EARTH_L2[][3] = {
            {52919, 0, 0}, {8720, 1.0721, 6283.0758}, {309, 0.867, 12566.152},
            {27, 0.05, 3.52}, {16, 5.19, 26.30}, {16, 3.68, 155.42},
            {10, 0.76, 18849.23}, {9, 2.06, 77713.77}, {7, 0.83, 775.52},
            {5, 4.66, 1577.34}, {4, 1.03, 7.11}, {4, 3.44, 5573.14},
            {3, 5.14, 796.30}, {3, 6.05, 5507.55}, {3, 1.19, 242.73},
            {3, 6.12, 529.69}, {3, 0.31, 398.15}, {3, 2.28, 553.57},
            {2, 4.38, 5223.69}, {2, 3.75, 0.98}
};

static const double EARTH_L3[][3] = {
            {289, 5.844, 6283.076}, {35, 0, 0}, {17, 5.49, 12566.15},
            {3, 5.20, 155.42}, {1, 4.72, 3.52}, {1, 5.30, 18849.23}, {1, 5.97, 242.73}
};

static const double EARTH_L4[][3] = {
            {114, 3.142, 0}, {8, 4.13, 6283.08}, {1, 3.84, 12566.15}
};

static const double EARTH_L5[][3] = {
            {1, 3.14, 0}
};

static const double EARTH_B0[][3] = {
            {280, 3.199, 84334.662}, {102, 5.422, 5507.553}, {80, 3.88, 5223.69},
            {44, 3.70, 2352.87}, {32, 4.00, 1577.34}
};

static const double EARTH_B1[][3] = {
            {9, 3.90, 5507.55}, {6, 1.73, 5223.69}
};

static const double EARTH_R0[][3] = {
            {100013989, 0, 0}, {1670700, 3.0984635, 6283.07585}, {13956, 3.05525, 12566.1517},
            {3084, 5.1985, 77713.7715}, {1628, 1.1739, 5753.3849}, {1576, 2.8469, 7860.4194},
            {925, 5.453, 11506.770}, {542, 4.564, 3930.210}, {472, 3.661, 5884.927},
            {346, 0.964, 5507.553}, {329, 5.900, 5223.694}, {307, 0.299, 5573.143},
            {243, 4.273, 11790.629}, {212, 5.847, 1577.344}, {186, 5.022, 10977.079},
            {175, 3.012, 18849.228}, {110, 5.055, 5486.778}, {98, 0.89, 6069.78},
            {86, 5.69, 15720.84}, {86, 1.27, 161000.69}, {65, 0.27, 17260.15},
            {63, 0.92, 529.69}, {57, 2.01, 83996.85}, {56, 5.24, 71430.70},
            {49, 3.25, 2544.31}, {47, 2.58, 775.52}, {45, 5.54, 9437.76},
            {43, 6.01, 6275.96}, {39, 5.36, 4694.00}, {38, 2.39, 8827.39},
            {37, 0.83, 19651.05}, {37, 4.90, 12139.55}, {36, 1.67, 12036.46},
            {35, 1.84, 2942.46}, {33, 0.24, 7084.90}, {32, 0.18, 5088.63},
            {32, 1.78, 398.15}, {28, 1.21, 6286.60}, {28, 1.90, 6279.55},
            {26, 4.59, 10447.39}
};

static const double EARTH_R1[][3] = {
            {103019, 1.10749, 6283.07585}, {1721, 1.0644, 12566.1517}, {702, 3.142, 0},
            {32, 1.02, 18849.23}, {31, 2.84, 5507.55}, {25, 1.32, 5223.69},
            {18, 1.42, 1577.34}, {10, 5.91, 10977.08}, {9, 1.42, 6275.96}, {9, 0.27, 5486.78}
};

static const double EARTH_R2[][3] = {
            {4359, 5.7846, 6283.0758}, {124, 5.579, 12566.152}, {12, 3.14, 0},
            {9, 3.63, 77713.77}, {6, 1.87, 5573.14}, {3, 5.47, 18849.23}
};

static const double EARTH_R3[][3] = {
            {145, 4.273, 6283.076}, {7, 3.92, 12566.15}
};

static const double EARTH_R4[][3] = {
            {4, 2.56, 6283.08}
};
static const double (*kEarthLOrders[])[3] = { EARTH_L0, EARTH_L1, EARTH_L2, EARTH_L3, EARTH_L4, EARTH_L5 };
static const size_t kEarthLCounts[] = {
    sizeof(EARTH_L0) / sizeof(EARTH_L0[0]), sizeof(EARTH_L1) / sizeof(EARTH_L1[0]),
    sizeof(EARTH_L2) / sizeof(EARTH_L2[0]), sizeof(EARTH_L3) / sizeof(EARTH_L3[0]),
    sizeof(EARTH_L4) / sizeof(EARTH_L4[0]), sizeof(EARTH_L5) / sizeof(EARTH_L5[0])
};
static const size_t kEarthLOrderCount = 6;

static const double (*kEarthBOrders[])[3] = { EARTH_B0, EARTH_B1 };
static const size_t kEarthBCounts[] = {
    sizeof(EARTH_B0) / sizeof(EARTH_B0[0]), sizeof(EARTH_B1) / sizeof(EARTH_B1[0])
};
static const size_t kEarthBOrderCount = 2;

static const double (*kEarthROrders[])[3] = { EARTH_R0, EARTH_R1, EARTH_R2, EARTH_R3, EARTH_R4 };
static const size_t kEarthRCounts[] = {
    sizeof(EARTH_R0) / sizeof(EARTH_R0[0]), sizeof(EARTH_R1) / sizeof(EARTH_R1[0]),
    sizeof(EARTH_R2) / sizeof(EARTH_R2[0]), sizeof(EARTH_R3) / sizeof(EARTH_R3[0]),
    sizeof(EARTH_R4) / sizeof(EARTH_R4[0])
};
static const size_t kEarthROrderCount = 5;

@end
