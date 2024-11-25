/**
 *  NSCalendar+Ranges.m
 *  KosherCocoa 3
 *
 *  Created by Moshe Berman on 4/10/13.
 *  Updated by Moshe Berman on 11/12/15.
 *
 *  Use of KosherCocoa 3 is governed by the LGPL 2.1 License.
 */

#import "NSCalendar+Ranges.h"
#import "NSCalendar+DateManipulation.h"

@implementation NSCalendar (Ranges)

#pragma mark - Units per Minute

- (NSUInteger)secondsPerMinute
{
    return [self secondsPerMinuteUsingReferenceDate:[NSDate date]];
}

- (NSUInteger)secondsPerMinuteUsingReferenceDate:(NSDate * _Nonnull)date
{
    return [self rangeOfUnit:NSCalendarUnitSecond inUnit:NSCalendarUnitMinute forDate:date].length;
}

#pragma mark - Units Per Hour

- (NSUInteger)secondsPerHour
{
    return [self secondsPerHourUsingReferenceDate:[NSDate date]];
}

- (NSUInteger)secondsPerHourUsingReferenceDate:(NSDate * _Nonnull)date
{
    return [self rangeOfUnit:NSCalendarUnitSecond inUnit:NSCalendarUnitHour forDate:date].length;
}

- (NSUInteger)minutesPerHour
{
    return [self minutesPerHourUsingReferenceDate:[NSDate date]];
}

- (NSUInteger)minutesPerHourUsingReferenceDate:(NSDate * _Nonnull)date
{
    return [self rangeOfUnit:NSCalendarUnitMinute inUnit:NSCalendarUnitHour forDate:date].length;
}

#pragma mark - Units per Day

- (NSUInteger)secondsPerDay
{
    return [self secondsPerDayUsingReferenceDate:[NSDate date]];
}

- (NSUInteger)secondsPerDayUsingReferenceDate:(NSDate * _Nonnull)date
{
    return [self rangeOfUnit:NSCalendarUnitSecond inUnit:NSCalendarUnitDay forDate:date].length;
}

- (NSUInteger)minutesPerDay
{
    return [self minutesPerDayUsingReferenceDate:[NSDate date]];
}

- (NSUInteger)minutesPerDayUsingReferenceDate:(NSDate * _Nonnull)date
{
    return [self rangeOfUnit:NSCalendarUnitMinute inUnit:NSCalendarUnitDay forDate:date].length;
}

- (NSUInteger)hoursPerDay
{
    return [self hoursPerDayUsingReferenceDate:[NSDate date]];
}

- (NSUInteger)hoursPerDayUsingReferenceDate:(NSDate * _Nonnull)date
{
    return [self rangeOfUnit:NSCalendarUnitHour inUnit:NSCalendarUnitDay forDate:date].length;
}

#pragma mark - Units Per Week

- (NSUInteger)secondsPerWeek
{
    return [self secondsPerWeekUsingReferenceDate:[NSDate date]];
}

- (NSUInteger)secondsPerWeekUsingReferenceDate:(NSDate * _Nonnull)date
{
    return [self rangeOfUnit:NSCalendarUnitSecond inUnit:NSCalendarUnitWeekOfYear forDate:date].length;
}

- (NSUInteger)minutesPerWeek
{
    return [self minutesPerWeekUsingReferenceDate:[NSDate date]];
}

- (NSUInteger)minutesPerWeekUsingReferenceDate:(NSDate * _Nonnull)date
{
    return [self rangeOfUnit:NSCalendarUnitMinute inUnit:NSCalendarUnitWeekOfYear forDate:date].length;
}

- (NSUInteger)hoursPerWeek
{
    return [self hoursPerWeekUsingReferenceDate:[NSDate date]];
}

- (NSUInteger)hoursPerWeekUsingReferenceDate:(NSDate * _Nonnull)date
{
    return [self rangeOfUnit:NSCalendarUnitHour inUnit:NSCalendarUnitWeekOfYear forDate:date].length;
}

- (NSUInteger)daysPerWeek
{
    return [self daysPerWeekUsingReferenceDate:[NSDate date]];
}

- (NSUInteger)daysPerWeekUsingReferenceDate:(NSDate * _Nonnull)date
{
    NSDate *weekLater = [self dateByAddingWeeks:1 toDate:date];
    return [[self components:NSCalendarUnitDay fromDate:date toDate:weekLater options:0] day];
}

#pragma mark - Units Per Month

- (NSUInteger)secondsPerMonth
{
    return [self secondsPerMonthUsingReferenceDate:[NSDate date]];
}

- (NSUInteger)secondsPerMonthUsingReferenceDate:(NSDate * _Nonnull)date
{
    return [self rangeOfUnit:NSCalendarUnitSecond inUnit:NSCalendarUnitMonth forDate:date].length;
}

- (NSUInteger)minutesPerMonth
{
    return [self minutesPerMonthUsingReferenceDate:[NSDate date]];
}

- (NSUInteger)minutesPerMonthUsingReferenceDate:(NSDate * _Nonnull)date
{
    return [self rangeOfUnit:NSCalendarUnitMinute inUnit:NSCalendarUnitMonth forDate:date].length;
}

- (NSUInteger)hoursPerMonth
{
    return [self hoursPerMonthUsingReferenceDate:[NSDate date]];
}

- (NSUInteger)hoursPerMonthUsingReferenceDate:(NSDate * _Nonnull)date
{
    return [self rangeOfUnit:NSCalendarUnitHour inUnit:NSCalendarUnitMonth forDate:date].length;
}

- (NSUInteger)daysPerMonth
{
    return [self daysPerMonthUsingReferenceDate:[NSDate date]];
}

