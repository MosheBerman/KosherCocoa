/**
 *  AstronomicalCalculator.h
 *  KosherCocoa 3
 *
 *  Created by Moshe Berman on 7/22/11.
 *  Updated by Moshe Berman on 8/25/13.
 *
 *  Use of KosherCocoa 3 is governed by the LGPL 2.1 License.
 */

#import <Foundation/Foundation.h>

/**
 *  A protocol defining methods to return sunrise and sunset times.
 */
NS_SWIFT_NAME(AstronomicalCalculator)
@interface KCAstronomicalCalculator : NSObject <NSObject>

- (id _Nullable)init;

// MARK: - Calculating Sunrise

/**
 *  A method that calculates UTC sunrise as well as any time based on an angle above or below sunrise. This abstract
 *  method is implemented by the classes that extend this class.
 *
 *  @param date Used to calculate day of year.
 *  @param zenith the azimuth below the vertical zenith of 90 degrees. for sunrise typically the zenith used for
 *  the calculation uses geometric zenith of 90 degrees and adjusts this slightly to account for solar refraction
 *  and the sun's radius. Another example would be beginNauticalTwilight that passes NAUTICAL_ZENITH to this method.
 *  @param adjustForElevation Determines if we calculate at sea level or the altitude of the calculator's location.
 *  @return The number of milliseconds since
 */

- (double)UTCSunriseForDate:(nonnull NSDate*)date andZenith:(double)zenith adjustForElevation:(BOOL)adjustForElevation;

// MARK: - Calculating Sunset

/**
 *  A method that calculates UTC sunrise as well as any time based on an angle above or below sunset. This abstract
 *  method is implemented by the classes that extend this class.
 *
 *  @param date Used to calculate day of year.
 *  @param zenith the azimuth below the vertical zenith of 90 degrees. for sunrise typically the zenith used for
 *  the calculation uses geometric zenith of 90 degrees and adjusts this slightly to account for solar refraction
 *  and the sun's radius. Another example would be beginNauticalTwilight that passes NAUTICAL_ZENITH to this method.
 *  @param adjustForElevation Determines if we calculate at sea level or the altitude of the calculator's location.
 *
 *  @return The UTC time of sunrise in 24 hour format. 5:45:00 AM will return 5.75.0. If an error was encountered in
 *  the calculation (expected behavior for some locations such as near the poles, NaN will be returned.
 */

- (double)UTCSunsetForDate:(nonnull NSDate*)date andZenith:(double)zenith adjustForElevation:(BOOL)adjustForElevation;

/**
 *    Method to return the adjustment to the zenith required to account for the
 *    elevation. Since a person at a higher elevation can see farther below the
 *    horizon, the calculation for sunrise / sunset is calculated below the
 *    horizon used at sea level. This is only used for sunrise and sunset and
 *    not times above or below it such as nautical twilight since those calculations
 *  are based on the level of available light at the
 *    given dip below the horizon, something that is not affected by elevation,
 *    the adjustment should only made if the zenith == 90&deg;
 *    {@link #adjustZenith adjusted} for refraction and solar radius.<br />
 *    The algorithm used is:
 *
 *    <pre>
 *    elevationAdjustment = Math.toDegrees(Math.acos(earthRadiusInMeters
 *            / (earthRadiusInMeters + elevationMeters)));
 *    </pre>
 *
 *    The source of this algorthitm is
 *    "http: *www.calendarists.com"Calendrical Calculations by
 *    Edward M. Reingold and Nachum Dershowitz. An alternate algorithm that
 *    produces an almost identical (but not accurate) result found in Ma'aglay
 *    Tzedek by Moishe Kosower and other sources is:
 *
 *    <pre>
 *    elevationAdjustment = 0.0347 * Math.sqrt(elevationMeters);
 *    </pre>
 *
 *    @param elevation elevation in Meters.
 *    @return the adjusted zenith
 */

- (double)elevationAdjustmentForElevation:(double)elevation;

/**
 *    Adjusts the zenith to account for solar refraction, solar radius and
 *    elevation. The value for Sun's zenith and true rise/set Zenith (used in
 *    this class and subclasses) is the angle that the center of the Sun makes
 *    to a line perpendicular to the Earth's surface. If the Sun were a point
 *    and the Earth were without an atmosphere, true sunset and sunrise would
 *    correspond to a 90&deg; zenith. Because the Sun is not a point, and
 *    because the atmosphere refracts light, this 90&deg; zenith does not, in
 *    fact, correspond to true sunset or sunrise, instead the centre of the
 *    Sun's disk must lie just below the horizon for the upper edge to be
 *    obscured. This means that a zenith of just above 90&deg; must be used.
 *    The Sun subtends an angle of 16 minutes of arc (this can be changed via
 *    the {@link #setSolarRadius(double)} method , and atmospheric refraction
 *    accounts for 34 minutes or so, giving a total of 50 arcminutes.
 *    The total value for ZENITH is 90+(5/6) or 90.8333333&deg; for true
 *    sunrise/sunset. Since a person at an elevation can see blow the horizon
 *    of a person at sea level, this will also adjust the zenith to account for
 *    elevation if available.
 *
 *  @param zenith The zenith to use with the calculation.
 *
 *  @param elevation The elevation to use for the calculation.
 *
 *    @return The zenith adjusted to include the sun's radius, refraction, and
 *  elevation adjustment.
 */

- (double)adjustZenith:(double)zenith forElevation:(double)elevation;

@end
