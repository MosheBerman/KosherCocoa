/**
 *  AstronomicalCalendar.h
 *  KosherCocoa 3
 *
 *  Created by Moshe Berman on 7/22/11.
 *  Modified by Moshe Berman on 1/12/15
 *
 *  Use of KosherCocoa 3 is governed by the LGPL 2.1 License.
 */

#import <Foundation/Foundation.h>

#import "KCGeoLocation.h"
#import "KCSunriseAndSunsetCalculator.h"

/** A class that calculates various sunrise and sunset values. */

@interface KCAstronomicalCalendar : NSObject

/**-----
 * @name Configuring the Calendar
 * -----
 */

/**
 * The calculator to use. 
 *
 *  In KosherCocoa, it's always a KCSunriseAndSunsetCalculator. The
 *  original Java library offered several calculator options.
 */

@property (nonatomic, strong) KCSunriseAndSunsetCalculator *astronomicalCalculator;

/**
 *  The location of the user.
 */

@property (nonatomic, strong) KCGeoLocation *geoLocation;

/**
 * The date for which we want to perform the calculations.
 */

@property (nonatomic, strong) NSDate *workingDate;

/**-----
 * @name Initializing the Calendar
 * -----
 */

/**
 *  This method initializes a new instance of KCAstronomicalCalendar.
 *
 *  @param aGeoLocation A geolocation object representing the user.
 *  @see KCGeoLocation.h
 *  @return An instance of KCAstronomicalCalendar.
 */

- (id)initWithLocation:(KCGeoLocation *)aGeoLocation;

/**-----
 * @name Calculating Sunrise
 * -----
 */

/**
 *  This method calculates sunrise at the current geolocation. 
 *  
 *  The zenith used for the calculation uses geometric zenith of 90 degrees plus elevation. 
 *  This is adjusted by the KCAstronomicalCalculator to add approximately 50/60 of a degree 
 *  to account for 34 archminutes of refraction and 16 archminutes for the sun's radius for
 *  a total of 90.83333 degrees.
 *
 *  @see KCSunriseAndSunsetCalculator
 *  @return Sunrise as an NSDate. 
 *  If the calculation cannot be computed, such as in the Arctic Circle, where there is 
 *  at least one day a year that the sun does not rise, and one where it does not set, 
 *  nil will be returned.
 */

- (NSDate *)sunrise;

/**
 *  This method calculates sunrise at sea-level at 
 *  the latitude and longitude represented by the 
 *  current geolocation.
 *
 *  Non-sunrise and sunset calculations such as dawn and dusk, depend on the amount of
 *  visible light, something that is not affected by elevation. This method returns 
 *  sunrise calculated at sea level. This forms the base for dawn calculations that are
 *  calculated as a dip below the horizon before sunrise.
 *
 *  @return Sunrise at sea level as an NSDate.
 */

- (NSDate *)seaLevelSunrise;

/**
 *  This method returns the beginning of civil twilight (dawn) using a zenith of {@link #CIVIL_ZENITH 96&deg;}.
 *
 *  @param offsetZenith The offset zenith.
 *
 * @return The Date of the beginning of civil twilight using a zenith of 96 degrees. If the calculation
 *         can't be computed, nill will be returned. See detailed explanation on top of the page.
 */

- (NSDate *)sunriseOffsetByDegrees:(double)offsetZenith;

/**---------------------------------------------
 * @name Calculating the Beginning of Twilight
 * ---------------------------------------------
 */

/**
 *  This method calculates the start of civil twilight.
 */

- (NSDate *)beginCivilTwilight;

- (NSDate *)beginNauticalTwilight;

- (NSDate *)beginAstronomicalTwilight;

/**-----
 * @name Calculating Sunset
 * -----
 */

/**
 *  This method returns an NSDate representing the time of sunset on 
 *  the KCAstronomicalCalendar instance's workingDate property.
 *
 *  This method takes elevation into account.
 *
 *  @return An NSDate representing sunset on workingDate.
 */

- (NSDate *)sunset;

/**
 *  This method returns an NSDate representing the time of sunset on
 *  the KCAstronomicalCalendar instance's workingDate property.
 *
 *  This method does not take elevation into account.
 *
 *  @return An NSDate representing sunset on workingDate.
 */

- (NSDate *)seaLevelSunset;

/**
 * A utility method that returns the time of an offset by degrees below or above the horizon of {@link #getSunset()
 * sunset}. Note that the degree offset is from the vertical, so for a calculation of 14&deg; after sunset, an
 * offset of 14 + {@link #GEOMETRIC_ZENITH} = 104 would have to be passed as a parameter.
 *
 * @param offsetZenith the degrees after {@link #getSunset()} to use in the calculation. 
 *          For time before sunset use negative numbers. Note that the degree offset is from the vertical, so for a calculation of 14&deg; 
 *          after sunset, an offset of 14 + {@link #GEOMETRIC_ZENITH} = 104 would have to be passed as a parameter.
 * @return The {@link java.util.Date}of the offset after (or before) {@link #getSunset()}. If the calculation can't
 *         be computed such as in the Arctic Circle where there is at least one day a year where the sun does not
 *         rise, and one where it does not set, a null will be returned. See detailed explanation on top of the
 *         page.
 */

