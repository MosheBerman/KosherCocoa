/**
 *  KCZmanimCalendar+DateManipulation.m
 *  KosherCocoa 3
 *
 *  Created by Moshe Berman on 10/30/13.
 *  Updated by Moshe Berman on 1/12/15.
 *
 *  Use of KosherCocoa 3 is governed by the LGPL 2.1 License.
 */
#import "KCAstronomicalCalendar+DateManipulation.h"
#import "NSCalendar+DateManipulation.h"

@implementation KCAstronomicalCalendar (DateManipulation)

- (NSDate * _Nullable)dateByAddingSeconds:(NSUInteger)seconds toDate:(NSDate * _Nonnull)date
{
    return [self.internalCalendar dateByAddingSeconds:seconds toDate:date];
}

- (NSDate * _Nullable)dateByAddingMinutes:(NSUInteger)minutes toDate:(NSDate * _Nonnull)date
{
    return [self.internalCalendar dateByAddingMinutes:minutes toDate:date];
}

- (NSDate * _Nullable)dateByAddingHours:(NSUInteger)hours toDate:(NSDate * _Nonnull)date
{
    return [self.internalCalendar dateByAddingHours:hours toDate:date];
}

- (NSDate * _Nullable)dateByAddingDays:(NSUInteger)days toDate:(NSDate * _Nonnull)date
{
    return [self.internalCalendar dateByAddingDays:days toDate:date];
}

- (NSDate * _Nullable)dateByAddingWeeks:(NSUInteger)weeks toDate:(NSDate * _Nonnull)date
{
    return [self.internalCalendar dateByAddingWeeks:weeks toDate:date];
}

- (NSDate * _Nullable)dateByAddingMonths:(NSUInteger)months toDate:(NSDate * _Nonnull)date
{
    return [self.internalCalendar dateByAddingMonths:months toDate:date];
}

- (NSDate * _Nullable)dateByAddingYears:(NSUInteger)years toDate:(NSDate * _Nonnull)date
{
    return [self.internalCalendar dateByAddingYears:years toDate:date];
}

#pragma mark - Subtract Units

- (NSDate * _Nullable)dateBySubtractingSeconds:(NSUInteger)seconds fromDate:(NSDate * _Nonnull)date
{
    return [self.internalCalendar dateBySubtractingSeconds:seconds fromDate:date];
}

- (NSDate * _Nullable)dateBySubtractingMinutes:(NSUInteger)minutes fromDate:(NSDate * _Nonnull)date
{
    return [self.internalCalendar dateBySubtractingMinutes:minutes fromDate:date];
}

- (NSDate * _Nullable)dateBySubtractingHours:(NSUInteger)hours fromDate:(NSDate * _Nonnull)date
{
    return [self.internalCalendar dateBySubtractingHours:hours fromDate:date];
}

- (NSDate * _Nullable)dateBySubtractingDays:(NSUInteger)days fromDate:(NSDate * _Nonnull)date
{
    return [self.internalCalendar dateBySubtractingDays:days fromDate:date];
}

- (NSDate * _Nullable)dateBySubtractingWeeks:(NSUInteger)weeks fromDate:(NSDate * _Nonnull)date
{
    return [self.internalCalendar dateBySubtractingWeeks:weeks fromDate:date];
}

- (NSDate * _Nullable)dateBySubtractingMonths:(NSUInteger)months fromDate:(NSDate * _Nonnull)date
{
    return [self.internalCalendar dateBySubtractingMonths:months fromDate:date];
}

- (NSDate * _Nullable)dateBySubtractingYears:(NSUInteger)years fromDate:(NSDate * _Nonnull)date
{
    return [self.internalCalendar dateBySubtractingYears:years fromDate:date];
}


@end
