/*
 KCHebrewYear.h
 KosherCocoa 4
 
 Created by Moshe Berman on 8/25/13.
 Updated by Moshe Berman on 10/11/13.
 
 This file contains constants related to the Hebrew Calendar.
 
 Use of KosherCocoa 4 is governed by the LGPL 2.1 License.
 */

#ifndef __KC_HEBREW_YEAR_H
#define __KC_HEBREW_YEAR_H


/**
 
 A type representing a hebrew year configuration.
 
 There are fourteen year configurations, as per
 Arthur Spier, 'The Comprehensive Hebrew Calendar,
 3rd ed' (Behrman House 1986, ISBN 087306-398-8.)
 
 Each configuration composites the weekday of 1 Tishri,
 the number of days in the year, and if the year
 contains Adar II.
 
 */

typedef NS_ENUM(NSUInteger, kHebrewYearType)
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
    kYearLengthShort = 0,    //  Years that are 353/383 days long "Chaseir"
    kYearLengthRegular,      //  Years that are 354/384 days long "Kesidran"
    kYearLengthLong          //  Years that are 355/385 days long "Shaleim"
};

///**
// The three kinds of Hebrew years.
//
//
// - KCHebrewYearTypeKesidran: A "common" year is 354 days long, or in a leap year, 384 days.
// - KCHebrewYearTypeShalaim: A "complete" year is 355 days long, or in a leap year, 383 days.
// */
//typedef NS_ENUM(NSUInteger, KCHebrewYearType) {
//
//    /// A "defective" year has either 353 days long, or in a leap year, 383 days.
//    KCHebrewYearTypeChaser,
//    KCHebrewYearTypeKesidran,
//    KCHebrewYearTypeShalaim,
//} NS_SWIFT_NAME(HebrewYearType);

#endif // __KC_HEBREW_YEAR_H
