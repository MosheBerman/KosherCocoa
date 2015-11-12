/**
 *  NSCalendar+Juncture.h
 *  KosherCocoa 3
 *
 *  Created by Moshe Berman on 4/10/13.
 *  Updated by Moshe Berman on 9/24/13.
 *
 *  Use of KosherCocoa 3 is governed by the LGPL 2.1 License.
 */


#import <Foundation/Foundation.h>

@interface NSCalendar (Juncture)

#pragma mark - First/Last of Week

- (NSDate *)firstDayOfTheWeek;
- (NSDate *)firstDayOfTheWeekUsingReferenceDate:(NSDate *)date;

- (NSDate *)lastDayOfTheWeek;
- (NSDate *)lastDayOfTheWeekUsingReferenceDate:(NSDate *)date;

#pragma mark - First/Last of Month

- (NSDate *)firstDayOfTheMonth;
- (NSDate *)firstDayOfTheMonthUsingReferenceDate:(NSDate *)date;

- (NSDate *)lastDayOfTheMonth;
- (NSDate *)lastDayOfTheMonthUsingReferenceDate:(NSDate *)date;

@end
