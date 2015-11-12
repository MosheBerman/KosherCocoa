/**
 *  NSDate+ConvenientDates.h
 *  KosherCocoa 3
 *
 *  Created by Moshe Berman on 8/26/13.
 *  Updated by Moshe Berman on 11/12/15.
 *
 *  Use of KosherCocoa 3 is governed by the LGPL 2.1 License.
 */

#import <Foundation/Foundation.h>

@interface NSDate (ConvenientDates)

/**-----
 * @name Creating Hebrew Dates
 * -----
 */

/** This method creates a date given a hebrew month and day.
 *
 *  The year is taken from the year component of `[NSDate date]` against 
 *  the Hebrew calendar.
 *
 *  @param month The month of the year. 1 is Tishrei, 2 Heshvan, etc.
 *  @param day The day of the month.
 *  @return An NSDate initialized with the supplied parameters.
 */

+ (NSDate *)dateWithHebrewMonth:(NSInteger)month andDay:(NSInteger)day;

/** This method creates a date given a hebrew month and day.
 *
 *  The year is taken from the value of `[NSDate date]`.
 *
 *  @param month The month of the year. 1 is Tishrei, 2 Heshvan, etc.
 *  @param day The day of the month.
 *  @param year The hebrew year number.
 *  @return An NSDate initialized with the supplied parameters.
 */

+ (NSDate *)dateWithHebrewMonth:(NSInteger)month andDay:(NSInteger)day andYear:(NSInteger)year;

@end
