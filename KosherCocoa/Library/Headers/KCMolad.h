/**
 *  KCMolad.h
 *  KosherCocoa 3
 *
 *  Created by Moshe Berman on 8/25/13.
 *  Updated by Moshe Berman on 10/11/13.
 *
 *  Use of KosherCocoa 3 is governed by the LGPL 2.1 License.
 */

#ifndef __KC_MOLAD_H
#define __KC_MOLAD_H

/** kJewishEpoch
 *
 *  The Jewish epoch using the RD (Rata Die/Fixed Date or Reingold Dershowitz) day
 *  used in the Java version of the Calendrical Calculations.
 *  Day 1 is January 1, 0001 Gregorian
 */

#define kJewishEpoch -1373429

/** kChalakimPerMinute
 *
 *  The number of *chalakim* per minute.
 *
 *  This is defined as 18.
 */

#define kChalakimPerMinute 18

/** kChalakimPerHour
 *
 *  The number of *chalakim* per hour.
 *
 *  This is defined as 18 times the number of minutes per 
 *  hour, or 1080.
 */

#define kChalakimPerHour 1080

/** kChalakimPerDay
 *
 *  The number of *chalakim* per day.
 *
 *  This is defined as 18 times the number of minutes per
 *  hour times the number of hours per day, or 25920.
 */

#define kChalakimPerDay 25920 // 24 * 1080

/** kChalakimPerMonth
 *
 *  The number of *chalakim* per month.
 *
 *  This is defined as the number of *chalakim*
 *  per day times the number of days in a standard
 *  Hebrew months.
 */

#define kChalakimPerMonth 765433 // (29 * 24 + 12) * 1080 + 793

/** kChalakimMoladTohu
 *
 *  Days from the beginning of Sunday till molad BaHaRaD.
 *  
 *  Calculated as 1 day, 5 hours and 204 chalakim.
 *
 *  (24 + 5) *1080 + 204 = 31524
 */

#define kChalakimMoladTohu 31524

#endif // __KC_MOLAD_H