//
//  KCMeeusCalculator.m
//  KosherCocoa
//
//  Created by Moshe Berman on 10/7/26.
//

#import "KCMeeusCalculator.h"
#import "trigonometry.h"

/**
 *  The type of solar event being calculated. Mirrors KosherJava's MeeusCalculator.SolarEvent.
 *  Only SUNRISE and SUNSET are reachable through the KCAstronomicalCalculator interface;
 *  NOON and MIDNIGHT exist for the shared rise/set and transit helpers.
 */
typedef NS_ENUM(NSInteger, KCMeeusSolarEvent) {
    KCMeeusSolarEventSunrise,
    KCMeeusSolarEventSunset,
    KCMeeusSolarEventNoon,
    KCMeeusSolarEventMidnight
};

/**
 *  One row of a VSOP87 series: a list of {A, B, C} terms plus its term count.
 */
typedef struct {
    const double (*terms)[3];
    size_t termCount;
} KCMeeusSeriesRow;

/**
 *  Evaluate a VSOP87 series of the form SUM_n (SUM_i A_i*cos(B_i + C_i*tau)) * tau^n,
 *  where the coefficients are stored in 1e-8 of the series' native unit (radians for
 *  longitude/latitude, AU for the radius vector). Mirrors KosherJava's sumSeries.
 */
static double KCMeeusSumSeries(const KCMeeusSeriesRow *rows, size_t rowCount, double tau) {
    double total = 0.0;
    double tauPow = 1.0;
    for (size_t r = 0; r < rowCount; r++) {
        double sum = 0.0;
        for (size_t i = 0; i < rows[r].termCount; i++) {
            sum += rows[r].terms[i][0] * cos(rows[r].terms[i][1] + rows[r].terms[i][2] * tau);
        }
        total += sum * tauPow;
        tauPow *= tau;
    }
    return total / 1.0e8;
}

// ---------------------------------------------------------------------------
// VSOP87 coefficient tables.
// Abridged Earth series from Meeus, Astronomical Algorithms (2nd ed.), Appendix III.
// Mechanically extracted from KosherJava's MeeusCalculator.java; each term is
// {A, B, C} and the series value is SUM A*cos(B + C*tau), tau in Julian millennia,
// in units of 1e-8 rad (L, B) or 1e-8 AU (R).
// ---------------------------------------------------------------------------

