/**
  NSCalendar+DateManipulation.h
  KosherCocoa 4

  Created by Moshe Berman on 4/10/13.
  Updated by Moshe Berman on 11/12/15.

  Use of KosherCocoa 4 is governed by the LGPL 2.1 License.
 */

@import Foundation;

NS_ASSUME_NONNULL_BEGIN

@interface NSCalendar (DateManipulation)

#pragma mark - Add Units

- (nullable NSDate *)dateByAddingSeconds:(NSUInteger)seconds toDate:(NSDate * _Nonnull)date;
- (nullable NSDate *)dateByAddingMinutes:(NSUInteger)minutes toDate:(NSDate * _Nonnull)date;
- (nullable NSDate *)dateByAddingHours:(NSUInteger)hours toDate:(NSDate * _Nonnull)date;
- (nullable NSDate *)dateByAddingDays:(NSUInteger)days toDate:(NSDate * _Nonnull)date;
- (nullable NSDate *)dateByAddingWeeks:(NSUInteger)weeks toDate:(NSDate * _Nonnull)date;
- (nullable NSDate *)dateByAddingMonths:(NSUInteger)months toDate:(NSDate * _Nonnull)date;
- (nullable NSDate *)dateByAddingYears:(NSUInteger)years toDate:(NSDate * _Nonnull)date;

#pragma mark - Subtract Units

- (nullable NSDate *)dateBySubtractingSeconds:(NSUInteger)seconds fromDate:(NSDate * _Nonnull)date;
- (nullable NSDate *)dateBySubtractingMinutes:(NSUInteger)minutes fromDate:(NSDate * _Nonnull)date;
- (nullable NSDate *)dateBySubtractingHours:(NSUInteger)hours fromDate:(NSDate * _Nonnull)date;
- (nullable NSDate *)dateBySubtractingDays:(NSUInteger)days fromDate:(NSDate * _Nonnull)date;
- (nullable NSDate *)dateBySubtractingWeeks:(NSUInteger)weeks fromDate:(NSDate * _Nonnull)date;
- (nullable NSDate *)dateBySubtractingMonths:(NSUInteger)months fromDate:(NSDate * _Nonnull)date;
- (nullable NSDate *)dateBySubtractingYears:(NSUInteger)years fromDate:(NSDate * _Nonnull)date;

@end

NS_ASSUME_NONNULL_END
