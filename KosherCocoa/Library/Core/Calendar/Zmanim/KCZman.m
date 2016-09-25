/**
 *  KCZman.m
 *  KosherCocoa 3
 *
 *  Created by Moshe Berman on 4/8/15.
 *
 *  Use of KosherCocoa 3 is governed by the LGPL 2.1 License.
 */

#import "KCZman.h"

@interface KCZman ()

@end

@implementation KCZman

#pragma mark - Instantiating a Zman

/** ---
 *  @name Instantiating a Zman
 *  ---
 */

/**
 *  Takes a selector and converts it into a KCZman object.
 *
 *  @return A zman object for the supplied selector.
 */

+ (KCZman *)zmanForSelector:(SEL)selector
{
    return [[KCZman alloc] initWithSelector:selector];
}

/**
 *  Instantiates a zman for the supplied selector.
 *
 *  @return A zman with with the supplied selector.
 */

- (instancetype)initWithSelector:(SEL)selector
{
    self = [super init];
    
    if (self)
    {
        _selector = selector;
    }
    
    return self;
}

#pragma mark - Display Name

/** ---
 *  @name Display Name
 *  ---
 */

/**
 *  The hebrew name of the zman.
 *
 *  @return The name of the zman, in Hebrew.
 */

- (NSString *)hebrewName
{
    return [self _metadataForCurrentZman][@"koshercocoa.name.hebrew"];
}

/**
 *  The transliterated name of the zman, using the ashkenazic pronunciation.
 *
 *  @discussion Transliterations use the Ashkenazic pronunciation. (For example: "Alos" for sunrise.)
 *
 *  @return The name of the zman.
 */

- (NSString *)transliteratedNameAshkenazic
{
    return [self _metadataForCurrentZman][@"koshercocoa.name.transliterated.ashkenaz"];
}

/**
 *  The transliterated name of the zman, using the sephardic pronunciation.
 *
 *  @discussion Transliterations use the sephardic pronunciation. (For example: "Alot" for sunrise.)
 *
 *  @return The name of the zman.
 */

- (NSString *)transliteratedNameSephardic
{
    return [self _metadataForCurrentZman][@"koshercocoa.name.transliterated.sepharad"];
}

/**
 *  The name of the zman in English.
 *
 *  @return The name of the zman.
 */

- (NSString *)englishName
{
    return [self _metadataForCurrentZman][@"koshercocoa.name.english"];
}

#pragma mark - Explanation

/** ---
 *  @name Explanation
 *  ---
 */

/**
 *  The explanation for the zman.
 *
 *  @return An explanation of the halachic background behind the zman.
 */

- (NSString *)explanation
{
    return [self _metadataForCurrentZman][@"koshercocoa.explanation.english"];
}

#pragma mark - Related Zmanim

/**
 *  This method returns the appropriate data for the zman's selector.
 *
 *  @param An NSDictionary containing data for the zman.
 */

