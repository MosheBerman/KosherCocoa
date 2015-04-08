/**
 *  KCZman.m
 *  KosherCocoa 2
 *
 *  Created by Moshe Berman on 4/8/15.
 *
 *  Use of KosherCocoa 2 is governed by the LGPL 2.1 License.
 */

#import "KCZman.h"

@interface KCZman ()

/**
 *  The selector used to calculate the zman.
 */

@property SEL selector;

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
    return [self _metadataForCurrentZman][@"koshercocoa.explanation"];
}

#pragma mark - Related Zmanim

/** ---
 *  @name Related Zmanim
 *  ---
 */

/**
 *  Other zmanim that are related to this zman.
 *
 *  @discussion Related zmanim are other versions of the same zman. Related zmanim always contains self.
 *
 *  @return An NSArray of SEL objects that are related to this zman.
 */

- (NSArray *)relatedZmanim
{
    
    NSString *selectorAsString = NSStringFromSelector(self.selector);
    NSArray *related = @[selectorAsString]; //  By default, return the array of just this selector.
    
    /**
     *  All of the related sets
     */
    NSArray *sets = @[
                      /**
                       *    Sha'ah Zmanis
                       */
                      
                      @[
                          NSStringFromSelector(@selector(shaahZmanisMogenAvraham)),
                          NSStringFromSelector(@selector(shaahZmanisGra)),
                          NSStringFromSelector(@selector(shaahZmanis16Point1Degrees)),
                          NSStringFromSelector(@selector(shaahZmanis18Degrees)),
                          NSStringFromSelector(@selector(shaahZmanis19Point8Degrees)),
                          NSStringFromSelector(@selector(shaahZmanis26Degrees)),
                          NSStringFromSelector(@selector(shaahZmanis60Minutes)),
                          NSStringFromSelector(@selector(shaahZmanis72Minutes)),
                          NSStringFromSelector(@selector(shaahZmanis72MinutesZmanis)),
                          NSStringFromSelector(@selector(shaahZmanis90Minutes)),
                          NSStringFromSelector(@selector(shaahZmanis90MinutesZmanis)),
                          NSStringFromSelector(@selector(shaahZmanis96Minutes)),
                          NSStringFromSelector(@selector(shaahZmanis96MinutesZmanis)),
                          NSStringFromSelector(@selector(shaahZmanisAteretTorah)),
                          NSStringFromSelector(@selector(shaahZmanis120Minutes)),
                          NSStringFromSelector(@selector(shaahZmanis120MinutesZmanis))
                          ],
                      
                      /**
                       *    Alos
                       */
                      
                      @[
                          NSStringFromSelector(@selector(alosHashachar)),
                          NSStringFromSelector(@selector(alos72)),
                          NSStringFromSelector(@selector(alos60)),
                          NSStringFromSelector(@selector(alos72Zmanis)),
                          NSStringFromSelector(@selector(alos90)),
                          NSStringFromSelector(@selector(alos90Zmanis)),
                          NSStringFromSelector(@selector(alos96)),
                          NSStringFromSelector(@selector(alos96Zmanis)),
                          NSStringFromSelector(@selector(alos120)),
                          NSStringFromSelector(@selector(alos120Zmanis)),
                          NSStringFromSelector(@selector(alos26Degrees)),
                          NSStringFromSelector(@selector(alos18Degrees)),
                          NSStringFromSelector(@selector(alos19Point8Degrees)),
                          NSStringFromSelector(@selector(alos16Point1Degrees))
                          ],
                      
                      /**
                       *    Misheyakir
                       */
                      
                      @[
                          NSStringFromSelector(@selector(misheyakir10Point2Degrees)),
                          NSStringFromSelector(@selector(misheyakir11Degrees)),
                          NSStringFromSelector(@selector(misheyakir11Point5Degrees)),
                          NSStringFromSelector(@selector(misheyakirAteretTorahWithMinutes:))
                          ],
                      
                      /**
                       *    Sof Zman Shma
                       */
                      
                      @[
                          NSStringFromSelector(@selector(sofZmanShmaGra)),
                          NSStringFromSelector(@selector(sofZmanShmaMogenAvraham)),
                          NSStringFromSelector(@selector(sofZmanShmaFixedLocal)),
                          NSStringFromSelector(@selector(sofZmanShmaMGA19Point8Degrees)),
                          NSStringFromSelector(@selector(sofZmanShmaMGA16Point1Degrees)),
                          NSStringFromSelector(@selector(sofZmanShmaMGA72Minutes)),
                          NSStringFromSelector(@selector(sofZmanShmaMGA72MinutesZmanis)),
                          NSStringFromSelector(@selector(sofZmanShmaMGA90Minutes)),
                          NSStringFromSelector(@selector(sofZmanShmaMGA90MinutesZmanis)),
                          NSStringFromSelector(@selector(sofZmanShmaMGA96Minutes)),
                          NSStringFromSelector(@selector(sofZmanShmaMGA96MinutesZmanis)),
                          NSStringFromSelector(@selector(sofZmanShma3HoursBeforeChatzos)),
                          NSStringFromSelector(@selector(sofZmanShmaMGA120Minutes)),
                          NSStringFromSelector(@selector(sofZmanShmaAlos16Point1ToSunset)),
                          NSStringFromSelector(@selector(sofZmanShmaAlos16Point1ToTzaisGeonim7Point083Degrees)),
                          NSStringFromSelector(@selector(sofZmanShmaKolEliyahu)),
                          ],
                      
                      /**
                       *    Sof Zman Tfila
                       */
                      
                      @[
                          NSStringFromSelector(@selector(sofZmanTfilaMogenAvraham)),
                          NSStringFromSelector(@selector(sofZmanTfilaGra)),
                          NSStringFromSelector(@selector(sofZmanTfilaFixedLocal)),
                          NSStringFromSelector(@selector(sofZmanTfilaMGA19Point8Degrees)),
                          NSStringFromSelector(@selector(sofZmanTfilaMGA16Point1Degrees)),
                          NSStringFromSelector(@selector(sofZmanTfilaMGA72Minutes)),
                          NSStringFromSelector(@selector(sofZmanTfilaMGA72MinutesZmanis)),
                          NSStringFromSelector(@selector(sofZmanTfilaMGA90Minutes)),
                          NSStringFromSelector(@selector(sofZmanTfilaMGA90MinutesZmanis)),
                          NSStringFromSelector(@selector(sofZmanTfilaMGA96Minutes)),
                          NSStringFromSelector(@selector(sofZmanTfilaMGA96MinutesZmanis)),
                          NSStringFromSelector(@selector(sofZmanTfilaMGA120Minutes)),
                          NSStringFromSelector(@selector(sofZmanTfila2HoursBeforeChatzos))
                          ],
                      
                      /**
                       *    Mincha Gedola
                       */
                      
                      @[
                          NSStringFromSelector(@selector(minchaGedola)),
                          NSStringFromSelector(@selector(minchaGedola30Minutes)),
                          NSStringFromSelector(@selector(minchaGedola72Minutes)),
                          NSStringFromSelector(@selector(minchaGedola16Point1Degrees)),
                          NSStringFromSelector(@selector(minchaGedola30Minutes)),
                          NSStringFromSelector(@selector(minchaGedolaGreaterThan30)),
                          NSStringFromSelector(@selector(minchaGedola16Point1Degrees)),
                          NSStringFromSelector(@selector(minchaGedolaAteretTorah))
                          ],
                      
                      /**
                       *    Mincha Ketana
                       */
                      
                      @[
                          NSStringFromSelector(@selector(minchaKetana)),
                          NSStringFromSelector(@selector(minchaKetana16Point1Degrees)),
                          NSStringFromSelector(@selector(minchaKetana72Minutes)),
                          NSStringFromSelector(@selector(minchaKetanaAteretTorah))
                          ],
                      
                      /**
                       *    Plag Hamincha
                       */
                      
                      @[
                          NSStringFromSelector(@selector(plagHamincha)),
                          NSStringFromSelector(@selector(plagHamincha60Minutes)),
                          NSStringFromSelector(@selector(plagHamincha72Minutes)),
                          NSStringFromSelector(@selector(plagHamincha72MinutesZmanis)),
                          NSStringFromSelector(@selector(plagHamincha90Minutes)),
                          NSStringFromSelector(@selector(plagHamincha90MinutesZmanis)),
                          NSStringFromSelector(@selector(plagHamincha96Minutes)),
                          NSStringFromSelector(@selector(plagHamincha96MinutesZmanis)),
                          NSStringFromSelector(@selector(plagHamincha16Point1Degrees)),
                          NSStringFromSelector(@selector(plagHamincha18Degrees)),
                          NSStringFromSelector(@selector(plagHamincha19Point8Degrees)),
                          NSStringFromSelector(@selector(plagHamincha26Degrees)),
                          NSStringFromSelector(@selector(plagAlosToSunset)),
                          NSStringFromSelector(@selector(plagAlos16Point1ToTzaisGeonim7Point083Degrees))
                          ],
                      
                      /**
                       *  Bain Hashmashos
                       */
                      
                      @[
                          NSStringFromSelector(@selector(bainHashmashosRT13Degrees)),
                          NSStringFromSelector(@selector(bainHashmashosRT58Point5Minutes)),
                          NSStringFromSelector(@selector(bainHashmashosRT13Point5MinutesBefore7Point083Degrees)),
                          NSStringFromSelector(@selector(bainHashmashosRT2Stars))
                          ],
                      
                      /**
                       *    Tzais
                       */
                      
                      @[
                          NSStringFromSelector(@selector(tzais)),
                          NSStringFromSelector(@selector(tzaisGeonim5Point95Degrees)),
                          NSStringFromSelector(@selector(tzaisGeonim5Point88Degrees)),
                          NSStringFromSelector(@selector(tzaisGeonim3Point65Degrees)),
                          NSStringFromSelector(@selector(tzaisGeonim4Point37Degrees)),
                          NSStringFromSelector(@selector(tzaisGeonim4Point61Degrees)),
                          NSStringFromSelector(@selector(tzaisGeonim4Point8Degrees)),
                          NSStringFromSelector(@selector(tzaisGeonim7Point083Degrees)),
                          NSStringFromSelector(@selector(tzaisGeonim8Point5Degrees)),
                          NSStringFromSelector(@selector(tzais50)),
                          NSStringFromSelector(@selector(tzais60)),
                          NSStringFromSelector(@selector(tzaisAteretTorah)),
                          NSStringFromSelector(@selector(tzais72)),
                          NSStringFromSelector(@selector(tzais72Zmanis)),
                          NSStringFromSelector(@selector(tzais90)),
                          NSStringFromSelector(@selector(tzais90Zmanis)),
                          NSStringFromSelector(@selector(tzais96)),
                          NSStringFromSelector(@selector(tzais96Zmanis)),
                          NSStringFromSelector(@selector(tzais120)),
                          NSStringFromSelector(@selector(tzais120Zmanis)),
                          NSStringFromSelector(@selector(tzais16Point1Degrees)),
                          NSStringFromSelector(@selector(tzais26Degrees)),
                          NSStringFromSelector(@selector(tzais18Degrees)),
                          NSStringFromSelector(@selector(tzais19Point8Degrees)),
                          ],
                      
                      /**
                       *    Achilas Chametz
                       */
                      
                      @[
                          NSStringFromSelector(@selector(sofZmanAchilasChametzGra)),
                          NSStringFromSelector(@selector(sofZmanAchilasChametzMGA72Minutes)),
                          NSStringFromSelector(@selector(sofZmanAchilasChametzMGA16Point1Degrees))
                          ],
                      
                      /**
                       *    Biur Chametz
                       */
                      
                      @[
                          NSStringFromSelector(@selector(sofZmanBiurChametzGra)),
                          NSStringFromSelector(@selector(sofZmanBiurChametzMGA72Minutes)),
                          NSStringFromSelector(@selector(sofZmanBiurChametzMGA16Point1Degrees))
                          ]
                      ];
    
    
    
    for (NSArray *array in sets)
    {
        if ([array containsObject:selectorAsString])
        {
            related = array;
            break;
        }
    }
    
    return related;
}