static const double KCMeeusEarthL0[][3] = { {175347046, 0, 0}, {3341656, 4.6692568, 6283.07585}, {34894, 4.6261, 12566.1517}, {3497, 2.7441, 5753.3849}, {3418, 2.8289, 3.5231}, {3136, 3.6277, 77713.7715}, {2676, 4.4181, 7860.4194}, {2343, 6.1352, 3930.2097}, {1324, 0.7425, 11506.7698}, {1273, 2.0371, 529.6910}, {1199, 1.1096, 1577.3435}, {990, 5.233, 5884.927}, {902, 2.045, 26.298}, {857, 3.508, 398.149}, {780, 1.179, 5223.694}, {753, 2.533, 5507.553}, {505, 4.583, 18849.228}, {492, 4.205, 775.523}, {357, 2.920, 0.067}, {317, 5.849, 11790.629}, {284, 1.899, 796.298}, {271, 0.315, 10977.079}, {243, 0.345, 5486.778}, {206, 4.806, 2544.314}, {205, 1.869, 5573.143}, {202, 2.458, 6069.777}, {156, 0.833, 213.299}, {132, 3.411, 2942.463}, {126, 1.083, 20.775}, {115, 0.645, 0.980}, {103, 0.636, 4694.003}, {102, 0.976, 15720.839}, {102, 4.267, 7.114}, {99, 6.21, 2146.17}, {98, 0.68, 155.42}, {86, 5.98, 161000.69}, {85, 1.30, 6275.96}, {85, 3.67, 71430.70}, {80, 1.81, 17260.15}, {79, 3.04, 12036.46}, {75, 1.76, 5088.63}, {74, 3.50, 3154.69}, {74, 4.68, 801.82}, {70, 0.83, 9437.76}, {62, 3.98, 8827.39}, {61, 1.82, 7084.90}, {57, 2.78, 6286.60}, {56, 4.39, 14143.50}, {56, 3.47, 6279.55}, {52, 0.19, 12139.55}, {52, 1.33, 1748.02}, {51, 0.28, 5856.48}, {49, 0.49, 1194.45}, {41, 5.37, 8429.24}, {41, 2.40, 19651.05}, {39, 6.17, 10447.39}, {37, 6.04, 10213.29}, {37, 2.57, 1059.38}, {36, 1.71, 2352.87}, {36, 1.78, 6812.77}, {33, 0.59, 17789.85}, {30, 0.44, 83996.85}, {30, 2.74, 1349.87}, {25, 3.16, 4690.48} };  // 64 terms
static const double KCMeeusEarthL1[][3] = { {628331966747.0, 0, 0}, {206059, 2.678235, 6283.07585}, {4303, 2.6351, 12566.1517}, {425, 1.590, 3.523}, {119, 5.796, 26.298}, {109, 2.966, 1577.344}, {93, 2.59, 18849.23}, {72, 1.14, 529.69}, {68, 1.87, 398.15}, {67, 4.41, 5507.55}, {59, 2.89, 5223.69}, {56, 2.17, 155.42}, {45, 0.40, 796.30}, {36, 0.47, 775.52}, {29, 2.65, 7.11}, {21, 5.34, 0.98}, {19, 1.85, 5486.78}, {19, 4.97, 213.30}, {17, 2.99, 6275.96}, {16, 0.03, 2544.31}, {16, 1.43, 2146.17}, {15, 1.21, 10977.08}, {12, 2.83, 1748.02}, {12, 3.26, 5088.63}, {12, 5.27, 1194.45}, {12, 2.08, 4694.00}, {11, 0.77, 553.57}, {10, 1.30, 6286.60}, {10, 4.24, 1349.87}, {9, 2.70, 242.73}, {9, 5.64, 951.72}, {8, 5.30, 2352.87}, {6, 2.65, 9437.76}, {6, 4.67, 4690.48} };  // 34 terms
static const double KCMeeusEarthL2[][3] = { {52919, 0, 0}, {8720, 1.0721, 6283.0758}, {309, 0.867, 12566.152}, {27, 0.05, 3.52}, {16, 5.19, 26.30}, {16, 3.68, 155.42}, {10, 0.76, 18849.23}, {9, 2.06, 77713.77}, {7, 0.83, 775.52}, {5, 4.66, 1577.34}, {4, 1.03, 7.11}, {4, 3.44, 5573.14}, {3, 5.14, 796.30}, {3, 6.05, 5507.55}, {3, 1.19, 242.73}, {3, 6.12, 529.69}, {3, 0.31, 398.15}, {3, 2.28, 553.57}, {2, 4.38, 5223.69}, {2, 3.75, 0.98} };  // 20 terms
static const double KCMeeusEarthL3[][3] = { {289, 5.844, 6283.076}, {35, 0, 0}, {17, 5.49, 12566.15}, {3, 5.20, 155.42}, {1, 4.72, 3.52}, {1, 5.30, 18849.23}, {1, 5.97, 242.73} };  // 7 terms
static const double KCMeeusEarthL4[][3] = { {114, 3.142, 0}, {8, 4.13, 6283.08}, {1, 3.84, 12566.15} };  // 3 terms
static const double KCMeeusEarthL5[][3] = { {1, 3.14, 0} };  // 1 term

static const KCMeeusSeriesRow KCMeeusEarthLRows[] = {
    { KCMeeusEarthL0, sizeof(KCMeeusEarthL0) / sizeof(KCMeeusEarthL0[0]) },
    { KCMeeusEarthL1, sizeof(KCMeeusEarthL1) / sizeof(KCMeeusEarthL1[0]) },
    { KCMeeusEarthL2, sizeof(KCMeeusEarthL2) / sizeof(KCMeeusEarthL2[0]) },
    { KCMeeusEarthL3, sizeof(KCMeeusEarthL3) / sizeof(KCMeeusEarthL3[0]) },
    { KCMeeusEarthL4, sizeof(KCMeeusEarthL4) / sizeof(KCMeeusEarthL4[0]) },
    { KCMeeusEarthL5, sizeof(KCMeeusEarthL5) / sizeof(KCMeeusEarthL5[0]) }
};
static const size_t KCMeeusEarthLRowCount = 6;

