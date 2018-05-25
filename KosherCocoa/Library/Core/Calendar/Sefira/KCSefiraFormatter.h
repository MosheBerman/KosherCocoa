/**
 *  KCSefiraFormatter.h
 *  KosherCocoa 3
 *
 *  Created by Moshe Berman on 10/23/13 based on KosherJava by Eliyahu Hershfeld.
 *  Updated by Moshe Berman on 10/23/13.
 *
 *  Use of KosherCocoa 3 is governed by the LGPL 2.1 License.
 *
 *  ---
 *
 * Zmanim Java API
 * Copyright (C) 2004-2012 Eliyahu Hershfeld
 *
 * This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General
 * Public License as published by the Free Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful,but WITHOUT ANY WARRANTY; without even the implied
 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 * You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to
 * the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA,
 * or connect to: http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html
 */


@import Foundation;

/**
 *  This flag determines which custom
 *  to use when returning a formatted
 *  string.
 */

typedef NS_ENUM(NSInteger, KCSefiraCustom)
{
    KCSefiraCustomAshkenaz,     //  Uses the bet prefix
    KCSefiraCustomSefard = 1,   //  Uses the lamed prefix
    KCSefiraCustomSephardic = 2,//  Uses the lamed prefix and sephardic formula
    KCSefiraCustomAri = 3       // Chabad - not sure what's different here yet.
} NS_SWIFT_NAME(SefiraCustom);

/**
 *  This flag determines which language to use to display the text.
 */

typedef NS_ENUM(NSInteger, KCSefiraLanguage) {
    KCSefiraLanguageHebrew = 0,             //  The count, in Hebrew
    KCSefiraLanguageLocalizedOrEnglish,     //  The count, in the system language with English as a fallback
    KCSefiraFormatterTransliteratedHebrew   //  The count, in Hebrew, spelled in English
} NS_SWIFT_NAME(SefiraLanguage);

/**
 *  The prayers for the formatter to show with the count text.
 *
 *  If the KCSefiraLanguage is not set to KCSefiraLanguageHebrew
 *  or KCSefiraCustom is KCSefiraCustomSephardic, the results from 
 *  passing these flags is undefined.
 */

typedef NS_OPTIONS(NSInteger, KCSefiraPrayerAddition) {
    KCSefiraPrayerAdditionLeshaimYichud = 1 << 0,
    KCSefiraPrayerAdditionBeracha = 1 << 1,
    KCSefiraPrayerAdditionHarachaman = 1 << 2,
    KCSefiraPrayerAdditionLamenatzaiach= 1 << 3,
    KCSefiraPrayerAdditionAna = 1 << 4,
    KCSefiraPrayerAdditionRibono = 1 << 5,
    KCSefiraPrayerAdditionAleinu = 1 << 6
} NS_SWIFT_NAME(SefiraPrayerAddition);

/** This class formats an integer into a sefira day*/
NS_SWIFT_NAME(SefiraFormatter)
@interface KCSefiraFormatter : NSObject

/**
 *  The language for the formatter to use.
 */

@property (nonatomic, assign) enum KCSefiraLanguage language;

/**
 *  The custom for the formatter to use.
 */

@property (nonatomic, assign) enum KCSefiraCustom custom;

#pragma mark - Getting the Count

/**
 *  Converts an integer (between 1 and 49, inclusive)
 *  into a string representing the sefira count for
 *  that day.
 *
 *  @param integer An integer representing the day of sefira.
 *
 *  @return A string representing the day of the omer.
 *
 */

- (nullable NSString *)countStringFromInteger:(NSInteger)integer;

/** 
 *  Converts an integer (between 1 and 49, inclusive)
 *  into a string representing the sefira count for
 *  that day.
 *
 *  We return an attributed string because parts of the prayer are 
 *  typeset precisely in modern prayerbooks for kabbalistic reasons.
 *
 *  @param integer An integer representing the day of sefira.
 *  @param prayers The prayers to prepend and append to the count text.
 *
 *  @return An attributed string representing the day of the omer.
 *
 */

- (nullable NSString *)countStringFromInteger:(NSInteger)integer withPrayers:(KCSefiraPrayerAddition)prayers;

#pragma mark - Getting the Kabbalistic Trait of the Week

/**
 Converts an integer (between 1 and 7, inclusive)
 into a kabbalistic trait traditionally assigned
 to a given week of the omer.
 
 @param week The week to get the trait for.
 @return A string containing the attribure of that week.
 */
- (nullable NSString *)kabbalisticTraitForWeek:(NSInteger)week;


#pragma mark - Getting the Kabbalistic Trait of the Day

/**
 Converts an integer (between 1 and 49, inclusive)
 into a kabbalistic trait traditionally assigned
 to a given day of the omer.

 @param day The day to get the trait for.
 @return A string containing the attribure of that day.
 */
- (nullable NSString *)kabbalisticTraitForDay:(NSInteger)day;

/**
 Converts an integer (between 1 and 49, inclusive)
 into a kabbalistic trait traditionally assigned
 to a given day of the omer.
 
 @param integer The day to get the trait for.
 @return A string containing the attribure of that day.
 */
- (nullable NSString *)kabbalisticTraitFromInteger:(NSInteger)integer DEPRECATED_MSG_ATTRIBUTE("Use kabbalisticTraitForDay: and kabbalisticTraitForWeek: instead.");

/**
 *  Get the blessing text for counting the omer.
 *
 *  @return The blessing said on counting the omer.
 */

- (nonnull NSString *)blessing;

@end
