/**
 *  KCZmanimCalendar+DateManipulation.h
 *  KosherCocoa 4
 *
 *  Created by Moshe Berman on 10/30/13.
 *  Updated by Moshe Berman on 1/12/15.
 *
 *  Use of KosherCocoa 4 is governed by the LGPL 2.1 License.
 */

#import "KCAstronomicalCalendar.h"

/**
 *  These method prototypes allow us to compile.
 *  We'll forward these to the internal calendar
 *  object that's equiped to handle the calls.
 *
 *  We do this because KCAstronomicalCalendar doesn't 
 *  inherit from NSCalendar, and the actual methods are 
 *  defined on an NSCalendar category.
 *
 *  Truth be told, this might be an structural issue 
 *  that needs to be dealt with.
 */

@interface KCAstronomicalCalendar (DateManipulation)

#pragma mark - Add Units


/**
 Adds the specified number of seconds to the supplied date.

 @param seconds The number of seconds to add.
 @param date The date to add to.
 @return A date object.
 */

- (NSDate * _Nullable)dateByAddingSeconds:(NSUInteger)seconds toDate:(NSDate * _Nonnull)date;


/**
 Adds the specified number of minutes to the supplied date.

 @param minutes The number of minutes to add.
 @param date The date to add to.
 @return A date object.
 */
- (NSDate * _Nullable)dateByAddingMinutes:(NSUInteger)minutes toDate:(NSDate * _Nonnull)date;

/**
 Adds the specified number of hours to the supplied date.
 
 @param hours The number of hours to add.
 @param date The date to add to.
 @return A date object.
 */
- (NSDate * _Nullable)dateByAddingHours:(NSUInteger)hours toDate:(NSDate * _Nonnull)date;

/**
 Adds the specified number of days to the supplied date.
 
 @param days The number of days to add.
 @param date The date to add to.
 @return A date object.
 */
- (NSDate * _Nullable)dateByAddingDays:(NSUInteger)days toDate:(NSDate * _Nonnull)date;

/**
 Adds the specified number of weeks to the supplied date.
 
 @param weeks The number of weeks to add.
 @param date The date to add to.
 @return A date object.
 */
- (NSDate * _Nullable)dateByAddingWeeks:(NSUInteger)weeks toDate:(NSDate * _Nonnull)date;

/**
 Adds the specified number of months to the supplied date.
 
 @param months The number of months to add.
 @param date The date to add to.
 @return A date object.
 */
- (NSDate * _Nullable)dateByAddingMonths:(NSUInteger)months toDate:(NSDate * _Nonnull)date;

/**
 Adds the specified number of years to the supplied date.
 
 @param years The number of years to add.
 @param date The date to add to.
 @return A date object.
 */
- (NSDate * _Nullable)dateByAddingYears:(NSUInteger)years toDate:(NSDate * _Nonnull)date;

#pragma mark - Subtract Units

/**
 Subtracts the specified number of seconds from the supplied date.
 
 @param seconds The number of seconds to subtract.
 @param date The date to subtract from.
 @return A date object.
 */
- (NSDate * _Nullable)dateBySubtractingSeconds:(NSUInteger)seconds fromDate:(NSDate * _Nonnull)date;

/**
 Subtracts the specified number of minutes from the supplied date.
 
 @param minutes The number of minutes to subtract.
 @param date The date to subtract from.
 @return A date object.
 */
- (NSDate * _Nullable)dateBySubtractingMinutes:(NSUInteger)minutes fromDate:(NSDate * _Nonnull)date;

/**
 Subtracts the specified number of hours from the supplied date.
 
 @param hours The number of hours to subtract.
 @param date The date to subtract from.
 @return A date object.
 */
- (NSDate * _Nullable)dateBySubtractingHours:(NSUInteger)hours fromDate:(NSDate * _Nonnull)date;

/**
 Subtracts the specified number of days from the supplied date.
 
 @param days The number of days to subtract.
 @param date The date to subtract from.
 @return A date object.
 */
- (NSDate * _Nullable)dateBySubtractingDays:(NSUInteger)days fromDate:(NSDate * _Nonnull)date;

/**
 Subtracts the specified number of weeks from the supplied date.
 
 @param weeks The number of weeks to subtract.
 @param date The date to subtract from.
 @return A date object.
 */
- (NSDate * _Nullable)dateBySubtractingWeeks:(NSUInteger)weeks fromDate:(NSDate * _Nonnull)date;

/**
 Subtracts the specified number of months from the supplied date.
 
 @param months The number of months to subtract.
 @param date The date to subtract from.
 @return A date object.
 */
- (NSDate * _Nullable)dateBySubtractingMonths:(NSUInteger)months fromDate:(NSDate * _Nonnull)date;

/**
 Subtracts the specified number of years from the supplied date.
 
 @param years The number of years to subtract.
 @param date The date to subtract from.
 @return A date object.
 */
- (NSDate * _Nullable)dateBySubtractingYears:(NSUInteger)years fromDate:(NSDate * _Nonnull)date;

@end