static const double KCMeeusEarthB0[][3] = { {280, 3.199, 84334.662}, {102, 5.422, 5507.553}, {80, 3.88, 5223.69}, {44, 3.70, 2352.87}, {32, 4.00, 1577.34} };  // 5 terms
static const double KCMeeusEarthB1[][3] = { {9, 3.90, 5507.55}, {6, 1.73, 5223.69} };  // 2 terms

static const KCMeeusSeriesRow KCMeeusEarthBRows[] = {
    { KCMeeusEarthB0, sizeof(KCMeeusEarthB0) / sizeof(KCMeeusEarthB0[0]) },
    { KCMeeusEarthB1, sizeof(KCMeeusEarthB1) / sizeof(KCMeeusEarthB1[0]) }
};
static const size_t KCMeeusEarthBRowCount = 2;

static const double KCMeeusEarthR0[][3] = { {100013989, 0, 0}, {1670700, 3.0984635, 6283.07585}, {13956, 3.05525, 12566.1517}, {3084, 5.1985, 77713.7715}, {1628, 1.1739, 5753.3849}, {1576, 2.8469, 7860.4194}, {925, 5.453, 11506.770}, {542, 4.564, 3930.210}, {472, 3.661, 5884.927}, {346, 0.964, 5507.553}, {329, 5.900, 5223.694}, {307, 0.299, 5573.143}, {243, 4.273, 11790.629}, {212, 5.847, 1577.344}, {186, 5.022, 10977.079}, {175, 3.012, 18849.228}, {110, 5.055, 5486.778}, {98, 0.89, 6069.78}, {86, 5.69, 15720.84}, {86, 1.27, 161000.69}, {65, 0.27, 17260.15}, {63, 0.92, 529.69}, {57, 2.01, 83996.85}, {56, 5.24, 71430.70}, {49, 3.25, 2544.31}, {47, 2.58, 775.52}, {45, 5.54, 9437.76}, {43, 6.01, 6275.96}, {39, 5.36, 4694.00}, {38, 2.39, 8827.39}, {37, 0.83, 19651.05}, {37, 4.90, 12139.55}, {36, 1.67, 12036.46}, {35, 1.84, 2942.46}, {33, 0.24, 7084.90}, {32, 0.18, 5088.63}, {32, 1.78, 398.15}, {28, 1.21, 6286.60}, {28, 1.90, 6279.55}, {26, 4.59, 10447.39} };  // 40 terms
static const double KCMeeusEarthR1[][3] = { {103019, 1.10749, 6283.07585}, {1721, 1.0644, 12566.1517}, {702, 3.142, 0}, {32, 1.02, 18849.23}, {31, 2.84, 5507.55}, {25, 1.32, 5223.69}, {18, 1.42, 1577.34}, {10, 5.91, 10977.08}, {9, 1.42, 6275.96}, {9, 0.27, 5486.78} };  // 10 terms
static const double KCMeeusEarthR2[][3] = { {4359, 5.7846, 6283.0758}, {124, 5.579, 12566.152}, {12, 3.14, 0}, {9, 3.63, 77713.77}, {6, 1.87, 5573.14}, {3, 5.47, 18849.23} };  // 6 terms
static const double KCMeeusEarthR3[][3] = { {145, 4.273, 6283.076}, {7, 3.92, 12566.15} };  // 2 terms
static const double KCMeeusEarthR4[][3] = { {4, 2.56, 6283.08} };  // 1 term

static const KCMeeusSeriesRow KCMeeusEarthRRows[] = {
    { KCMeeusEarthR0, sizeof(KCMeeusEarthR0) / sizeof(KCMeeusEarthR0[0]) },
    { KCMeeusEarthR1, sizeof(KCMeeusEarthR1) / sizeof(KCMeeusEarthR1[0]) },
    { KCMeeusEarthR2, sizeof(KCMeeusEarthR2) / sizeof(KCMeeusEarthR2[0]) },
    { KCMeeusEarthR3, sizeof(KCMeeusEarthR3) / sizeof(KCMeeusEarthR3[0]) },
    { KCMeeusEarthR4, sizeof(KCMeeusEarthR4) / sizeof(KCMeeusEarthR4[0]) }
};
static const size_t KCMeeusEarthRRowCount = 5;


