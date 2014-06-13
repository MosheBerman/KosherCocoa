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
    NSArray *names = @[
                       @"ערב פסח"
                       , @"פסח",
                       @"חול המועד פסח",
                       @"פסח שני",
                       @"ערב שבועות",
                       @"שבועות",
                       @"שבעה עשר בתמוז",
                       @"תשעה באב",
                       @"ט״ו באב",
                       @"ערב ראש השנה",
                       @"ראש השנה",
                       @"צום גדלי-ה",
                       @"ערב יום כיפור",
                       @"ערב סוכות",
                       @"סוכות",
                       @"חול המועד סוכות",
                       @"הושנה רבה",
                       @"שמיני עצרת",
                       @"שמחת תורה",
                       @"ערב חנוכה",
                       @"חנוכה",
                       @"עשרה בטבת",
                       @"ט״ו בשבט",
                       @"תענית אסתר",
                       @"פורים",
                       @"שושן פורים",
                       @"פורים קטן",
                       @"ראש חודש",
                       @"יום השואה",
                       @"יום הזיכרון",
                       @"יום העצמאות",
                       @"יום ירושלים"
                       ];
    return names[self.holidayIndex];
}

/**
 *  @return the transliterad hebrew name of the holiday.
 */

- (NSString *)nameTransliterated
{
    NSArray *names = @[@"Erev Pesach", @"Pesach", @"Chol Hamoed Pesach", @"Pesach Sheni", @"Erev Shavuos", @"Shavuos",
                       @"Fast of Seventeenth Of Tammuz", @"Fast of Ninth of Av", @"Tu Be'Av", @"Erev Rosh Hashana", @"Rosh Hashana",
                       @"Fast of Gedalya", @"Erev Yom Kippur", @"Erev Succos", @"Succos", @"Chol Hamoed Succos", @"Hoshana Rabba",
                       @"Shemini Atzeres", @"Simchat Torah", @"Erev Chanukah", @"Chanuka", @"Fast of Tenth of Teves", @"Tu Be'Shvat",
                       @"Fast of Esther", @"Purim", @"Shushan Purim", @"Purim Katan", @"Rosh Chodesh", @"Yom Hashoah", @"Yom Hazikaron",
                       @"Yom Ha'atzma'ut", @"Yom Yerushalayim"];
    return names[self.holidayIndex];
    
}

@end
