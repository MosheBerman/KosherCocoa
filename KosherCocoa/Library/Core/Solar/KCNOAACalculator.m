//
//  KCNOAACalculator.m
//  KosherCocoa
//
//  Created by Elyahu on 1/23/23.
//

#import "KCNOAACalculator.h"
#import "trigonometry.h"

@implementation KCNOAACalculator

- (id)initWithGeoLocation:(KCGeoLocation *)geolocation
{
    
    self = [super init];
    
    if (self)
    {
        [self setCalculatorName:@"US National Oceanic and Atmospheric Administration Algorithm"];
        
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
    }
    
    return self;
}

- (double)getUTCSunrise:(NSDate *)calendar geoLocation:(KCGeoLocation *)geoLocation zenith:(double)zenith adjustForElevation:(BOOL)adjustForElevation {
    double elevation = adjustForElevation ? self.geoLocation.altitude : 0;
    double adjustedZenith = [self adjustZenith:zenith forElevation:elevation];

    double sunrise = [self getSunriseUTC:[self getJulianDay:calendar] latitude:geoLocation.latitude longitude:geoLocation.longitude zenith:adjustedZenith];
    sunrise = sunrise / 60;

    // ensure that the time is >= 0 and < 24
    while (sunrise < 0.0) {
        sunrise += 24.0;
    }
    while (sunrise >= 24.0) {
        sunrise -= 24.0;
    }
    return sunrise;
}