/**
 *  Estimate delta-T = TT - UT in seconds for the given Julian day, using the polynomial
 *  expressions of Espenak and Meeus. The value is approximate (especially in the far past /
 *  future) but accurate to a few seconds for the modern era. Mirrors KosherJava's getDeltaT.
 */
static double KCMeeusDeltaT(double julianDay) {
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
    } else { // generic parabola of Espenak and Meeus for dates well outside the calibrated range
        double u = (year - 1820) / 100.0;
        return -20 + 32 * u * u;
    }
}

/**
 *  Return the principal terms of the nutation in longitude (delta-Psi) and obliquity
 *  (delta-epsilon) in arc-seconds (Meeus chapter 22, abridged). Mirrors KosherJava's getNutation.
 */
static void KCMeeusNutation(double julianCenturies, double nutation[2]) {
    double t = julianCenturies;
    double omega = 125.04452 - 1934.136261 * t + 0.0020708 * t * t + t * t * t / 450000.0; // moon's ascending node
    double lSun = 280.4665 + 36000.7698 * t;   // mean longitude of the sun
    double lMoon = 218.3165 + 481267.8813 * t; // mean longitude of the moon
    double deltaPsi = -17.20 * sinDeg(omega) - 1.32 * sinDeg(2 * lSun)
            - 0.23 * sinDeg(2 * lMoon) + 0.21 * sinDeg(2 * omega);
    double deltaEpsilon = 9.20 * cosDeg(omega) + 0.57 * cosDeg(2 * lSun)
            + 0.10 * cosDeg(2 * lMoon) - 0.09 * cosDeg(2 * omega);
    nutation[0] = deltaPsi;
    nutation[1] = deltaEpsilon;
}

/**
 *  Return the sun's apparent geocentric ecliptic longitude and latitude in degrees, built from the
 *  Earth's heliocentric VSOP87 position with the FK5 frame correction, nutation in longitude and the
 *  aberration of light applied (Meeus chapter 25). Mirrors KosherJava's
 *  getSunApparentEclipticCoordinates.
 */
static void KCMeeusSunApparentEclipticCoordinates(double julianCenturies, double coordinates[2]) {
    double tau = julianCenturies / 10.0; // Julian millennia
    double earthL = toDegrees(KCMeeusSumSeries(KCMeeusEarthLRows, KCMeeusEarthLRowCount, tau)); // Earth heliocentric longitude (deg)
    double earthB = toDegrees(KCMeeusSumSeries(KCMeeusEarthBRows, KCMeeusEarthBRowCount, tau)); // Earth heliocentric latitude (deg)
    double earthR = KCMeeusSumSeries(KCMeeusEarthRRows, KCMeeusEarthRRowCount, tau);             // Earth radius vector (AU)

    // Geocentric position of the Sun is diametrically opposite the heliocentric Earth.
    double theta = earthL + 180.0;       // geocentric longitude (deg), dynamical (VSOP87) frame
    double beta = -earthB;               // geocentric latitude (deg)

    // FK5 frame correction (Meeus 25.9): convert from the VSOP87 dynamical frame to FK5.
    double lambdaPrime = theta - 1.397 * julianCenturies - 0.00031 * julianCenturies * julianCenturies;
    double deltaLongFK5 = -0.09033 + 0.03916 * (cosDeg(lambdaPrime) + sinDeg(lambdaPrime)) * tanDeg(beta);
    double deltaLatFK5 = 0.03916 * (cosDeg(lambdaPrime) - sinDeg(lambdaPrime));
    theta += deltaLongFK5 / 3600.0;
    beta += deltaLatFK5 / 3600.0;

    // Nutation in longitude (apparent place) and aberration of light.
    double nut[2];
    KCMeeusNutation(julianCenturies, nut); // {delta-Psi, delta-epsilon} in arc-seconds
    double aberration = -20.4898 / earthR;        // arc-seconds (Meeus 25, abridged)
    double lambda = theta + nut[0] / 3600.0 + aberration / 3600.0;

    coordinates[0] = fmod(fmod(lambda, 360.0) + 360.0, 360.0);
    coordinates[1] = beta;
}

/**
 *  Return the true obliquity of the ecliptic in degrees (mean obliquity, Meeus 22.2, plus
 *  nutation in obliquity). Mirrors KosherJava's getTrueObliquity.
 */
