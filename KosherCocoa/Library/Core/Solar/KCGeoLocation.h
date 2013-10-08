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
@property double latitude;
@property double longitude;
@property double altitude;

/**-----
 * @name Initializers
 * -----
 */

- (id)initWithName:(NSString *)name andLatitude:(double)latitude andLongitude:(double)longitude andTimeZone:(NSTimeZone *)timezone;

/**
 *
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
