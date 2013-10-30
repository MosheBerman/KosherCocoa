/**
 *  KCSefiraFormatter,h
 *  KosherCocoa 2
 *
 *  Created by Moshe Berman on 10/23/13.
 *  Updated by Moshe Berman on 10/23/13.
 *
 *  Use of KosherCocoa 2 is governed by the LGPL 2.1 License.
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
    KCSefiraCustomSephardic = 2,//  Uses the lamed prefix and sephardic formula
};

/**
 *  This
 */
NS_ENUM(NSInteger, KCSefiraLanguage) {
    KCSefiraLanguageHebrew = 0,             //  The count, in Hebrew
    KCSefiraLanguageEnglish,                //  The count, in English
    KCSefiraFormatterTransliteratedHebrew   //  The count, in Hebrew, spelled in English
};

//

/** This class formats an integer into a sefira day*/
@interface KCSefiraFormatter : NSObject

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