- (NSUInteger)daysPerMonthUsingReferenceDate:(NSDate * _Nonnull)date
{
    return [self rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date].length;
}

- (NSUInteger)weeksPerMonth
{
    return [self weeksPerMonthUsingReferenceDate:[NSDate date]];
}

- (NSUInteger)weeksPerMonthUsingReferenceDate:(NSDate * _Nonnull)date
{
    return [self rangeOfUnit:NSCalendarUnitWeekOfYear inUnit:NSCalendarUnitMonth forDate:date].length;
}

#pragma mark - Units Per Year

- (NSUInteger)secondsPerYear
{
    return [self secondsPerYearUsingReferenceDate:[NSDate date]];
}

- (NSUInteger)secondsPerYearUsingReferenceDate:(NSDate * _Nonnull)date
{
    return [self rangeOfUnit:NSCalendarUnitSecond inUnit:NSCalendarUnitYear forDate:date].length;
}

- (NSUInteger)minutesPerYear
{
    return [self minutesPerYearUsingReferenceDate:[NSDate date]];
}

- (NSUInteger)minutesPerYearUsingReferenceDate:(NSDate * _Nonnull)date
{
    return [self rangeOfUnit:NSCalendarUnitMinute inUnit:NSCalendarUnitYear forDate:date].length;
}

- (NSUInteger)hoursPerYear
{
    return [self hoursPerYearUsingReferenceDate:[NSDate date]];
}

- (NSUInteger)hoursPerYearUsingReferenceDate:(NSDate * _Nonnull)date
{
    return [self rangeOfUnit:NSCalendarUnitHour inUnit:NSCalendarUnitYear forDate:date].length;
}

- (NSUInteger)daysPerYear
{
    return [self daysPerYearUsingReferenceDate:[NSDate date]];
}

- (NSUInteger)daysPerYearUsingReferenceDate:(NSDate * _Nonnull)date
{
    return [self rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitYear forDate:date].length;
}

- (NSUInteger)weeksPerYear
{
    return [self weeksPerMonthUsingReferenceDate:[NSDate date]];
}

- (NSUInteger)weeksPerYearUsingReferenceDate:(NSDate * _Nonnull)date
{
    return [self rangeOfUnit:NSCalendarUnitWeekOfYear inUnit:NSCalendarUnitYear forDate:date].length;
}


- (NSUInteger)monthsPerYear
{
    return [self monthsPerYearUsingReferenceDate:[NSDate date]];
}

- (NSUInteger)monthsPerYearUsingReferenceDate:(NSDate * _Nonnull)date
{
    return [self rangeOfUnit:NSCalendarUnitMonth inUnit:NSCalendarUnitYear forDate:date].length;
}

#pragma mark - Number of Units Between Dates

- (NSInteger)secondsFromDate:(NSDate * _Nonnull)fromDate toDate:(NSDate * _Nonnull)toDate
{
    return [[self components:NSCalendarUnitSecond fromDate:fromDate toDate:toDate options:0] second];
}

- (NSInteger)minutesFromDate:(NSDate * _Nonnull)fromDate toDate:(NSDate * _Nonnull)toDate
{
    return [[self components:NSCalendarUnitMinute fromDate:fromDate toDate:toDate options:0] minute];
}

- (NSInteger)hoursFromDate:(NSDate * _Nonnull)fromDate toDate:(NSDate * _Nonnull)toDate
{
    return [[self components:NSCalendarUnitHour fromDate:fromDate toDate:toDate options:0] hour];
}

- (NSInteger)daysFromDate:(NSDate*)fromDate toDate:(NSDate * _Nonnull)toDate
{
    return [[self components:NSCalendarUnitDay fromDate:fromDate toDate:toDate options:0] day];
}

- (NSInteger)weeksFromDate:(NSDate*)fromDate toDate:(NSDate * _Nonnull)toDate
{
    return [self weeksOfYearFromDate:fromDate toDate:toDate];
}

- (NSInteger)weeksOfYearFromDate:(NSDate*)fromDate toDate:(NSDate * _Nonnull)toDate
{
    return [[self components:NSCalendarUnitWeekOfYear fromDate:fromDate toDate:toDate options:0] weekOfYear];
}

- (NSInteger)weeksOfMonthFromDate:(NSDate*)fromDate toDate:(NSDate * _Nonnull)toDate
{
    return [[self components:NSCalendarUnitWeekOfMonth fromDate:fromDate toDate:toDate options:0] weekOfMonth];
}

- (NSInteger)monthsFromDate:(NSDate*)fromDate toDate:(NSDate * _Nonnull)toDate
{
    return [[self components:NSCalendarUnitMonth fromDate:fromDate toDate:toDate options:0] month];
}

- (NSInteger)yearsFromDate:(NSDate*)fromDate toDate:(NSDate * _Nonnull)toDate
{
    return [[self components:NSCalendarUnitYear fromDate:fromDate toDate:toDate options:0] year];
}


#pragma mark - Date Comparison

- (BOOL)date:(NSDate * _Nonnull)firstDate isBeforeDate:(NSDate * _Nonnull)anotherDate
{
    if (!firstDate || !anotherDate)
    {
        return NO;
    }
    
    return [self secondsFromDate:firstDate toDate:anotherDate] < 0;
}

- (BOOL)date:(NSDate * _Nonnull)firstDate isAfterDate:(NSDate * _Nonnull)anotherDate
{
    if (!firstDate || !anotherDate)
    {
        return NO;
    }
    
    return [self secondsFromDate:firstDate toDate:anotherDate] > 0;
}


@end
