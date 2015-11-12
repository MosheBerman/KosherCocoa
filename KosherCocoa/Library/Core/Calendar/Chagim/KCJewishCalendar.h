/**
 *  KCJewishCalendar.h
 *  KosherCocoa 3
 *
 *  Created by Moshe Berman on 11/11/11.
 *  Updated by Moshe Berman on 8/26/13.
 *  Updated by Jeremy Bensoussan on 17/11/13.
 *
 *  Use of KosherCocoa 3 is governed by the LGPL 2.1 License.
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
@property BOOL returnsModernHolidays;

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

/**
 *  This method determines if the given date is a Jewish Holiday.
 *
 *  @return bool YES for holidays, NO for fast days and chanukah.
 */

- (BOOL)isYomTov;

/**
 *  This method determines if the given date is Chol Hamoed of Pesach or Succos.
 *
 *  @return bool YES if the current day is Chol Hamoed of Pesach or Succos.
 */

- (BOOL)isCholHamoed;

/**
 *  This method determines if the given date is Chol Hamoed of Succos.
 *
 *  @return bool YES if the current day is Chol Hamoed of Succos.
 */

- (BOOL)isCholHamoedSuccos;

/**
 *  This method determines if the given date is Chol Hamoed of Pesach.
 *
 *  @return bool YES if the current day is Chol Hamoed of Pesach.
 */

- (BOOL)isCholHamoedPesach;

/**
 *  This method determines if the current day is erev Yom Tov.
 *
 *  @return bool YES if the current day is Erev - Pesach, Shavuos, Rosh Hashana, Yom Kippur or Succos.
 */

- (BOOL)isErevYomTov;

/**
 *  This method determines if the current day is Erev Rosh
 *  Chodesh.
 *
 *  @return bool YES if the current day is Erev Rosh Chodesh. Returns NO for Erev Rosh Hashana
 */

- (BOOL)isErevRoshChodesh;

/**
 *  This method determines if the day is a Taanis (fast day).
 *
 *  @return bool YES if the current day is 17 of Tammuz, Tisha B'Av, Yom Kippur, 
 *  Fast of Gedalyah, 10 of Teves or the Fast of Esther.
 */

- (BOOL)isTaanis;

/**
 *  This method determines the day of Chanukah.
 *
 *  @return NSInteger equal to the number of the day of Chanukah, or -1 if it is not Chanukah
 */

- (NSInteger)dayOfChanukah;

/**
 *  This method determines if the date is Chanukkah
 *
 *  @return bool YES if it is Chanukah
 */

- (BOOL)isChanukah; 

/**
 *  This method determines if Purim
 *
 *  @return bool YES if the day is Purim
 */

- (BOOL)isPurim;

/**
 *  This method determines if the current day is Rosh
 *  Chodesh.
 *
 *  @return bool YES if the current day is Rosh Chodesh. Returns NO for Rosh Hashana
 */

- (BOOL)isRoshChodesh;

/**
 *  This method determines if the date is Pesach
 *
 *  @return bool YES if it is Pesach
 */

- (BOOL)isPesach;

/**
 *  This method determines if the date is Shavuos
 *
 *  @return bool YES if it is Shavuos
 */

- (BOOL)isShavuos;

/**
 *  This method determines if the date is Succos
 *
 *  @return bool YES if it is Succos
 */

- (BOOL)isSuccos;

/**
 *  This method determines if the date is Simchat Torah
 *
 *  @return bool YES if it is Simchat Torah
 */

- (BOOL)isSimchasTorah;

/**
 *  This method determines if the date is Shmini Atzeres
 *
 *  @return bool YES if it is Shmini Atzeres
 */

- (BOOL)isShminiAtzeres;

