/**
 *  KCZmanimCalendar+DateManipulation.h
 *  KosherCocoa 3
 *
 *  Created by Moshe Berman on 10/30/13.
 *  Updated by Moshe Berman on 1/12/15.
 *
 *  Use of KosherCocoa 3 is governed by the LGPL 2.1 License.
 */

#import "KCAstronomicalCalendar.h"

/**
 *  These method prototypes allow us to compile.
 *  We'll forward these to the internal calendar
 *  object that's equiped to handle the calls.
 *
 *  We do this because KCAstronomicalCalendar doesn't 
 *  inherit from NSCalendar, and the actual methods are 
 *  defined on an NSCalendar category.
 *
 *  Truth be told, this might be an structural issue 
 *  that needs to be dealt with.
 */

@interface KCAstronomicalCalendar (DateManipulation)

#pragma mark - Add Units

- (NSDate *)dateByAddingSeconds:(NSUInteger)seconds toDate:(NSDate *)date;
- (NSDate *)dateByAddingMinutes:(NSUInteger)minutes toDate:(NSDate *)date;
- (NSDate *)dateByAddingHours:(NSUInteger)hours toDate:(NSDate *)date;
- (NSDate *)dateByAddingDays:(NSUInteger)days toDate:(NSDate *)date;
- (NSDate *)dateByAddingWeeks:(NSUInteger)weeks toDate:(NSDate *)date;
- (NSDate *)dateByAddingMonths:(NSUInteger)months toDate:(NSDate *)date;
- (NSDate *)dateByAddingYears:(NSUInteger)years toDate:(NSDate *)date;

#pragma mark - Subtract Units

- (NSDate *)dateBySubtractingSeconds:(NSUInteger)seconds fromDate:(NSDate *)date;
- (NSDate *)dateBySubtractingMinutes:(NSUInteger)minutes fromDate:(NSDate *)date;
- (NSDate *)dateBySubtractingHours:(NSUInteger)hours fromDate:(NSDate *)date;
- (NSDate *)dateBySubtractingDays:(NSUInteger)days fromDate:(NSDate *)date;
- (NSDate *)dateBySubtractingWeeks:(NSUInteger)weeks fromDate:(NSDate *)date;
- (NSDate *)dateBySubtractingMonths:(NSUInteger)months fromDate:(NSDate *)date;
- (NSDate *)dateBySubtractingYears:(NSUInteger)years fromDate:(NSDate *)date;

@end