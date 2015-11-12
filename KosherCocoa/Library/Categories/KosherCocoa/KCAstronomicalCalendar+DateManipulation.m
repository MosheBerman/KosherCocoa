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

- (NSDate *)dateByAddingSeconds:(NSUInteger)seconds toDate:(NSDate *)date
{
    return [self.internalCalendar dateByAddingSeconds:seconds toDate:date];
}

- (NSDate *)dateByAddingMinutes:(NSUInteger)minutes toDate:(NSDate *)date
{
    return [self.internalCalendar dateByAddingMinutes:minutes toDate:date];
}

- (NSDate *)dateByAddingHours:(NSUInteger)hours toDate:(NSDate *)date
{
    return [self.internalCalendar dateByAddingHours:hours toDate:date];
}

- (NSDate *)dateByAddingDays:(NSUInteger)days toDate:(NSDate *)date
{
    return [self.internalCalendar dateByAddingDays:days toDate:date];
}

- (NSDate *)dateByAddingWeeks:(NSUInteger)weeks toDate:(NSDate *)date
{
    return [self.internalCalendar dateByAddingWeeks:weeks toDate:date];
}

- (NSDate *)dateByAddingMonths:(NSUInteger)months toDate:(NSDate *)date
{
    return [self.internalCalendar dateByAddingMonths:months toDate:date];
}

- (NSDate *)dateByAddingYears:(NSUInteger)years toDate:(NSDate *)date
{
    return [self.internalCalendar dateByAddingYears:years toDate:date];
}

#pragma mark - Subtract Units

- (NSDate *)dateBySubtractingSeconds:(NSUInteger)seconds fromDate:(NSDate *)date
{
    return [self.internalCalendar dateBySubtractingSeconds:seconds fromDate:date];
}

- (NSDate *)dateBySubtractingMinutes:(NSUInteger)minutes fromDate:(NSDate *)date
{
    return [self.internalCalendar dateBySubtractingMinutes:minutes fromDate:date];
}

- (NSDate *)dateBySubtractingHours:(NSUInteger)hours fromDate:(NSDate *)date
{
    return [self.internalCalendar dateBySubtractingHours:hours fromDate:date];
}

- (NSDate *)dateBySubtractingDays:(NSUInteger)days fromDate:(NSDate *)date
{
    return [self.internalCalendar dateBySubtractingDays:days fromDate:date];
}

- (NSDate *)dateBySubtractingWeeks:(NSUInteger)weeks fromDate:(NSDate *)date
{
    return [self.internalCalendar dateBySubtractingWeeks:weeks fromDate:date];
}

- (NSDate *)dateBySubtractingMonths:(NSUInteger)months fromDate:(NSDate *)date
{
    return [self.internalCalendar dateBySubtractingMonths:months fromDate:date];
}

- (NSDate *)dateBySubtractingYears:(NSUInteger)years fromDate:(NSDate *)date
{
    return [self.internalCalendar dateBySubtractingYears:years fromDate:date];
}


@end