static double KCMeeusTrueObliquity(double julianCenturies) {
    double seconds = 21.448 - julianCenturies
            * (46.8150 + julianCenturies * (0.00059 - julianCenturies * 0.001813));
    double epsilon0 = 23.0 + (26.0 + (seconds / 60.0)) / 60.0;
    double nut[2];
    KCMeeusNutation(julianCenturies, nut);
    double deltaEpsilon = nut[1] / 3600.0;
    return epsilon0 + deltaEpsilon;
}

/**
 *  Return the apparent declination of the sun in degrees, computed from the apparent geocentric
 *  ecliptic coordinates derived from the VSOP87 series. Mirrors KosherJava's getSunDeclination.
 */
static double KCMeeusSunDeclination(double julianCenturies) {
    double sun[2];
    KCMeeusSunApparentEclipticCoordinates(julianCenturies, sun); // {lambda, beta} in degrees
    double lambda = sun[0];
    double beta = sun[1];
    double epsilon = KCMeeusTrueObliquity(julianCenturies);
    double sinDec = sinDeg(beta) * cosDeg(epsilon) + cosDeg(beta) * sinDeg(epsilon) * sinDeg(lambda);
    return asinDeg(sinDec);
}

/**
 *  Return the apparent geocentric right ascension of the sun in degrees (0-360).
 *  Mirrors KosherJava's getSunRightAscension.
 */
static double KCMeeusSunRightAscension(double julianCenturies) {
    double sun[2];
    KCMeeusSunApparentEclipticCoordinates(julianCenturies, sun);
    double lambda = sun[0];
    double beta = sun[1];
    double epsilon = KCMeeusTrueObliquity(julianCenturies);
    double y = sinDeg(lambda) * cosDeg(epsilon) - tanDeg(beta) * sinDeg(epsilon);
    double x = cosDeg(lambda);
    double ra = toDegrees(atan2(y, x));
    return fmod(fmod(ra, 360.0) + 360.0, 360.0);
}

/**
 *  Return the equation of time - apparent minus mean solar time - in minutes of time, following
 *  Meeus chapter 28. The sign convention matches KCNOAACalculator so the rise/set formulas are
 *  interchangeable. Mirrors KosherJava's getEquationOfTime.
 */
static double KCMeeusEquationOfTime(double julianCenturies) {
    double tau = julianCenturies / 10.0;
    // Mean longitude of the sun (Meeus 28.1), in degrees.
    double l0 = 280.4664567 + tau * (360007.6982779 + tau * (0.03032028
            + tau * (1.0 / 49931.0 - tau * (1.0 / 15300.0 + tau / 2000000.0))));
    l0 = fmod(fmod(l0, 360.0) + 360.0, 360.0);
    double alpha = KCMeeusSunRightAscension(julianCenturies);
    double nut[2];
    KCMeeusNutation(julianCenturies, nut);
    double epsilon = KCMeeusTrueObliquity(julianCenturies);
    double e = l0 - 0.0057183 - alpha + (nut[0] / 3600.0) * cosDeg(epsilon); // degrees
    // Reduce to (-180, 180] so the *4 conversion gives the customary +/- ~16 minute range.
    e = fmod(fmod(e + 180.0, 360.0) + 360.0, 360.0) - 180.0;
    return e * 4.0; // 1 degree = 4 minutes of time
}

/**
 *  Return the hour angle of the sun in radians for the given latitude, declination and zenith.
 *  Mirrors KosherJava's getSunHourAngle.
 */
static double KCMeeusSunHourAngle(double latitude, double solarDeclination, double zenith, KCMeeusSolarEvent solarEvent) {
    double ratio = cosDeg(zenith) / (cosDeg(latitude) * cosDeg(solarDeclination))
            - tanDeg(latitude) * tanDeg(solarDeclination);
    if (ratio < -1.0 || ratio > 1.0) {
        return NAN; // the sun never reaches this zenith (polar day / night)
    }
    double hourAngle = acos(ratio);
    if (solarEvent == KCMeeusSolarEventSunset) {
        hourAngle = -hourAngle;
    }
    return hourAngle;
}

@interface KCMeeusCalculator ()

- (double)getUTCSunRiseSetForDate:(nonnull NSDate *)date
                      geoLocation:(nonnull KCGeoLocation *)geoLocation
                           zenith:(double)zenith
               adjustForElevation:(BOOL)adjustForElevation
                       solarEvent:(KCMeeusSolarEvent)solarEvent;