- (double)getUTCSunset:(NSDate *)calendar geoLocation:(KCGeoLocation *)geoLocation zenith:(double)zenith adjustForElevation:(BOOL)adjustForElevation {
    double elevation = adjustForElevation ? self.geoLocation.altitude : 0;
    double adjustedZenith = [self adjustZenith:zenith forElevation:elevation];

    double sunset = [self getSunsetUTC:[self getJulianDay:calendar] latitude:geoLocation.latitude longitude:geoLocation.longitude zenith:adjustedZenith];
    sunset = sunset / 60;

    // ensure that the time is >= 0 and < 24
    while (sunset < 0.0) {
        sunset += 24.0;
    }
    while (sunset >= 24.0) {
        sunset -= 24.0;
    }
    return sunset;
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

- (double)getJulianCenturiesFromJulianDay:(double)julianDay {
    return (julianDay - kJulianDayJan_1_2000) / kJulianDaysPerCentury;
}

- (double)getJulianDayFromJulianCenturies:(double)julianCenturies {
    return julianCenturies * kJulianDaysPerCentury + kJulianDayJan_1_2000;
}

- (double)getEquationOfTime:(double)julianCenturies {
    double epsilon = [self getObliquityCorrection:julianCenturies];
    double geomMeanLongSun = [self getSunGeometricMeanLongitude:julianCenturies];
    double eccentricityEarthOrbit = [self getEarthOrbitEccentricity:julianCenturies];
    double geomMeanAnomalySun = [self getSunGeometricMeanAnomaly:julianCenturies];
    
    double y = tan(toRadians(epsilon) / 2.0);
    y *= y;
    
    double sin2l0 = sin(2.0 * toRadians(geomMeanLongSun));
    double sinm = sin(toRadians(geomMeanAnomalySun));
    double cos2l0 = cos(2.0 * toRadians(geomMeanLongSun));
    double sin4l0 = sin(4.0 * toRadians(geomMeanLongSun));
    double sin2m = sin(2.0 * toRadians(geomMeanAnomalySun));
    
    double equationOfTime = y * sin2l0 - 2.0 * eccentricityEarthOrbit * sinm + 4.0 * eccentricityEarthOrbit * y * sinm * cos2l0 - 0.5 * y * y * sin4l0 - 1.25 * eccentricityEarthOrbit * eccentricityEarthOrbit * sin2m;
    return toDegrees(equationOfTime) * 4.0; // in minutes of time
}


- (double)getSunGeometricMeanLongitude:(double)julianCenturies {
    double longitude = 280.46646 + julianCenturies * (36000.76983 + 0.0003032 * julianCenturies);
    while (longitude > 360.0) {
        longitude -= 360.0;
    }
    while (longitude < 0.0) {
        longitude += 360.0;
    }

    return longitude; // in degrees
}

- (double)getSunGeometricMeanAnomaly:(double)julianCenturies {
    return 357.52911 + julianCenturies * (35999.05029 - 0.0001537 * julianCenturies); // in degrees
}

- (double)getEarthOrbitEccentricity:(double)julianCenturies {
    return 0.016708634 - julianCenturies * (0.000042037 + 0.0000001267 * julianCenturies);
}

- (double)getSunDeclination:(double)julianCenturies {
    double obliquityCorrection = [self getObliquityCorrection:julianCenturies];
    double lambda = [self getSunApparentLongitude:julianCenturies];
    
    double sint = sin(toRadians(obliquityCorrection)) * sin(toRadians(lambda));
    double theta = toDegrees(asin(sint));
    return theta; // in degrees
}

- (double)getMeanObliquityOfEcliptic:(double)julianCenturies {
    double seconds = 21.448 - julianCenturies * (46.8150 + julianCenturies * (0.00059 - julianCenturies * (0.001813)));
    return 23.0 + (26.0 + (seconds / 60.0)) / 60.0; // in degrees
}

- (double)getObliquityCorrection:(double)julianCenturies {
    double obliquityOfEcliptic = [self getMeanObliquityOfEcliptic:julianCenturies];
    
    double omega = 125.04 - 1934.136 * julianCenturies;
    return obliquityOfEcliptic + 0.00256 * cos(toRadians(omega)); // in degrees
}

- (double)getSunApparentLongitude:(double)julianCenturies {
    double sunTrueLongitude = [self getSunTrueLongitude:julianCenturies];

    double omega = 125.04 - 1934.136 * julianCenturies;
    double lambda = sunTrueLongitude - 0.00569 - 0.00478 * sin(toDegrees(omega));
    return lambda; // in degrees
}

- (double)getSunTrueLongitude:(double)julianCenturies {
    double sunLongitude = [self getSunGeometricMeanLongitude:julianCenturies];
    double center = [self getSunEquationOfCenter:julianCenturies];
    return sunLongitude + center;
}

- (double)getSunEquationOfCenter:(double)julianCenturies {
    double m = [self getSunGeometricMeanAnomaly:julianCenturies];

    double mrad = toRadians(m);
    double sinm = sin(mrad);
    double sin2m = sin(mrad + mrad);
    double sin3m = sin(mrad + mrad + mrad);

    return sinm * (1.914602 - julianCenturies * (0.004817 + 0.000014 * julianCenturies)) + sin2m
            * (0.019993 - 0.000101 * julianCenturies) + sin3m * 0.000289; // in degrees
}


- (double)getSunHourAngleAtSunrise:(double)lat solarDec:(double)solarDec zenith:(double)zenith {
    double latRad = toRadians(lat);
    double sdRad = toRadians(solarDec);
    return acos(cos(toRadians(zenith)) / (cos(latRad) * cos(sdRad)) - tan(latRad) * tan(sdRad)); // in radians
}

- (double)getSunHourAngleAtSunset:(double)lat solarDec:(double)solarDec zenith:(double)zenith {
    double latRad = toRadians(lat);
    double sdRad = toRadians(solarDec);
    double hourAngle = acos(cos(toRadians(zenith)) / (cos(latRad) * cos(sdRad)) - tan(latRad) * tan(sdRad));
    return -hourAngle; // in radians
}

- (double)getSunriseUTC:(double)julianDay latitude:(double)latitude longitude:(double)longitude zenith:(double)zenith {
    double julianCenturies = [self getJulianCenturiesFromJulianDay:julianDay];
    
    // Find the time of solar noon at the location, and use that declination. This is better than start of the
    // Julian day
    double noonMin = [self getSolarNoonUTC:julianCenturies longitude:(-longitude)];
    double tNoon = [self getJulianCenturiesFromJulianDay:julianDay + noonMin / 1440.0];
    
    // First pass to approximate sunrise (using solar noon)
    double eqTime = [self getEquationOfTime:tNoon];
    double solarDec = [self getSunDeclination:tNoon];
    double hourAngle = [self getSunHourAngleAtSunrise:latitude solarDec:solarDec zenith:zenith];
    
    double delta = (-longitude) - toDegrees(hourAngle);
    double timeDiff = 4 * delta;
    double timeUTC = 720 + timeDiff - eqTime;
    
    // Second pass includes fractional Julian Day in gamma calc
    double newTime = [self getJulianCenturiesFromJulianDay:[self getJulianDayFromJulianCenturies:julianCenturies] + timeUTC/ 1440.0];
    eqTime = [self getEquationOfTime:newTime];
    solarDec = [self getSunDeclination:newTime];
    hourAngle = [self getSunHourAngleAtSunrise:latitude solarDec:solarDec zenith:zenith];
    
    delta = (-longitude) - toDegrees(hourAngle);
    timeDiff = 4 * delta;
    timeUTC = 720 + timeDiff - eqTime;
    return timeUTC;
    }

- (double)getSolarNoonUTC:(double)julianCenturies longitude:(double)longitude {
    // First pass uses approximate solar noon to calculate equation of time
    double tNoon = [self getJulianCenturiesFromJulianDay:[self getJulianDayFromJulianCenturies:julianCenturies] + longitude / 360.0];
    double eqTime = [self getEquationOfTime:tNoon];
    double solNoonUTC = 720 + (longitude * 4) - eqTime; // min
    
    double newTime = [self getJulianCenturiesFromJulianDay:[self getJulianDayFromJulianCenturies:julianCenturies] - 0.5 + solNoonUTC / 1440.0];
    eqTime = [self getEquationOfTime:newTime];
    return 720 + (longitude * 4) - eqTime; // min
}


- (double)getSunsetUTC:(double)julianDay latitude:(double)latitude longitude:(double)longitude zenith:(double)zenith {
    double julianCenturies = [self getJulianCenturiesFromJulianDay:julianDay];
    
    // Find the time of solar noon at the location, and use that declination. This is better than start of the
    // Julian day
    double noonMin = [self getSolarNoonUTC:julianCenturies longitude:(-longitude)];
    double tNoon = [self getJulianCenturiesFromJulianDay:julianDay + noonMin / 1440.0];
    
    // First calculates sunrise and approx length of day
    double eqTime = [self getEquationOfTime:tNoon];
    double solarDec = [self getSunDeclination:tNoon];
    double hourAngle = [self getSunHourAngleAtSunset:latitude solarDec:solarDec zenith:zenith];
    
    double delta = (-longitude) - toDegrees(hourAngle);
    double timeDiff = 4 * delta;
    double timeUTC = 720 + timeDiff - eqTime;
    
    // Second pass includes fractional Julian Day in gamma calc
    double newTime = [self getJulianCenturiesFromJulianDay:[self getJulianDayFromJulianCenturies:julianCenturies] + timeUTC/ 1440.0];
    eqTime = [self getEquationOfTime:newTime];
    solarDec = [self getSunDeclination:newTime];
    hourAngle = [self getSunHourAngleAtSunset:latitude solarDec:solarDec zenith:zenith];
    
    delta = (-longitude) - toDegrees(hourAngle);
    timeDiff = 4 * delta;
    timeUTC = 720 + timeDiff - eqTime;
    return timeUTC;
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
    gregorianCalendar.timeZone = self.geoLocation.timeZone;
    //
    //  Set up the date components
    //
    
    NSDateComponents *parts = [gregorianCalendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:date];
    
    return parts;
    
}

- (double)UTCSunriseForDate:(nonnull NSDate *)date andZenith:(double)zenith adjustForElevation:(BOOL)adjustForElevation {
    return [self getUTCSunrise:date geoLocation:_geoLocation zenith:zenith adjustForElevation:adjustForElevation];
}

- (double)UTCSunsetForDate:(nonnull NSDate *)date andZenith:(double)zenith adjustForElevation:(BOOL)adjustForElevation {
    return [self getUTCSunset:date geoLocation:_geoLocation zenith:zenith adjustForElevation:adjustForElevation];
}

@end
