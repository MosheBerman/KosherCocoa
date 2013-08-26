//
//  GeoLocation.h
//  Zmanim
//
//  Created by Moshe Berman on 3/22/11.
//  Copyright 2011 MosheBerman.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <math.h>
#import "KCConstants.h"

@interface GeoLocation : NSObject 

@property (nonatomic, strong) NSString *locationName;
@property (nonatomic, strong) NSTimeZone *timeZone;
@property double latitude;
@property double longitude;
@property double altitude;

//
//  Initializers
//

- (id)initWithName:(NSString *)name andLatitude:(double)latitude andLongitude:(double)longitude andTimeZone:(NSTimeZone *)timezone;

//
//
//

- (id)initWithName:(NSString *)name andLatitude:(double)latitude andLongitude:(double)longitude andElevation:(double)elevation andTimeZone:(NSTimeZone *)timezone;

//
//
//

- (double)vincentyFormulaForLocation:(GeoLocation *)location withBearing:(int)formula;

//
//
//

- (long)localMeanTimeOffset;

@end