/**
 *  The traditional calculation uses local time. This
 *  method subtracts 20.94 minutes (20 minutes and 56.496 seconds)
 *  from the local time (Har Habayis with a longitude
 *  of 35.2354&deg; is 5.2354&deg; away from the %15 timezone longitude)to get to standard time.
 *  This method intentionally uses standard time and not daylight savings time.
 *  (Java will implicitly format the time to the default (or set)Timezone) -> is this relevant to Objective C?
 *
 *  @param month an integer representing the month. This method expects 1 for Nissan and 13 for Adar II. Use the constants to avoid any confusion.
 *  @param year The Hebrew year to use in calculating.
 *
 *  @return NSDate equal to the molad in Standard Time in Yerushalayim as a Date.
 */

- (NSDate *)moladAsDateForMonth:(NSInteger)month ofYear:(NSInteger)year;

/**
 *  Currently returns the time even if it is during the day. It should return
 *  the 72 Minute Tzais after to the time if the zman is between Alos and Tzais.
 *
 *  @param month The Hebrew month to use in calculating.
 *  @param year The Hebrew year to use in calculating.
 *
 *  @return NSDate earliest time of Kiddush Levana calculated as 3 days after the molad.
 */

- (NSDate *)tchilasZmanKidushLevana3DaysForMonth:(NSInteger)month ofYear:(NSInteger)year;

/**
 *  Currently returns the time even if it is during the day. It should return
 *  the 72 Minute Tzais after to the time if the zman is between Alos and Tzais.
 *
 *  @param date The date to calculate for.
 *
 *  @return NSDate earliest time of Kiddush Levana calculated as 3 days after the molad.
 */

- (NSDate *)tchilasZmanKidushLevana3DaysForDate:(NSDate *)date;

/**
 *  Currently returns the time even if it is during the day. It should return
 *  the 72 Minute Tzais after to the time if the zman is between Alos and Tzais.
 *
 *  @param month The Hebrew month to use in calculating.
 *  @param year The Hebrew year to use in calculating.
 *
 *  @return NSDate earliest time of Kiddush Levana calculated as 7 days after the molad.
 */

- (NSDate *)tchilasZmanKidushLevana7DaysForMonth:(NSInteger)month ofYear:(NSInteger)year;

/**
 *  Currently returns the time even if it is during the day. It should return
 *  the 72 Minute Tzais after to the time if the zman is between Alos and Tzais.
 *
 *  @param date The date to calculate for.
 *
 *  @return NSDate earliest time of Kiddush Levana calculated as 7 days after the molad.
 */

- (NSDate *)tchilasZmanKidushLevana7DaysForDate:(NSDate *)date;

/**
 *  Calculates the latest time of Kiddush Levana according to the
 *  Maharil's opinion that it is calculated as halfway between molad and molad.
 *  This adds half the 29 days, 12 hours and 793 chalakim time between molad and
 *  molad (14 days, 18 hours, 22 minutes and 666 milliseconds)to the month's molad.
 *
 *  @discussion Currently returns the time even if it is during the day. It should return the 72 Minute Alos prior to the time if the zman is between Alos and Tzais.
 *
 *  @param month The Hebrew month to use in calculating.
 *  @param year The Hebrew year to use in calculating.
 *
 *  @return NSDate latest time of Kiddush Levana between Moldos
 */

- (NSDate *)sofZmanKidushLevanaBetweenMoldosForMonth:(NSInteger)month ofYear:(NSInteger)year;

/**
 *  Calculates the latest time of Kiddush Levana according to the
 *  Maharil's opinion that it is calculated as halfway between molad and molad.
 *  This adds half the 29 days, 12 hours and 793 chalakim time between molad and
 *  molad (14 days, 18 hours, 22 minutes and 666 milliseconds)to the month's molad.
 *
 *  @discussion Currently returns the time even if it is during the day. It should return the 72 Minute Alos prior to the time if the zman is between Alos and Tzais.
 *
 *  @param date The date to calculate for.
 *
 *  @return NSDate latest time of Kiddush Levana between Moldos
 */

- (NSDate *)sofZmanKidushLevanaBetweenMoldosForDate:(NSDate *)date;

