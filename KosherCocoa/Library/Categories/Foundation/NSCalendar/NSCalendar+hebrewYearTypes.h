/**
  NSCalendar+hebrewYearTypes.h
  KosherCocoa 4

  Created by Moshe Berman on 5/9/13.
  Updated by Moshe Berman on 11/12/15.

  Use of KosherCocoa 4 is governed by the LGPL 2.1 License.
 */

@import Foundation;
#import "KCHebrewYear.h"
#import "KCWeekday.h"


@interface NSCalendar (HebrewYearTypes)

//  Returns a weekday, 1-7
+ (enum kWeekday)firstWeekdayOfHebrewYearContainingDate:(NSDate * _Nonnull)date;

// Returns a year length, as per the comments in the kYearLength enum
+ (enum kYearLength)lengthOfHebrewYearContainingDate:(NSDate * _Nonnull)date;

//  YES if the given date is represented by a hebrew year containing 13 months, else NO
+ (BOOL)isHebrewYearContainingDateALeapYear:(NSDate * _Nonnull)date;

//  Returns one of fourteen types. See the kHebrewYearType enum above.
+ (enum kHebrewYearType)typeOfHebrewYearContainingDate:(NSDate * _Nonnull)date;

@end
