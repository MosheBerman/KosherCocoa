//
//  KCHebrewMonth.h
//  KosherCocoa
//
//  Created by Moshe Berman on 4/7/19.
//  Copyright © 2019 Moshe Berman. All rights reserved.
//

#ifndef KCHebrewMonth_h
#define KCHebrewMonth_h

/**
 The months of the Hebrew Calendar, as an enumerated type.
 
 - KCHebrewMonthTishrei: The first month on the Hebrew calendar.
 - KCHebrewMonthCheshvan: The second month on the Hebrew calendar.
 - KCHebrewMonthKislev: The third month on the Hebrew calendar.
 - KCHebrewMonthTeves: The fourth month on the Hebrew calendar.
 - KCHebrewMonthShevat: The fifth month on the Hebrew calendar.
 - KCHebrewMonthAdar: The sixth month on the Hebrew calendar.
 - KCHebrewMonthAdar_II: In years where it occurs, the seventh month on the Hebrew calendar.
 - KCHebrewMonthNissan: The seventh month on the Hebrew calendar.
 - KCHebrewMonthIyar: The eighth month on the Hebrew calendar.
 - KCHebrewMonthSivan: The ninth month on the Hebrew calendar.
 - KCHebrewMonthTammuz: The 10th month on the Hebrew calendar.
 - KCHebrewMonthAv: The 11th month on the Hebrew calendar.
 - KCHebrewMonthElul: The 12th month on the Hebrew calendar.
 - KCHebrewMonthTishri: An alias for KCHebrewMonthTishrei.
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
    KCHebrewMonthElul,
    KCHebrewMonthTishri = KCHebrewMonthTishrei
};

#endif /* KCHebrewMonth_h */
