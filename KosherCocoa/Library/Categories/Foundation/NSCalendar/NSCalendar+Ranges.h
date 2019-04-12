/**
  NSCalendar+Ranges.h
  KosherCocoa 4

  Created by Moshe Berman on 4/10/13.
  Updated by Moshe Berman on 11/12/15.

  Use of KosherCocoa 4 is governed by the LGPL 2.1 License.
 */

@import Foundation;

NS_ASSUME_NONNULL_BEGIN

@interface NSCalendar (Ranges)

#pragma mark - Units Per Minute

- (NSUInteger)secondsPerMinute;
- (NSUInteger)secondsPerMinuteUsingReferenceDate:(NSDate * _Nonnull)date;

#pragma mark - Units Per Hour

- (NSUInteger)secondsPerHour;
- (NSUInteger)secondsPerHourUsingReferenceDate:(NSDate * _Nonnull)date;

- (NSUInteger)minutesPerHour;
- (NSUInteger)minutesPerHourUsingReferenceDate:(NSDate * _Nonnull)date;

#pragma mark - Units Per Day

- (NSUInteger)secondsPerDay;
- (NSUInteger)secondsPerDayUsingReferenceDate:(NSDate * _Nonnull)date;

- (NSUInteger)minutesPerDay;
- (NSUInteger)minutesPerDayUsingReferenceDate:(NSDate * _Nonnull)date;

- (NSUInteger)hoursPerDay;
- (NSUInteger)hoursPerDayUsingReferenceDate:(NSDate * _Nonnull)date;

#pragma mark - Units Per Week

- (NSUInteger)secondsPerWeek;
- (NSUInteger)secondsPerWeekUsingReferenceDate:(NSDate * _Nonnull)date;

- (NSUInteger)minutesPerWeek;
- (NSUInteger)minutesPerWeekUsingReferenceDate:(NSDate * _Nonnull)date;

- (NSUInteger)hoursPerWeek;
- (NSUInteger)hoursPerWeekUsingReferenceDate:(NSDate * _Nonnull)date;

- (NSUInteger)daysPerWeek;
- (NSUInteger)daysPerWeekUsingReferenceDate:(NSDate * _Nonnull)date;

#pragma mark - Units Per Month

- (NSUInteger)secondsPerMonth;
- (NSUInteger)secondsPerMonthUsingReferenceDate:(NSDate * _Nonnull)date;

- (NSUInteger)minutesPerMonth;
- (NSUInteger)minutesPerMonthUsingReferenceDate:(NSDate * _Nonnull)date;

- (NSUInteger)hoursPerMonth;
- (NSUInteger)hoursPerMonthUsingReferenceDate:(NSDate * _Nonnull)date;

- (NSUInteger)daysPerMonth;
- (NSUInteger)daysPerMonthUsingReferenceDate:(NSDate * _Nonnull)date;

- (NSUInteger)weeksPerMonth;
- (NSUInteger)weeksPerMonthUsingReferenceDate:(NSDate * _Nonnull)date;

#pragma mark - Units Per Year

- (NSUInteger)secondsPerYear;
- (NSUInteger)secondsPerYearUsingReferenceDate:(NSDate * _Nonnull)date;

- (NSUInteger)minutesPerYear;
- (NSUInteger)minutesPerYearUsingReferenceDate:(NSDate * _Nonnull)date;

- (NSUInteger)hoursPerYear;
- (NSUInteger)hoursPerYearUsingReferenceDate:(NSDate * _Nonnull)date;

- (NSUInteger)daysPerYear;
- (NSUInteger)daysPerYearUsingReferenceDate:(NSDate * _Nonnull)date;

- (NSUInteger)weeksPerYear;
- (NSUInteger)weeksPerYearUsingReferenceDate:(NSDate * _Nonnull)date;

- (NSUInteger)monthsPerYear;
- (NSUInteger)monthsPerYearUsingReferenceDate:(NSDate * _Nonnull)date;

#pragma mark - Ranges Between Dates

//  Negative values indicate that fromDate is after toDate
- (NSInteger)secondsFromDate:(NSDate * _Nonnull)fromDate toDate:(NSDate * _Nonnull)toDate;
- (NSInteger)minutesFromDate:(NSDate * _Nonnull)fromDate toDate:(NSDate * _Nonnull)toDate;
- (NSInteger)hoursFromDate:(NSDate * _Nonnull)fromDate toDate:(NSDate * _Nonnull)toDate;
- (NSInteger)daysFromDate:(NSDate*)fromDate toDate:(NSDate * _Nonnull)toDate;
- (NSInteger)weeksFromDate:(NSDate*)fromDate toDate:(NSDate * _Nonnull)toDate;
- (NSInteger)monthsFromDate:(NSDate*)fromDate toDate:(NSDate * _Nonnull)toDate;
- (NSInteger)yearsFromDate:(NSDate*)fromDate toDate:(NSDate * _Nonnull)toDate;

#pragma mark - Date Comparison

- (BOOL)date:(NSDate * _Nonnull)firstDate isBeforeDate:(NSDate * _Nonnull)anotherDate;
- (BOOL)date:(NSDate * _Nonnull)firstDate isAfterDate:(NSDate * _Nonnull)anotherDate;

@end

NS_ASSUME_NONNULL_END
