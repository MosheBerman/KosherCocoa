/** 
 *  SunriseAndSunset.h
 *  KosherCocoa 3
 *
 *  Created by Moshe Berman on 3/29/11.
 *  Modified by Moshe Berman on 8/25/13
 *
 *  Use of KosherCocoa 3 is governed by the LGPL 2.1 License.
 */

#import <Foundation/Foundation.h>
#import "KCGeoLocation.h"
#import "KCConstants.h"
#import "KCAstronomicalCalculator.h"

/** A class that uses the United States Naval Almanac Algorithm to calculate sunrise and sunset. */

@interface KCSunriseAndSunsetCalculator : NSObject <KCAstronomicalCalculator>

/**
 *
 *
 *  A string representing the name of the calculator
 */

@property (nonatomic, strong) NSString *calculatorName;

/**
 *  The location of the user.
 */

@property (nonatomic, strong) KCGeoLocation *geoLocation;

/**
 *  This method instantiates a new KCSunriseAndSunsetCalculator 
 *  using the supplied KCGeolocation.
 *
 *  @param geolocation A Geolocation object.
 *  @return An instance of KCSunriseAndSunsetCalculator.
 */

- (id)initWithGeoLocation:(KCGeoLocation *)geolocation;

/**-----
 * @name Calculations
 * -----
 */

/**
 *  A method returning the sunrise in UTC as a double. If an error was
 *  encountered in the calculation (as expected in some locations, such
 *  as near the poles) NAN will be returned.
 *
 *  @param year A Gregorian year number as an integer.
 *
 *  @param month The month of the gregorian year. Valud values range from 1 to 12.
 *
 *  @param day The day of the gregorian month. Valid values range from 1 to 31.
 *
 *  @param longitude The longitude in degrees. (Longitude values west of Meridian are negative.)
 *
 *  @param latitude The latitude in degrees. longitudes south of Equator are negative
 *
 *  @param zenith Which zenith to use in the calculation.
 *
 *  @param type The type of calculation to carry out. Values are kCalcTypeSunrise or kCalcTypeSunset. (Alternatively, an integer 0 or 1)
 *
 *  @return The time that sunset occurs UTC as a double.
 */

- (double)sunriseOrSunsetForYear:(int)year andMonth:(int)month andDay:(int)day atLongitude:(double)longitude andLatitude:(double)latitude withZenith:(double)zenith andType:(int)type;

/**
 *  Calculate the local mean time of rising or setting.
 *  By `local' is meant the exact time at the location, 
 *  assuming that there were no time zone. That is, the 
 *  time difference between the location and the Meridian 
 *  depended entirely on the longitude. We can't do anything
 *  with this time directly; we must convert it to UTC and 
 *  then to a local time. The result is expressed as a 
 *  fractional number of hours since midnight.
 *
 *  @param localHour Description unavailable.
 *
 *  @param sunRightAscensionHours Description unavailable.
 *
 *  @param approxTimeDays Description unavailable.
 *
 *  @return The local mean time of sunrise or sunset.
 */

- (double)localMeanTimeForHour:(double)localHour andAscension:(double)sunRightAscensionHours andApproxTimeDays:(double)approxTimeDays;

/**
 *  Gets the cosine of the Sun's local hour angle.
 *
 *  @param sunTrueLongitude Description unavailable.
 *
 *  @param latitude The latitude to use for the calculation.
 *
 *  @param zenith The zenith to use for the calculation.
 *
 */

- (double)cosLocalHourAngleForAngle:(double)sunTrueLongitude andLatitude:(double)latitude andZenith:(double)zenith;

/**
 *  Calculates the Sun's right ascension in hours, given the Sun's true
 *  longitude in degrees. Input and output are angles greater than 0 and
 *  less than 360.
 *  
 *  @param sunTrueLongitude Description unavailable.
 *
 *  @return The sun's right ascension.
 *
 */

- (double)sunRightAscensionHoursForLongitude:(double)sunTrueLongitude;

/**
 *  Calculates the Sun's true longitude in degrees. The result is an angle
 *  greater than 0 and less than 360. Requires the Sun's mean anomaly, also
 *  in degrees.
 *
 *  @param sunMeanAnomaly The mean anomaly of the sun, in degrees.
 *
 *  @return The sun's true longitude in degrees.
 */

- (double)sunTrueLongitudeFromAnomaly:(double)sunMeanAnomaly;

/**
 *  Calculate the Sun's mean anomaly in degrees, at sunrise or sunset, given
 *  the longitude in degrees.
 *  
 *  @param dayOfYear The day of the year that we're calculating for.
 *
 *  @param longitude The longitude for the calculation.
 *
 *  @param type Either 0 or 1. Also defined as kTypeSunrise and kTypeSunset in 
 *  kSunCalculationTypes.h, respectively.
 *
 *  @return The sun's mean anomaly in degrees.
 */

- (double)meanAnomalyForDayOfYear:(int)dayOfYear atLongitude:(double)longitude forCalculationType:(int)type;

/**
 *  Gets the approximate time of sunset or sunrise In DAYS since midnight
 *  Jan 1st, assuming 6am and 6pm events. We need this figure to derive the
 *  Sun's mean anomaly.
 *
 *  @param dayOfYear The day of the gregorian year.
 *
 *  @param hoursFromMeridian How far we are from the meridian.
 *
 *  @param type Either 0 or 1. Also defined as kTypeSunrise and kTypeSunset in
 *  kSunCalculationTypes.h, respectively.
 *
 */

