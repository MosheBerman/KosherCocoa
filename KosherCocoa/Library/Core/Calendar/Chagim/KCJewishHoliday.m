//
//  KCJewishHoliday.m
//  KosherCocoa
//
//  Created by Moshe Berman on 6/8/14.
//  Copyright (c) 2014 Moshe Berman. All rights reserved.
//

#import "KCJewishHoliday.h"
#import "KCJewishHolidays.h"

@implementation KCJewishHoliday

/**
 *  A convenience accessor to get a holiday from an index.
 */

+ (id)holidayWithIndex:(NSInteger)index
{
    KCJewishHoliday *holiday = [[KCJewishHoliday alloc] init];
    
    [holiday setHolidayIndex:index];
    
    return holiday;
}

/**
 *  @return the hebrew name of the holiday.
 */

- (NSString *)name
{
    NSDictionary *names = [self names][self.holidayIndex];
    
    return names[@"he_IL"];
}

/**
 *  @return the transliterad hebrew name of the holiday.
 */

- (NSString *)nameTransliterated
{
    NSDictionary *names = [self names][self.holidayIndex];
    
    return names[@"en_US"];
}

/**
 *  Returns a static array of all of the holiday names in a dictionary.
 */

- (NSArray *)names
{
    static NSArray *names =  nil;
    
    names = @[
              @{@"en_US" : @"Erev Pesach", @"he_IL" :  @"ערב פסח"},
              @{@"en_US" : @"Pesach", @"he_IL" :  @"פסח"},
              @{@"en_US" : @"Chol Hamoed Pesach", @"he_IL" :  @"חול המועד פסח"},
              @{@"en_US" : @"Pesach Sheni", @"he_IL" :  @"פסח שני"},
              @{@"en_US" : @"Erev Shavuos", @"he_IL" :  @"ערב שבועות"},
              @{@"en_US" : @"Shavuos", @"he_IL" :  @"שבועות"},
              @{@"en_US" : @"Fast of Seventeenth Of Tammuz", @"he_IL" :  @"שבעה עשר בתמוז"},
              @{@"en_US" : @"Fast of Ninth of Av", @"he_IL" :  @"תשעה באב"},
              @{@"en_US" : @"Tu Be'Av", @"he_IL" :  @"ט״ו באב"},
              @{@"en_US" : @"Erev Rosh Hashana", @"he_IL" :  @"ערב ראש השנה"},
              @{@"en_US" : @"Rosh Hashana", @"he_IL" :  @"ראש השנה"},
              @{@"en_US" : @"Fast of Gedalya", @"he_IL" :  @"צום גדלי-ה"},
              @{@"en_US" : @"Erev Yom Kippur", @"he_IL" :  @"ערב יום כיפור"},
              @{@"en_US" : @"Yom Kippur", @"he_IL" :  @"יום כיפור"},
              @{@"en_US" : @"Erev Sukkot", @"he_IL" :  @"ערב סוכות"},
              @{@"en_US" : @"Sukkot", @"he_IL" :  @"סוכות"},
              @{@"en_US" : @"Chol Hamoed Sukkot", @"he_IL" :  @"חול המועד סוכות"},
              @{@"en_US" : @"Hoshana Rabba", @"he_IL" :  @"הושנה רבה"},
              @{@"en_US" : @"Shemini Atzeres", @"he_IL" :  @"שמיני עצרת"},
              @{@"en_US" : @"Simchat Torah", @"he_IL" :  @"שמחת תורה"},
              @{@"en_US" : @"Erev Chanukah", @"he_IL" :  @"ערב חנוכה"},
              @{@"en_US" : @"Chanukah", @"he_IL" :  @"חנוכה"},
              @{@"en_US" : @"Fast of Tenth of Teves", @"he_IL" :  @"עשרה בטבת"},
              @{@"en_US" : @"Tu Be'Shvat", @"he_IL" :  @"ט״ו בשבט"},
              @{@"en_US" : @"Fast of Esther", @"he_IL" :  @"תענית אסתר"},
              @{@"en_US" : @"Purim", @"he_IL" :  @"פורים"},
              @{@"en_US" : @"Shushan Purim", @"he_IL" :  @"שושן פורים"},
              @{@"en_US" : @"Purim Katan", @"he_IL" :  @"פורים קטן"},
              @{@"en_US" : @"Rosh Chodesh", @"he_IL" :  @"ראש חודש"},
              @{@"en_US" : @"Yom Hashoah", @"he_IL" :  @"יום השואה"},
              @{@"en_US" : @"Yom Hazikaron", @"he_IL" :  @"יום הזיכרון"},
              @{@"en_US" : @"Yom Ha'atzma'ut", @"he_IL" :  @"יום העצמאות"},
              @{@"en_US" : @"Yom Yerushalayim", @"he_IL" :  @"יום ירושלים"}
              ];
    
    return names;
}

@end
