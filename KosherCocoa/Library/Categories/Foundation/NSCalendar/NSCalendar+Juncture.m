/**
 *  NSCalendar+Juncture.m
 *  KosherCocoa 3
 *
 *  Created by Moshe Berman on 4/10/13.
 *  Updated by Moshe Berman on 11/12/15.
 *
 *  Use of KosherCocoa 3 is governed by the LGPL 2.1 License.
 */

#import "NSCalendar+Juncture.h"
#import "NSCalendar+Ranges.h"       //  To get the number of days in a week
#import "NSCalendar+Components.h"   //  To get specific components
#import "NSCalendar+DateManipulation.h"

@implementation NSCalendar (Juncture)

#pragma mark - First/Last of Week

- (NSDate * _Nullable)firstDayOfTheWeek
{
    return [self firstDayOfTheWeekUsingReferenceDate:[NSDate date]];
}

- (NSDate * _Nullable)firstDayOfTheWeekUsingReferenceDate:(NSDate * _Nonnull)date
{    
    NSInteger weekday = [self weekdayInDate:date]-1;
    return [self dateBySubtractingDays:weekday fromDate:date];
}

- (NSDate * _Nullable)lastDayOfTheWeek
{
    return [self lastDayOfTheWeekUsingReferenceDate:[NSDate date]];
}

- (NSDate * _Nullable)lastDayOfTheWeekUsingReferenceDate:(NSDate * _Nonnull)date
{
    
    NSDate *d = [self firstDayOfTheWeekUsingReferenceDate:date];
    NSUInteger daysPerWeek = [self daysPerWeekUsingReferenceDate:d];
    return [self dateByAddingDays:daysPerWeek-1 toDate:d];
}


#pragma mark - First/Last of Month

- (NSDate * _Nullable)firstDayOfTheMonth
{
    return [self firstDayOfTheMonthUsingReferenceDate:[NSDate date]];
}

- (NSDate * _Nullable)firstDayOfTheMonthUsingReferenceDate:(NSDate * _Nonnull)date
{
    NSDateComponents *c = [self components:NSCalendarUnitMonth | NSCalendarUnitYear fromDate:date];
    
    [c setDay:1];
    
    return [self dateFromComponents:c];
}

- (NSDate * _Nullable)lastDayOfTheMonth
{
    return [self firstDayOfTheMonthUsingReferenceDate:[NSDate date]];
}

- (NSDate * _Nullable)lastDayOfTheMonthUsingReferenceDate:(NSDate * _Nonnull)date
{
    
    NSDateComponents *c = [self components:NSCalendarUnitYear | NSCalendarUnitMonth fromDate:date];
    
    [c setDay:[self daysPerMonthUsingReferenceDate:date]];
    
    return [self dateFromComponents:c];
}

#pragma mark 
@end
