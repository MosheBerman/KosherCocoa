/**
 *  KCZmanimCalendar.m
 *  KosherCocoa 3
 *
 *  Created by Moshe Berman on 7/19/11.
 *  Updated by Moshe Berman on 10/8/13.
 *
 *  Use of KosherCocoa 3 is governed by the LGPL 2.1 License.
 */

#import "KCZmanimCalendar.h"
#import "MBCalendarCategories.h"
#import "KCAstronomicalCalendar+DateManipulation.h"

@implementation KCZmanimCalendar

- (NSDate *)alosHashachar
{
    return [self sunriseOffsetByDegrees:kZenithSixteenPointOne];
}

- (NSDate *)alos72
{
    return [self dateBySubtractingMinutes:72 fromDate:[self seaLevelSunrise]];
}

- (NSDate *)chatzos
{
    return [self sunTransit];    
}

- (NSDate *)sofZmanShmaGra
{
    return [[self seaLevelSunrise] dateByAddingTimeInterval:[self shaahZmanisGra]*3];
}

- (NSDate *)sofZmanShmaMogenAvraham
{
    return [[self alos72] dateByAddingTimeInterval:[self shaahZmanisMogenAvraham]*3];
}

//
//  TODO: Make this look for yom tov and shabbosim autocatically
//
//  Might not make sense, since chagim are calculated in a subclass
//  but perhaps calculate sunset there in overridden methods...
//

- (NSDate *)candleLighting
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

- (NSDate *)candleLightingWithOffsetFromSunset:(NSInteger)offsetInMinutes
{
    return [self dateBySubtractingMinutes:offsetInMinutes fromDate:[self sunset]];
}

- (NSDate *)candleLighting15
{
    return [self candleLightingWithOffsetFromSunset:15];
}

- (NSDate *)candleLighting18
{
    return [self candleLightingWithOffsetFromSunset:18];
}

- (NSDate *)candleLighting20
{
    return [self candleLightingWithOffsetFromSunset:20];
}

- (NSDate *)candleLighting22
{
    return [self candleLightingWithOffsetFromSunset:22];
}

- (NSDate *)candleLighting30
{
    return [self candleLightingWithOffsetFromSunset:30];
}

- (NSDate *)candleLighting40
{
    return [self candleLightingWithOffsetFromSunset:40];
}

- (NSDate *)sofZmanTfilaGra
{
    return [[self seaLevelSunrise] dateByAddingTimeInterval:[self shaahZmanisGra]*4];
}

- (NSDate *)sofZmanTfilaMogenAvraham
{
    return [[self alos72] dateByAddingTimeInterval:[self shaahZmanisMogenAvraham]*4];
}

- (NSDate *)minchaGedola
{
    return [[self seaLevelSunrise] dateByAddingTimeInterval:[self shaahZmanisGra]*6.5];
}

- (NSDate *)minchaKetana
{
    return [[self seaLevelSunrise] dateByAddingTimeInterval:[self shaahZmanisGra]*9.5];    
}

- (NSDate *)plagHamincha
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

- (NSDate *)tzais
{
    return [self sunsetOffsetByDegrees:kZenithEightPointFive];
}

- (NSDate *)tzais72
{
    return [self dateByAddingMinutes:72 toDate:[self seaLevelSunset]];
}

@end
