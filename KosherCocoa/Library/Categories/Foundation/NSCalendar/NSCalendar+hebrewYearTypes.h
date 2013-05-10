//
//  NSCalendar+hebrewYearTypes.h
//  KosherCocoa
//
//  Created by Moshe Berman on 5/9/13.
//  Copyright (c) 2013 Moshe Berman. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 
 There are fourteen year configurations, as
 per 'The Hebrew Calendar' (Arthur Spier).
 
 Each configuration is based on the first
 day of the year, the length of the year in days,
 and if the year is a leap year.
 
 */

typedef enum
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
} kHebrewYearType;

typedef enum {
    kWeekdaySunday = 1,
    kWeekdayMonday,
    kWeekdayTuesday,
    kWeekdayWednesday,
    kWeekdayThursday,
    kWeekdayFriday,
    kWeekdaySaturday
} kWeekday;

typedef enum {
    kYearLengthShort = 0,    //  Years that are 353/383 days long
    kYearLengthRegular,      //  Years that are 354/384 days long
    kYearLengthLong          //  Years that are 355/385 days long
} kYearLength;


@interface NSCalendar (HebrewYearTypes)

//  Returns a weekday, 1-7
+ (kWeekday)firstWeekdayOfHebrewYearContainingDate:(NSDate *)date;

// Returns a year length, as per the comments in the kYearLength enum
+ (kYearLength)lengthOfHebrewYearContainingDate:(NSDate *)date;

//  YES if the given date is represented by a hebrew year containing 13 months, else NO
+ (BOOL)isHebrewYearContainingDateALeapYear:(NSDate *)date;

//  Returns one of fourteen types. See the kHebrewYearType enum above.
+ (kHebrewYearType)typeOfHebrewYearContainingDate:(NSDate *)date;

@end
