//
//  AstronomicalCalendar.h
//  KosherCocoa
//
//  Created by Moshe Berman on 7/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "KCGeoLocation.h"
#import "KCSunriseAndSunsetCalculator.h"

/** A class that calculates various sunrise and sunset values. */

@interface KCAstronomicalCalendar : NSCalendar

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
 *  This method initializes a new instance of KCAstronomicalCalendars.
 *
 *  @param aGeoLocation A geolocation object representing the user.
 *  @see KCGeoLocation
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
 *  This method <#does something#>.
 *
 *  <#optional discussion#>
 *
 *  @param <#parameter name #> <#description#>
 *  @return <#return value#>
 */

- (NSDate *)sunset;

/**
 *  This method <#does something#>.
 *
 *  <#optional discussion#>
 *
 *  @param <#parameter name #> <#description#>
 *  @return <#return value#>
 */


- (NSDate *)seaLevelSunset;

/**
 *  This method <#does something#>.
 *
 *  <#optional discussion#>
 *
 *  @param <#parameter name #> <#description#>
 *  @return <#return value#>
 */


- (NSDate *)sunsetOffsetByDegrees:(double)offsetZenith;

/**
 *  This method <#does something#>.
 *
 *  <#optional discussion#>
 *
 *  @param <#parameter name #> <#description#>
 *  @return <#return value#>
 */


- (NSDate *)adjustedSunsetDateWithSunset:(NSDate*)sunset andSunrise:(NSDate *)sunrise;

/**-----
 * @name Calculating the End of Twilight
 * -----
 */

/**
 *  This method <#does something#>.
 *
 *  <#optional discussion#>
 *
 *  @param <#parameter name #> <#description#>
 *  @return <#return value#>
 */

- (NSDate *)endCivilTwilight;

/**
 *  This method <#does something#>.
 *
 *  <#optional discussion#>
 *
 *  @param <#parameter name #> <#description#>
 *  @return <#return value#>
 */


- (NSDate *)endNauticalTwilight;

/**
 *  This method <#does something#>.
 *
 *  <#optional discussion#>
 *
 *  @param <#parameter name #> <#description#>
 *  @return <#return value#>
 */


- (NSDate *)endAstronomicalTwilight;

/**
 *  This method <#does something#>.
 *
 *  <#optional discussion#>
 *
 *  @param <#parameter name #> <#description#>
 *  @return <#return value#>
 */

- (double)UTCSunrise:(double)zenith;

/**
 *  This method <#does something#>.
 *
 *  <#optional discussion#>
 *
 *  @param <#parameter name #> <#description#>
 *  @return <#return value#>
 */

- (double)UTCSeaLevelSunrise:(double)zenith;

/**
 *  This method <#does something#>.
 *
 *  <#optional discussion#>
 *
 *  @param <#parameter name #> <#description#>
 *  @return <#return value#>
 */

- (double)UTCSunset:(double)zenith;

/**
 *  This method <#does something#>.
 *
 *  <#optional discussion#>
 *
 *  @param <#parameter name #> <#description#>
 *  @return <#return value#>
 */

- (double)UTCSeaLevelSunset:(double)zenith;

/**
 *  This method <#does something#>.
 *
 *  <#optional discussion#>
 *
 *  @param <#parameter name #> <#description#>
 *  @return <#return value#>
 */

- (double)temporalHourFromSunrise:(NSDate *)sunrise toSunset:(NSDate*)sunset;

/**
 *  This method <#does something#>.
 *
 *  <#optional discussion#>
 *
 *  @param <#parameter name #> <#description#>
 *  @return <#return value#>
 */


- (NSDate *)sunTransit;

/**
 *  This method <#does something#>.
 *
 *  <#optional discussion#>
 *
 *  @param <#parameter name #> <#description#>
 *  @return <#return value#>
 */

/**-----
 * @name Miscellaneous Methods
 * -----
 */
/**
 *  This method <#does something#>.
 *
 *  <#optional discussion#>
 *
 *  @param <#parameter name #> <#description#>
 *  @return <#return value#>
 */


//
//  A method that returns the calculated time
//  as an NSDate object based on the user's time zone
//  and today's date.
//  

- (NSDate *)dateFromTime:(double)time;

//
//  A method that returns the calculated time
//  as an NSDate object based on a given time
//  zone and a given date. 
//
//  Returns nil if the time passed in is NAN.
//  

- (NSDate *)dateFromTime:(double)time inTimeZone:(NSTimeZone *)tz onDate:(NSDate *)date;

//
//
//
- (NSString *)stringFromDate:(NSDate *)date forTimeZone:(NSTimeZone *)tz withSeconds:(BOOL)shouldShowSeconds;
- (NSString *)stringFromDate:(NSDate *)date forTimeZone:(NSTimeZone *)tz;

@end