- (NSDictionary *)_metadataForCurrentZman
{
    
    NSDictionary * metadata = nil;
    static NSArray<NSDictionary<NSString *, NSObject*>*>* data = nil;
    
    if (data == nil)
    {
        data = @[
                 @{
                     @"kosherococa.group.name" : @"שעה זמנית",
                     @"koshercocoa.group.name.transliterated.ashkenaz" : @"Sha'ah Zmanis",
                     @"koshercocoa.group.name.english" : @"Temporal Hour",
                     @"zmanim" : @[
                             @{
                                 @"koshercocoa.selector" : NSStringFromSelector(@selector(shaahZmanisMogenAvraham)),
                                 @"koshercocoa.name.hebrew" : @"מ״א",
                                 @"koshercocoa.name.transliterated.ashkenaz" : @"M'A",
                                 @"koshercocoa.name.transliterated.sepharad" : @"M'A",
                                 @"koshercocoa.name.english" : @"M'A",
                                 @"koshercocoa.explanation.english" : @" A shaah zmanis (temporal hour) according to the opinion of the Mogen Avraham. This calculation divides the day based on the opinion of the Mogen Avraham that the day runs from dawn to dusk (for Sof Zman Shema  and tfila). Dawn for this calculation is 72 minutes before sunrise and dusk is 72 minutes after sunset. This day is split into 12 equal parts with each part being a temporal hour."
                                 },
                             @{
                                 @"koshercocoa.selector" : NSStringFromSelector(@selector(shaahZmanisGra)),
                                 @"koshercocoa.name.hebrew" : @"גר״א",
                                 @"koshercocoa.name.transliterated.ashkenaz" : @"Gr'a",
                                 @"koshercocoa.name.transliterated.sepharad" : @"Gr'a",
                                 @"koshercocoa.name.english" : @"Gr'a",
                                 @"koshercocoa.explanation.english" : @"A shaah zmanis (temporal hour) according to the opinion of the Gra and the Baal Hatanya. This calculation divides the day based on the opinion of the GRA and the Baal Hatanya that the day runs from sunrise to  sunset. The calculations are based on a day from sea level sunrise to sea level sunset. The day is split into 12 equal parts with each one being a shaah zmanis. An explanation and detailed sources for not using elevation for anything besides sunrise and sunset can be found in Zmanim Kehilchasam (second edition published in 2007) by Rabbi Dovid Yehuda Bursztyn chapter 2 (pages 186-187)."
                                 },
                             @{
                                 
                                 @"koshercocoa.selector" : NSStringFromSelector(@selector(shaahZmanis16Point1Degrees)),
                                 @"koshercocoa.name.hebrew" : @"16.1 מעלות",
                                 @"koshercocoa.name.transliterated.ashkenaz" : @"16.1 Maalos)",
                                 @"koshercocoa.name.transliterated.sepharad" : @"16.1 Maalot)",
                                 @"koshercocoa.name.english" : @"Temporal Hour (16.1 Degrees)",
                                 @"koshercocoa.explanation.english" : @"A shaah zmanis (temporal hour) calculated using a 16.1 degree dip. This calculation divides the day based on the opinion that the day runs from dawn to dusk. Dawn for this calculation is  when the sun is 16.1 degrees below the eastern geometric horizon before sunrise. Dusk for this is when the sun is 16.1 degrees below the western geometric horizon after sunset. This day is split into 12 equal parts with each part being a shaah zmanis."
                                 }
                             ]
                     }
                 ];
        /*
         
         NSStringFromSelector(@selector(shaahZmanis16Point1Degrees)) : @{
         @"koshercocoa.name.hebrew" : @"(16.1 מעלות)",
         @"koshercocoa.name.transliterated.ashkenaz" : @"16.1 Maalos)",
         @"koshercocoa.name.transliterated.sepharad" : @"16.1 Maalot)",
         @"koshercocoa.name.english" : @"Temporal Hour (16.1 Degrees)",
         @"koshercocoa.explanation.english" : @"A shaah zmanis (temporal hour) calculated using a 16.1 degree dip. This calculation divides the day based on the opinion that the day runs from dawn to dusk. Dawn for this calculation is  when the sun is 16.1 degrees below the eastern geometric horizon before sunrise. Dusk for this is when the sun is 16.1 degrees below the western geometric horizon after sunset. This day is split into 12 equal parts with each part being a shaah zmanis."
         },
         NSStringFromSelector(@selector(shaahZmanis18Degrees)) : @{
         @"koshercocoa.name.hebrew" : @"(18 מעלות)",
         @"koshercocoa.name.transliterated.ashkenaz" : @"18 Ma'alos)",
         @"koshercocoa.name.transliterated.sepharad" : @"18 Ma'alot)",
         @"koshercocoa.name.english" : @"Temporal Hour (18 Degrees)",
         @"koshercocoa.explanation.english" : @"A shaah zmanis (temporal hour) calculated using an 18 degree dip. This calculation divides the day based on the opinion of the Mogen Avraham that the day runs from dawn to dusk. Dawn for this calculation is  when the sun is 18 degrees below the eastern geometric horizon before sunrise. Dusk for this is when the sun is 18 degrees below the western geometric horizon after sunset. This day is split into 12 equal parts with each part being a shaah zmanis."
         },
         NSStringFromSelector(@selector(shaahZmanis19Point8Degrees)) : @{
         @"koshercocoa.name.hebrew" : @"(19.8 מעלות)",
         @"koshercocoa.name.transliterated.ashkenaz" : @"19.8 Ma'alos)",
         @"koshercocoa.name.transliterated.sepharad" : @"19.8 Ma'alot)",
         @"koshercocoa.name.english" : @"Temporal Hour (19.8 Degrees)",
         @"koshercocoa.explanation.english" : @"A shaah zmanis (temporal hour) calculated using a 19.8 degree dip. This calculation divides the day based on the opinion of the Mogen Avraham that the day runs from dawn to dusk. Dawn for this calculation is  when the sun is 19.8 degrees below the eastern geometric horizon before sunrise. Dusk for this is when the sun is 19.8 degrees below the western geometric horizon after sunset. This day is split into 12 equal parts with each part being a shaah zmanis"
         },
         NSStringFromSelector(@selector(shaahZmanis26Degrees)) : @{
         @"koshercocoa.name.hebrew" : @"(26 מעלות)",
         @"koshercocoa.name.transliterated.ashkenaz" : @"26 Ma'alos)",
         @"koshercocoa.name.transliterated.sepharad" : @"26 Ma'alot)",
         @"koshercocoa.name.english" : @"Temporal Hour (26 Degrees)",
         @"koshercocoa.explanation.english" : @"Method to return a shaah zmanis (temporal hour) calculated using a 26 degree dip. This calculation divides the day based on the opinion of the Mogen Avraham that the day runs from dawn to dusk. Dawn for this calculation is  when the sun is 26 degrees below the eastern geometric horizon before sunrise. Dusk for this is when the sun is 26 degree below the western geometric horizon after sunset. This day is split into 12 equal parts with each part being a shaah zmanis."
         },
         NSStringFromSelector(@selector(shaahZmanis60Minutes)) : @{
         @"koshercocoa.name.hebrew" : @"(60 דקות)",
         @"koshercocoa.name.transliterated.ashkenaz" : @"60 Dakos)",
         @"koshercocoa.name.transliterated.sepharad" : @"60 Dakot)",
         @"koshercocoa.name.english" : @"Temporal Hour (60 Minutes)",
         @"koshercocoa.explanation.english" : @"Method to return a shaah zmanis (solar hour) according to the opinion of the Mogen Avraham. This calculation divides the day based on the opinion of the Mogen Avraham that the day runs from dawn to dusk. Dawn for this calculation is 60 minutes before sunrise and dusk is 60 minutes after sunset. This day is split into 12 equal parts with each part being a shaah zmanis."
         },
         NSStringFromSelector(@selector(shaahZmanis72Minutes)) : @{
         @"koshercocoa.name.hebrew" : @"(72 דקות)",
         @"koshercocoa.name.transliterated.ashkenaz" : @"72 Dakos)",
         @"koshercocoa.name.transliterated.sepharad" : @"72 Dakot)",
         @"koshercocoa.name.english" : @"Temporal Hour (72 Minutes)",
         @"koshercocoa.explanation.english" : @"Method to return a shaah zmanis (solar hour) according to the opinion of the Mogen Avraham. This calculation divides the day based on the opinion of the Mogen Avraham that the day runs from dawn to dusk. Dawn for this calculation is 72 minutes before sunrise and dusk is 72 minutes after sunset. This day is split into 12 equal parts with each part being a shaah zmanis."
         },
         NSStringFromSelector(@selector(shaahZmanis72MinutesZmanis)) : @{
         @"koshercocoa.name.hebrew" : @"(72 דקות זמנית)",
         @"koshercocoa.name.transliterated.ashkenaz" : @"72 Dakos Zmaniyos)",
         @"koshercocoa.name.transliterated.sepharad" : @"72 Dakot Zmaniyot)",
         @"koshercocoa.name.english" : @"Temporal Hour (72 Temporal Minutes)",
         @"koshercocoa.explanation.english" : @"Method to return a shaah zmanis (temporal hour) according to the opinion of the Mogen Avraham based on alos being 72 minutes zmaniyos before sunrise. This calculation divides the day based on the opinion of the Mogen Avraham that the day runs from dawn to dusk. Dawn for this calculation is 72 minutes zmaniyos before sunrise and dusk is 72 minutes zmaniyos after sunset. This day is split into 12 equal parts with each part being a shaah zmanis. This is identical to 1/10th of the day from sunrise to sunset."
         },
         NSStringFromSelector(@selector(shaahZmanis90Minutes)) : @{
         @"koshercocoa.name.hebrew" : @"(90 דקות)",
         @"koshercocoa.name.transliterated.ashkenaz" : @"90 Dakos)",
         @"koshercocoa.name.transliterated.sepharad" : @"90 Dakot)",
         @"koshercocoa.name.english" : @"Temporal Hour (90 Minutes)",
         @"koshercocoa.explanation.english" : @"Method to return a shaah zmanis (temporal hour) calculated using a dip of 90 minutes. This calculation divides the day based on the opinion of the Mogen Avraham that the day runs from dawn to dusk. Dawn for this calculation is 90 minutes before sunrise and dusk is 90 minutes after sunset. This day is split into 12 equal parts with each part being a shaah zmanis."
         },
         NSStringFromSelector(@selector(shaahZmanis90MinutesZmanis)) : @{
         @"koshercocoa.name.hebrew" : @"(90 דקות זמנית)",
         @"koshercocoa.name.transliterated.ashkenaz" : @"90 Dakos Zmaniyos)",
         @"koshercocoa.name.transliterated.sepharad" : @"90 Dakot Zmaniyot)",
         @"koshercocoa.name.english" : @"Temporal Hour (90 Temporal Minutes)",
         @"koshercocoa.explanation.english" : @"Method to return a shaah zmanis (temporal hour) according to the opinion of the Mogen Avraham based on alos being 90 minutes zmaniyos before sunrise. This calculation divides the day based on the opinion of the Mogen Avraham that the day runs from dawn to dusk. Dawn for this calculation is 90 minutes zmaniyos before sunrise and dusk is 90 minutes zmaniyos after sunset. This day is split into 12 equal parts with each part being a shaah zmanis. This is identical to 1/8th of the day from sunrise to sunset."
         },
         NSStringFromSelector(@selector(shaahZmanis96Minutes)) : @{
         @"koshercocoa.name.hebrew" : @"(96 דקות)",
         @"koshercocoa.name.transliterated.ashkenaz" : @"96 Dakos)",
         @"koshercocoa.name.transliterated.sepharad" : @"96 Dakot)",
         @"koshercocoa.name.english" : @"Temporal Hour (96 Minutes)",
         @"koshercocoa.explanation.english" : @"Method to return a shaah zmanis (temporal hour) calculated using a dip of 96 minutes. This calculation divides the day based on the opinion of the Mogen Avraham that the day runs from dawn to dusk. Dawn for this calculation is 96 minutes before sunrise and dusk is 96 minutes after sunset. This day is split into 12 equal parts with each part being a shaah zmanis."
         },
         NSStringFromSelector(@selector(shaahZmanis96MinutesZmanis)) : @{
         @"koshercocoa.name.hebrew" : @"(96 דקות זמנית)",
         @"koshercocoa.name.transliterated.ashkenaz" : @"96 Dakos Zmaniyos)",
         @"koshercocoa.name.transliterated.sepharad" : @"96 Dakot Zmaniyot)",
         @"koshercocoa.name.english" : @"Temporal Hour (96 Temporal Minutes)",
         @"koshercocoa.explanation.english" : @"Method to return a shaah zmanis (temporal hour) according to the opinion of the Mogen Avraham based on alos being 96 minutes zmaniyos before sunrise. This calculation divides the day based on the opinion of the Mogen Avraham that the day runs from dawn to dusk. Dawn for this calculation is 96 minutes zmaniyos before sunrise and dusk is 96 minutes zmaniyos after sunset. This day is split into 12 equal parts with each part being a shaah zmanis. This is identical to 1/7.5th of the day from sunrise to sunset."
         },
         NSStringFromSelector(@selector(shaahZmanisAteretTorah)) : @{
         @"koshercocoa.name.hebrew" : @"(עטרת תורה)",
         @"koshercocoa.name.transliterated.ashkenaz" : @"Ateret Torah)",
         @"koshercocoa.name.transliterated.sepharad" : @"Ateret Torah)",
         @"koshercocoa.name.english" : @"Temporal Hour (Ateret Torah)",
         @"koshercocoa.explanation.english" : @"Method to return a shaah zmanis (temporal hour) according to the opinion of the Chacham Yosef Harari-Raful of Yeshivat Ateret Torah calculated with alos being 1/10th of sunrise to sunset day, or 72 minutes zmaniyos of such a day before sunrise, and tzais is usually calculated as 40 minutes (configurable to any offset by modifying AteretTorahSunsetOffset) after sunset. This day is split into 12 equal parts with each part being a shaah zmanis. Note that with this system, chatzos (mid-day) will not be the point that the sun is halfway across the sky."
         },
         NSStringFromSelector(@selector(shaahZmanis120Minutes)) : @{
         @"koshercocoa.name.hebrew" : @"(120 דקות)",
         @"koshercocoa.name.transliterated.ashkenaz" : @"120 Dakos)",
         @"koshercocoa.name.transliterated.sepharad" : @"120 Dakot)",
         @"koshercocoa.name.english" : @"Temporal Hour (120 Minutes)",
         @"koshercocoa.explanation.english" : @"A shaah zmanis (temporal hour) calculated using a dip of 120 minutes. This calculation divides the day based on the opinion of the Mogen Avraham that the day runs from dawn to dusk. Dawn for this calculation is 120 minutes before sunrise and dusk is 120 minutes after sunset. This day is split into 12 equal parts with each part being a shaah zmanis."
         },
         NSStringFromSelector(@selector(shaahZmanis120MinutesZmanis))  : @{
         @"koshercocoa.name.hebrew" : @"(120 דקות זמנית)",
         @"koshercocoa.name.transliterated.ashkenaz" : @"120 Dakos Zmaniyos)",
         @"koshercocoa.name.transliterated.sepharad" : @"120 Dakot Zmaniyot)",
         @"koshercocoa.name.english" : @"Temporal Hour (120 Temporal Minutes)",
         @"koshercocoa.explanation.english" : @"The time of plag hamincha based on sunrise being 120 minutes zmaniyos (GRA and the Baal Hatanya) or 1/6th of the day before sea level sunrise. This is calculated as 10.75 hours after dawn. The formula used is: 10.75 * ShaahZmanis120MinutesZmanis after dawn."
         }
         ]
         },
         */
        /**
         *    Alos
         */
        
        /*
         NSStringFromSelector(@selector(alosHashachar))  : @{
         @"koshercocoa.name.hebrew" : @"עלות השחר",
         @"koshercocoa.name.transliterated.ashkenaz" : @"Alos HaShachar",
         @"koshercocoa.name.transliterated.sepharad" : @"Alot HaShachar",
         @"koshercocoa.name.english" : @"Dawn",
         @"koshercocoa.explanation" : @"Returns alos (dawn) based on the time when the sun is 16.1&deg; below the eastern geometric horizon before sunrise. "
         },
         
         NSStringFromSelector(@selector(alos72))  : @{
         @"koshercocoa.name.hebrew" : @"(עלות (72 דקות",
         @"koshercocoa.name.transliterated.ashkenaz" : @"Alos (72 Dakos)",
         @"koshercocoa.name.transliterated.sepharad" : @"Alot (72 Dakot)",
         @"koshercocoa.name.english" : @"Dawn (72 minutes)",
         @"koshercocoa.explanation" : @"Method to return alos (dawn) calculated using 72 minutes before sunrise at sea level (no adjustment for elevation) based on the time to walk the distance of 4 Mil at 18 minutes a Mil. This is based on the opinion of most Rishonim who stated that the time of the Neshef (time between dawn and sunrise) does not vary by the time of year or location but purely depends on the time it takes to walk the istance of 4 Mil."
         },
         NSStringFromSelector(@selector(alos60)) : @{
         @"koshercocoa.name.hebrew" : @"(עלות (60 דקות",
         @"koshercocoa.name.transliterated.ashkenaz" : @"Alos (60 Dakos)",
         @"koshercocoa.name.transliterated.sepharad" : @"Alot (60 Dakot)",
         @"koshercocoa.name.english" : @"Dawn (60 Minutes)",
         @"koshercocoa.explanation" : @"Method to return alos (dawn) calculated as 60 minutes before sea level sunrise.  This is the time to walk the distance of 4 Mil at 15 minutes a Mil (the opinion of  the Chavas Yair. See the Divray Malkiel). Time based offset calculations for alos  are based on the opinion of most Rishonim who stated that the time of the  Neshef (time between dawn and sunrise) does not vary by the time of year or location  but purely depends on the time it takes to walk the distance of 4 Mil."
         },
         NSStringFromSelector(@selector(alos72Zmanis))  : @{
         @"koshercocoa.name.hebrew" : @"עלות (72 דקות זמניות ",
         @"koshercocoa.name.transliterated.ashkenaz" : @"",
         @"koshercocoa.name.transliterated.sepharad" : @"",
         @"koshercocoa.name.english" : @"Dawn (72 Minutes)",
         @"koshercocoa.explanation" : @"Method to return alos (dawn) calculated using 72 minutes zmaniyos (GRA and the Baal Hatanya)  or 1/10th of the day before sea level sunrise. This is based on an 18 minute Mil so the time  for 4 Mil is 72 minutes which is 1/10th of a day (12 * 60 = 720) based on the day starting  at sea level sunrise and ending at sea level sunset. The actual calulation is  KCAstronomicalCalendar.SeaLevelSunrise()- (KCZmanimCalendar.ShaahZmanisGra() * 1.2). This calculation is used in the calendars published by Hisachdus Harabanim  D'Artzos Habris Ve'Canada."
         },
         NSStringFromSelector(@selector(alos90)) : @{
         @"koshercocoa.name.hebrew" : @"(עלות (90 דקות",
         @"koshercocoa.name.transliterated.ashkenaz" : @"Alos (90 Dakos)",
         @"koshercocoa.name.transliterated.sepharad" : @"Alot (90 Dakot)",
         @"koshercocoa.name.english" : @"Dawn (90 Minutes)",
         @"koshercocoa.explanation" : @"Method to return alos (dawn) calculated using 90 minutes before sea level sunrise based  on the time to walk the distance of 4 Mil at 22.5 minutes a Mil. Time based offset calculations  for alos are based on the opinion of most Rishonim who stated that the time of  the Neshef (time between dawn and sunrise) does not vary by the time of year or location  but purely depends on the time it takes to walk the distance of 4 Mil."
         },
         NSStringFromSelector(@selector(alos90Zmanis)) : @{
         @"koshercocoa.name.hebrew" : @"(עלות (90 דקות זמניות",
         @"koshercocoa.name.transliterated.ashkenaz" : @"Alos (90 Dakos Zmaniyos)",
         @"koshercocoa.name.transliterated.sepharad" : @"Alot (90 Dakot Zmaniyot)",
         @"koshercocoa.name.english" : @"Dawn (9 Temporal Minutes)",
         @"koshercocoa.explanation" : @"Method to return alos (dawn) calculated using 90 minutes zmaniyos (GRA and the Baal Hatanya)  or 1/8th of the day before sea level sunrise. This is based on a 22.5 minute Mil so  the time for 4 Mil is 90 minutes which is 1/8th of a day (12 * 60) / 8 = 90  based on the day starting at sunrise and ending at sunset. The actual calculation is  KCAstronomicalCalendar.Sunrise() - (KCZmanimCalendar.ShaahZmanisGra() * 1.5)."
         },
         NSStringFromSelector(@selector(alos96))  : @{
         @"koshercocoa.name.hebrew" : @"(עלות (96 דקות",
         @"koshercocoa.name.transliterated.ashkenaz" : @"Alos (96 Dakos)",
         @"koshercocoa.name.transliterated.sepharad" : @"Alot (96 Dakot)",
         @"koshercocoa.name.english" : @"Dawn (96 Minutes)",
         @"koshercocoa.explanation" : @"Method to return alos (dawn) calculated using 96 minutes before sea level sunrise based  on the time to walk the distance of 4 Mil at 24 minutes a Mil. Time based offset calculations  for alos are based on the opinion of most Rishonim who stated that the time of  the Neshef (time between dawn and sunrise) does not vary by the time of year or location but  purely depends on the time it takes to walk the distance of 4 Mil."
         },
         NSStringFromSelector(@selector(alos96Zmanis))  : @{
         @"koshercocoa.name.hebrew" : @"(עלות (96 דקות זמניות",
         @"koshercocoa.name.transliterated.ashkenaz" : @"Alos (96 Dakos Zmaniyos)",
         @"koshercocoa.name.transliterated.sepharad" : @"Alot (96 Dakot Zmaniyot)",
         @"koshercocoa.name.english" : @"Dawn (96 Temporal Minutes)",
         @"koshercocoa.explanation" : @"Method to return alos (dawn) calculated using 96 minutes zmaniyos (GRA and the Baal Hatanya)  or 1/8th of the day before sea level sunrise. This is based on a 24 minute Mil so the time  for 4 Mil is 96 minutes which is 1/7.5th of a day (12 * 60) / 7.5 = 96 based on the day  starting at sunrise and ending at sunset. The actual calculation is  KCAstronomicalCalendar.Sunrise() - (KCZmanimCalendar.ShaahZmanisGra() * 1.6). "
         },
         NSStringFromSelector(@selector(alos120))  : @{
         @"koshercocoa.name.hebrew" : @"(עלות (120 דקות",
         @"koshercocoa.name.transliterated.ashkenaz" : @"Alos (120 Dakos)",
         @"koshercocoa.name.transliterated.sepharad" : @"Alot (120 Dakot)",
         @"koshercocoa.name.english" : @"Dawn (120 Minutes)",
         @"koshercocoa.explanation" : @"Method to return alos (dawn) calculated using 120 minutes before sea level sunrise  (no adjustment for elevation is made) based on the time to walk the distance of 5 Mil (Ula)  at 24 minutes a Mil. Time based offset calculations for alos are based on the opinion of most Rishonim who stated that the time of the Neshef (time between dawn and sunrise) does not vary  by the time of year or location but purely depends on the time it takes to walk the  distance of 5 Mil(Ula)."
         },
         NSStringFromSelector(@selector(alos120Zmanis))  : @{
         @"koshercocoa.name.hebrew" : @"(עלות (120 דקות זמניות",
         @"koshercocoa.name.transliterated.ashkenaz" : @"Alos (120 Dakos Zmaniyos)",
         @"koshercocoa.name.transliterated.sepharad" : @"Alot (120 Dakot Zmaniyot)",
         @"koshercocoa.name.english" : @"Dawn (120 Temporal Minutes)",
         @"koshercocoa.explanation" : @"Method to return alos (dawn) calculated using 120 minutes zmaniyos (GRA and the Baal Hatanya)  or 1/6th of the day before sea level sunrise. This is based on a 24 minute Mil so the time  for 5 Mil is 120 minutes which is 1/6th of a day (12 * 60) / 6 = 120 based on the day starting  at sunrise and ending at sunset. The actual calculation is  KCAstronomicalCalendar.Sunrise() - (KCZmanimCalendar.ShaahZmanisGra() * 2)."
         },
         NSStringFromSelector(@selector(alos26Degrees)) : @{
         @"koshercocoa.name.hebrew" : @"(עלות (96 מעלות",
         @"koshercocoa.name.transliterated.ashkenaz" : @"Alos (26 Ma'alot)",
         @"koshercocoa.name.transliterated.sepharad" : @"Alot (26 Ma'alot)",
         @"koshercocoa.name.english" : @"Dawn (26 Degrees)",
         @"koshercocoa.explanation" : @"A method to return alos (dawn) calculated when the sun is 26° below the eastern geometric  horizon before sunrise. This calculation is based on the same calculation of 120 minutes  but uses a degree based calculation instead of 120 exact minutes. This calculation is based  on the position of the sun 120 minutes before sunrise in Jerusalem during the equinox which calculates to 26° below geometric zenith."
         },
         NSStringFromSelector(@selector(alos18Degrees)) : @{
         @"koshercocoa.name.hebrew" : @"(עלות (18 מעלות",
         @"koshercocoa.name.transliterated.ashkenaz" : @"Alos (18 Ma'alot)",
         @"koshercocoa.name.transliterated.sepharad" : @"Alot (18 Ma'alot)",
         @"koshercocoa.name.english" : @"Dawn (18 Degrees)",
         @"koshercocoa.explanation" : @"A method to return alos (dawn) calculated when the sun is 18° below the eastern geometric  horizon before sunrise."
         },
         NSStringFromSelector(@selector(alos19Point8Degrees)) : @{
         @"koshercocoa.name.hebrew" : @"(עלות (19.8 מעלות",
         @"koshercocoa.name.transliterated.ashkenaz" : @"Alos (19.8 Ma'alot)",
         @"koshercocoa.name.transliterated.sepharad" : @"Alot (19.8 Ma'alot)",
         @"koshercocoa.name.english" : @"Dawn (19.8 Degrees)",
         @"koshercocoa.explanation" : @"Method to return alos (dawn) calculated when the sun is 19.8° below the eastern geometric  horizon before sunrise. This calculation is based on the same calculation of 90 minutes but  uses a degree based calculation instead of 90 exact minutes. This calculation is based on  the position of the sun 90 minutes before sunrise in Jerusalem during the equinox which  calculates to 19.8° below geometric zenith"
         },
         NSStringFromSelector(@selector(alos16Point1Degrees))  : @{
         @"koshercocoa.name.hebrew" : @"(עלות (16.1 מעלות",
         @"koshercocoa.name.transliterated.ashkenaz" : @"Alos (16.1 Ma'alot)",
         @"koshercocoa.name.transliterated.sepharad" : @"Alot (16.1 Ma'alot)",
         @"koshercocoa.name.english" : @"Dawn (16.1 Degrees)",
         @"koshercocoa.explanation" : @"Method to return alos (dawn) calculated when the sun is 16.1° below the eastern geometric  horizon before sunrise. This calculation is based on the same calculation of 72 minutes but  uses a degree based calculation instead of 72 exact minutes. This calculation is based on  the position of the sun 72 minutes before sunrise in Jerusalem during the equinox which  calculates to 16.1° below geometric zenith."
         },
         
         */
        /**
         *    Misheyakir
         */
        /*
         NSStringFromSelector(@selector(misheyakir10Point2Degrees))  : @{
         @"koshercocoa.name.hebrew" : @"(משיכיר (10.2 מעלות",
         @"koshercocoa.name.transliterated.ashkenaz" : @"Misheyakir (10.2 Ma'alos)",
         @"koshercocoa.name.transliterated.sepharad" : @"Misheyakir (10.2 Ma'alot)",
         @"koshercocoa.name.english" : @"Misheyakir (10.2 Degrees)",
         @"koshercocoa.explanation" : @""
         },
         NSStringFromSelector(@selector(misheyakir11Degrees))  : @{
         @"koshercocoa.name.hebrew" : @"(משיכיר (11 מעלות",
         @"koshercocoa.name.transliterated.ashkenaz" : @"Misheyakir (11 Ma'alos)",
         @"koshercocoa.name.transliterated.sepharad" : @"Misheyakir (11 Ma'alot)",
         @"koshercocoa.name.english" : @"Misheyakir (11 Degrees)",
         @"koshercocoa.explanation" : @""
         },
         NSStringFromSelector(@selector(misheyakir11Point5Degrees))  : @{
         @"koshercocoa.name.hebrew" : @"(משיכיר (11.5 מעלות",
         @"koshercocoa.name.transliterated.ashkenaz" : @"Misheyakir (11.5 Ma'alos)",
         @"koshercocoa.name.transliterated.sepharad" : @"Misheyakir (11.5 Ma'alot)",
         @"koshercocoa.name.english" : @"Misheyakir (11.5 Degrees)",
         @"koshercocoa.explanation" : @""
         },
         NSStringFromSelector(@selector(misheyakirAteretTorahWithMinutes:))  : @{
         @"koshercocoa.name.hebrew" : @"משיכיר (עטרת תורה)",
         @"koshercocoa.name.transliterated.ashkenaz" : @"Misheyakir (Ateret Torah)",
         @"koshercocoa.name.transliterated.sepharad" : @"Misheyakir (Ateret Torah)",
         @"koshercocoa.name.english" : @"First Sunlight (Ateret Torah)",
         @"koshercocoa.explanation.english" : @"This method calculates the misheyakir as an offset the Alos 72 minutes, zmanis calculation."
         },
         */
        /**
         *   Sunrise
         */
        /*
         NSStringFromSelector(@selector(sunrise))  : @{
         @"koshercocoa.name.hebrew" : @"נץ החמה",
         @"koshercocoa.name.transliterated.ashkenaz" : @"Naitz HAchama",
         @"koshercocoa.name.transliterated.sepharad" : @"Netz Hachama",
         @"koshercocoa.name.english" : @"Sunrise",
         @"koshercocoa.explanation.english" : @"Sunrise at the current location. The zenith used for the calculation uses geometric zenith of 90 degrees plus elevation. This is adjusted to add approximately 50/60 of a degree to account for 34 archminutes of refraction and 16 archminutes for the sun's radius for a total of 90.83333 degrees."
         },
         */
        
        /**
         *    Sof Zman Shma
         */
        /*
         NSStringFromSelector(@selector(sofZmanShmaGra))  : @{
         @"koshercocoa.name.hebrew" : @"(סוף זמן קריאת שמע  (גר\"א ",
         @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Kriyas Sh'ma (Gr'a)",
         @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Kriyas Sh'ma (Gr'a",
         @"koshercocoa.name.english" : @"Latest time to recite Kriyas Sh'ma (Gr'a)",
         @"koshercocoa.explanation" : @"This method returns the latest zman krias shema (time to recite Shema in the morning). This time is 3 shaos zmaniyos (solar hours) after sea level sunrise based on the opinion of the GRA and the Baal Hatanya that the day is calculated from sunrise to sunset."
         },
         NSStringFromSelector(@selector(sofZmanShmaMogenAvraham)) : @{
         @"koshercocoa.name.hebrew" : @"(סוף זמן קריאת שמע  (מ\"א ",
         @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Kriyas Sh'ma (M'A)",
         @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Kriyas Sh'ma (M'A)",
         @"koshercocoa.name.english" : @"Latest time to recite Kriyas Sh'ma (M'A)",
         @"koshercocoa.explanation" : @"This method returns the latest zman krias shema (time to recite shema in the morning) in the opinion of the MGA based on alos being 72 minutes before sunrise. This time is 3 shaos zmaniyos (solar hours) after dawn based on the opinion of the MGA that the day is calculated from a dawn of 72 minutes before sunrise to nightfall of 72 minutes after sunset."
         },
         NSStringFromSelector(@selector(sofZmanShmaFixedLocal)) : @{
         @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"",
         @"koshercocoa.name.transliterated.sepharad" : @"",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation" : @" A method that returns the latest zman krias shema (time to recite Shema in the morning)  calculated as 3 hours before FixedLocalChatzos()."
         },
         
         NSStringFromSelector(@selector(sofZmanShmaMGA19Point8Degrees)) : @{
         @"koshercocoa.name.hebrew" : @"(סוף זמן קריאת שמע  (מ\"א 19.8 מעלות",
         @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Kriyas Sh'ma (M'A 19.8 Ma'alos)",
         @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Kriyas Sh'ma (M'A 19.8 Ma'alot)",
         @"koshercocoa.name.english" : @"Latest time to recite Kriyas Sh'ma (M'A 19.8 Degrees)",
         @"koshercocoa.explanation" : @" This method returns the latest zman krias shema (time to recite Shema in the morning) according  to the opinion of the MGA based on alos being 19.8° before sunrise. This time is 3 shaos  zmaniyos (solar hours) after dawn based on the opinion of the MGA that the day is calculated  from dawn to nightfall with both being 19.8° below sunrise or sunset.  This returns the time of 3 * ShaahZmanis19Point8Degrees() after dawn."
         },
         NSStringFromSelector(@selector(sofZmanShmaMGA16Point1Degrees)) : @{
         @"koshercocoa.name.hebrew" : @"(סוף זמן קריאת שמע  (מ\"א 16.1 מעלות",
         @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Kriyas Sh'ma (M'A 16.1 Ma'alos)",
         @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Kriyas Sh'ma (M'A 16.1 Ma'alot)",
         @"koshercocoa.name.english" : @"Latest time to recite Kriyas Sh'ma (M'A 16.1 Degrees)",
         @"koshercocoa.explanation" : @"This method returns the latest zman krias shema (time to recite Shema in the morning) according  to the opinion of the MGA based on alos being 16.1° before sunrise. This time is 3 shaos  zmaniyos (solar hours) after dawn based on the opinion of the MGA that the day is calculated  from dawn to nightfall with both being 16.1° below sunrise or sunset.  This returns the time of 3 * ShaahZmanis16Point1Degrees() after dawn."
         },
         NSStringFromSelector(@selector(sofZmanShmaMGA72Minutes)) : @{
         @"koshercocoa.name.hebrew" : @"(סוף זמן קריאת שמע  (מ\"א 72 דקות ",
         @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Kriyas Sh'ma (M'A 72 Dakos)",
         @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Kriyas Sh'ma (M'A 72 Dakot)",
         @"koshercocoa.name.english" : @"Latest time to recite Kriyas Sh'ma (M'A 72 Minutes)",
         @"koshercocoa.explanation" : @"This method returns the latest zman krias shema (time to recite Shema in the morning) according  to the opinion of the MGA based on alos being 72 minutes before sunrise.  This time is 3 shaos zmaniyos (solar hours) after dawn based on the opinion of the Magen Avraham that the day is calculated from a dawn of 72 minutes before sunrise to nightfall of 72 minutes  after sunset. This returns the time of 3 * ShaahZmanis72Minutes() after dawn. This class returns an identical time to KCZmanimCalendar.SofZmanShmaMGA() and is repeated here for clarity."
         },
         NSStringFromSelector(@selector(sofZmanShmaMGA72MinutesZmanis)) : @{
         @"koshercocoa.name.hebrew" : @"(סוף זמן קריאת שמע  (מ\"א 72 דקות ",
         @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Kriyas Sh'ma (M'A 72 Dakos Zmaniyos)",
         @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Kriyas Sh'ma (M'A 72 Dakot  Zmaniyot)",
         @"koshercocoa.name.english" : @"Latest time to recite Kriyas Sh'ma (M'A 72 Temporal Minutes)",
         @"koshercocoa.explanation" : @"This method returns the latest zman krias shema (time to recite Shema in the morning) according  to the opinion of the MGA based on alos being 72 minutes zmaniyos , or 1/10th of the day  before sunrise. This time is 3 shaos zmaniyos (solar hours) after dawn based on the opinion  of the Magen Avraham that the day is calculated from a dawn of 72 minutes zmaniyos,  or 1/10th of the day before sea level sunrise to nightfall of 72 minutes zmaniyos after sea  level sunset. This returns the time of 3 * getShaahZmanis72MinutesZmanis() after dawn. "
         },
         NSStringFromSelector(@selector(sofZmanShmaMGA90Minutes)) : @{
         @"koshercocoa.name.hebrew" : @"(סוף זמן קריאת שמע  (מ\"א 90 דקות ",
         @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Kriyas Sh'ma (M'A 90 Dakos)",
         @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Kriyas Sh'ma (M'A 90 Dakot)",
         @"koshercocoa.name.english" : @"Latest time to recite Kriyas Sh'ma (M'A 90 Minutes)",
         @"koshercocoa.explanation" : @"This method returns the latest zman krias shema (time to recite Shema in the morning)  according to the opinion of the Magen Avraham based on alos being 90 minutes before sunrise.  This time is 3 shaos zmaniyos (solar hours) after dawn based on the opinion of the Magen Avraham that the day is calculated from a dawn of 90 minutes before sunrise to nightfall of 90 minutes  after sunset. This returns the time of 3 * ShaahZmanis90Minutes() after dawn."
         },
         NSStringFromSelector(@selector(sofZmanShmaMGA90MinutesZmanis)) : @{
         @"koshercocoa.name.hebrew" : @"(סוף זמן קריאת שמע  (מ\"א 90 דקות ",
         @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Kriyas Sh'ma (M'A 90 Dakos Zmaniyos)",
         @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Kriyas Sh'ma (M'A 90 Dakot  Zmaniyot)",
         @"koshercocoa.name.english" : @"Latest time to recite Kriyas Sh'ma (M'A 90 Temporal Minutes)",
         @"koshercocoa.explanation" : @"This method returns the latest zman krias shema (time to recite Shema in the morning) according  to the opinion of the MGA based on alos being 90 minutes zmaniyos before sunrise.  This time is 3 shaos zmaniyos (solar hours) after dawn based on the opinion of the Magen Avraham that the day is calculated from a dawn of 90 minutes zmaniyos before sunrise to  nightfall of 90 minutes zmaniyos after sunset.  This returns the time of 3 * ShaahZmanis90MinutesZmanis() after dawn."
         },
         NSStringFromSelector(@selector(sofZmanShmaMGA96Minutes)) : @{
         @"koshercocoa.name.hebrew" : @"(סוף זמן קריאת שמע  (מ\"א 96 דקות ",
         @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Kriyas Sh'ma (M'A 96 Dakos)",
         @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Kriyas Sh'ma (M'A 96 Dakot)",
         @"koshercocoa.name.english" : @"Latest time to recite Kriyas Sh'ma (M'A 96 Minutes)",
         @"koshercocoa.explanation" : @"This method returns the latest zman krias shema (time to recite Shema in the morning) according to the opinion of the MGA based on alos being 96 minutes before sunrise.  This time is 3 shaos zmaniyos (solar hours) after dawn based on the opinion of the Magen Avraham that the day is calculated from a dawn of 96 minutes before sunrise to  nightfall of 96 minutes after sunset.  This returns the time of 3 * ShaahZmanis96Minutes() after dawn."
         },
         NSStringFromSelector(@selector(sofZmanShmaMGA96MinutesZmanis)) : @{
         @"koshercocoa.name.hebrew" : @"(סוף זמן קריאת שמע  (מ\"א 96 דקות ",
         @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Kriyas Sh'ma (M'A 96 Dakos Zmaniyos)",
         @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Kriyas Sh'ma (M'A 96 Dakot  Zmaniyot)",
         @"koshercocoa.name.english" : @"Latest time to recite Kriyas Sh'ma (M'A 96 Temporal Minutes)",
         @"koshercocoa.explanation" : @"This method returns the latest zman krias shema (time to recite Shema in the morning) according to the opinion of the MGA based on alos being 96 minutes zmaniyos before sunrise.  This time is 3 shaos zmaniyos (solar hours) after dawn based on the opinion of the Magen Avraham that the day is calculated from a dawn of 96 minutes zmaniyos before sunrise to  nightfall of 96 minutes zmaniyos after sunset.  This returns the time of 3 * ShaahZmanis96MinutesZmanis() after dawn."
         },
         NSStringFromSelector(@selector(sofZmanShma3HoursBeforeChatzos)) : @{
         @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"",
         @"koshercocoa.name.transliterated.sepharad" : @"",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation" : @"This method returns the latest zman krias shema (time to recite Shema in the morning) calculated as 3 hours (regular and not zmaniyos) before KCZmanimCalendar.Chatzos().  This is the opinion of the Shach in the Nekudas Hakesef (Yora Deah 184), Shevus Yaakov,  Chasam Sofer and others. This returns the time of 3 hours before KCZmanimCalendar.Chatzos()."
         },
         NSStringFromSelector(@selector(sofZmanShmaMGA120Minutes)) : @{
         @"koshercocoa.name.hebrew" : @"(סוף זמן קריאת שמע  (מ\"א 9120 דקות ",
         @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Kriyas Sh'ma (M'A 120 Dakos)",
         @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Kriyas Sh'ma (M'A 120 Dakot)",
         @"koshercocoa.name.english" : @"Latest time to recite Kriyas Sh'ma (M'A 120 Minutes)",
         @"koshercocoa.explanation" : @"This method returns the latest zman krias shema (time to recite Shema in the morning) according  to the opinion of the Magen Avraham based on alos being 120 minutes or 1/6th of the day before sunrise. This time is 3 shaos zmaniyos (solar hours) after dawn based on the opinion of  the Magen Avraham that the day is calculated from a dawn of 120 minutes before sunrise to  nightfall of 120 minutes after sunset.  This returns the time of 3 * ShaahZmanis120Minutes() after dawn."
         },
         NSStringFromSelector(@selector(sofZmanShmaAlos16Point1ToSunset)) : @{
         @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"",
         @"koshercocoa.name.transliterated.sepharad" : @"",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation" : @"This method returns the latest zman krias shema (time to recite Shema in the morning) based on the opinion that the day starts at alos 16.1° and ends at sea level sunset.  3 shaos zmaniyos are calculated based on this day and added to alosto reach this time.  This time is 3 shaos zmaniyos (solar hours) after dawn based on the opinion that the day  is calculated from a alos 16.1° to sea level sunset. Note: Based on this calculation chatzos will not be at midday."
         },
         NSStringFromSelector(@selector(sofZmanShmaAlos16Point1ToTzaisGeonim7Point083Degrees)) : @{
         @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"",
         @"koshercocoa.name.transliterated.sepharad" : @"",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation" : @"This method returns the latest zman krias shema (time to recite Shema in the morning) based  on the opinion that the day starts at alos 16.1° and ends at tzais 7.083°. 3 shaos zmaniyos  are calculated based on this day and added to alos to reach this time. This time is 3 shaos  zmaniyos (temporal hours) after alos 16.1° based on the opinion that the day is calculated  from a alos 16.1° to tzais 7.083°. Note: Based on this calculation chatzos will not be at midday."
         },
         */
        /**
         *    Sof Zman Tfila
         */
        /*
         NSStringFromSelector(@selector(sofZmanTfilaMogenAvraham))  : @{
         @"koshercocoa.name.hebrew" : @"(סוף זמן תפילה (מ\"א ",
         @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Tefila (M'A)",
         @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Tefila (M'A)",
         @"koshercocoa.name.english" : @"Latest time to recite the morning prayers (M'A )",
         @"koshercocoa.explanation" : @"This method returns the latest zman tfila (time to recite the morning prayers) in the opinion of the MGA based on alos being 72 minutes before sunrise. This time is 4 shaos zmaniyos (temporal hours) after dawn based on the opinion of the MGA that the day is calculated from a dawn} of 72 minutes before sunrise to nightfall} of 72 minutes after sunset."
         },
         NSStringFromSelector(@selector(sofZmanTfilaGra)) : @{
         @"koshercocoa.name.hebrew" : @"(סוף זמן תפילה (גר\"א ",
         @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Tefila (Gr'a)",
         @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Tefila (Gr'a",
         @"koshercocoa.name.english" : @"Latest time to recite the morning prayers (Gr'a)",
         @"koshercocoa.explanation" : @"This method returns the latest zman tefilah (time to recite the morning prayers). This time is 4 hours into the day based on the opinion of the GRA and the Baal Hatanya that the day is calculated from sunrise to sunset."
         },
         NSStringFromSelector(@selector(sofZmanTfilaFixedLocal)) : @{
         @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"",
         @"koshercocoa.name.transliterated.sepharad" : @"",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation" : @" This method returns the latest zman tfila (time to recite the morning prayers)  calculated as 2 hours before FixedLocalChatzos()."
         },
         NSStringFromSelector(@selector(sofZmanTfilaMGA19Point8Degrees)) : @{
         @"koshercocoa.name.hebrew" : @"(סוף זמן תפילה  (מ\"א 19.8 מעלות",
         @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Tefila (M'A 19.8 Ma'alos)",
         @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Tfila (M'A 19.8 Ma'alot)",
         @"koshercocoa.name.english" : @"Latest ime to recite the morning prayers (M'A 19.8 Degrees)",
         @"koshercocoa.explanation" : @"This method returns the latest zman tfila (time to recite the morning prayers) according to  the opinion of the Magen Avraham based on alos being 19.8° before sunrise.  This time is 4 shaos zmaniyos (solar hours) after dawn based on the opinion of the Magen Avraham that the day is calculated from dawn to nightfall with both being 19.8° below sunrise or sunset. This returns the time of 4 * ShaahZmanis19Point8Degrees() after dawn."
         },
         NSStringFromSelector(@selector(sofZmanTfilaMGA16Point1Degrees)) : @{
         @"koshercocoa.name.hebrew" : @"(סוף זמן תפילה  (מ\"א 16.1 מעלות",
         @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Tefila (M'A 16.1 Ma'alos)",
         @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Tfila (M'A 16.1 Ma'alot)",
         @"koshercocoa.name.english" : @"Latest time to recite the morning prayers (M'A 16.1 Degrees)",
         @"koshercocoa.explanation" : @"This method returns the latest zman tfila (time to recite the morning prayers) according to  the opinion of the Magen Avraham based on alos being 16.1° before sunrise. This time is 4 shaos zmaniyos (solar hours) after dawn based on the opinion of the Magen Avraham that the day is calculated from dawn to nightfall with both being 16.1° below sunrise or sunset. This returns the time of 4 * ShaahZmanis16Point1Degrees() after dawn."
         },
         NSStringFromSelector(@selector(sofZmanTfilaMGA72Minutes)) : @{
         @"koshercocoa.name.hebrew" : @"(סוף זמן תפילה  (מ\"א 72 דקות",
         @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Tefila (M'A 72 Dakos)",
         @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Tfila (M'A72 Dakot)",
         @"koshercocoa.name.english" : @"Latest time to recite the morning prayers M'A 72 Minutes)",
         @"koshercocoa.explanation" : @"This method returns the latest zman tfila (time to recite the morning prayers) according to  the opinion of the Magen Avraham based on alos being 72 minutes before sunrise.  This time is 4 shaos zmaniyos (solar hours) after dawn based on the opinion of the Magen Avraham that the day is calculated from a dawn of 72 minutes before sunrise to nightfall of 72 minutes  after sunset. This returns the time of 4 * ShaahZmanis72Minutes() after dawn. This class returns an identical time to KCZmanimCalendar.SofZmanTfilaMGA()  and is repeated here for clarity."
         },
         NSStringFromSelector(@selector(sofZmanTfilaMGA72MinutesZmanis)) : @{
         @"koshercocoa.name.hebrew" : @"(סוף זמן תפילה  (מ\"א 72 דקות זמניות",
         @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Tefila (M'A 72 Dakos Zmaniyos)",
         @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Tfila (M'A72 Dakot Zmaniyot)",
         @"koshercocoa.name.english" : @"Latest time to recite the morning prayers (M'A 72  Temporal Minutes)",
         @"koshercocoa.explanation" : @"This method returns the latest zman tfila (time to the morning prayers) according to the opinion  of the Magen Avraham based on alos being 72 minutes zmaniyos before sunrise.  This time is 4 shaos zmaniyos (solar hours) after dawn based on the opinion of the Magen Avraham that the day is calculated from a dawn of 72 minutes zmaniyos before sunrise to nightfall  of 72 minutes zmaniyos after sunset.  This returns the time of 4 * ShaahZmanis72MinutesZmanis() after dawn."
         },
         NSStringFromSelector(@selector(sofZmanTfilaMGA90Minutes)) : @{
         @"koshercocoa.name.hebrew" : @"(סוף זמן תפילה  (מ\"א 90 דקות",
         @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Tefila (M'A 90 Dakos)",
         @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Tfila (M'A90 Dakot)",
         @"koshercocoa.name.english" : @"Latest time to recite the morning prayers M'A 90 Minutes)",
         @"koshercocoa.explanation" : @"This method returns the latest zman tfila (time to recite the morning prayers) according to  the opinion of the Magen Avraham based on alos being 90 minutes before sunrise. This time is 4 shaos zmaniyos (solar hours) after dawn based on the opinion of the Magen Avraham that the day is calculated from a dawn of 90 minutes before sunrise to nightfall of 90 minutes  after sunset.  This returns the time of 4 * ShaahZmanis90Minutes() after dawn."
         },
         NSStringFromSelector(@selector(sofZmanTfilaMGA90MinutesZmanis)) : @{
         @"koshercocoa.name.hebrew" : @"(סוף זמן תפילה  (מ\"א 90 דקות זמניות",
         @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Tefila (M'A 90 Dakos Zmaniyos)",
         @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Tfila (M'A90 Dakot Zmaniyot)",
         @"koshercocoa.name.english" : @"Latest time to recite the morning prayers (M'A 90  Temporal Minutes)",
         @"koshercocoa.explanation" : @"This method returns the latest zman tfila (time to the morning prayers) according to the  opinion of the Magen Avraham based on alos being 90 minutes zmaniyos before sunrise.  This time is 4 shaos zmaniyos (solar hours) after dawn based on the opinion of the Magen Avraham that the day is calculated from a dawn of 90 minutes zmaniyos before sunrise to nightfall  of 90 minutes zmaniyos after sunset.  This returns the time of 4 * ShaahZmanis90MinutesZmanis() after dawn."
         },
         NSStringFromSelector(@selector(sofZmanTfilaMGA96Minutes)) : @{
         @"koshercocoa.name.hebrew" : @"(סוף זמן תפילה  (מ\"א 96 דקות",
         @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Tefila (M'A 96 Dakos)",
         @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Tfila (M'A96 Dakot)",
         @"koshercocoa.name.english" : @"Latest time to recite the morning prayers M'A 90 Minutes)",
         @"koshercocoa.explanation" : @"This method returns the latest zman tfila (time to recite the morning prayers) according to the opinion of the Magen Avraham based on alos being 96 minutes before sunrise.  This time is 4 shaos zmaniyos (solar hours) after dawn based on the opinion of the Magen Avraham that the day is calculated from a dawn of 96 minutes before sunrise to nightfall  of 96 minutes after sunset. This returns the time of 4 * ShaahZmanis96Minutes() after dawn."
         },
         NSStringFromSelector(@selector(sofZmanTfilaMGA96MinutesZmanis)) : @{
         @"koshercocoa.name.hebrew" : @"(סוף זמן תפילה  (מ\"א 96 דקות זמניות",
         @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Tefila (M'A 96 Dakos Zmaniyos)",
         @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Tfila (M'A96 Dakot Zmaniyot)",
         @"koshercocoa.name.english" : @"Latest time to recite the morning prayers (M'A 96  Temporal Minutes)",
         @"koshercocoa.explanation" : @"This method returns the latest zman tfila (time to the morning prayers) according to the  opinion of the Magen Avraham based on alos being 96 minutes zmaniyos before sunrise.  This time is 4 shaos zmaniyos (solar hours) after dawn based on the opinion of the Magen Avraham that the day is calculated from a dawn of 96 minutes zmaniyos before sunrise to nightfall  of 96 minutes zmaniyos after sunset.  This returns the time of 4 * ShaahZmanis96MinutesZmanis() after dawn."
         },
         NSStringFromSelector(@selector(sofZmanTfilaMGA120Minutes)) : @{
         @"koshercocoa.name.hebrew" : @"(סוף זמן תפילה  (מ\"א 120 דקות",
         @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Tefila (M'A 120 Dakos)",
         @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Tfila (M'A 120 Dakot)",
         @"koshercocoa.name.english" : @"Latest time to recite the morning prayers M'A 120 Minutes)",
         @"koshercocoa.explanation" : @"This method returns the latest zman tfila (time to recite the morning prayers) according to the opinion of the Magen Avraham based on alos being 120 minutes before sunrise .  This time is 4 shaos zmaniyos (solar hours) after dawn based on the opinion of the Magen Avraham that the day is calculated from a dawn of 120 minutes before sunrise to nightfall  of 120 minutes after sunset.  This returns the time of 4 * ShaahZmanis120Minutes() after dawn."
         },
         NSStringFromSelector(@selector(sofZmanTfila2HoursBeforeChatzos))  : @{
         @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"",
         @"koshercocoa.name.transliterated.sepharad" : @"",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation" : @"This method returns the latest zman tfila (time to recite the morning prayers) calculated as  2 hours before ZmanimCalendar.getChatzos(). This is based on the opinions that calculate  sof zman krias shema as SofZmanShma3HoursBeforeChatzos(). This returns the time of 2 hours before KCZmanimCalendar.Chatzos()."
         },
         
         NSStringFromSelector(@selector(fixedLocalChatzos))  : @{
         @"koshercocoa.name.hebrew" : @"(חצות (קבוע",
         @"koshercocoa.name.transliterated.ashkenaz" : @"Chatzos (Kavua)",
         @"koshercocoa.name.transliterated.sepharad" : @"Chatzot (Kavu'a)",
         @"koshercocoa.name.english" : @"Midday (Fixed Local)",
         @"koshercocoa.explanation.english" : @"This time is noon and midnight adjusted from standard time to account for the local latitude. The 360° of the globe divided by 24 calculates to 15° per hour with 4 minutes per degree, so at a longitude of 0 , 15, 30 etc... Chatzos in 12:00 noon. Lakewood, N.J., whose longitude is -74.2094, is 0.7906 away from the closest multiple of 15 at -75°. This is multiplied by 4 to yield 3 minutes and 10 seconds for a chatzos of 11:56:50.  This method is not tied to the theoretical 15° timezones, but will adjust to the actual timezone and Daylight saving time."
         },
         
         */
        /**
         *    Mincha Gedola
         */
        /*
         NSStringFromSelector(@selector(minchaGedola)) : @{
         @"koshercocoa.name.hebrew" : @"מנחה גדולה",
         @"koshercocoa.name.transliterated.ashkenaz" : @"Mincha Gedola",
         @"koshercocoa.name.transliterated.sepharad" : @"Mincha Gedola",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation.english" : @" This method returns the time of mincha ketana. This is the preferred earliest time to pray mincha in the opinion of the Rambam and others. This is calculated as 9.5 sea level solar hours after sea level sunrise. This calculation is calculated based on the opinion of the Vilna Ga'on and the Baal Hatanya that the day is calculated from sunrise to sunset."
         },
         NSStringFromSelector(@selector(minchaGedola30Minutes)) : @{
         @"koshercocoa.name.hebrew" : @"מנחה גדולה (130 דקות)",
         @"koshercocoa.name.transliterated.ashkenaz" : @"Mincha Gedola",
         @"koshercocoa.name.transliterated.sepharad" : @" Mincha Gedola",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation" : @"This method returns mincha gedola calculated as 30 minutes after chatzos and not 1/2 of  a shaah zmanis after chatzos as calculated by KCZmanimCalendar.MinchaGedola(). Some use this time to delay the start of mincha in the winter when 1/2 of a shaah zmanis is  less than 30 minutes. See MinchaGedolaGreaterThan30()for a convenience method that returns  the later of the 2 calculations. One should not use this time to start mincha before the standard mincha gedola. See Shulchan Aruch Orach Chayim סימן רל״ג סעיף א׳ and the Shaar Hatziyon סעיף קטן ח."
         },
         NSStringFromSelector(@selector(minchaGedola72Minutes)) : @{
         @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"",
         @"koshercocoa.name.transliterated.sepharad" : @"",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation" : @" This method returns the time of mincha gedola according to the Magen Avraham with the day  starting 72 minutes before sunrise and ending 72 minutes after sunset. This is the earliest  time to pray mincha. For more information on this see the documentation on mincha gedola.x This is calculated as 6.5 solar hours after alos.  The calculation used is 6.5 * ShaahZmanis72Minutes() after alos."
         },
         NSStringFromSelector(@selector(minchaGedola16Point1Degrees)) : @{
         @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"",
         @"koshercocoa.name.transliterated.sepharad" : @"Mincha Gedola (16.1 Ma'alot)",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation" : @" This method returns the time of mincha gedola according to the Magen Avraham with the day  starting and ending 16.1° below the horizon. This is the earliest time to pray mincha.  For more information on this see the documentation on mincha gedola.  This is calculated as 6.5 solar hours after alos.  The calculation used is 6.5 * ShaahZmanis16Point1Degrees() after alos."
         },
         NSStringFromSelector(@selector(minchaGedola30Minutes)) : @{
         @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"",
         @"koshercocoa.name.transliterated.sepharad" : @"",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation.english" : @"<#explanation#>"
         },
         NSStringFromSelector(@selector(minchaGedolaGreaterThan30)) : @{
         @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"",
         @"koshercocoa.name.transliterated.sepharad" : @"",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation" : @" This is a conveniance methd that returns the later of KCZmanimCalendar.MinchaGedola() and KCMinchaGedola30Minutes(). In the winter when a shaah zmanis is less than 30 minutes MinchaGedola30Minutes() will be returned, otherwise KCZmanimCalendar.MinchaGedola() will be returned."
         },
         NSStringFromSelector(@selector(minchaGedola16Point1Degrees)) : @{
         @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"",
         @"koshercocoa.name.transliterated.sepharad" : @"",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation.english" : @"<#explanation#>"
         },
         NSStringFromSelector(@selector(minchaGedolaAteretTorah))  : @{
         @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"",
         @"koshercocoa.name.transliterated.sepharad" : @"",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation.english" : @"<#explanation#>"
         },
         */
        /**
         *    Mincha Ketana
         */
        /*
         NSStringFromSelector(@selector(minchaKetana))  : @{
         @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"",
         @"koshercocoa.name.transliterated.sepharad" : @"",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation.english" : @"<#explanation#>"
         },
         NSStringFromSelector(@selector(minchaKetana16Point1Degrees)) : @{
         @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"",
         @"koshercocoa.name.transliterated.sepharad" : @"Mincha Ketana (16.1 Ma'alot)",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation" : @" This method returns the time of mincha ketana according to the Magen Avraham with the day  starting and ending 16.1° below the horizon. This is the perfered earliest time to pray mincha according to the opinion of the Rambam and others. For more information on this see the documentation on mincha gedola. This is calculated as 9.5 solar hours after alos.  The calculation used is 9.5 * ShaahZmanis16Point1Degrees() after alos."
         },
         NSStringFromSelector(@selector(minchaKetana72Minutes)) : @{
         @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"",
         @"koshercocoa.name.transliterated.sepharad" : @"",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation" : @" This method returns the time of mincha ketana according to the Magen Avraham with the day  starting 72 minutes before sunrise and ending 72 minutes after sunset. This is the perfered  earliest time to pray mincha according to the opinion of the Rambam and others.  For more information on this see the documentation on mincha gedola.  This is calculated as 9.5 ShaahZmanis72Minutes() after alos.  The calculation used is 9.5 * getShaahZmanis72Minutes() after alos."
         },
         NSStringFromSelector(@selector(minchaKetanaAteretTorah))  : @{
         @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"",
         @"koshercocoa.name.transliterated.sepharad" : @"",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation.english" : @"<#explanation#>"
         },
         */
        /**
         *    Plag Hamincha
         */
        /*
         NSStringFromSelector(@selector(plagHamincha)) : @{
         @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"",
         @"koshercocoa.name.transliterated.sepharad" : @"Plag Hamincha",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation.english" : @"This is calculated as 10.75 hours after sunrise. This calculation is based on the opinion of the GRA and the Baal Hatanya that the day is calculated from sunrise to sunset."
         },
         NSStringFromSelector(@selector(plagHamincha60Minutes)) : @{
         @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"",
         @"koshercocoa.name.transliterated.sepharad" : @"",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation" : @" This method returns the time of plag hamincha according to the Magen Avraham with the day  starting 60 minutes before sunrise and ending 60 minutes after sunset. This is calculated  as 10.75 hours after dawn.  The formula used is: 10.75 ShaahZmanis60Minutes() after Alos60()."
         },
         NSStringFromSelector(@selector(plagHamincha72Minutes))  : @{
         @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"",
         @"koshercocoa.name.transliterated.sepharad" : @"",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation" : @" This method returns the time of plag hamincha according to the Magen Avraham with the day  starting 72 minutes before sunrise and ending 72 minutes after sunset. This is calculated  as 10.75 hours after dawn.  The formula used is: 10.75 ShaahZmanis72Minutes() after KCZmanimCalendar.Alos72()."
         },
         NSStringFromSelector(@selector(plagHamincha72MinutesZmanis)) : @{
         @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"",
         @"koshercocoa.name.transliterated.sepharad" : @"",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation" : @"This method returns the time of plag hamincha. This is calculated as 10.75 hours after dawn.  The formula used is: 10.75 * ShaahZmanis72MinutesZmanis() after dawn."
         },
         NSStringFromSelector(@selector(plagHamincha90Minutes)) : @{
         @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"",
         @"koshercocoa.name.transliterated.sepharad" : @"",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation" : @"This method returns the time of plag hamincha according to the Magen Avraham with the day  starting 90 minutes before sunrise and ending 90 minutes after sunset. This is calculated  as 10.75 hours after dawn.  The formula used is: 10.75 ShaahZmanis90Minutes() after Alos90()."
         },
         NSStringFromSelector(@selector(plagHamincha90MinutesZmanis)) : @{
         @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"",
         @"koshercocoa.name.transliterated.sepharad" : @"",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation" : @" This method returns the time of plag hamincha. This is calculated as 10.75 hours after dawn.  The formula used is: 10.75 * ShaahZmanis90MinutesZmanis() after dawn."
         },
         NSStringFromSelector(@selector(plagHamincha96Minutes)) : @{
         @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"",
         @"koshercocoa.name.transliterated.sepharad" : @"",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation" : @" This method returns the time of plag hamincha according to the Magen Avraham with the day  starting 96 minutes before sunrise and ending 96 minutes after sunset. This is calculated  as 10.75 hours after dawn.  The formula used is: 10.75 ShaahZmanis96Minutes() after Alos96()."
         },
         NSStringFromSelector(@selector(plagHamincha96MinutesZmanis)) : @{
         @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"",
         @"koshercocoa.name.transliterated.sepharad" : @"",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation" : @" This method returns the time of plag hamincha. This is calculated as 10.75 hours after dawn.  The formula used is: 10.75 * ShaahZmanis96MinutesZmanis() after dawn."
         },
         NSStringFromSelector(@selector(plagHamincha16Point1Degrees)) : @{
         @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"",
         @"koshercocoa.name.transliterated.sepharad" : @"",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation" : @" This method returns the time of plag hamincha based on the opinion that the day starts at  alos 16.1° and ends at tzais 16.1°. This is calculated as 10.75 hours zmaniyos after dawn.  The formula is 10.75 * ShaahZmanis16Point1Degrees() after Alos16Point1Degrees()."
         },
         NSStringFromSelector(@selector(plagHamincha18Degrees)) : @{
         @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"",
         @"koshercocoa.name.transliterated.sepharad" : @"",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation.english" : @"<#explanation#>"
         },
         NSStringFromSelector(@selector(plagHamincha19Point8Degrees)) : @{
         @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"",
         @"koshercocoa.name.transliterated.sepharad" : @"",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation" : @" This method returns the time of plag hamincha based on the opinion that the day starts at  alos 19.8° and ends at tzais 19.8°. This is calculated as 10.75 hours zmaniyos after dawn.  The formula is 10.75 * ShaahZmanis19Point8Degrees() after Alos19Point8Degrees()."
         },
         NSStringFromSelector(@selector(plagHamincha26Degrees)) : @{
         @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"",
         @"koshercocoa.name.transliterated.sepharad" : @"",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation" : @" This method returns the time of plag hamincha based on the opinion that the day starts at  alos 26° and ends at tzais 26° . This is calculated as 10.75 hours zmaniyos after dawn.  The formula is 10.75 * ShaahZmanis26Degrees() after Alos26Degrees()."
         },
         NSStringFromSelector(@selector(plagAlosToSunset)) : @{
         @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"",
         @"koshercocoa.name.transliterated.sepharad" : @"",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation" : @" This method returns the time of plag hamincha based on the opinion that the day starts at  alos 16.1° and ends at sunset. 10.75 shaos zmaniyos are calculated based on this day and  added to alos to reach this time. This time is 10.75 shaos zmaniyos (temporal hours) after  dawn based on the opinion that the day is calculated from a dawn of 16.1 degrees before  sunrise to sea level sunset.  This returns the time of 10.75 * the calculated shaah zmanis after dawn."
         },
         NSStringFromSelector(@selector(plagAlos16Point1ToTzaisGeonim7Point083Degrees)) : @{
         @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"",
         @"koshercocoa.name.transliterated.sepharad" : @"",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation" : @" This method returns the time of plag hamincha based on the opinion that the day starts at  alos 16.1° and ends at tzais. 10.75 shaos zmaniyos are calculated based on this day and  added to alos to reach this time. This time is 10.75 shaos zmaniyos (temporal hours) after  dawn based on the opinion that the day is calculated from a dawn of 16.1 degrees before  sunrise to tzais . This returns the time of 10.75 * the calculated shaah zmanis after dawn."
         },
         */
        /**
         *  Bain Hashmashos
         */
        /*
         NSStringFromSelector(@selector(bainHashmashosRT13Degrees)) : @{
         ` @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"",
         @"koshercocoa.name.transliterated.sepharad" : @"",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation" : @" Method to return Bain Hashmasho of Rabainu Tam calculated when the sun is 13.24° below  the western geometric horizon (90°) after sunset. This calculation is based on the same  calculation of Bain Hasmashos Rabainu Tam 58.5 minutes but uses a degree based calculation  instead of 58.5 exact minutes. This calculation is based on the position of the sun  58.5 minutes after sunset in Jerusalem during the equinox which calculates to 13.24° below  geometric zenith."
         },
         NSStringFromSelector(@selector(bainHashmashosRT58Point5Minutes)) : @{
         @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"",
         @"koshercocoa.name.transliterated.sepharad" : @"",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation.english" : @"<#explanation#>"
         },
         NSStringFromSelector(@selector(bainHashmashosRT13Point5MinutesBefore7Point083Degrees)) : @{
         @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"",
         @"koshercocoa.name.transliterated.sepharad" : @"",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation.english" : @"<#explanation#>"
         },
         NSStringFromSelector(@selector(bainHashmashosRT2Stars)) : @{
         @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"",
         @"koshercocoa.name.transliterated.sepharad" : @"",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation.english" : @"<#explanation#>"
         },
         */
        /**
         *    Tzais
         */
        /*
         NSStringFromSelector(@selector(tzais))  : @{
         @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"Tzais Hakochavim (8.5 Maalos)",
         @"koshercocoa.name.transliterated.sepharad" : @"Tzait Hakochavim (8.5 Ma'alot)",
         @"koshercocoa.name.english" : @"First Starlight",
         @"koshercocoa.explanation.english" : @"This calculation is based on the position of the sun 36 minutes after sunset in Jerusalem on March 16, about 4 days before the equinox, the day that a solar hour is 60 minutes, which is 8.5degrees below geometric zenith. The Ohr Meir considers this the time that 3 small stars are visible, which is later than the required 3 medium stars."
         },
         NSStringFromSelector(@selector(tzaisGeonim5Point95Degrees)) : @{
         @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"",
         @"koshercocoa.name.transliterated.sepharad" : @"",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation" : @" This method returns the tzais (nightfall) based on the opinion of the Geonim calculated at  the sun's position at 5.95° below the western horizon."
         },
         NSStringFromSelector(@selector(tzaisGeonim5Point88Degrees)) : @{
         @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"",
         @"koshercocoa.name.transliterated.sepharad" : @"",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation" : @" This method returns the tzais (nightfall) based on the opinion of the Geonim calculated  as 3/4 of a 24 minute Mil, (Baal Hatanya) based on a Mil being 24 minutes, and is calculated as 18 + 2 + 4 for a total of 24 minutes  (FIXME: additional documentation details needed).  It is the sun's position at 5.88° below the western horizon.  This is a very early zman and should not be relied on without Rabbinical guidance."
         },
         NSStringFromSelector(@selector(tzaisGeonim3Point65Degrees)) : @{
         @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"",
         @"koshercocoa.name.transliterated.sepharad" : @"",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation" : @" This method returns the tzais (nightfall) based on the opinion of the Geonim calculated as  3/4 of a Mil based on an 18 minute Mil, or 13.5 minutes.  It is the sun's position at 3.65° below the western horizon.  This is a very early zman and should not be relied on without Rabbinical guidance."
         },
         NSStringFromSelector(@selector(tzaisGeonim4Point37Degrees)) : @{
         @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"",
         @"koshercocoa.name.transliterated.sepharad" : @"",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation" : @" This method returns the tzais (nightfall) based on the opinion of the Geonim calculated  as 3/4 of a Mil, based on a 22.5 minute Mil, or 16 7/8 minutes. It is the sun's position  at 4.37° below the western horizon.  This is a very early zman and should not be relied on without Rabbinical guidance."
         },
         NSStringFromSelector(@selector(tzaisGeonim4Point61Degrees)) : @{
         @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"",
         @"koshercocoa.name.transliterated.sepharad" : @"",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation" : @" This method returns the tzais (nightfall) based on the opinion of the Geonim calculated  as 3/4 of a Mil based on an 24 minute Mil, or 18 minutes. It is the sun's position at 4.61° below the western horizon. This is a very early zman and should not be relied on without Rabbinical guidance."
         },
         NSStringFromSelector(@selector(tzaisGeonim4Point8Degrees)) : @{
         @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"",
         @"koshercocoa.name.transliterated.sepharad" : @"",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation" : @" This method returns the tzais (nightfall) based on the opinion of the Geonim calculated  as 3/4 of a Mil based on the sun's position at 4.8° below the western horizon.  This is based on Rabbi Leo Levi's calculations. FIXME: additional documentation needed.  This is the This is a very early zman and should not be relied on without Rabbinical guidance."
         },
         NSStringFromSelector(@selector(tzaisGeonim7Point083Degrees)) : @{
         @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"",
         @"koshercocoa.name.transliterated.sepharad" : @"",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation" : @" This method returns the tzais (nightfall) based on the opinion of the Geonim calculated  as 30 minutes after sunset during the equinox in Yerushalayim. The sun's position at this  time computes to 7.083° (or 7° 5? below the western horizon. Note that this is a common  and rounded number. Computation shows the accurate number is 7.2°"
         },
         NSStringFromSelector(@selector(tzaisGeonim8Point5Degrees)) : @{
         @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"",
         @"koshercocoa.name.transliterated.sepharad" : @"",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation" : @" This method returns the tzais (nightfall) based on the opinion of the Geonim calculated  at the sun's position at 8.5° below the western horizon."
         },
         NSStringFromSelector(@selector(tzais50)) : @{
         @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"",
         @"koshercocoa.name.transliterated.sepharad" : @"",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation" : @" This method returns the tzais (nightfall) based on R' Moshe Feinstein's opinion that the time to walk the distance of a Mil is 12.5 minutes for a total of 50 minutes for 4 Mil after sea level sunset."
         },
         NSStringFromSelector(@selector(tzais60)) : @{
         @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"",
         @"koshercocoa.name.transliterated.sepharad" : @"",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation" : @" This method returns the tzais (nightfall) based on the opinion of the Chavas Yair and  Divray Malkiel that the time to walk the distance of a Mil is 15 minutes for a total  of 60 minutes for 4 Mil after sea level sunset."
         },
         NSStringFromSelector(@selector(tzaisAteretTorah)) : @{
         @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"",
         @"koshercocoa.name.transliterated.sepharad" : @"",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation" : @" This method returns tzais usually calculated as 40 minutes (configurable to any offset by modifying AteretTorahSunsetOffset) after sunset. Please note that Chacham Yosef Harari-Raful of Yeshivat Ateret Torah who uses this time,  does so only for calculating various other zmanai hayom such as Sof Zman Krias Shema  and Plag Hamincha. His calendars do not publish a zman for Tzais.  It should also be noted that Chacham Harari-Raful provided a 25 minute zman for Israel.  This API uses 40 minutes year round in any place on the globe by default.  This offset can be changed by modifying AteretTorahSunsetOffset."
         },
         NSStringFromSelector(@selector(tzais72)) : @{
         @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"Tzais Hakochavim (72 Dakos)",
         @"koshercocoa.name.transliterated.sepharad" : @"Tzait Hakochavim (72 Dakot)",
         @"koshercocoa.name.english" : @"First Starlight (72 Minutes)",
         @"koshercocoa.explanation.english" : @"Calculated as 72 minutes after sunset, not taking elevation into account."
         },
         NSStringFromSelector(@selector(tzais72Zmanis)) : @{
         @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"",
         @"koshercocoa.name.transliterated.sepharad" : @"",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation" : @" Method to return tzais (dusk) calculated as 72 minutes zmaniyos,  or 1/10th of the day after sea level sunset."
         },
         NSStringFromSelector(@selector(tzais90)) : @{
         @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"",
         @"koshercocoa.name.transliterated.sepharad" : @"",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation" : @" Method to return tzais (dusk) calculated as 90 minutes after sea level sunset.  This method returns tzais (nightfall) based on the opinion of the Magen Avraham that the time  to walk the distance of a Mil according to the Rambam's opinion is 18 minutes  for a total of 90 minutes based on the opinion of Ula who calculated tzais as 5 Mil after sea  level shkiah (sunset).  A similar calculation Tzais19Point8Degrees()uses solar position calculations based on this time."
         },
         NSStringFromSelector(@selector(tzais90Zmanis)) : @{
         @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"",
         @"koshercocoa.name.transliterated.sepharad" : @"",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation" : @" Method to return tzais (dusk) calculated using 90 minutes zmaniyos (GRA and the Baal Hatanya)  after sea level sunset."
         },
         NSStringFromSelector(@selector(tzais96)) : @{
         @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"",
         @"koshercocoa.name.transliterated.sepharad" : @"",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation" : @" A method to return tzais (dusk) calculated as 96 minutes after sea level sunset.  For information on how this is calculated see the comments on Alos96()."
         },
         NSStringFromSelector(@selector(tzais96Zmanis)) : @{
         @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"",
         @"koshercocoa.name.transliterated.sepharad" : @"",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation" : @" Method to return tzais (dusk) calculated using 96 minutes zmaniyos  (GRA and the Baal Hatanya) after sea level sunset."
         },
         NSStringFromSelector(@selector(tzais120)) : @{
         @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"",
         @"koshercocoa.name.transliterated.sepharad" : @"",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation" : @" This method returns tzais (nightfall) based on the opinion of the Magen Avraham that the time  to walk the distance of a Mil according to the Rambam's opinion is 2/5 of an hour (24 minutes)  for a total of 120 minutes based on the opinion of Ula who calculated tzais as 5 Mil after  sea level shkiah (sunset).  A similar calculation Tzais26Degrees() uses temporal calculations based on this time."
         },
         NSStringFromSelector(@selector(tzais120Zmanis)) : @{
         @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"",
         @"koshercocoa.name.transliterated.sepharad" : @"",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation" : @" Method to return tzais (dusk) calculated using 120 minutes zmaniyos  (GRA and the Baal Hatanya) after sea level sunset."
         },
         NSStringFromSelector(@selector(tzais16Point1Degrees)) : @{
         @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"",
         @"koshercocoa.name.transliterated.sepharad" : @"",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation" : @" For information on how this is calculated see the comments on Alos16Point1Degrees()"
         },
         NSStringFromSelector(@selector(tzais26Degrees)) : @{
         @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"",
         @"koshercocoa.name.transliterated.sepharad" : @"",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation" : @"  For information on how this is calculated see the comments on Alos26Degrees()"
         },
         NSStringFromSelector(@selector(tzais18Degrees)) : @{
         @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"",
         @"koshercocoa.name.transliterated.sepharad" : @"",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation" : @" For information on how this is calculated see the comments on Alos18Degrees()"
         },
         NSStringFromSelector(@selector(tzais19Point8Degrees)) : @{
         @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"",
         @"koshercocoa.name.transliterated.sepharad" : @"",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation" : @" For information on how this is calculated see the comments on Alos19Point8Degrees()"
         },
         */
        
        /**
         *    Achilas Chametz
         */
        /*
         NSStringFromSelector(@selector(sofZmanAchilasChametzGra)) : @{
         @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"",
         @"koshercocoa.name.transliterated.sepharad" : @"",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation" : @" This method returns the latest time one is allowed eating chametz on Erev Pesach according  to the opinion of the GRA and the Baal Hatanya. This time is identical to the Sof zman tefilah GRA. This time is 4 hours into the day based on the opinion of the GRA and the Baal Hatanya  that the day is calculated from sunrise to sunset.  This returns the time 4 * KCZmanimCalendar.ShaahZmanisGra() after sea level sunrise."
         },
         NSStringFromSelector(@selector(sofZmanAchilasChametzMGA72Minutes)) : @{
         @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"",
         @"koshercocoa.name.transliterated.sepharad" : @"",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation" : @" This method returns the latest time one is allowed eating chametz on Erev Pesach according to  the opinion of the MGA based on alos being 72 minutes before sunrise. This time is identical to  the Sof zman tefilah MGA 72 minutes. This time is 4 shaos zmaniyos (temporal hours) after dawn  based on the opinion of the MGA that the day is calculated from a dawn of 72 minutes before  sunrise to nightfall of 72 minutes after sunset.  This returns the time of 4 * KCZmanimCalendar.ShaahZmanisMGA() after dawn."
         },
         NSStringFromSelector(@selector(sofZmanAchilasChametzMGA16Point1Degrees)) : @{
         @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"",
         @"koshercocoa.name.transliterated.sepharad" : @"",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation" : @" This method returns the latest time one is allowed eating chametz on Erev Pesach according to  the opinion of the MGA based on alos being 16.1° before sunrise. This time is 4 shaos zmaniyos  (solar hours) after dawn based on the opinion of the MGA that the day is calculated from dawn  to nightfall with both being 16.1° below sunrise or sunset.  This returns the time of 4 ShaahZmanis16Point1Degrees() after dawn."
         },
         */
        /**
         *    Biur Chametz
         */
        /*
         NSStringFromSelector(@selector(sofZmanBiurChametzGra)) : @{
         @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"",
         @"koshercocoa.name.transliterated.sepharad" : @"",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation" : @" This method returns the latest time for burning chametz on Erev Pesach according to the opinion  of the GRA and the Baal Hatanya. This time is 5 hours into the day based on the opinion  of the GRA and the Baal Hatanya that the day is calculated from sunrise to sunset.  This returns the time 5 * KCZmanimCalendar.ShaahZmanisGra() after sea level sunrise."
         },
         NSStringFromSelector(@selector(sofZmanBiurChametzMGA72Minutes)) : @{
         @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"",
         @"koshercocoa.name.transliterated.sepharad" : @"",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation" : @" This method returns the latest time for burning chametz on Erev Pesach according to the opinion  of the Magen Avraham based on alos being 72 minutes before sunrise.  This time is 5 shaos zmaniyos (temporal hours) after dawn based on the opinion of the Magen Avraham that the day is calculated from a dawn of 72 minutes before sunrise to nightfall of 72 minutes  after sunset. This returns the time of 5 * KCZmanimCalendar.ShaahZmanisMGA() after dawn."
         },
         NSStringFromSelector(@selector(sofZmanBiurChametzMGA16Point1Degrees)) : @{
         @"koshercocoa.name.hebrew" : @"",
         @"koshercocoa.name.transliterated.ashkenaz" : @"",
         @"koshercocoa.name.transliterated.sepharad" : @"",
         @"koshercocoa.name.english" : @"",
         @"koshercocoa.explanation" : @" This method returns the latest time for burning chametz on Erev Pesach according to the opinion  of the MGA based on alos being 16.1° before sunrise. This time is 5 shaos zmaniyos (solar hours)  after dawn based on the opinion of the MGA that the day is calculated from dawn to nightfall  with both being 16.1° below sunrise or sunset.  This returns the time of 5 ShaahZmanis16Point1Degrees() after dawn."
         }
         };
         
         */
    };
    
    
    //  TODO: Optimize this
    for (NSArray <NSDictionary *>* group in data)
    {
        for (NSDictionary * method in group)
        {
            
            NSString *selectorMatchingUs = NSStringFromSelector(self.selector);
            
            NSString *selectorForMethod = method[@"koshercocoa.selector"];
            
            if ([selectorMatchingUs isEqualToString:selectorForMethod])
            {
                metadata = method;
                break;
            }
            
        }
    }
    
    return metadata;
}

/**
 *  Comparisons
 */

- (BOOL)isEqual:(id)object
{
    BOOL isOtherAlsoZman = [object isKindOfClass:[KCZman class]];
    BOOL equal = [super isEqual:object] && isOtherAlsoZman && [self isEqualToZman:(KCZman *)object];
    
    return equal;
}

- (BOOL)isEqualToZman:(KCZman *)anotherZman
{
    NSString *mySelector = NSStringFromSelector(self.selector);
    NSString *otherZmanSelector = NSStringFromSelector(anotherZman.selector);
    
    return [mySelector isEqualToString:otherZmanSelector];
}

@end
