/**
 *  NSCalendar+DateManipulation.m
 *  KosherCocoa 3
 *
 *  Created by Moshe Berman on 4/10/13.
 *  Updated by Moshe Berman on 11/12/15.
 *
 *  Use of KosherCocoa 3 is governed by the LGPL 2.1 License.
 */

#import "NSCalendar+DateManipulation.h"

@implementation NSCalendar (DateManipulation)

#pragma mark - Add Units

- (NSDate * _Nullable)dateByAddingSeconds:(NSUInteger)seconds toDate:(NSDate * _Nonnull)date
{
    if (!date) {
        return nil;
    }
    NSDateComponents *c = [NSDateComponents new];
    [c setSecond:seconds];
    return [self dateByAddingComponents:c toDate:date options:0];
}

- (NSDate * _Nullable)dateByAddingMinutes:(NSUInteger)minutes toDate:(NSDate * _Nonnull)date
{
    if (!date) {
        return nil;
    }
    NSDateComponents *c = [NSDateComponents new];
    [c setMinute:minutes];
    return [self dateByAddingComponents:c toDate:date options:0];
}

- (NSDate * _Nullable)dateByAddingHours:(NSUInteger)hours toDate:(NSDate * _Nonnull)date
{
    if (!date) {
        return nil;
    }
    NSDateComponents *c = [NSDateComponents new];
    [c setHour:hours];
    return [self dateByAddingComponents:c toDate:date options:0];
}

- (NSDate * _Nullable)dateByAddingDays:(NSUInteger)days toDate:(NSDate * _Nonnull)date
{
    if (!date) {
        return nil;
    }
    NSDateComponents *c = [NSDateComponents new];
    [c setDay:days];
    return [self dateByAddingComponents:c toDate:date options:0];
}

- (NSDate * _Nullable)dateByAddingWeeks:(NSUInteger)weeks toDate:(NSDate * _Nonnull)date
{
    if (!date) {
        return nil;
    }
    NSDateComponents *c = [NSDateComponents new];
    [c setWeekOfYear:weeks];
    return [self dateByAddingComponents:c toDate:date options:0];
}

- (NSDate * _Nullable)dateByAddingMonths:(NSUInteger)months toDate:(NSDate * _Nonnull)date
{
    if (!date) {
        return nil;
    }
    NSDateComponents *c = [NSDateComponents new];
    [c setMonth:months];
    return [self dateByAddingComponents:c toDate:date options:0];
}

- (NSDate * _Nullable)dateByAddingYears:(NSUInteger)years toDate:(NSDate * _Nonnull)date
{
    if (!date) {
        return nil;
    }
    NSDateComponents *c = [NSDateComponents new];
    [c setYear:years];
    return [self dateByAddingComponents:c toDate:date options:0];
}

#pragma mark - Subtract Units

- (NSDate * _Nullable)dateBySubtractingSeconds:(NSUInteger)seconds fromDate:(NSDate * _Nonnull)date
{
 
    if (!date) {
        return nil;
    }
    NSDateComponents *c = [NSDateComponents new];
    [c setSecond:-seconds];
    return [self dateByAddingComponents:c toDate:date options:0];
}
- (NSDate * _Nullable)dateBySubtractingMinutes:(NSUInteger)minutes fromDate:(NSDate * _Nonnull)date;
{
    if (!date) {
        return nil;
    }
    NSDateComponents *c = [NSDateComponents new];
    [c setMinute:-minutes];
    return [self dateByAddingComponents:c toDate:date options:0];
}

- (NSDate * _Nullable)dateBySubtractingHours:(NSUInteger)hours fromDate:(NSDate * _Nonnull)date
{
    if (!date) {
        return nil;
    }
    NSDateComponents *c = [NSDateComponents new];
    [c setHour:-hours];
    return [self dateByAddingComponents:c toDate:date options:0];
}

- (NSDate * _Nullable)dateBySubtractingDays:(NSUInteger)days fromDate:(NSDate * _Nonnull)date
{
    if (!date) {
        return nil;
    }
    NSDateComponents *c = [NSDateComponents new];
    [c setDay:-days];
    return [self dateByAddingComponents:c toDate:date options:0];
}

- (NSDate * _Nullable)dateBySubtractingWeeks:(NSUInteger)weeks fromDate:(NSDate * _Nonnull)date
{
    if (!date) {
        return nil;
    }
    NSDateComponents *c = [NSDateComponents new];
    [c setWeekOfYear:-weeks];
    return [self dateByAddingComponents:c toDate:date options:0];
}

- (NSDate * _Nullable)dateBySubtractingMonths:(NSUInteger)months fromDate:(NSDate * _Nonnull)date
{
    if (!date) {
        return nil;
    }
    NSDateComponents *c = [NSDateComponents new];
    [c setMonth:-months];
    return [self dateByAddingComponents:c toDate:date options:0];
}


- (NSDate * _Nullable)dateBySubtractingYears:(NSUInteger)years fromDate:(NSDate * _Nonnull)date
{
    if (!date) {
        return nil;
    }
    NSDateComponents *c = [NSDateComponents new];
    [c setYear:-years];
    return [self dateByAddingComponents:c toDate:date options:0];
}


@end
