/**
 *  MBCalendarCategories.h
 *  KosherCocoa 3
 *
 *  Created by Moshe Berman on 4/12/13.
 *  Updated by Moshe Berman on 11/12/15.
 *
 *  Use of KosherCocoa 3 is governed by the LGPL 2.1 License.
 */

#import <Foundation/Foundation.h>

@interface NSCalendar (Components)

- (NSInteger)weekdayInDate:(NSDate*)date;
- (NSInteger)secondsInDate:(NSDate*)date;
- (NSInteger)minutesInDate:(NSDate*)date;
- (NSInteger)hoursInDate:(NSDate*)date;
- (NSInteger)daysInDate:(NSDate*)date;
- (NSInteger)monthsInDate:(NSDate*)date;
- (NSInteger)yearsInDate:(NSDate*)date;
- (NSInteger)eraInDate:(NSDate*)date;

- (NSInteger)weekOfMonthInDate:(NSDate*)date;
- (NSInteger)weekOfYearInDate:(NSDate*)date;

@end