/**
 *  This method returns the appropriate data for the zman's selector.
 *
 *  @param An NSDictionary containing data for the zman.
 */

- (NSDictionary *)_metadataForCurrentZman
{
    
    static NSDictionary * metadata = nil;
    
    if (metadata == nil)
    {
        NSDictionary *data = @{
                               NSStringFromSelector(@selector(shaahZmanisMogenAvraham)) : @{
                                       @"koshercocoa.name.hebrew" : @"שעה זמנית (מ״א)",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"Sha'ah Zmanis (M'A)",
                                       @"koshercocoa.name.transliterated.sepharad" : @"Sha'ah Zmanit (M'A)",
                                       @"koshercocoa.name.english" : @"Temporal Hour (M'A)",
                                       @"koshercocoa.explanation" : @" A shaah zmanis (temporal hour) according to the opinion of the Magen Avraham. This calculation divides the day based on the opinion of the Magen Avraham that the day runs from dawn to dusk (for sof zman krias shema and tfila). Dawn for this calculation is 72 minutes before sunrise and dusk is 72 minutes after sunset. This day is split into 12 equal parts with each part being a temporal hour."
                                       },
                               
                               NSStringFromSelector(@selector(shaahZmanisGra)) : @{
                                       @"koshercocoa.name.hebrew" : @"שעה זמנית (גר״א)",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"Sha'ah Zmanis (Gr'a)",
                                       @"koshercocoa.name.transliterated.sepharad" : @"Sha'ah Zmanit (Gr'a)",
                                       @"koshercocoa.name.english" : @"Temporal Hour (Gr'a)",
                                       @"koshercocoa.explanation" : @"A shaah zmanis (temporal hour) according to the opinion of the Gra and the Baal Hatanya. This calculation divides the day based on the opinion of the GRA and the Baal Hatanya that the day runs from sunrise to  sunset. The calculations are based on a day from sea level sunrise to sea level sunset. The day is split into 12 equal parts with each one being a shaah zmanis. An explanation and detailed sources for not using elevation for anything besides sunrise and sunset can be found in Zmanim Kehilchasam (second edition published in 2007) by Rabbi Dovid Yehuda Bursztyn chapter 2 (pages 186-187)."
                                       },
                               
                               NSStringFromSelector(@selector(shaahZmanis16Point1Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"שעה זמנית (16.1 מעלות)",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"Sha'ah Zmanis (16.1 Maalos)",
                                       @"koshercocoa.name.transliterated.sepharad" : @"Sha'ah Zmanit (16.1 Maalot)",
                                       @"koshercocoa.name.english" : @"Temporal Hour (16.1 Degrees)",
                                       @"koshercocoa.explanation" : @"A shaah zmanis (temporal hour) calculated using a 16.1 degree dip. This calculation divides the day based on the opinion that the day runs from dawn to dusk. Dawn for this calculation is  when the sun is 16.1 degrees below the eastern geometric horizon before sunrise. Dusk for this is when the sun is 16.1 degrees below the western geometric horizon after sunset. This day is split into 12 equal parts with each part being a shaah zmanis."
                                       },
                               NSStringFromSelector(@selector(shaahZmanis18Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"שעה זמנית (18 מעלות)",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"Sha'ah Zmanis (18 Maalos)",
                                       @"koshercocoa.name.transliterated.sepharad" : @"Sha'ah Zmanit (18 Maalos)",
                                       @"koshercocoa.name.english" : @"Temporal Hour (18 Degrees)",
                                       @"koshercocoa.explanation" : @"A shaah zmanis (temporal hour) calculated using an 18 degree dip. This calculation divides the day based on the opinion of the Magen Avraham that the day runs from dawn to dusk. Dawn for this calculation is  when the sun is 18 degrees below the eastern geometric horizon before sunrise. Dusk for this is when the sun is 18 degrees below the western geometric horizon after sunset. This day is split into 12 equal parts with each part being a shaah zmanis."
                                       },
                               NSStringFromSelector(@selector(shaahZmanis19Point8Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(shaahZmanis26Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(shaahZmanis60Minutes)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(shaahZmanis72Minutes)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(shaahZmanis72MinutesZmanis)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(shaahZmanis90Minutes)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(shaahZmanis90MinutesZmanis)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(shaahZmanis96Minutes)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(shaahZmanis96MinutesZmanis)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(shaahZmanisAteretTorah)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(shaahZmanis120Minutes)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(shaahZmanis120MinutesZmanis))  : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               
                               /**
                                *    Alos
                                */
                               
                               
                               NSStringFromSelector(@selector(alosHashachar))  : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(alos72))  : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(alos60)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(alos72Zmanis))  : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(alos90)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(alos90Zmanis)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(alos96))  : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(alos96Zmanis))  : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(alos120))  : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(alos120Zmanis))  : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(alos26Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(alos18Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(alos19Point8Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(alos16Point1Degrees))  : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               
                               /**
                                *    Misheyakir
                                */
                               
                               NSStringFromSelector(@selector(misheyakir10Point2Degrees))  : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(misheyakir11Degrees))  : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(misheyakir11Point5Degrees))  : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(misheyakirAteretTorahWithMinutes:))  : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               
                               /**
                                *    Sof Zman Shma
                                */
                               
                               NSStringFromSelector(@selector(sofZmanShmaGra))  : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(sofZmanShmaMogenAvraham)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(sofZmanShmaFixedLocal)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(sofZmanShmaMGA19Point8Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(sofZmanShmaMGA16Point1Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(sofZmanShmaMGA72Minutes)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(sofZmanShmaMGA72MinutesZmanis)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(sofZmanShmaMGA90Minutes)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(sofZmanShmaMGA90MinutesZmanis)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(sofZmanShmaMGA96Minutes)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(sofZmanShmaMGA96MinutesZmanis)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(sofZmanShma3HoursBeforeChatzos)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(sofZmanShmaMGA120Minutes)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(sofZmanShmaAlos16Point1ToSunset)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(sofZmanShmaAlos16Point1ToTzaisGeonim7Point083Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(sofZmanShmaKolEliyahu)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               
                               /**
                                *    Sof Zman Tfila
                                */
                               
                               NSStringFromSelector(@selector(sofZmanTfilaMogenAvraham))  : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(sofZmanTfilaGra)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(sofZmanTfilaFixedLocal)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(sofZmanTfilaMGA19Point8Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(sofZmanTfilaMGA16Point1Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(sofZmanTfilaMGA72Minutes)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(sofZmanTfilaMGA72MinutesZmanis)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(sofZmanTfilaMGA90Minutes)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(sofZmanTfilaMGA90MinutesZmanis)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(sofZmanTfilaMGA96Minutes)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(sofZmanTfilaMGA96MinutesZmanis)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(sofZmanTfilaMGA120Minutes)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(sofZmanTfila2HoursBeforeChatzos))  : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               
                               /**
                                *    Mincha Gedola
                                */
                               
                               NSStringFromSelector(@selector(minchaGedola)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(minchaGedola30Minutes)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(minchaGedola72Minutes)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(minchaGedola16Point1Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(minchaGedola30Minutes)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(minchaGedolaGreaterThan30)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(minchaGedola16Point1Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(minchaGedolaAteretTorah))  : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               
                               /**
                                *    Mincha Ketana
                                */
                               
                               NSStringFromSelector(@selector(minchaKetana))  : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(minchaKetana16Point1Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(minchaKetana72Minutes)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(minchaKetanaAteretTorah))  : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               
                               /**
                                *    Plag Hamincha
                                */
                               
                               NSStringFromSelector(@selector(plagHamincha)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(plagHamincha60Minutes)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(plagHamincha72Minutes))  : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(plagHamincha72MinutesZmanis)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(plagHamincha90Minutes)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(plagHamincha90MinutesZmanis)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(plagHamincha96Minutes)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(plagHamincha96MinutesZmanis)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(plagHamincha16Point1Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(plagHamincha18Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(plagHamincha19Point8Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(plagHamincha26Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(plagAlosToSunset)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(plagAlos16Point1ToTzaisGeonim7Point083Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               
                               /**
                                *  Bain Hashmashos
                                */
                               
                               NSStringFromSelector(@selector(bainHashmashosRT13Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(bainHashmashosRT58Point5Minutes)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(bainHashmashosRT13Point5MinutesBefore7Point083Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(bainHashmashosRT2Stars)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               
                               /**
                                *    Tzais
                                */
                               
                               NSStringFromSelector(@selector(tzais))  : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(tzaisGeonim5Point95Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(tzaisGeonim5Point88Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(tzaisGeonim3Point65Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(tzaisGeonim4Point37Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(tzaisGeonim4Point61Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(tzaisGeonim4Point8Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(tzaisGeonim7Point083Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(tzaisGeonim8Point5Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(tzais50)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(tzais60)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(tzaisAteretTorah)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(tzais72)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(tzais72Zmanis)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(tzais90)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(tzais90Zmanis)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(tzais96)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(tzais96Zmanis)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(tzais120)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(tzais120Zmanis)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(tzais16Point1Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(tzais26Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(tzais18Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(tzais19Point8Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               
                               
                               /**
                                *    Achilas Chametz
                                */
                               
                               NSStringFromSelector(@selector(sofZmanAchilasChametzGra)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(sofZmanAchilasChametzMGA72Minutes)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(sofZmanAchilasChametzMGA16Point1Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               
                               /**
                                *    Biur Chametz
                                */
                               
                               NSStringFromSelector(@selector(sofZmanBiurChametzGra)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(sofZmanBiurChametzMGA72Minutes)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       },
                               NSStringFromSelector(@selector(sofZmanBiurChametzMGA16Point1Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation" : @""
                                       }
                               };
        
        metadata = data[NSStringFromSelector(self.selector)];
    }
    
    return metadata;
}

@end
