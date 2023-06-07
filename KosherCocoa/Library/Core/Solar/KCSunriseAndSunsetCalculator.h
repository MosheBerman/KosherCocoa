/** 
 *  SunriseAndSunset.h
 *  KosherCocoa 3
 *
 *  Created by Moshe Berman on 3/29/11.
 *  Modified by Moshe Berman on 8/25/13
 *
 *  Use of KosherCocoa 3 is governed by the LGPL 2.1 License.
 */

@import Foundation;
#import "KCGeoLocation.h"
#import "KCConstants.h"
#import "KCAstronomicalCalculator.h"

/** A class that uses the United States Naval Almanac Algorithm to calculate sunrise and sunset. */

NS_SWIFT_NAME(SunriseAndSunsetCalculator)
@interface KCSunriseAndSunsetCalculator : KCAstronomicalCalculator

/**
 *
 *
 *  A string representing the name of the calculator
 */

@property (nonatomic, strong, nullable) NSString *calculatorName;

/**
 *  The location of the user.
 */

@property (nonatomic, strong, nonnull) KCGeoLocation *geoLocation;

/**
 *  This method instantiates a new KCSunriseAndSunsetCalculator 
 *  using the supplied KCGeolocation.
 *
 *  @param geolocation A Geolocation object.
 *  @return An instance of KCSunriseAndSunsetCalculator.
 */

- (nonnull instancetype)initWithGeoLocation:(nonnull KCGeoLocation *)geolocation;

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

- (double)sunriseOrSunsetForYear:(NSInteger)year andMonth:(NSInteger)month andDay:(NSInteger)day atLongitude:(double)longitude andLatitude:(double)latitude withZenith:(double)zenith andType:(NSInteger)type;

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

- (double)meanAnomalyForDayOfYear:(NSInteger)dayOfYear atLongitude:(double)longitude forCalculationType:(NSInteger)type;

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

- (double)approxTimeDaysForDayOfYear:(NSInteger)dayOfYear withHoursFromMeridian:(double)hoursFromMeridian forCalculationType:(NSInteger)type;

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

- (NSInteger)dayOfYearForYear:(NSInteger)year andMonth:(NSInteger)month andDay:(NSInteger)day;

@end
