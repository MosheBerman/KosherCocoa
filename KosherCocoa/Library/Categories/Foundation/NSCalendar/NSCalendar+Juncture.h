/**
 *  NSCalendar+Juncture.h
 *  KosherCocoa 3
 *
 *  Created by Moshe Berman on 4/10/13.
 *  Updated by Moshe Berman on 9/24/13.
 *
 *  Use of KosherCocoa 3 is governed by the LGPL 2.1 License.
 */


@import Foundation;

NS_ASSUME_NONNULL_BEGIN

@interface NSCalendar (Juncture)

#pragma mark - First/Last of Week

- (nullable NSDate *)firstDayOfTheWeek;
- (nullable NSDate *)firstDayOfTheWeekUsingReferenceDate:(NSDate *)date;

- (nullable NSDate *)lastDayOfTheWeek;
- (nullable NSDate *)lastDayOfTheWeekUsingReferenceDate:(NSDate *)date;

#pragma mark - First/Last of Month

- (nullable NSDate *)firstDayOfTheMonth;
- (nullable NSDate *)firstDayOfTheMonthUsingReferenceDate:(NSDate *)date;

- (nullable NSDate *)lastDayOfTheMonth;
- (nullable NSDate *)lastDayOfTheMonthUsingReferenceDate:(NSDate *)date;

@end

NS_ASSUME_NONNULL_END
