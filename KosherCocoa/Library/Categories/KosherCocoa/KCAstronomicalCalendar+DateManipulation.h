/**
 *  KCZmanimCalendar+DateManipulation.h
 *  KosherCocoa 4
 *
 *  Created by Moshe Berman on 10/30/13.
 *  Updated by Moshe Berman on 1/12/15.
 *
 *  Use of KosherCocoa 4 is governed by the LGPL 2.1 License.
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

- (NSDate * _Nullable)dateByAddingSeconds:(NSUInteger)seconds toDate:(NSDate * _Nonnull)date;
- (NSDate * _Nullable)dateByAddingMinutes:(NSUInteger)minutes toDate:(NSDate * _Nonnull)date;
- (NSDate * _Nullable)dateByAddingHours:(NSUInteger)hours toDate:(NSDate * _Nonnull)date;
- (NSDate * _Nullable)dateByAddingDays:(NSUInteger)days toDate:(NSDate * _Nonnull)date;
- (NSDate * _Nullable)dateByAddingWeeks:(NSUInteger)weeks toDate:(NSDate * _Nonnull)date;
- (NSDate * _Nullable)dateByAddingMonths:(NSUInteger)months toDate:(NSDate * _Nonnull)date;
- (NSDate * _Nullable)dateByAddingYears:(NSUInteger)years toDate:(NSDate * _Nonnull)date;

#pragma mark - Subtract Units

- (NSDate * _Nullable)dateBySubtractingSeconds:(NSUInteger)seconds fromDate:(NSDate * _Nonnull)date;
- (NSDate * _Nullable)dateBySubtractingMinutes:(NSUInteger)minutes fromDate:(NSDate * _Nonnull)date;
- (NSDate * _Nullable)dateBySubtractingHours:(NSUInteger)hours fromDate:(NSDate * _Nonnull)date;
- (NSDate * _Nullable)dateBySubtractingDays:(NSUInteger)days fromDate:(NSDate * _Nonnull)date;
- (NSDate * _Nullable)dateBySubtractingWeeks:(NSUInteger)weeks fromDate:(NSDate * _Nonnull)date;
- (NSDate * _Nullable)dateBySubtractingMonths:(NSUInteger)months fromDate:(NSDate * _Nonnull)date;
- (NSDate * _Nullable)dateBySubtractingYears:(NSUInteger)years fromDate:(NSDate * _Nonnull)date;

@end
