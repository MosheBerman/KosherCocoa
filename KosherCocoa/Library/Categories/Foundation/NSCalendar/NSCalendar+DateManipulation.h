/**
 *  NSCalendar+DateManipulation.h
 *  KosherCocoa 3
 *
 *  Created by Moshe Berman on 4/10/13.
 *  Updated by Moshe Berman on 11/12/15.
 *
 *  Use of KosherCocoa 3 is governed by the LGPL 2.1 License.
 */

@import Foundation;

NS_ASSUME_NONNULL_BEGIN

@interface NSCalendar (DateManipulation)

#pragma mark - Add Units

- (nullable NSDate *)dateByAddingSeconds:(NSUInteger)seconds toDate:(NSDate *)date;
- (nullable NSDate *)dateByAddingMinutes:(NSUInteger)minutes toDate:(NSDate *)date;
- (nullable NSDate *)dateByAddingHours:(NSUInteger)hours toDate:(NSDate *)date;
- (nullable NSDate *)dateByAddingDays:(NSUInteger)days toDate:(NSDate *)date;
- (nullable NSDate *)dateByAddingWeeks:(NSUInteger)weeks toDate:(NSDate *)date;
- (nullable NSDate *)dateByAddingMonths:(NSUInteger)months toDate:(NSDate *)date;
- (nullable NSDate *)dateByAddingYears:(NSUInteger)years toDate:(NSDate *)date;

#pragma mark - Subtract Units

- (nullable NSDate *)dateBySubtractingSeconds:(NSUInteger)seconds fromDate:(NSDate *)date;
- (nullable NSDate *)dateBySubtractingMinutes:(NSUInteger)minutes fromDate:(NSDate *)date;
- (nullable NSDate *)dateBySubtractingHours:(NSUInteger)hours fromDate:(NSDate *)date;
- (nullable NSDate *)dateBySubtractingDays:(NSUInteger)days fromDate:(NSDate *)date;
- (nullable NSDate *)dateBySubtractingWeeks:(NSUInteger)weeks fromDate:(NSDate *)date;
- (nullable NSDate *)dateBySubtractingMonths:(NSUInteger)months fromDate:(NSDate *)date;
- (nullable NSDate *)dateBySubtractingYears:(NSUInteger)years fromDate:(NSDate *)date;

@end

NS_ASSUME_NONNULL_END
