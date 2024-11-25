/**
 *  NSDate+Description.m
 *  KosherCocoa 3
 *
 *  Created by Moshe Berman on 4/14/13.
 *  Updated by Moshe Berman on 11/12/15.
 *
 *  Use of KosherCocoa 3 is governed by the LGPL 2.1 License.
 */

#import "NSDate+Description.h"

@implementation NSDate (KCDescription)

- (NSString *)description
{
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setTimeStyle:NSDateFormatterNoStyle];
    [formatter setDateStyle:NSDateFormatterLongStyle];
    return [formatter stringFromDate:self];
}

- (NSString *)dayNameOnCalendar:(NSCalendar *)calendar
{
    NSDateFormatter *f = [NSDateFormatter new];
    [f setCalendar:calendar];
    [f setDateFormat:@"ccc"];
    return [f stringFromDate:self];
}

- (NSString *)monthNameOnCalendar:(NSCalendar *)calendar
{
    NSDateFormatter *f = [NSDateFormatter new];
    [f setCalendar:calendar];
    [f setDateFormat:@"MMMM"];
    return [f stringFromDate:self];
}

- (NSString *)monthAndYearOnCalendar:(NSCalendar *)calendar
{
    NSDateFormatter *f = [NSDateFormatter new];
    [f setCalendar:calendar];
    [f setDateFormat:@"MMMM yyyy"];
    return [f stringFromDate:self];
}

- (NSString *)monthAbbreviationAndYearOnCalendar:(NSCalendar *)calendar
{
    NSDateFormatter *f = [NSDateFormatter new];
    [f setCalendar:calendar];
    [f setDateFormat:@"MMM yyyy"];
    return [f stringFromDate:self];
}


- (NSString *)monthAbbreviationOnCalendar:(NSCalendar *)calendar
{
    NSDateFormatter *f = [NSDateFormatter new];
    [f setCalendar:calendar];
    [f setDateFormat:@"MMM"];
    return [f stringFromDate:self];
}

- (NSString *)monthAndDayOnCalendar:(NSCalendar *)calendar
{
    NSDateFormatter *f = [NSDateFormatter new];
    [f setCalendar:calendar];
    [f setDateFormat:@"MMM d"];
    return [f stringFromDate:self];
}

- (NSString *)dayOfMonthOnCalendar:(NSCalendar *)calendar
{
    NSDateFormatter *f = [NSDateFormatter new];
    [f setCalendar:calendar];
    [f setDateFormat:@"d"];
    return [f stringFromDate:self];
}

- (NSString *)monthAndDayAndYearOnCalendar:(NSCalendar *)calendar
{
    NSDateFormatter *f = [NSDateFormatter new];
    [f setCalendar:calendar];
    [f setDateFormat:@"MMM d yyyy"];
    return [f stringFromDate:self];
}


- (NSString *)dayOfMonthAndYearOnCalendar:(NSCalendar *)calendar
{
    NSDateFormatter *f = [NSDateFormatter new];
    [f setCalendar:calendar];
    [f setDateFormat:@"d yyyy"];
    return [f stringFromDate:self];
}

@end
