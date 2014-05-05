/**
 *  KCSefiraFormatter.h
 *  KosherCocoa 2
 *
 *  Created by Moshe Berman on 10/23/13 based on KosherJava by Eliyahu Hershfeld.
 *  Updated by Moshe Berman on 10/23/13.
 *
 *  Use of KosherCocoa 2 is governed by the LGPL 2.1 License.
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


#import <Foundation/Foundation.h>

/**
 *  The sefira custom flag determines which
 *  custom to use when returning a formatted
 *  string.
 */

NS_ENUM(NSInteger, KCSefiraCustom) {
    KCSefiraCustomAshkenaz,     //  Uses the bet prefix
    KCSefiraCustomSefard = 1,   //  Uses the lamed prefix
    KCSefiraCustomSephardic = 2 //  Uses the lamed prefix and sephardic formula
};

/**
 *  This
 */
NS_ENUM(NSInteger, KCSefiraLanguage) {
    KCSefiraLanguageHebrew = 0,             //  The count, in Hebrew
    KCSefiraLanguageEnglish,                //  The count, in English
    KCSefiraFormatterTransliteratedHebrew   //  The count, in Hebrew, spelled in English
};

/** This class formats an integer into a sefira day*/
@interface KCSefiraFormatter : NSObject

/**
 *  The language for the formatter to use.
 */

@property (nonatomic, assign) enum KCSefiraLanguage language;

/**
 *  The custom for the formatter to use.
 */

@property (nonatomic, assign) enum KCSefiraCustom custom;

/** Converts an integer (between 1 and 49, inclusive)
 *  into a string representing the sefira count for
 *  that day.
 *
 *  @param integer An integer representing the day of sefira.
 *
 *  @return A string representing the day of the omer.
 *
 */

- (NSString *)stringFromInteger:(NSInteger)integer;

@end
