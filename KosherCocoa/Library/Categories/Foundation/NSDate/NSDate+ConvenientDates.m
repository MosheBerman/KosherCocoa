/**
 *  NSDate+ConvenientDates.m
 *  KosherCocoa 3
 *
 *  Created by Moshe Berman on 8/26/13.
 *  Updated by Moshe Berman on 11/12/15.
 *
 *  Use of KosherCocoa 3 is governed by the LGPL 2.1 License.
 */

#import "NSDate+ConvenientDates.h"
#import "NSCalendar+Components.h"

@implementation NSDate (ConvenientDates)

/**
 *  This method creates a date given a hebrew month and day.
 *
 *  The year is taken from the value of `[NSDate date]`.
 *
 *  @param month The month of the year. 1 is Tishrei, 2 Heshvan, etc.
 *  @param day The day of the month.
 *  @return An NSDate initialized with the supplied parameters.
 */

+ (NSDate *)dateWithHebrewMonth:(NSInteger)month andDay:(NSInteger)day {
    
    NSCalendar *hebrewCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierHebrew];
    
    NSUInteger year = [hebrewCalendar yearsInDate:[NSDate date]];
    
    return [self dateWithHebrewMonth:month andDay:day andYear:year];
}

/**
 *  This method creates a date given a hebrew month and day.
 *
 *  The year is taken from the value of `[NSDate date]`.
 *
 *  @param month The month of the year. 1 is Tishrei, 2 Heshvan, etc.
 *  @param day The day of the month.
 *  @param year The hebrew year number.
 *  @return An NSDate initialized with the supplied parameters.
 */

+ (NSDate *)dateWithHebrewMonth:(NSInteger)month andDay:(NSInteger)day andYear:(NSInteger)year {
    
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    
    NSCalendar *hebrewCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierHebrew];
    
    [comps setCalendar:hebrewCalendar];
    
    [comps setMonth:month];
    [comps setDay:day];
    [comps setYear:year];
    
    NSDate *retVal = [hebrewCalendar dateFromComponents:comps];
    
    return retVal;
}

@end