/**
 *  This is the opinion brought down in the Shulchan Aruch (Orach Chaim 426).
 *  It should be noted that some opinions hold that the Rema who brings down the opinion
 *  of the Maharil's of calculating half way between molad and molad is of the opinion
 *  that the Mechaber agrees to his opinion. Also see the Aruch Hashulchan.
 *  For additional details on the subject, See Rabbi Dovid Heber's very detailed writeup
 *  in Siman Daled (chapter 4)of Shaarei Zmanim http://www.worldcat.org/oclc/461326125.
 *
 *  Note: Currently returns the time even if it is during the day.
 *  It should return the  Alos prior to the time if the zman is between Alos and Tzais.
 *
 *  @param month The Hebrew month to use in calculating.
 *  @param year The Hebrew year to use in calculating.
 *
 *  @return NSDate latest time of Kiddush Levana calculated as 15 days after the molad.
 */

- (NSDate *)sofZmanKidushLevana15DaysForMonth:(NSInteger)month ofYear:(NSInteger)year;
/**
 *  This is the opinion brought down in the Shulchan Aruch (Orach Chaim 426).
 *  It should be noted that some opinions hold that the Rema who brings down the opinion
 *  of the Maharil's of calculating half way between molad and molad is of the opinion
 *  that the Mechaber agrees to his opinion. Also see the Aruch Hashulchan.
 *  For additional details on the subject, See Rabbi Dovid Heber's very detailed writeup
 *  in Siman Daled (chapter 4)of Shaarei Zmanim http://www.worldcat.org/oclc/461326125.
 *
 *  @discussion Currently returns the time even if it is during the day. It should return the  Alos prior to the time if the zman is between Alos and Tzais.
 *
 *  @param date The date to calculate for.
 *
 *  @return NSDate latest time of Kiddush Levana calculated as 15 days after the molad.
 */

- (NSDate *)sofZmanKidushLevana15DaysForDate:(NSDate *)date;

/**
 *  Returns the Daf Yomi (Bavli) for the date the calendar is set to
 *
 *  @return KCDaf object corresponding to the date
 */

- (KCDaf *)dafYomiBavli;

#pragma mark - Calendar Utility Methods

/**
 *  Returns the current hebrew month
 *
 *  @return NSInteger corresponding to the current Hebrew month
 */

- (NSInteger)currentHebrewMonth;

/**
 *  Returns the day of the current hebrew month
 *
 *  @return NSInteger corresponding to the day of the current Hebrew month
 */

- (NSInteger)currentHebrewDayOfMonth;

/**
 *  Returns the current day of the civil week (i.e. days starting @ midnight)
 *
 *  @return NSInteger corresponding to the current day of the civil week
 */

- (NSInteger)currentDayOfTheWeek;

/**
 *  Determine if the current Hebrew year is a leap year
 *
 *  @return bool YES if it is a leap year
 **/

- (BOOL)isCurrentlyHebrewLeapYear;

/**
 *  Determine if the parameter Hebrew year is a leap year
 *
 *  @param year A hebrew year.
 *
 *  @return bool YES if it is a leap year
 **/

- (BOOL)isHebrewLeapYear:(NSInteger)year;

/**
 *  Determine if the month of Kislev is short this year.
 *
 *  @return bool YES if Kislef is short
 **/

- (BOOL)isKislevShort;

/**
 *  Returns the length of the parameter Hebrew year
 *
 *  @param year A hebrew year.
 *
 *  @return NSInteger corresponding to the number of days of the year
 **/

- (NSInteger)lengthOfHebrewYear:(NSInteger)year;

/**
 *  Returns the current Hebrew Year
 *
 *  @return NSInteger
 **/

- (NSInteger)currentHebrewYear;

/**
 *  Returns the friday following a given date
 *
 *  @param workingDate The date to calculate for.
 *
 *  @return NSDate
 **/

- (NSDate *)fridayFollowingDate:(NSDate *)workingDate;

@end
