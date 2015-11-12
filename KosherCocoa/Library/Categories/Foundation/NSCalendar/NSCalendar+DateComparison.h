/**
 *  NSCalendar+DateComparison.h
 *  KosherCocoa 3
 *
 *  Created by Moshe Berman on 4/13/13.
 *  Updated by Moshe Berman on 11/12/15.
 *
 *  Use of KosherCocoa 3 is governed by the LGPL 2.1 License.
 */

#import <Foundation/Foundation.h>

@interface NSCalendar (DateComparison)

- (BOOL)date:(NSDate *)firstDate isSameDayAs:(NSDate *)anotherDate;
- (BOOL)date:(NSDate*)firstDate isSameWeekAs:(NSDate *)anotherDate;
- (BOOL)date:(NSDate*)firstDate isSameMonthAs:(NSDate *)anotherDate;
- (BOOL)date:(NSDate *)firstDate isSameYearAs:(NSDate *)anotherDate;
- (BOOL)date:(NSDate *)firstDate isSameEraAs:(NSDate *)anotherDate;

@end
