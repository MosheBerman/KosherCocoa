/**
 *  NSCalendar+hebrewYearTypes.h
 *  KosherCocoa 3
 *
 *  Created by Moshe Berman on 5/9/13.
 *  Updated by Moshe Berman on 11/12/15.
 *
 *  Use of KosherCocoa 3 is governed by the LGPL 2.1 License.
 */

#import <Foundation/Foundation.h>

/**
 
 A type representing a hebrew year configuration.
 
 There are fourteen year configurations, as per
 Arthur Spier, 'The Comprehensive Hebrew Calendar,
 3rd ed' (Behrman House 1986, ISBN 087306-398-8.
 
 Each configuration composites the weekday of 1 Tishri,
 the number of days in the year, and if the year
 contains Adar II.
 
 */

typedef NS_ENUM(NSInteger, kHebrewYearType)
{
    kHebrewYearTypeA = 0, //  Monday,     353, regular
    kHebrewYearTypeB,     //  Shabbat,    353, regular
    kHebrewYearTypeC,     //  Tuesday,    354, regular
    kHebrewYearTypeD,     //  Thursday,   354, regular
    kHebrewYearTypeE,     //  Monday,     355, regular
    kHebrewYearTypeF,     //  Thursday,   355, regular
    kHebrewYearTypeG,     //  Shabbat,    355, regular    -----
    kHebrewYearTypeH,     //  Monday,     383, leap       -----
    kHebrewYearTypeI,     //  Thursday,   383, leap
    kHebrewYearTypeJ,     //  Shabbat,    383, leap
    kHebrewYearTypeK,     //  Tuesday,    384, leap
    kHebrewYearTypeL,     //  Monday,     385, leap
    kHebrewYearTypeM,     //  Thursday,   385, leap
    kHebrewYearTypeN,     //  Shabbat,    385, leap
};

/**
 *  A type representing the days of the week.
 *
 *  The related enum values are index-1, not index-0. (Sunday is 1, Monday is 2, etc.)
 */

typedef NS_ENUM(NSInteger, kWeekday)
{
    kWeekdaySunday = 1,
    kWeekdayMonday,
    kWeekdayTuesday,
    kWeekdayWednesday,
    kWeekdayThursday,
    kWeekdayFriday,
    kWeekdaySaturday
};

/**
 *  A type representing the length of a hebrew year.
 *
 *  There are 6 possible lengths (in days) that a Hebrew year can be.
 *  They are: 353, 354, 355, 383, 384, and 385 days. A year that has
 *  353 days is "short", a year with 354 is "regular", 355 is "long."
 *
 *  The 30 day discrepancy will occur in leap years because
 *  of the extra month. The "length" of the year is the same as
 *  if there was no extra month. (383 is the same as 353.)
 *
 */

typedef NS_ENUM(NSInteger, kYearLength)
{
    kYearLengthShort = 0,    //  Years that are 353/383 days long
    kYearLengthRegular,      //  Years that are 354/384 days long
    kYearLengthLong          //  Years that are 355/385 days long
};

@interface NSCalendar (HebrewYearTypes)

//  Returns a weekday, 1-7
+ (enum kWeekday)firstWeekdayOfHebrewYearContainingDate:(NSDate *)date;

// Returns a year length, as per the comments in the kYearLength enum
+ (enum kYearLength)lengthOfHebrewYearContainingDate:(NSDate *)date;

//  YES if the given date is represented by a hebrew year containing 13 months, else NO
+ (BOOL)isHebrewYearContainingDateALeapYear:(NSDate *)date;

//  Returns one of fourteen types. See the kHebrewYearType enum above.
+ (enum kHebrewYearType)typeOfHebrewYearContainingDate:(NSDate *)date;

@end
