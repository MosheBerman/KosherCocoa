/*
 *  KCHebrewYear.h
 *  KosherCocoa 3
 * 
 *  Created by Moshe Berman on 8/25/13.
 *  Updated by Moshe Berman on 10/11/13.
 *
 *  This file contains constants related to the Hebrew Calendar.
 *
 *  Use of KosherCocoa 3 is governed by the LGPL 2.1 License.
 */

#ifndef __KC_HEBREW_YEAR_H
#define __KC_HEBREW_YEAR_H

/** kHebrewMonth
 *
 *  The months of the Hebrew Calendar, as an enumerated type.
 *
 *  It's important to note that Adar II is always considered
 *  to be the the seventh month by the Foundation framework.
 *
 *  Other languages or environments may handle Hebrew leap
 *  years differently.
 */

typedef NS_ENUM(NSUInteger, KCHebrewMonth) {
    KCHebrewMonthTishrei = 1,
    KCHebrewMonthCheshvan,
    KCHebrewMonthKislev,
    KCHebrewMonthTeves,
    KCHebrewMonthShevat,
    KCHebrewMonthAdar,
    KCHebrewMonthAdar_II,
    KCHebrewMonthNissan,
    KCHebrewMonthIyar,
    KCHebrewMonthSivan,
    KCHebrewMonthTammuz,
    KCHebrewMonthAv,
    KCHebrewMonthElul
} NS_SWIFT_NAME(HebrewMonth);

// Backwards Compatibility...
#define kTishrei KCHebrewMonthTishrei
#define kCheshvan KCHebrewMonthCheshvan
#define kKislev KCHebrewMonthKislev
#define kTeves KCHebrewMonthTeves
#define kShevat KCHebrewMonthShevat
#define kAdar KCHebrewMonthAdar
#define kAdar_II KCHebrewMonthAdar_II
#define kNissan KCHebrewMonthNissan
#define kIyar KCHebrewMonthIyar
#define kSivan KCHebrewMonthSivan
#define kTammuz KCHebrewMonthTammuz
#define kAv KCHebrewMonthAv
#define kElul KCHebrewMonthElul

typedef KCHebrewMonth kHebrewMonth;


/**
 The three kinds of Hebrew years.

 Another way of thinking about this is a composite
 of leap years (with 13 months instead of 12) and
 leap months. (Leap months contain 30 days instead
 of the 29 they would otherwise contain. Two months
 of the Hebrew calendar can be leap months.)
 
 - KCYearTypeChaser: A "defective" year has either 353 days long, or in a leap year, 383 days.
 - KCYearTypeKesidran: A "common" year is 354 days long, or in a leap year, 384 days.
 - KCYearTypeShalaim: A "complete" year is 355 days long, or in a leap year, 383 days.
 */
typedef NS_ENUM(NSUInteger, KCHebrewYearType) {
    KCHebrewYearTypeChaser,
    KCHebrewYearTypeKesidran,
    KCHebrewYearTypeShalaim,
} NS_SWIFT_NAME(HebrewYearType);

// Backwards Compatibility...
#define kChaser KCYearTypeChaser
#define kKesidran KCYearTypeKesidran
#define kShalaim KCYearTypeShalaim

typedef KCHebrewYearType kYearType;

#endif // __KC_HEBREW_YEAR_H
