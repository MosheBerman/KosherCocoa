/**
 *  KCParashatHashavuaCalculator.h
 *  KosherCocoa 3
 *
 *  Created by Moshe Berman on 1/17/11.
 *  Updated by Moshe Berman on 10/7/13.
 *
 *  Use of KosherCocoa 3 is governed by the LGPL 2.1 License.
 */

@import Foundation;
#import "MBCalendarCategories.h"
#import "KCParasha.h"

/**
 *  The KCParashatHashavuaCalculator class calculates which 
 *  parasha is read on the shabbat following a supplied date.
 *  It can also return the listing for an entire year. 
 *
 *  In Israel, due to differences in holiday observance, the schedule
 *  may vary from the diaspora in some years. KCParashatHashavuaCalculator
 *  accounts for these as well, and can return the appropriate value for
 *  both Israel and the diaspora.
 */
NS_SWIFT_NAME(ParashatHashavuaCalculator)
@interface KCParashatHashavuaCalculator : NSObject

/**
 *  This method returns a KCParasha object representing the *parasha* 
 *  in the diaspora for the week during which the supplied date falls.
 *
 *  @param date An NSDate representing a day for which we want to calculate the parasha.
 *  @see KCParasha.h
 *  @return A KCParasha object representing the relevant parasha or parshiot.
 */

- (nonnull KCParasha *)parashaInDiasporaForDate:(nonnull NSDate *)date;

/**
 *  This method returns a KCParasha object representing the *parasha*
 *  in Israel for the week during which the supplied date falls.
 *
 *  @param date An NSDate representing a day for which we want to calculate the parasha.
 *  @see KCParasha
 *  @return A KCParasha object representing the relevant parasha or parshiot.
 */

- (nonnull KCParasha *)parashaInIsraelForDate:(nonnull NSDate *)date;

/**
 *  Returns a listing of all parshiot in the diaspora
 *  for the specificed year type.
 *  
 *  You can get the year type from the NSCalendar class method,
 *  typeOfHebrewYearContainingDate: as defined
 *  in NSDate+HebrewYearTypes category method.
 *
 *  @param typeOfYear A kHebrewYearType value as defined in NSCalendar+hebrewYearTypes.h
 *
 *  @see KCParasha.h
 *
 *  @return An array of KCParashaIdentifiers wrapped in NSNumber objects.
 *
 */

- (nonnull NSArray <NSNumber *>*)parshiotInDiasporaDuringYearType:(enum kHebrewYearType)typeOfYear;

/**
 *  Returns a listing of all parshiot in Israel 
 *  for the specificed year type.
 *
 *  You can get the year type from the NSCalendar class method,
 *  typeOfHebrewYearContainingDate: as defined
 *  in NSDate+HebrewYearTypes category method.
 *
 *  @param typeOfYear A kHebrewYearType value as defined in NSCalendar+hebrewYearTypes.h
 *
 *  @see KCParasha.h
 *  @return An array of KCParashaIdentifiers wrapped in NSNumber objects.
 *
 */

- (nonnull NSArray <NSNumber *>*)parshiotInIsraelDuringYearType:(enum kHebrewYearType)typeOfYear;

@end