- (double)getSunRiseSetUTCForDate:(nonnull NSDate *)date
                         latitude:(double)latitude
                        longitude:(double)longitude
                           zenith:(double)zenith
                       solarEvent:(KCMeeusSolarEvent)solarEvent;

- (double)getSolarNoonMidnightUTCForJulianDay:(double)julianDay
                                    longitude:(double)longitude
                                   solarEvent:(KCMeeusSolarEvent)solarEvent;

- (double)getJulianCenturiesFromJulianDay:(double)julianDay;

- (double)getJulianDay:(nonnull NSDate *)date;

- (nullable NSDateComponents *)yearMonthAndDayFromDate:(nonnull NSDate *)date;

@end

@implementation KCMeeusCalculator
{
    //
    //  Whether to apply the delta-T (TT - UT) correction when evaluating the Sun's position.
    //  Always YES; KosherJava's setApplyDeltaT/isApplyDeltaT are not ported (no base-class hook).
    //
    BOOL _applyDeltaT;
}

- (nonnull instancetype)initWithGeoLocation:(nonnull KCGeoLocation *)geolocation
{

    self = [super init];

    if (self)
    {
        [self setCalculatorName:@"Jean Meeus Higher-Accuracy (VSOP87) Algorithm"];

        //
        //  The delta-T (TT - UT) correction is always applied, matching the KosherJava default.
        //

        _applyDeltaT = YES;

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

//
//  Adjusts the zenith to account for solar refraction, solar radius and elevation, using this
//  calculator's configured refraction, solar radius and earth radius instead of the
//  kRefraction/kSolarRadius/kEarthRadiusInKilometers constants. Deviation from KosherJava: uses
//  the fixed 16' solar radius; the date-based apparent solar radius table is not ported.
//

- (double)adjustZenith:(double)zenith forElevation:(double)elevation
{
    if (zenith == kZenithGeometric)
    {
        zenith = zenith
        + (self.solarRadius + self.refraction + [self elevationAdjustmentForElevation:elevation]);
    }

    return zenith;
}

//
//  Returns the elevation dip using this calculator's configured earth radius (in kilometers,
//  matching KosherJava's getEarthRadius) instead of the kEarthRadiusInKilometers constant.
//

- (double)elevationAdjustmentForElevation:(double)elevation
{
    return toDegrees(acos(self.earthRadius / (self.earthRadius + (elevation / 1000.0))));
}

/**
 *  A method that calculates UTC sunrise or sunset as well as any time based on an angle above or
 *  below sunrise or sunset and returns it as a double in 24-hour format. 5:45:00 AM will return
 *  5.75. Mirrors KosherJava's getUTCSunRiseSet.
 */
- (double)getUTCSunRiseSetForDate:(nonnull NSDate *)date
                      geoLocation:(nonnull KCGeoLocation *)geoLocation
                           zenith:(double)zenith
               adjustForElevation:(BOOL)adjustForElevation
                       solarEvent:(KCMeeusSolarEvent)solarEvent
{
    double elevation = adjustForElevation ? self.geoLocation.altitude : 0;
    double adjustedZenith = [self adjustZenith:zenith forElevation:elevation];
    double riseSet = [self getSunRiseSetUTCForDate:date
                                         latitude:geoLocation.latitude
                                        longitude:-geoLocation.longitude
                                           zenith:adjustedZenith
                                       solarEvent:solarEvent];
    riseSet = riseSet / 60.0;
    return fmod(fmod(riseSet, 24.0) + 24.0, 24.0); // ensure that the time is >= 0 and < 24
}

/**
 *  Return the UTC of sunrise or sunset in minutes for the given day at the given location on
 *  earth, using the high-accuracy solar declination and equation of time. Mirrors KosherJava's
 *  getSunRiseSetUTC.
 */
- (double)getSunRiseSetUTCForDate:(nonnull NSDate *)date
                         latitude:(double)latitude
                        longitude:(double)longitude
                           zenith:(double)zenith
                       solarEvent:(KCMeeusSolarEvent)solarEvent
{
    double julianDay = [self getJulianDay:date];

    // Use the declination at local solar noon as the starting point, then iterate.
    double noonmin = [self getSolarNoonMidnightUTCForJulianDay:julianDay longitude:longitude solarEvent:KCMeeusSolarEventNoon];
    double tnoon = [self getJulianCenturiesFromJulianDay:julianDay + noonmin / 1440.0];
    double equationOfTime = KCMeeusEquationOfTime(tnoon);
    double solarDeclination = KCMeeusSunDeclination(tnoon);
    double hourAngle = KCMeeusSunHourAngle(latitude, solarDeclination, zenith, solarEvent);
    double delta = longitude - toDegrees(hourAngle);
    double timeUTC = 720 + (4 * delta) - equationOfTime;

    // Additional passes including the fractional Julian Day for improved accuracy (a third pass over the NOAA
    // implementation's two helps convergence at high latitudes).
    for (int i = 0; i < 2; i++) {
        double newt = [self getJulianCenturiesFromJulianDay:julianDay + timeUTC / 1440.0];
        equationOfTime = KCMeeusEquationOfTime(newt);
        solarDeclination = KCMeeusSunDeclination(newt);
        hourAngle = KCMeeusSunHourAngle(latitude, solarDeclination, zenith, solarEvent);
        if (isnan(hourAngle)) {
            return NAN;
        }
        delta = longitude - toDegrees(hourAngle);
        timeUTC = 720 + (4 * delta) - equationOfTime;
    }
    return timeUTC;
}

/**
 *  Return the UTC of solar noon, or the upcoming midnight (about 12 hours after solar noon) of
 *  the given day at the given location, in minutes after 0:00 UTC. Uses the high-accuracy
 *  equation of time. Mirrors KosherJava's getSolarNoonMidnightUTC.
 */
- (double)getSolarNoonMidnightUTCForJulianDay:(double)julianDay
                                    longitude:(double)longitude
                                   solarEvent:(KCMeeusSolarEvent)solarEvent
{
    // no day-half shift: the loop epoch julianDay + solNoonUTC/1440 already lands on the event
    // First pass: seed includes the 720/1440-minute transit base so the equation of time is sampled near the true
    // transit (the NOAACalculator omits this base in its seed; here it is included for consistency with the loop).
    double base = (solarEvent == KCMeeusSolarEventNoon) ? 720 : 1440;
    double tnoon = [self getJulianCenturiesFromJulianDay:julianDay + longitude / 360.0];
    double equationOfTime = KCMeeusEquationOfTime(tnoon);
    double solNoonUTC = base + (longitude * 4) - equationOfTime; // minutes

    // Refine the equation of time at the calculated transit time.
    for (int i = 0; i < 3; i++) {
        double newt = [self getJulianCenturiesFromJulianDay:julianDay + solNoonUTC / 1440.0];
        equationOfTime = KCMeeusEquationOfTime(newt);
        solNoonUTC = base + (longitude * 4) - equationOfTime;
    }
    return solNoonUTC;
}

/**
 *  Convert a Universal-Time Julian day to Julian centuries since J2000.0 in Terrestrial Time.
 *  The delta-T (TT - UT) offset is added so that the solar-position series, which are defined
 *  in TT, are evaluated correctly. Mirrors KosherJava's getJulianCenturiesFromJulianDay.
 */
- (double)getJulianCenturiesFromJulianDay:(double)julianDay
{
    double jde = julianDay;
    if (_applyDeltaT) {
        jde += KCMeeusDeltaT(julianDay) / 86400.0; // delta-T is in seconds; convert to days
    }
    return (jde - kJulianDayJan_1_2000) / kJulianDaysPerCentury;
}

- (double)getJulianDay:(nonnull NSDate *)date {
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

- (double)UTCSunriseForDate:(nonnull NSDate *)date andZenith:(double)zenith adjustForElevation:(BOOL)adjustForElevation {
    return [self getUTCSunRiseSetForDate:date geoLocation:_geoLocation zenith:zenith adjustForElevation:adjustForElevation solarEvent:KCMeeusSolarEventSunrise];
}

- (double)UTCSunsetForDate:(nonnull NSDate *)date andZenith:(double)zenith adjustForElevation:(BOOL)adjustForElevation {
    return [self getUTCSunRiseSetForDate:date geoLocation:_geoLocation zenith:zenith adjustForElevation:adjustForElevation solarEvent:KCMeeusSolarEventSunset];
}

@end
