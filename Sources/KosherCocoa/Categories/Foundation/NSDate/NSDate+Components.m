/**
 *  NSDate+Components.h
 *  KosherCocoa 3
 *
 *  Created by Moshe Berman on 4/12/13.
 *  Updated by Moshe Berman on 11/12/15.
 *
 *  Use of KosherCocoa 3 is governed by the LGPL 2.1 License.
 */

#import "NSDate+Components.h"
#import "NSDateComponents+AllComponents.h"


@implementation NSDate (KCComponents)

#pragma mark - Convenience Intializers


+ (NSDate *)dateWithDay:(NSUInteger)day month:(NSUInteger)month year:(NSUInteger)year
{
    return [NSDate dateWithDay:day Month:month Year:year andCalendar:[NSDate defaultCalendar]];
}

+ (NSDate *)dateWithDay:(NSUInteger)day Month:(NSUInteger)month Year:(NSUInteger)year andCalendar:(NSCalendar *)calendar
{
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setDay:day];
    [components setMonth:month];
    [components setYear:year];
    
    return [calendar dateFromComponents:components];
}

//  The "everything" method

+ (NSDate *)dateWithEra:(NSInteger)era year:(NSInteger)year month:(NSInteger)month day:(NSInteger)day hour:(NSInteger)hour minute:(NSInteger)minute second:(NSInteger)second week:(NSInteger)week weekday:(NSInteger)weekday weekdayOrdinal:(NSInteger)weekdayOrdinal andCalendar:(NSCalendar *)calendar
{
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setEra:era];
    [components setYear:year];
    [components setMonth:month];
    [components setDay:day];
    [components setHour:hour];
    [components setMinute:minute];
    [components setSecond:second];
    [components setWeekOfYear:week];
    [components setWeekday:weekday];
    [components setWeekdayOrdinal:weekdayOrdinal];
    
    return [calendar dateFromComponents:components];
}

#pragma mark - Default Values

//    All default values return components of [NSDate date].
+ (NSInteger)defaultEraForCalendar:(NSCalendar *)calendar
{
    return [[NSDate defaultComponentsForCalendar:calendar] era];
}

+ (NSInteger)defaultYearForCalendar:(NSCalendar *)calendar
{
    return [[NSDate defaultComponentsForCalendar:calendar] year];
}

+ (NSInteger)defaultMonthForCalendar:(NSCalendar *)calendar
{
    return [[NSDate defaultComponentsForCalendar:calendar] month];
}

+ (NSInteger)defaultDayForCalendar:(NSCalendar *)calendar
{
    return [[NSDate defaultComponentsForCalendar:calendar] day];
}

+ (NSInteger)defaultHourForCalendar:(NSCalendar *)calendar
{
    return [[NSDate defaultComponentsForCalendar:calendar] hour];
}

+ (NSInteger)defaultMinuteForCalendar:(NSCalendar *)calendar
{
    return [[NSDate defaultComponentsForCalendar:calendar] minute];
}

+ (NSInteger)defaultSecondForCalendar:(NSCalendar *)calendar
{
    return [[NSDate defaultComponentsForCalendar:calendar] second];
}

+ (NSInteger)defaultWeekForCalendar:(NSCalendar *)calendar
{
    return [[NSDate defaultComponentsForCalendar:calendar] weekOfYear];
}

+ (NSInteger)defaultWeekdayForCalendar:(NSCalendar *)calendar
{
    return [[NSDate defaultComponentsForCalendar:calendar] weekday];
}

+ (NSInteger)defaultWeekdayOrdinalForCalendar:(NSCalendar *)calendar
{
    return [[NSDate defaultComponentsForCalendar:calendar] weekdayOrdinal];
}

//  These use [NSCalendar currentCalendar].
+ (NSInteger)defaultEra
{
    return [[NSDate defaultComponents] era];
}

+ (NSInteger)defaultYear
{
    return [[NSDate defaultComponents] year];
}

+ (NSInteger)defaultMonth
{
    return [[NSDate defaultComponents] month];
}

+ (NSInteger)defaultDay
{
    return [[NSDate defaultComponents] day];
}

+ (NSInteger)defaultHour
{
    return [[NSDate defaultComponents] hour];
}

+ (NSInteger)defaultMinute
{
    return [[NSDate defaultComponents] minute];
}

+ (NSInteger)defaultSecond
{
    return [[NSDate defaultComponents] second];
}

+ (NSInteger)defaultWeek
{
    return [[NSDate defaultComponents] weekOfYear];
}

+ (NSInteger)defaultWeekday
{
    return [[NSDate defaultComponents] weekday];
}

+ (NSInteger)defaultWeekdayOrdinal
{
    return [[NSDate defaultComponents] weekdayOrdinal];
}

#pragma mark - Default Components and Calendar

+ (NSDateComponents *)defaultComponents
{
    return [self defaultComponentsForCalendar:[NSDate defaultCalendar]];
}

+ (NSDateComponents *)defaultComponentsForCalendar:(NSCalendar *)calendar
{    
    return [calendar components:[NSDateComponents allComponents] fromDate:[NSDate date]];
}

/* A default calendar */

+ (NSCalendar *)defaultCalendar
{
    return [NSCalendar currentCalendar];
}

@end
