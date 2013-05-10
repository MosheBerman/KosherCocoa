//
//  KosherCocoaConstants.h
//  KosherCocoa
//
//  Created by Moshe Berman on 11/26/12.
//  Copyright (c) 2012 Moshe Berman. All rights reserved.
//

#ifndef __KosherCocoaConstants_h
#define __KosherCocoaConstants_h


/* ------------ Zenith constants --------------- */

#define kZenithGeometric 90.0

#define kZenithCivil 96.0

#define kZenithNautical 102.0

#define kZenithAstronomical 108.0

//  These zeniths are defined in the ZmanimCalendar in KosherCocoa

#define kZenithSixteenPointOne (kZenithGeometric + 16.1)

#define kZenithEightPointFive (kZenithGeometric + 8.5)

/* ---- Astronomical Constants --- */

#define kDegreesPerHour (360.0 / 24.0)

#define kSolarRadius (16.0/60.0)

#define kRefraction (34.0/60.0)

#define kEarthRadius 6356.9

/* --- Complex Zmanim Constants --- */

#define kZenithThreePointSeven kZenithGeometric + 3.7

#define kZenithFivePointNinetyFive kZenithGeometric + 5.95

#define kZenithSevenPointZeroEightThree kZenithGeometric + 7 + (5/60)

#define kZenithTenPointTwo kZenithGeometric + 10.2

#define kZenithElevenDegrees kZenithGeometric + 11

#define kZenithElevenPointFive kZenithGeometric + 11.5

#define kZenithThirteenDegrees kZenithGeometric + 13

#define kZenithThirteenPointTwentyFourDegrees kZenithGeometric + 13.24

#define kZenithNineteenPointEight kZenithGeometric + 19.8

#define kZenithTwentySix kZenithGeometric + 26.0

#define kZenithFourPointThirtySeven kZenithGeometric + 4.37

#define kZenithFourPointSixtyOne kZenithGeometric + 4.61

#define kZenithFourPointEight kZenithGeometric + 4.8

#define kZenithThreePointSixtyFive kZenithGeometric + 3.65

#define kZenithFivePointEightyEight kZenithGeometric + 5.88


/* ------------------------ GeoLocation Constants ----------------------- */

#define kDistance 0
#define kInitialBearing 1
#define kFinalBearing 2

/* ---------------------- Calculation Type Constants ---------------------- */

//
//  Used in the calculation methods to determine which
//  calculation we are performing. (They're essentially
//  a boolean flag, but here it's expressed as a pair of
//  ints.)
//

#define kTypeSunrise 0
#define kTypeSunset 1

/* --------------------- Time Constants ---------------------- */

//
//	These constants are used for determining
//	day offsets from a given date. These constants
//	make the code more readable and easier to maintain.
//

#define kSecondsInAMinute 60
#define kMinutesInAnHour 60
#define kHoursInADay 24
#define kSecondsInAnHour (kSecondsInAMinute * kMinutesInAnHour)
#define kSecondsInADay (kSecondsInAMinute * kMinutesInAnHour * kHoursInADay)
#define kSecondsInSolarYear kSecondsInADay * 365

#define kMillisecondsInAMinute kSecondsInAMinute * 1000
#define kMillisecondsInAnHour kMillisecondsInAMinute * 60


/* ------------------ JewishDate Constants ------------ */

//The Jewish Months
enum kHebrewMonths {
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

//Number of chalakim in a month
#define kChalakimPerMonth 765433 // (29 * 24 + 12) * 1080 + 793

//Days from the beginning of Sunday till molad BaHaRaD. Calculated as 1 day, 5 hours and 204 chalakim = (24 + 5) * 1080 + 204 = 31524
#define kChalakimMoladTohu 31524

//
//  There are three kinds of Hebrew years, each
//  having two possible configurations. They are:
//
//  A "defective year" (Chaser) is 353 days long.
//  A "defective leap year" is 353 days.
//
//  A "common year" (Kesidran) is 354 days long.
//  A "common leap year" is 384 days.
//
//  A "complete year" (Shalaim) is 355 days long.
//  A "complete leap year" is 385 days long.
//
//  This enum accounts for these three pairings.
//

enum kYearType {
    kChaser = 0,
    kKesidran,
    kShalaim
};

//
//  The Jewish holidays, also called "Yomim Tovim",
//  or "Chagim" are defined here.
//
//  This enum includes the major holidays,
//  and the modern holidays, instituted in the
//  State of Israel, which was established in 1948.
//

enum kYomimTovim {
    kErevPesach = 0,
    kPesach,
    kCholHamoedPesach,
    kPesachSheni,
    kErevShavuos,
    kShavuos,
    kSeventeenthOfTammuz,
    kTishaBeav,
    kTuBeav,
    kErevRoshHashana,
    kRoshHashana,
    kFastOfGedalya,
    kErevYomKippur,
    kYomKippur,
    kErevSuccos,
    kSuccos,
    kCholHamoedSuccos,
    kHoshanaRabba,
    kSheminiAtzeres,
    kSimchasTorah,
    kErevChanukah,
    kChanukah,
    kTenthOfTeves,
    kTuBeshvat,
    kFastOfEsther,
    kPurim,
    kShushanPurim,
    kPurimKatan,
    kRoshChodesh,
    kYomHashoah,
    kYomHazikaron,
    kYomHaatzmaut,
    kYomYerushalayim
};


#endif