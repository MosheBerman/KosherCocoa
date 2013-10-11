/**
 *  KCGeolocation.h
 *  KosherCocoa 2
 *
 *  Created by Moshe Berman on 3/22/11.
 *  Updated by Moshe Berman on 10/8/13.
 *
 *  Use of KosherCocoa 2 is governed by the LGPL 2.1 License.
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
 *  @param name A name for the location. This isn't required
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
 *  @param latitude The latitude that the location represents.
 *  @param longitude The longitude that the location represents.
 *  @param elevation The altitude that the location represents.
 *  @param timezone The time zone that the location represents.
 *
 *  @return A configured KCGeoLocation instance.
 */

- (id)initWithName:(NSString *)name andLatitude:(double)latitude andLongitude:(double)longitude andElevation:(double)elevation andTimeZone:(NSTimeZone *)timezone;

/**
 *
 */

- (double)vincentyFormulaForLocation:(KCGeoLocation *)location withBearing:(int)formula;

/**
 *
 */

- (long)localMeanTimeOffset;

@end
