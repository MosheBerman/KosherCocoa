/**
 *  KCZmanimCalendar.m
 *  KosherCocoa 2
 *
 *  Created by Moshe Berman on 7/19/11.
 *  Updated by Moshe Berman on 10/8/13.
 *
 *  Use of KosherCocoa 2 is governed by the LGPL 2.1 License.
 */

#import "KCZmanimCalendar.h"
#import "MBCalendarCategories.h"

@implementation KCZmanimCalendar

- (NSDate *) alosHashachar{
    return [self sunriseOffsetByDegrees:kZenithSixteenPointOne];
}

- (NSDate *) alos72{
    return [self dateBySubtractingMinutes:72 fromDate:[self seaLevelSunrise]];
}

- (NSDate *) chatzos{
    return [self sunTransit];    
}

- (NSDate *) sofZmanShmaGra{
    return [[self seaLevelSunrise] dateByAddingTimeInterval:[self shaahZmanisGra]*3];
}

- (NSDate *) sofZmanShmaMogenAvraham{
    return [[self alos72] dateByAddingTimeInterval:[self shaahZmanisMogenAvraham]*3];
}

//
//  TODO: Make this look for yom tov and shabbosim autocatically
//
//  Might not make sense, since chagim are calculated in a subclass
//  but perhaps calculate sunset there in overridden methods...
//

- (NSDate *) candleLighting{
    
    NSUInteger candleLightingOffset = [self candleLightingOffset];
    return [self dateBySubtractingMinutes:candleLightingOffset fromDate:[self sunset]];

}

- (NSDate *) candleLighting15{
    self.candleLightingOffset = 15;
    return [self candleLighting];
}

- (NSDate *) candleLighting18{
    self.candleLightingOffset = 18;
    return [self candleLighting];
}

- (NSDate *) candleLighting20{
    self.candleLightingOffset = 20;
    return [self candleLighting];
}

- (NSDate *) candleLighting22{
    self.candleLightingOffset = 22;
    return [self candleLighting];
}

- (NSDate *) candleLighting30{
    self.candleLightingOffset = 30;
    return [self candleLighting];
}

- (NSDate *) candleLighting40{
    self.candleLightingOffset = 40;
    return [self candleLighting];
}

- (NSDate *) sofZmanTfilaGra{
    return [[self seaLevelSunrise] dateByAddingTimeInterval:[self shaahZmanisGra]*4];
}

- (NSDate *) sofZmanTfilaMogenAvraham{
    return [[self alos72] dateByAddingTimeInterval:[self shaahZmanisMogenAvraham]*4];
}

- (NSDate *) minchaGedola{
    return [[self seaLevelSunrise] dateByAddingTimeInterval:[self shaahZmanisGra]*6.5];
}

- (NSDate *) minchaKetana{
    return [[self seaLevelSunrise] dateByAddingTimeInterval:[self shaahZmanisGra]*9.5];    
}

- (NSDate *) plagHamincha{
        return [[self seaLevelSunrise] dateByAddingTimeInterval:[self shaahZmanisGra]*10.75];
}

- (double) shaahZmanisGra{
    return [self temporalHourFromSunrise:[self seaLevelSunrise] toSunset:[self seaLevelSunset]];
}

- (double) shaahZmanisMogenAvraham{
    return [self temporalHourFromSunrise:[self alos72] toSunset:[self tzais72]];
}

- (NSDate *)tzais{
    return [self sunsetOffsetByDegrees:kZenithEightPointFive];
}

- (NSDate *) tzais72{
    return [self dateByAddingMinutes:72 toDate:[self seaLevelSunset]];
}

@end
