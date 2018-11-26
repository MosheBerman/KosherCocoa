//
//  KCGeoLocation+NSCoding.m
//  KosherCocoa
//
//  Created by Moshe Berman on 11/26/18.
//  Copyright © 2018 Moshe Berman. All rights reserved.
//

#import "KCGeoLocation+NSCoding.h"

@implementation KCGeoLocation (NSCoding)

- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
    [aCoder encodeObject:self.locationName forKey:@"locationName"];
    [aCoder encodeObject:self.timeZone forKey:@"timeZone"];
    [aCoder encodeDouble:self.latitude forKey:@"latitude"];
    [aCoder encodeDouble:self.longitude forKey:@"longitude"];
    [aCoder encodeDouble:self.altitude forKey:@"altitude"];
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)aDecoder {
    self = [self init];
    
    if (self) {
        self.locationName = [aDecoder decodeObjectForKey:@"locationName"];
        self.timeZone = [aDecoder decodeObjectForKey:@"timeZone"];
        self.latitude = [aDecoder decodeDoubleForKey:@"latitude"];
        self.longitude = [aDecoder decodeDoubleForKey:@"longitude"];
        self.altitude = [aDecoder decodeDoubleForKey:@"altitude"];
    }
    return self;
}

@end
