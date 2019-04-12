/**
  KCJewishCalendar.h
  KosherCocoa 4

  Created by Moshe Berman on 11/11/11.
  Updated by Moshe Berman on 8/26/13.
  Updated by Jeremy Bensoussan on 17/11/13.

  Use of KosherCocoa 4 is governed by the LGPL 2.1 License.
 */

@import Foundation;
#import "KCComplexZmanimCalendar.h"
#import "KCDaf.h"

/**
 A class that can be used to check when Jewish holidays are.
 */
NS_SWIFT_NAME(JewishCalendar)
@interface KCJewishCalendar : KCComplexZmanimCalendar


// MARK: - Israel

/**
 Determines if we account for diaspora in our calculations.
 */
@property (nonatomic) BOOL inIsrael;

/**
 Determines if we consider "modern" holidays, such as Yom Ha'atzmaut when returning values.
 */
@property (nonatomic) BOOL returnsModernHolidays;

// MARK: - Holidays

/**
 The index of any holidays that fall on `workingDate`.
 */
@property (nonatomic, readonly) NSInteger yomTovIndex;

/**
 Determines if the given date is a Jewish Holiday.
 */
@property (nonatomic, readonly) BOOL isYomTov;

/**
 Determines if the given date is Chol Hamoed of Pesach or Succos.
 */
@property (nonatomic, readonly) BOOL isCholHamoed;

/**
 Determines if the given date is Chol Hamoed of Succos.
 */
@property (nonatomic, readonly) BOOL isCholHamoedSuccos;

/**
 Determines if the given date is Chol Hamoed of Pesach.
 */
@property (nonatomic, readonly) BOOL isCholHamoedPesach;

/**
 Determines if the current day is erev Yom Tov.
 */
@property (nonatomic, readonly) BOOL isErevYomTov;

/**
 Determines if the current day is Erev Rosh.
 */
@property (nonatomic, readonly) BOOL isErevRoshChodesh;

/**
 Determines if the day is a Taanis (fast day).
 `YES` if `workingDate` is 17 of Tammuz, Tisha B'Av, Yom Kippur, Fast of Gedalyah, 10 of Teves or the Fast of Esther.
 */
@property (nonatomic, readonly) BOOL isTaanis;

/**
 The day of Chanukah, or -1 if it is not Chanukah
 */
@property (nonatomic, readonly) NSInteger dayOfChanukah;

/**
 Determines if the date is Chanukah.
 */
@property (nonatomic, readonly) BOOL isChanukah;

/**
 Determines if the `workingDate` is Purim.
 */
@property (nonatomic, readonly) BOOL isPurim;

/** Determines if the `workingDate` is Rosh Chodesh.
 */
@property (nonatomic, readonly) BOOL isRoshChodesh;

/**
 Determines if the `workingDate` is Pesach.
 */
@property (nonatomic, readonly) BOOL isPesach;

/**
 Determines if the `workingDate` is Shavuos.
 */
@property (nonatomic, readonly) BOOL isShavuos;

/**
 Determines if the `workingDate` is Succos.
 */
@property (nonatomic, readonly) BOOL isSuccos;

/**
 Determines if the `workingDate` is Simchas Torah
 */
@property (nonatomic, readonly) BOOL isSimchasTorah;

/**
 Determines if the `workingDate` is Shemini Atzeres.
 */
@property (nonatomic, readonly) BOOL isShminiAtzeres;

/**
 The traditional calculation uses local time. This
 method subtracts 20.94 minutes (20 minutes and 56.496 seconds)
 from the local time (Har Habayis with a longitude
 of 35.2354&deg; is 5.2354&deg; away from the %15 timezone longitude)to get to standard time.
 This method intentionally uses standard time and not daylight savings time.
 
 @param month an integer representing the month. This method expects 1 for Nissan and 13 for Adar II. Use the constants to avoid any confusion.
 @param year The Hebrew year to use in calculating.
 
 @return NSDate equal to the molad in Standard Time in Yerushalayim as a Date.
 */
- (nullable NSDate *)moladAsDateForMonth:(NSInteger)month ofYear:(NSInteger)year;

/*
 Currently returns the time even if it is during the day. It should return
 the 72 Minute Tzais after to the time if the zman is between Alos and Tzais.
 
 @param month The Hebrew month to use in calculating.
 @param year The Hebrew year to use in calculating.
 
 @return NSDate earliest time of Kiddush Levana calculated as 3 days after the molad.
 */
- (nullable NSDate *)tchilasZmanKidushLevana3DaysForMonth:(NSInteger)month ofYear:(NSInteger)year;

/**
 Currently returns the time even if it is during the day. It should return
 the 72 Minute Tzais after to the time if the zman is between Alos and Tzais.
 
 @param date The date to calculate for.
 
 @return NSDate earliest time of Kiddush Levana calculated as 3 days after the molad.
 */

- (nullable NSDate *)tchilasZmanKidushLevana3DaysForDate:(nonnull NSDate *)date;

/*
 Currently returns the time even if it is during the day. It should return
 the 72 Minute Tzais after to the time if the zman is between Alos and Tzais.
 
 @param month The Hebrew month to use in calculating.
 @param year The Hebrew year to use in calculating.
 
 @return NSDate earliest time of Kiddush Levana calculated as 7 days after the molad.
 */

- (nullable NSDate *)tchilasZmanKidushLevana7DaysForMonth:(NSInteger)month ofYear:(NSInteger)year;

