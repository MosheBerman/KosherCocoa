/**
 *  KCGeolocation.h
 *  KosherCocoa 3
 *
 *  Created by Moshe Berman on 3/22/11.
 *  Updated by Moshe Berman on 10/8/13.
 *
 *  Use of KosherCocoa 3 is governed by the LGPL 2.1 License.
 */

#import <Foundation/Foundation.h>
#import <math.h>
#import "KCConstants.h"

/** A class that represents a location and a timezone. */
@interface KCGeoLocation : NSObject 

/**-----
 * @name Properties
 * -----
 */

@property (nonatomic, strong) NSString *locationName;
@property (nonatomic, strong) NSTimeZone *timeZone;
@property (nonatomic, assign) double latitude;
@property (nonatomic, assign) double longitude;
@property (nonatomic, assign) double altitude;

/**-----
 * @name Initializers
 * -----
 */

/**
 *  This method insantiates a new KCGeoLocation.
 *
 *  @param latitude The latitude that the location represents.
 *  @param longitude The longitude that the location represents.
 *  @param timezone The time zone that the location represents.
 *
 *  @return A configured KCGeoLocation instance.
 */

- (id)initWithLatitude:(double)latitude andLongitude:(double)longitude andTimeZone:(NSTimeZone *)timezone;

/**
 *  This method insantiates a new KCGeoLocation.
 *
 *  @param latitude The latitude that the location represents.
 *  @param longitude The longitude that the location represents.
 *  @param elevation The altitude that the location represents.
 *  @param timezone The time zone that the location represents.
 *
 *  @return A configured KCGeoLocation instance.
 */

- (id)initWithLatitude:(double)latitude andLongitude:(double)longitude elevation:(double)elevation  andTimeZone:(NSTimeZone *)timezone;

/**
 *  This method insantiates a new KCGeoLocation.
 *
 *  @param name A name for the location. This isn't required.
 *  @param latitude The latitude that the location represents.
 *  @param longitude The longitude that the location represents.
 *  @param timezone The time zone that the location represents.
 *
 *  @return A configured KCGeoLocation instance.
 */

- (id)initWithName:(NSString *)name andLatitude:(double)latitude andLongitude:(double)longitude andTimeZone:(NSTimeZone *)timezone;

/**
 *  This method insantiates a new KCGeoLocation.
 *
 *  @param name A name for the location. This isn't required.
 *  @param latitude The latitude that the location represents.
 *  @param longitude The longitude that the location represents.
 *  @param elevation The altitude that the location represents.
 *  @param timezone The time zone that the location represents.
 *
 *  @return A configured KCGeoLocation instance.
 */

- (id)initWithName:(NSString *)name andLatitude:(double)latitude andLongitude:(double)longitude andElevation:(double)elevation andTimeZone:(NSTimeZone *)timezone;

/**
 * Calculate <a
 * href="http://en.wikipedia.org/wiki/Great-circle_distance">geodesic
 * distance</a> in Meters between this Object and a second Object passed to
 * this method using <a
 * href="http://en.wikipedia.org/wiki/Thaddeus_Vincenty">Thaddeus Vincenty's</a>
 * inverse formula See T Vincenty, "<a
 * href="http://www.ngs.noaa.gov/PUBS_LIB/inverse.pdf">Direct and Inverse
 * Solutions of Geodesics on the Ellipsoid with application of nested
 * equations</a>", Survey Review, vol XXII no 176, 1975.
 *
 *  @param location the destination location
 *  @param formula This formula calculates initial bearing InitialBearing, final bearing ({@link #FINAL_BEARING}) and distance ({@link #DISTANCE}).
 *
 *  @return The value of the formula with the location.
 */

- (double)vincentyFormulaForLocation:(KCGeoLocation *)location withBearing:(int)formula;

/**
* A method that will return the location's local mean time 
 *  offset in milliseconds from local
 *  <a href="http://en.wikipedia.org/wiki/Standard_time"> standard time</a>.
 *  The globe is split into 360&deg;, with
 *   15&deg; per hour of the day. For a local that is at a longitude that
 *  is evenly divisible by 15 (longitude % 15 == 0), at solar noon (with 
 *  adjustment for the
 *  <a href="http://en.wikipedia.org/wiki/Equation_of_time">equation of time</a>) the sun
 *  should be directly overhead, so a user who is 1&deg; west of this will have noon at 4
 *  minutes after standard time noon, and conversely, a user
 *  who is 1&deg; east of the 15&deg; longitude will have noon at 11:56 AM. Lakewood, N.J., 
 *  whose longitude is -74.2094, is 0.7906 away from the closest multiple of 15 at -75&deg;. 
 *  This is multiplied by 4 to yield 3 minutes and 10 seconds earlier than standard time. 
 *  The offset returned does not account for the
 *  <a href="http://en.wikipedia.org/wiki/Daylight_saving_time">Daylight saving time</a>
 *  offset since this class is unaware of dates.
 *
 *  @return the offset in milliseconds not accounting for Daylight saving time. A positive 
 *  value will be returned East of the 15&deg; timezone line, and a negative value West of i
 */

- (long)localMeanTimeOffset;

@end
