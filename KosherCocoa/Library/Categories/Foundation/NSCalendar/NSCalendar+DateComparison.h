/**
 *  NSCalendar+DateComparison.h
 *  KosherCocoa 4
 *
 *  Created by Moshe Berman on 4/13/13.
 *  Updated by Moshe Berman on 11/12/15.
 *
 *  Use of KosherCocoa 4 is governed by the LGPL 2.1 License.
 */

@import Foundation;

NS_ASSUME_NONNULL_BEGIN

@interface NSCalendar (DateComparison)

- (BOOL)date:(NSDate * _Nonnull)firstDate isSameDayAs:(NSDate * _Nonnull)anotherDate;
- (BOOL)date:(NSDate*)firstDate isSameWeekAs:(NSDate * _Nonnull)anotherDate;
- (BOOL)date:(NSDate*)firstDate isSameMonthAs:(NSDate * _Nonnull)anotherDate;
- (BOOL)date:(NSDate * _Nonnull)firstDate isSameYearAs:(NSDate * _Nonnull)anotherDate;
- (BOOL)date:(NSDate * _Nonnull)firstDate isSameEraAs:(NSDate * _Nonnull)anotherDate;

@end

NS_ASSUME_NONNULL_END