/**
 Currently returns the time even if it is during the day. It should return
 the 72 Minute Tzais after to the time if the zman is between Alos and Tzais.
 
 @param date The date to calculate for.
 
 @return NSDate earliest time of Kiddush Levana calculated as 7 days after the molad.
 */

- (nullable NSDate *)tchilasZmanKidushLevana7DaysForDate:(nonnull NSDate *)date;

/**
 Calculates the latest time of Kiddush Levana according to the
 Maharil's opinion that it is calculated as halfway between molad and molad.
 This adds half the 29 days, 12 hours and 793 chalakim time between molad and
 molad (14 days, 18 hours, 22 minutes and 666 milliseconds)to the month's molad.
 
 @discussion Currently returns the time even if it is during the day. It should return the 72 Minute Alos prior to the time if the zman is between Alos and Tzais.
 
 @param month The Hebrew month to use in calculating.
 @param year The Hebrew year to use in calculating.
 
 @return NSDate latest time of Kiddush Levana between Moldos
 */

- (nullable NSDate *)sofZmanKidushLevanaBetweenMoldosForMonth:(NSInteger)month ofYear:(NSInteger)year;

/**
 Calculates the latest time of Kiddush Levana according to the
 Maharil's opinion that it is calculated as halfway between molad and molad.
 This adds half the 29 days, 12 hours and 793 chalakim time between molad and
 molad (14 days, 18 hours, 22 minutes and 666 milliseconds)to the month's molad.
 
 @discussion Currently returns the time even if it is during the day. It should return the 72 Minute Alos prior to the time if the zman is between Alos and Tzais.
 
 @param date The date to calculate for.
 
 @return NSDate latest time of Kiddush Levana between Moldos
 */

- (nullable NSDate *)sofZmanKidushLevanaBetweenMoldosForDate:(nonnull NSDate *)date;

/**
 This is the opinion brought down in the Shulchan Aruch (Orach Chaim 426).
 It should be noted that some opinions hold that the Rema who brings down the opinion
 of the Maharil's of calculating half way between molad and molad is of the opinion
 that the Mechaber agrees to his opinion. Also see the Aruch Hashulchan.
 For additional details on the subject, See Rabbi Dovid Heber's very detailed writeup
 in Siman Daled (chapter 4)of Shaarei Zmanim http://www.worldcat.org/oclc/461326125.
 
 Note: Currently returns the time even if it is during the day.
 It should return the  Alos prior to the time if the zman is between Alos and Tzais.
 
 @param month The Hebrew month to use in calculating.
 @param year The Hebrew year to use in calculating.
 
 @return NSDate latest time of Kiddush Levana calculated as 15 days after the molad.
 */

- (nullable NSDate *)sofZmanKidushLevana15DaysForMonth:(NSInteger)month ofYear:(NSInteger)year;
/**
 This is the opinion brought down in the Shulchan Aruch (Orach Chaim 426).
 It should be noted that some opinions hold that the Rema who brings down the opinion
 of the Maharil's of calculating half way between molad and molad is of the opinion
 that the Mechaber agrees to his opinion. Also see the Aruch Hashulchan.
 For additional details on the subject, See Rabbi Dovid Heber's very detailed writeup
 in Siman Daled (chapter 4)of Shaarei Zmanim http://www.worldcat.org/oclc/461326125.
 
 @discussion Currently returns the time even if it is during the day. It should return the  Alos prior to the time if the zman is between Alos and Tzais.
 
 @param date The date to calculate for.
 
 @return NSDate latest time of Kiddush Levana calculated as 15 days after the molad.
 */
- (nullable NSDate *)sofZmanKidushLevana15DaysForDate:(nonnull NSDate *)date;

/**
 Returns the Daf Yomi (Bavli) for the date the calendar is set to
 
 @return KCDaf object corresponding to the date
 */

- (nonnull KCDaf *)dafYomiBavli;

#pragma mark - Calendar Utility Methods

/**
 Returns the current hebrew month
 
 @return NSInteger corresponding to the current Hebrew month
 */

- (NSInteger)currentHebrewMonth;

/**
 Determines the day of the hebrew month.
 */
@property (nonatomic) NSInteger currentHebrewDayOfMonth;

/**
 Determines current day of the civil week (i.e. days starting @ midnight)
 */
@property (nonatomic) NSInteger currentDayOfTheWeek;

/**
 Determines if the current Hebrew year is a leap year.
 */
@property (nonatomic, readonly) BOOL isCurrentlyHebrewLeapYear;

/**
 Determines if the parameter Hebrew year is a leap year.
 
 @param year A hebrew year.
 @return `YES` if it is a leap year, otherwise `NO`.
 */
- (BOOL) isHebrewLeapYear:(NSInteger)year;

/**
 Determine if the month of Kislev is short this year.
 */
@property (nonatomic, readonly) BOOL isKislevShort;

/**
 The current Hebrew year.
 */
@property (nonatomic) NSInteger currentHebrewYear;


/**
 Determines the length of the the Hebrew year, `year`.
 
 @param year A hebrew year.
 @return NSInteger corresponding to the number of days of the year
 */
- (NSInteger)lengthOfHebrewYear:(NSInteger)year;

/**
 Determines the friday following a given date.
 
 @param workingDate The date to calculate for.
 @return A date representing friday on, or after `workdingDate`.
*/
- (nullable NSDate *)fridayFollowingDate:(nonnull NSDate *)workingDate;

@end
