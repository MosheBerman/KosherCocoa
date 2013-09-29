/*
 *  KCJewishCalendar
 *  KosherCocoa 2
 *
 *  Created by Moshe Berman on 11/11/11.
 *  Updated by Moshe Berman on 8/26/13.
 *
 *  Use of KosherCocoa 2 is governed by the LGPL 2.1 License.
 */

#import <Foundation/Foundation.h>
#import "KCComplexZmanimCalendar.h"
#import "KCDaf.h"

/** A class that can be used to check when Jewish holidays are. */

@interface KCJewishCalendar : KCComplexZmanimCalendar

/**-----
 * @name Properties
 * -----
 */

/**
 *  Determines if we account for diaspora in our calculations.
 */

@property BOOL inIsrael;

/**
 *  Determines if we consider "modern" holidays,
 *  such as Yom Ha'atzmaut when returning values.
 */

@property BOOL useModernHolidays;

/**-----
 * @name Holidays
 * -----
 */

/**
 *  This method returns the index of any holidays that fall on 
 *  the date represented by `[NSDate date]`.
 *
 *  @return An NSInteger corresponding to a value 
 */

- (NSInteger)yomTovIndex;

//Returns true if the current day is Yom Tov. The method
//returns false for Chanukah, Erev Yom tov and fast days.

/**
 *  This method determines if the given date is a Jewish Holiday.
 *
 *  @return bool YES for holidays, false for fast days and chanukah.
 */
- (BOOL)isYomTov;

/** 
 *
 */
    
- (BOOL)isCholHamoed;

/**
 *
 */
- (BOOL)isCholHamoedSuccos;

//Returns if a given day is chol hamoed pesach
- (BOOL)isCholHamoedPesach;

//Returns true if the current day is erev Yom Tov. The method returns true
//for Erev - Pesach, Shavuos, Rosh Hashana, Yom Kippur and Succos.
- (BOOL)isErevYomTov;

// Returns true if the current day is Erev Rosh 
// Chodesh. Returns false for Erev Rosh Hashana
- (BOOL)isErevRoshChodesh;

//Return true if the day is a Taanis (fast day). Return true for 
//17 of Tammuz, Tisha B'Av, Yom Kippur, Fast of Gedalyah, 10 of
//Teves and the Fast of Esther
- (BOOL)isTaanis;

//Returns the day of Chanukah or -1 if it is not Chanukah.
- (NSInteger)dayOfChanukah;

//Returns if a given day is chanukah
- (BOOL)isChanukah; 

// Returns if a given day is purim
- (BOOL)isPurim;

//Returns if the day is Rosh Chodesh. Rosh Hashana will return false
- (BOOL)isRoshChodesh;

//returns if a given day is pesach
- (BOOL)isPesach;

//Returns if a given day is shavuos
- (BOOL)isShavuos;

//Returns if a given day is succos
- (BOOL)isSuccos;

//Returns if a given day is simchat torah
- (BOOL)isSimchasTorah;

//Returns if a given day is Shmini Atzeres
- (BOOL)isShminiAtzeres;

//Returns the molad in Standard Time in Yerushalayim as a Date. 
//The traditional calculation uses local time. This
//method subtracts 20.94 minutes (20 minutes and 56.496 seconds)
//from the local time (Har Habayis with a longitude
//of 35.2354&deg; is 5.2354&deg; away from the %15 timezone longitude)to get to standard time. This method
//intentionally uses standard time and not daylight savings time. 
//Java will implicitly format the time to the default (or set)Timezone.
//
//
//  This method expects 1 for Nissan and 13 for Adar II. Use the constants to avoid 
//  any confusion.
//

- (NSDate *)moladAsDateForMonth:(NSInteger)month ofYear:(NSInteger)year;

//Returns the earliest time of Kiddush Levana calculated as 3 days after the molad. 
//Currently returns the time even if it is during the day. It should return 
//the 72 Minute Tzais after to the time if the zman is between Alos and Tzais.
- (NSDate *)tchilasZmanKidushLevana3DaysForMonth:(NSInteger)month ofYear:(NSInteger)year;
- (NSDate *)tchilasZmanKidushLevana3DaysForDate:(NSDate *)date;

//Returns the earliest time of Kiddush Levana calculated as 7 days after the molad. 
//Currently returns the time even if it is during the day. It should return 
//the 72 Minute Tzais after to the time if the zman is between Alos and Tzais.
- (NSDate *)tchilasZmanKidushLevana7DaysForMonth:(NSInteger)month ofYear:(NSInteger)year;
- (NSDate *)tchilasZmanKidushLevana7DaysForDate:(NSDate *)date;

//Returns the latest time of Kiddush Levana according to the 
//<a href="http://en.wikipedia.org/wiki/Yaakov_ben_Moshe_Levi_Moelin">Maharil's</a> opinion 
//that it is calculated as
//halfway between molad and molad. This adds half the 29 days, 12 hours and 793 chalakim 
//time between molad and
// molad (14 days, 18 hours, 22 minutes and 666 milliseconds)to the month's molad. 
//Currently returns the time even if it is during the day. 
//It should return the 72 Minute Alos
// prior to the time if the zman is between Alos and Tzais.
- (NSDate *)sofZmanKidushLevanaBetweenMoldosForMonth:(NSInteger)month ofYear:(NSInteger)year;
- (NSDate *)sofZmanKidushLevanaBetweenMoldosForDate:(NSDate *)date;

//Returns the latest time of Kiddush Levana calculated as 15 days after the molad. 
//  This is the opinion brought down
// in the Shulchan Aruch (Orach Chaim 426). It should be noted that some opinions hold that the
// <http://en.wikipedia.org/wiki/Moses_Isserles">Rema</a> who brings down the opinion of the <a
// href="http://en.wikipedia.org/wiki/Yaakov_ben_Moshe_Levi_Moelin">Maharil's</a> of calculating
// half way between molad and molad is of the opinion that the Mechaber agrees to his opinion.
//  Also see the Aruch Hashulchan. 
//  For additional details on the subject, See Rabbi
// Dovid Heber's very detailed writeup in Siman Daled (chapter 4)of <a
// href="http://www.worldcat.org/oclc/461326125">Shaarei Zmanim</a>.

//  Note:å Currently returns the time even if it is
// during the day. It should return the  Alos prior to the
// time if the zman is between Alos and Tzais.
- (NSDate *)sofZmanKidushLevana15DaysForMonth:(NSInteger)month ofYear:(NSInteger)year;
- (NSDate *)sofZmanKidushLevana15DaysForDate:(NSDate *)date;

//Returns the Daf Yomi (Bavli)for the date that the calendar is set to.
- (KCDaf *)dafYomiBavli;

#pragma mark - Calendar Utility Methods

//Returns the current hebrew month
- (NSInteger)currentHebrewMonth;

//Returns the day of the current hebrew month
- (NSInteger)currentHebrewDayOfMonth;

//Returns the current day of the week
- (NSInteger)currentDayOfTheWeek;

//Determine if the current hebrew year is a leap year
- (BOOL)isCurrentlyHebrewLeapYear;

- (BOOL)isHebrewLeapYear:(NSInteger)year;

//Determine if kislev is a "short" month this year
- (BOOL)isKislevShort;

//Get the length of the current hebrew year
- (NSInteger)lengthOfHebrewYear:(NSInteger)year;

//Get the current Hebrew Year
- (NSInteger)currentHebrewYear;

//  Returns the friday following a given date
- (NSDate *)fridayFollowingDate:(NSDate *)workingDate;

@end
