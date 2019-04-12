/**
  NSCalendar+Juncture.h
  KosherCocoa 4

  Created by Moshe Berman on 4/10/13.
  Updated by Moshe Berman on 9/24/13.

  Use of KosherCocoa 4 is governed by the LGPL 2.1 License.
 */


@import Foundation;

NS_ASSUME_NONNULL_BEGIN

@interface NSCalendar (Juncture)

#pragma mark - First/Last of Week

- (nullable NSDate *)firstDayOfTheWeek;
- (nullable NSDate *)firstDayOfTheWeekUsingReferenceDate:(NSDate * _Nonnull)date;

- (nullable NSDate *)lastDayOfTheWeek;
- (nullable NSDate *)lastDayOfTheWeekUsingReferenceDate:(NSDate * _Nonnull)date;

#pragma mark - First/Last of Month

- (nullable NSDate *)firstDayOfTheMonth;
- (nullable NSDate *)firstDayOfTheMonthUsingReferenceDate:(NSDate * _Nonnull)date;

- (nullable NSDate *)lastDayOfTheMonth;
- (nullable NSDate *)lastDayOfTheMonthUsingReferenceDate:(NSDate * _Nonnull)date;

@end

NS_ASSUME_NONNULL_END