- (double)approxTimeDaysForDayOfYear:(int)dayOfYear withHoursFromMeridian:(double)hoursFromMeridian forCalculationType:(int)type;

/**
 *
 *  Get time difference between location's longitude and the Meridian, in
 *  hours. West of Meridian has a negative time difference.
 *  
 *  @param longitude The longitude that we're calculating for.
 *
 *  @return the time difference between the longitude and the prime meridian.
 */

- (double)hoursFromMeridianForLongitude:(double)longitude;

/**
 *  Calculate the day of the year, where Jan 1st is day 1. Note that this
 *  method needs to know the year, because leap years have an impact here
 *  
 *  @param year A Gregorian year number.
 *
 *  @param month A gregorian month number. January is 1, December is 12.
 *
 *  @param day The day of the month, beginning with 1.
 *
 *  @return The days of the Gregorian year.
 */

- (int)dayOfYearForYear:(int)year andMonth:(int)month andDay:(int)day;

/**
 *  Get sunset as a double.
 *
 *  @param date The date we're using to calculate sunrise.
 *
 *  @param zenith The zenith we use.
 *
 *  @param adjustForElevation Determines if we calculate at a the given elevation or at 
 *  sea level.
 *
 *  @return The sunset time as a double. (TODO: Check the units.)
 */

- (double)UTCSunsetForDate:(NSDate*)date andZenith:(double)zenith adjustForElevation:(BOOL)adjustForElevation;

/**
 *  Get sunrise as a double.
 *
 *  @param date The date we're using to calculate sunrise.
 *
 *  @param zenith The zenith we use.
 *
 *  @param adjustForElevation Determines if we calculate at a the given elevation or at
 *  sea level.
 *
 *  @return The sunrise time as a double. (TODO: Check the units.)
 */

-  (double)UTCSunriseForDate:(NSDate*)date andZenith:(double)zenith adjustForElevation:(BOOL)adjustForElevation;

/**
 *
 *  Break up a date object into day, month, year.
 *  
 *  @discussion This method works against the Gregorian calendar, so the return value uses Gregorian units.
 *
 *  @param date An NSDate to use extract information from.
 *
 *  @return An array containing three numbers. The first represents a year. The second represents the month. The third value is the day of the month.
 */

- (NSArray *)yearMonthAndDayFromDate:(NSDate *)date;

/**
 *	Method to return the adjustment to the zenith required to account for the
 *	elevation. Since a person at a higher elevation can see farther below the
 *	horizon, the calculation for sunrise / sunset is calculated below the
 *	horizon used at sea level. This is only used for sunrise and sunset and
 *	not times above or below it such as nautical twilight since those calculations
 *  are based on the level of available light at the
 *	given dip below the horizon, something that is not affected by elevation,
 *	the adjustment should only made if the zenith == 90&deg;
 *	{@link #adjustZenith adjusted} for refraction and solar radius.<br />
 *	The algorithm used is:
 *
 *	<pre>
 *	elevationAdjustment = Math.toDegrees(Math.acos(earthRadiusInMeters
 *			/ (earthRadiusInMeters + elevationMeters)));
 *	</pre>
 *
 *	The source of this algorthitm is <a
 *	href="http: *www.calendarists.com">Calendrical Calculations</a> by
 *	Edward M. Reingold and Nachum Dershowitz. An alternate algorithm that
 *	produces an almost identical (but not accurate) result found in Ma'aglay
 *	Tzedek by Moishe Kosower and other sources is:
 *
 *	<pre>
 *	elevationAdjustment = 0.0347 * Math.sqrt(elevationMeters);
 *	</pre>
 *
 *	@param elevation elevation in Meters.
 *	@return the adjusted zenith
 */

- (double)elevationAdjustmentForElevation:(double)elevation;

/**
 *	Adjusts the zenith to account for solar refraction, solar radius and
 *	elevation. The value for Sun's zenith and true rise/set Zenith (used in
 *	this class and subclasses) is the angle that the center of the Sun makes
 *	to a line perpendicular to the Earth's surface. If the Sun were a point
 *	and the Earth were without an atmosphere, true sunset and sunrise would
 *	correspond to a 90&deg; zenith. Because the Sun is not a point, and
 *	because the atmosphere refracts light, this 90&deg; zenith does not, in
 *	fact, correspond to true sunset or sunrise, instead the centre of the
 *	Sun's disk must lie just below the horizon for the upper edge to be
 *	obscured. This means that a zenith of just above 90&deg; must be used.
 *	The Sun subtends an angle of 16 minutes of arc (this can be changed via
 *	the {@link #setSolarRadius(double)} method , and atmospheric refraction
 *	accounts for 34 minutes or so, giving a total of 50 arcminutes.
 *	The total value for ZENITH is 90+(5/6) or 90.8333333&deg; for true
 *	sunrise/sunset. Since a person at an elevation can see blow the horizon
 *	of a person at sea level, this will also adjust the zenith to account for
 *	elevation if available. 
 *
 *  @param zenith The zenith to use with the calculation.
 *
 *  @param elevation The elevation to use for the calculation.
 *
 *	@return The zenith adjusted to include the sun's radius, refraction, and
 *  elevation adjustment.
 */

-(double)adjustZenith:(double)zenith forElevation:(double)elevation;


@end
