/**
 *  NSDate+Description.h
 *  KosherCocoa 3
 *
 *  Created by Moshe Berman on 4/14/13.
 *  Updated by Moshe Berman on 11/12/15.
 *
 *  Use of KosherCocoa 3 is governed by the LGPL 2.1 License.
 */

@import Foundation;

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (KCDescription)

- (nullable NSString *)description;

// Returns a three letter abbreviation of weekday name
- (nullable NSString *)dayNameOnCalendar:(NSCalendar *)calendar;

//  Prints out "January", "February", etc for Gregorian dates.
- (nullable NSString *)monthNameOnCalendar:(NSCalendar *)calendar;

//  Prints out "January 2012", "February 2012", etc for Gregorian dates.
- (nullable NSString *)monthAndYearOnCalendar:(NSCalendar *)calendar;

//  Prints out "Jan 2012", "Feb 2012", etc for Gregorian dates.
- (nullable NSString *)monthAbbreviationAndYearOnCalendar:(NSCalendar *)calendar;

//  Prints out "January 3", "February 28", etc for Gregorian dates.
- (nullable NSString *)monthAndDayOnCalendar:(NSCalendar *)calendar;

//  Prints out "Jan", "Feb", etc for Gregorian dates.
- (nullable NSString *)monthAbbreviationOnCalendar:(NSCalendar *)calendar;

//  Prints out a number, representing the day of the month
- (nullable NSString *)dayOfMonthOnCalendar:(NSCalendar *)calendar;

//  Prints out, for example, January 12, 2013
- (nullable NSString *)monthAndDayAndYearOnCalendar:(NSCalendar *)calendar;

// Prints out dates such as 12, 2013
- (nullable NSString *)dayOfMonthAndYearOnCalendar:(NSCalendar *)calendar;
@end

NS_ASSUME_NONNULL_END
