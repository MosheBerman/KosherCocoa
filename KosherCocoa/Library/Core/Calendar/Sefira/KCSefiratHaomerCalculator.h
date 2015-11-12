/**
 *  KCSefiratHaomerCalculator.h
 *  KosherCocoa 3
 *
 *  Created by Moshe Berman on 3/1/11.
 *  Updated by Moshe Berman on 10/8/13.
 *
 *  Use of KosherCocoa 3 is governed by the LGPL 2.1 License.
 */

#import <Foundation/Foundation.h>

/** A class that calculates Sefirat Haomer. */

@interface KCSefiratHaomerCalculator : NSObject

/* -----
 * @name Check if a date falls during sefira 
 * -----
 */

/**
 *  This method checks if [NSDate date] represents a day
 *  that falls out during the omer count on the Hebrew
 *  calendar.
 *
 *  @return YES if today is during the sefira count, otherwise NO.
 */

+ (BOOL)fallsToday;

/**
 *  This method checks if the supplied date represents a
 *  day that dalls out during the omer count according
 *  to the Hebrew calendar.
 *
 *  @param date an NSDate
 *  @return YES if date is during the sefira count, otherwise NO.
 */

+ (BOOL)fallsOnDate:(NSDate *)date;

/* -----
 *  @name Getting the day of sefira.
 * -----
 */

/**
 *  This method returns an integer representing the
 *  current day of the omer count.
 *
 *  If [NSDate date] does not fall out during the 
 *  omer count, then 0 is returned.
 *
 *  @return An integer representing the day of the omer count.
 */

+ (NSInteger)dayOfSefira;

/**
 *  This method returns an integer representing the
 *  day of the omer count which date falls out on.
 *
 *  If date does not fall out during the
 *  omer count, then 0 is returned.
 *
 *  @param date The date to use.
 *
 *  @return An integer representing the day of the omer count.
 */

+ (NSInteger)dayOfSefiraForDate:(NSDate *)date;

@end
