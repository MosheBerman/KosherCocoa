/**
 *  MBCalendarCategories.m
 *  KosherCocoa 3
 *
 *  Created by Moshe Berman on 4/12/13.
 *  Updated by Moshe Berman on 11/12/15.
 *
 *  Use of KosherCocoa 3 is governed by the LGPL 2.1 License.
 */
#import "NSCalendar+Components.h"

@implementation NSCalendar (Components)

- (NSInteger)weekOfMonthInDate:(NSDate*)date
{
    NSDateComponents *comps = [self components:NSCalendarUnitWeekOfMonth fromDate:date];
    return [comps weekOfMonth];
}

- (NSInteger)weekOfYearInDate:(NSDate*)date
{
    NSDateComponents *comps = [self components:NSCalendarUnitWeekOfYear fromDate:date];
    return [comps weekOfYear];
}

- (NSInteger)weekdayInDate:(NSDate*)date
{
    NSDateComponents *comps = [self components:NSCalendarUnitWeekday fromDate:date];
    return [comps weekday];
}

- (NSInteger)secondsInDate:(NSDate*)date
{
    NSDateComponents *comps = [self components:NSCalendarUnitSecond fromDate:date];
    return [comps second];
}

- (NSInteger)minutesInDate:(NSDate*)date
{
    NSDateComponents *comps = [self components:NSCalendarUnitMinute fromDate:date];
    return [comps minute];
}

- (NSInteger)hoursInDate:(NSDate*)date
{
    NSDateComponents *comps = [self components:NSCalendarUnitHour fromDate:date];
    return [comps hour];
}

- (NSInteger)daysInDate:(NSDate*)date
{
    NSDateComponents *comps = [self components:NSCalendarUnitDay fromDate:date];
    return [comps day];
}

- (NSInteger)monthsInDate:(NSDate*)date
{
    NSDateComponents *comps = [self components:NSCalendarUnitMonth fromDate:date];
    return [comps month];
}

- (NSInteger)yearsInDate:(NSDate*)date
{
    NSDateComponents *comps = [self components:NSCalendarUnitYear fromDate:date];
    return [comps year];
}

- (NSInteger)eraInDate:(NSDate*)date
{
    NSDateComponents *comps = [self components:NSCalendarUnitEra fromDate:date];
    return [comps era];
}



@end
