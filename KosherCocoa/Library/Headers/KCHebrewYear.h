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

enum kHebrewMonth {
    kTishrei = 1,
    kCheshvan,
    kKislev,
    kTeves,
    kShevat,
    kAdar,
    kAdar_II,
    kNissan,
    kIyar,
    kSivan,
    kTammuz,
    kAv,
    kElul
};

/** kYearType
 *
 *  There are three kinds of Hebrew years, each
 *  having two possible configurations. They are:
 *
 *  A "defective year" (Chaser) is 353 days long.
 *  A "defective leap year" is 353 days.
 *
 *  A "common year" (Kesidran) is 354 days long.
 *  A "common leap year" is 384 days.
 *
 *  A "complete year" (Shalaim) is 355 days long.
 *  A "complete leap year" is 385 days long.
 *
 *  Another way of thinking about this is a composite
 *  of leap years (with 13 months instead of 12) and
 *  leap months. (Leap months contain 30 days instead 
 *  of the 29 they would otherwise contain. Two months
 *  of the Hebrew calendar can be leap months.)
 *
 */

enum kYearType {
    kChaser = 0,
    kKesidran,
    kShalaim
};

#endif // __KC_HEBREW_YEAR_H