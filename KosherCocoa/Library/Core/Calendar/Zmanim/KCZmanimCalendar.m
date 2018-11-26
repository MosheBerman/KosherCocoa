/**
 *  KCZmanimCalendar.m
 *  KosherCocoa 4
 *
 *  Created by Moshe Berman on 7/19/11.
 *  Updated by Moshe Berman on 10/8/13.
 *
 *  Use of KosherCocoa 4 is governed by the LGPL 2.1 License.
 */

#import "KCZmanimCalendar.h"
#import "MBCalendarCategories.h"
#import "KCAstronomicalCalendar+DateManipulation.h"

@implementation KCZmanimCalendar

- (NSDate * _Nullable)alosHashachar
{
    return [self sunriseOffsetByDegrees:kZenithSixteenPointOne];
}

- (NSDate * _Nullable)alos72
{
    return [self dateBySubtractingMinutes:72 fromDate:[self seaLevelSunrise]];
}

- (NSDate * _Nullable)chatzos
{
    return [self sunTransit];    
}

- (NSDate * _Nullable)sofZmanShmaGra
{
    return [[self seaLevelSunrise] dateByAddingTimeInterval:[self shaahZmanisGra]*3];
}

- (NSDate * _Nullable)sofZmanShmaMogenAvraham
{
    return [[self alos72] dateByAddingTimeInterval:[self shaahZmanisMogenAvraham]*3];
}

//
//  TODO: Make this look for yom tov and shabbosim autocatically
//
//  Might not make sense, since chagim are calculated in a subclass
//  but perhaps calculate sunset there in overridden methods...
//

- (NSDate * _Nullable)candleLighting
{
    NSUInteger candleLightingOffset = [self candleLightingOffset];

    return [self candleLightingWithOffsetFromSunset:candleLightingOffset];
}

/**
 *  A method to return the candle lighting time, calculated as offset
 *  minutes before sunset.
 *
 *  @param offsetInMinutes The number of minutes before sunset.
 *
 *  @return An NSDate representing the candle lighting time.
 */

- (NSDate * _Nullable)candleLightingWithOffsetFromSunset:(NSInteger)offsetInMinutes
{
    return [self dateBySubtractingMinutes:offsetInMinutes fromDate:[self sunset]];
}

- (NSDate * _Nullable)candleLighting15
{
    return [self candleLightingWithOffsetFromSunset:15];
}

- (NSDate * _Nullable)candleLighting18
{
    return [self candleLightingWithOffsetFromSunset:18];
}

- (NSDate * _Nullable)candleLighting20
{
    return [self candleLightingWithOffsetFromSunset:20];
}

- (NSDate * _Nullable)candleLighting22
{
    return [self candleLightingWithOffsetFromSunset:22];
}

- (NSDate * _Nullable)candleLighting30
{
    return [self candleLightingWithOffsetFromSunset:30];
}

- (NSDate * _Nullable)candleLighting40
{
    return [self candleLightingWithOffsetFromSunset:40];
}

- (NSDate * _Nullable)sofZmanTfilaGra
{
    return [[self seaLevelSunrise] dateByAddingTimeInterval:[self shaahZmanisGra]*4];
}

- (NSDate * _Nullable)sofZmanTfilaMogenAvraham
{
    return [[self alos72] dateByAddingTimeInterval:[self shaahZmanisMogenAvraham]*4];
}

- (NSDate * _Nullable)minchaGedola
{
    return [[self seaLevelSunrise] dateByAddingTimeInterval:[self shaahZmanisGra]*6.5];
}

- (NSDate * _Nullable)minchaKetana
{
    return [[self seaLevelSunrise] dateByAddingTimeInterval:[self shaahZmanisGra]*9.5];    
}

- (NSDate * _Nullable)plagHamincha
{
        return [[self seaLevelSunrise] dateByAddingTimeInterval:[self shaahZmanisGra]*10.75];
}

- (double)shaahZmanisGra
{
    return [self temporalHourFromSunrise:[self seaLevelSunrise] toSunset:[self seaLevelSunset]];
}

- (double)shaahZmanisMogenAvraham
{
    return [self temporalHourFromSunrise:[self alos72] toSunset:[self tzais72]];
}

- (NSDate * _Nullable)tzais
{
    return [self sunsetOffsetByDegrees:kZenithEightPointFive];
}

- (NSDate * _Nullable)tzais72
{
    return [self dateByAddingMinutes:72 toDate:[self seaLevelSunset]];
}

@end