- (NSDate *)sunsetOffsetByDegrees:(double)offsetZenith;

/**
 * A method that will roll the sunset time forward a day if sunset occurs before sunrise. This is a rare occurrence
 * and will typically happen when calculating very early and late twilights in a location with a time zone far off
 * from its natural 15&deg; boundaries. This method will ensure that in this case, the sunset will be incremented to
 * the following date. An example of this is Marquette, Michigan that far west of the natural boundaries for EST.
 * When you add in DST this pushes it an additional hour off. Calculating the extreme 26&deg;twilight on March 6th
 * it start at 2:34:30 on the 6th and end at 1:01:46 on the following day March 7th. Occurrences are more common in
 * the polar region for dips as low as 3&deg; (Tested for Hooper Bay, Alaska).
 *
 * @param sunset the sunset date to adjust if needed
 * @param sunrise the sunrise to compare to the sunset
 * @return the adjusted sunset date. If the calculation can't be computed such as in the Arctic Circle where there
 *         is at least one day a year where the sun does not rise, and one where it does not set, a null will be
 *         returned. See detailed explanation on top of the page.
 */

- (NSDate *)adjustedSunsetDateWithSunset:(NSDate*)sunset andSunrise:(NSDate *)sunrise;

/**-----
 * @name Calculating the End of Twilight
 * -----
 */

/**
 * A method that returns the end of civil twilight using a zenith of {@link #CIVIL_ZENITH 96&deg;}.
 *
 * @return The <code>Date</code> of the end of civil twilight using a zenith of {@link #CIVIL_ZENITH 96&deg;}. If
 *         the calculation can't be computed, null will be returned. See detailed explanation on top of the page.
 */

- (NSDate *)endCivilTwilight;

/**
 * A method that returns the end of nautical twilight using a zenith of {@link #NAUTICAL_ZENITH 102&deg;}.
 *
 * @return The <code>Date</code> of the end of nautical twilight using a zenith of {@link #NAUTICAL_ZENITH 102&deg;}
 *         . If the calculation can't be computed, null will be returned. See detailed explanation on top of the
 *         page.
 */

- (NSDate *)endNauticalTwilight;

/**
 * A method that returns the end of astronomical twilight using a zenith of {@link #ASTRONOMICAL_ZENITH 108&deg;}.
 *
 * @return the <code>Date</code> of the end of astronomical twilight using a zenith of {@link #ASTRONOMICAL_ZENITH
 *         108&deg;}. If the calculation can't be computed, null will be returned. See detailed explanation on top
 *         of the page.
 */

- (NSDate *)endAstronomicalTwilight;

/**
 * A method that returns the sunrise in UTC time without correction for time zone offset from GMT and without using
 * daylight savings time.
 *
 * @param zenith the degrees below the horizon. For time after sunrise use negative numbers.
 * @return The time in the format: 18.75 for 18:45:00 UTC/GMT. If the calculation can't be computed such as in the
 *         Arctic Circle where there is at least one day a year where the sun does not rise, and one where it does
 *         not set, {@link Double#NaN} will be returned. See detailed explanation on top of the page.
 */

- (double)UTCSunrise:(double)zenith;

/**
 * A method that returns the sunrise in UTC time without correction for time zone offset from GMT and without using
 * daylight savings time. Non-sunrise and sunset calculations such as dawn and dusk, depend on the amount of visible
 * light, something that is not affected by elevation. This method returns UTC sunrise calculated at sea level. This
 * forms the base for dawn calculations that are calculated as a dip below the horizon before sunrise.
 *
 * @param zenith the degrees below the horizon. For time after sunrise use negative numbers.
 * @return The time in the format: 18.75 for 18:45:00 UTC/GMT. If the calculation can't be computed such as in the
 *         Arctic Circle where there is at least one day a year where the sun does not rise, and one where it does
 *         not set, {@link Double#NaN} will be returned. See detailed explanation on top of the page.
 */

- (double)UTCSeaLevelSunrise:(double)zenith;

/**
 * A method that returns the sunset in UTC time without correction for time zone offset from GMT and without using
 * daylight savings time.
 *
 * @param zenith the degrees below the horizon. For time after sunset use negative numbers.
 * @return The time in the format: 18.75 for 18:45:00 UTC/GMT. If the calculation can't be computed such as in the
 *         Arctic Circle where there is at least one day a year where the sun does not rise, and one where it does
 *         not set, {@link Double#NaN} will be returned. See detailed explanation on top of the page.
 */

- (double)UTCSunset:(double)zenith;

/**
 * A method that returns the sunset in UTC time without correction for elevation, time zone offset from GMT and
 * without using daylight savings time. Non-sunrise and sunset calculations such as dawn and dusk, depend on the
 * amount of visible light, something that is not affected by elevation. This method returns UTC sunset calculated
 * at sea level. This forms the base for dusk calculations that are calculated as a dip below the horizon after
 * sunset.
 *
 * @param zenith the degrees below the horizon. For time before sunset use negative numbers.
 * @return The time in the format: 18.75 for 18:45:00 UTC/GMT. If the calculation can't be computed such as in the
 *         Arctic Circle where there is at least one day a year where the sun does not rise, and one where it does
 *         not set, {@link Double#NaN} will be returned. See detailed explanation on top of the page.
*/

- (double)UTCSeaLevelSunset:(double)zenith;

/**
 * A utility method that will allow the calculation of a temporal (solar) hour based on the sunrise and sunset
 * passed as parameters to this method. An example of the use of this method would be the calculation of a
 * non-elevation adjusted temporal hour by passing in getSeaLevelSunrise sea level sunrise} and
 * {@link #getSeaLevelSunset() sea level sunset} as parameters.
 *
 * @param sunrise The start of the day.
 * @param sunset The end of the day.
 *
 * @return the long millisecond length of the temporal hour. If the calculation can't be computed a
 *         LONG_MIN will be returned. See detailed explanation on top of the page.
 */

- (double)temporalHourFromSunrise:(NSDate *)sunrise toSunset:(NSDate*)sunset;

/**
 * A method that returns sundial or solar noon. It occurs when the Sun is <a href
 * ="http://en.wikipedia.org/wiki/Transit_%28astronomy%29">transitting</a> the <a
 * href="http://en.wikipedia.org/wiki/Meridian_%28astronomy%29">celestial meridian</a>. In this class it is
 * calculated as halfway between sea level sunrise and sea level sunset, which can be slightly off the real transit
 * time due to changes in declination (the lengthening or shortening day).
 *
 * @return the <code>Date</code> representing Sun's transit. If the calculation can't be computed such as in the
 *         Arctic Circle where there is at least one day a year where the sun does not rise, and one where it does
 *         not set, null will be returned. See detailed explanation on top of the page.
 */

- (NSDate *)sunTransit;

/**-----
 * @name Miscellaneous Methods
 * -----
 */

/**
 *  This method returns the calculated time
 *  as an NSDate object based on the user's time zone
 *  and today's date.
 *
 *  @param time The time as a double.
 *
 *  @return The calculated time
 *  as an NSDate object based on the user's time zone
 *  and today's date.
 */

- (NSDate *)dateFromTime:(double)time;

/**
 *  A method that returns the calculated time
 *  as an NSDate object based on a given time
 *  zone and a given date.
 *
 *  Returns nil if the the "time" parameter is NAN.
 *
 *  @param time the time offset from the start of the day, representing hours, minutes, and seconds.
 *  @param tz A timezone to use to calculate the date.
 *  @param date The date representing the units larger than hours.
 *
 *  @return An NSDate containing the exact time represented by combining the date and time values.
 */

- (NSDate *)dateFromTime:(double)time inTimeZone:(NSTimeZone *)tz onDate:(NSDate *)date;

/**
 *  Returns a formatted string representing the supplied
 *  date in the supplied time zone.
 *
 *  This method does not toggle the timezone of the
 *  NSDateFormatter that is used, so assume the default
 *  calendar.
 *
 *  @param date The date to display.
 *  @param timezone The time zone to format against.
 *
 *  @return A string representation of the supplied date in the supplied time zone.
 */

- (NSString *)stringFromDate:(NSDate *)date forTimeZone:(NSTimeZone *)timezone;

/**
 *  Returns a formatted string representing the supplied
 *  date in the supplied time zone.
 *
 *  This method does not toggle the timezone of the
 *  NSDateFormatter that is used, so assume the default
 *  calendar.
 *
 *  @param date The date to display.
 *  @param tz The time zone to format against.
 *  @param shouldShowSeconds A flag to disable seconds in our final string.
 *
 *  @return A string representation of the supplied date in the supplied time zone.
 *
 *  @see stringFromDate:forTimeZone:
 */

- (NSString *)stringFromDate:(NSDate *)date forTimeZone:(NSTimeZone *)tz withSeconds:(BOOL)shouldShowSeconds;

/**
 *  Expose the internal calendar so the main class can
 *  appropriately forward methods.
 *
 */

- (NSCalendar *)internalCalendar;

@end
