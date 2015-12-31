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
                       *
                       */
                      
                      @[
                          NSStringFromSelector(@selector(sunrise))
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
                       *    Chatzos
                       */
                      
                      @[
                          NSStringFromSelector(@selector(chatzos)),
                          NSStringFromSelector(@selector(fixedLocalChatzos))
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
                       *    Sunset
                       */
                      
                      @[
                          NSStringFromSelector(@selector(sunset))
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
    
    NSDictionary * metadata = nil;
    static  NSDictionary *data = nil;
    
    if (data == nil)
    {
         data = @{
                               NSStringFromSelector(@selector(shaahZmanisMogenAvraham)) : @{
                                       @"koshercocoa.name.hebrew" : @"שעה זמנית (מ״א)",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"Sha'ah Zmanis (M'A)",
                                       @"koshercocoa.name.transliterated.sepharad" : @"Sha'ah Zmanit (M'A)",
                                       @"koshercocoa.name.english" : @"Temporal Hour (M'A)",
                                       @"koshercocoa.explanation.english" : @" A shaah zmanis (temporal hour) according to the opinion of the Mogen Avraham. This calculation divides the day based on the opinion of the Mogen Avraham that the day runs from dawn to dusk (for Sof Zman Shema  and tfila). Dawn for this calculation is 72 minutes before sunrise and dusk is 72 minutes after sunset. This day is split into 12 equal parts with each part being a temporal hour."
                                       },
                               
                               NSStringFromSelector(@selector(shaahZmanisGra)) : @{
                                       @"koshercocoa.name.hebrew" : @"שעה זמנית (גר״א)",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"Sha'ah Zmanis (Gr'a)",
                                       @"koshercocoa.name.transliterated.sepharad" : @"Sha'ah Zmanit (Gr'a)",
                                       @"koshercocoa.name.english" : @"Temporal Hour (Gr'a)",
                                       @"koshercocoa.explanation.english" : @"A shaah zmanis (temporal hour) according to the opinion of the Gra and the Baal Hatanya. This calculation divides the day based on the opinion of the GRA and the Baal Hatanya that the day runs from sunrise to  sunset. The calculations are based on a day from sea level sunrise to sea level sunset. The day is split into 12 equal parts with each one being a shaah zmanis. An explanation and detailed sources for not using elevation for anything besides sunrise and sunset can be found in Zmanim Kehilchasam (second edition published in 2007) by Rabbi Dovid Yehuda Bursztyn chapter 2 (pages 186-187)."
                                       },
                               
                               NSStringFromSelector(@selector(shaahZmanis16Point1Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"שעה זמנית (16.1 מעלות)",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"Sha'ah Zmanis (16.1 Maalos)",
                                       @"koshercocoa.name.transliterated.sepharad" : @"Sha'ah Zmanit (16.1 Maalot)",
                                       @"koshercocoa.name.english" : @"Temporal Hour (16.1 Degrees)",
                                       @"koshercocoa.explanation.english" : @"A shaah zmanis (temporal hour) calculated using a 16.1 degree dip. This calculation divides the day based on the opinion that the day runs from dawn to dusk. Dawn for this calculation is  when the sun is 16.1 degrees below the eastern geometric horizon before sunrise. Dusk for this is when the sun is 16.1 degrees below the western geometric horizon after sunset. This day is split into 12 equal parts with each part being a shaah zmanis."
                                       },
                               NSStringFromSelector(@selector(shaahZmanis18Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"שעה זמנית (18 מעלות)",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"Sha'ah Zmanis (18 Maalos)",
                                       @"koshercocoa.name.transliterated.sepharad" : @"Sha'ah Zmanit (18 Maalos)",
                                       @"koshercocoa.name.english" : @"Temporal Hour (18 Degrees)",
                                       @"koshercocoa.explanation.english" : @"A shaah zmanis (temporal hour) calculated using an 18 degree dip. This calculation divides the day based on the opinion of the Mogen Avraham that the day runs from dawn to dusk. Dawn for this calculation is  when the sun is 18 degrees below the eastern geometric horizon before sunrise. Dusk for this is when the sun is 18 degrees below the western geometric horizon after sunset. This day is split into 12 equal parts with each part being a shaah zmanis."
                                       },
                               NSStringFromSelector(@selector(shaahZmanis19Point8Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"שעה זמנית (19.8 מעלות)",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"Sha'ah Zmanis (19.8 Maalos)",
                                       @"koshercocoa.name.transliterated.sepharad" : @"Sha'ah Zmanit (19.8 Maalot)",
                                       @"koshercocoa.name.english" : @"Temporal Hour (19.8 Degrees)",
                                       @"koshercocoa.explanation.english" : @"A shaah zmanis (temporal hour) calculated using a 19.8 degree dip. This calculation divides the day based on the opinion of the Mogen Avraham that the day runs from dawn to dusk. Dawn for this calculation is  when the sun is 19.8 degrees below the eastern geometric horizon before sunrise. Dusk for this is when the sun is 19.8 degrees below the western geometric horizon after sunset. This day is split into 12 equal parts with each part being a shaah zmanis"
                                       },
                               NSStringFromSelector(@selector(shaahZmanis26Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"שעה זמנית (26 מעלות)",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"Sha'ah Zmanis (26 Maalos)",
                                       @"koshercocoa.name.transliterated.sepharad" : @"Sha'ah Zmanit (26 Maalot)",
                                       @"koshercocoa.name.english" : @"Temporal Hour (26 Degrees)",
                                       @"koshercocoa.explanation.english" : @"Method to return a shaah zmanis (temporal hour) calculated using a 26 degree dip. This calculation divides the day based on the opinion of the Mogen Avraham that the day runs from dawn to dusk. Dawn for this calculation is  when the sun is 26 degrees below the eastern geometric horizon before sunrise. Dusk for this is when the sun is 26 degree below the western geometric horizon after sunset. This day is split into 12 equal parts with each part being a shaah zmanis."
                                       },
                               NSStringFromSelector(@selector(shaahZmanis60Minutes)) : @{
                                       @"koshercocoa.name.hebrew" : @"שעה זמנית (60 דקות)",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"Sha'ah Zmanis (60 Dakos)",
                                       @"koshercocoa.name.transliterated.sepharad" : @"Sha'ah Zmanit (60 Dakot)",
                                       @"koshercocoa.name.english" : @"Temporal Hour (60 Minutes)",
                                       @"koshercocoa.explanation.english" : @"Method to return a shaah zmanis (solar hour) according to the opinion of the Mogen Avraham. This calculation divides the day based on the opinion of the Mogen Avraham that the day runs from dawn to dusk. Dawn for this calculation is 60 minutes before sunrise and dusk is 60 minutes after sunset. This day is split into 12 equal parts with each part being a shaah zmanis."
                                       },
                               NSStringFromSelector(@selector(shaahZmanis72Minutes)) : @{
                                       @"koshercocoa.name.hebrew" : @"שעה זמנית (72 דקות)",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"Sha'ah Zmanis (72 Dakos)",
                                       @"koshercocoa.name.transliterated.sepharad" : @"Sha'ah Zmanit (72 Dakot)",
                                       @"koshercocoa.name.english" : @"Temporal Hour (72 Minutes)",
                                       @"koshercocoa.explanation.english" : @"Method to return a shaah zmanis (solar hour) according to the opinion of the Mogen Avraham. This calculation divides the day based on the opinion of the Mogen Avraham that the day runs from dawn to dusk. Dawn for this calculation is 72 minutes before sunrise and dusk is 72 minutes after sunset. This day is split into 12 equal parts with each part being a shaah zmanis."
                                       },
                               NSStringFromSelector(@selector(shaahZmanis72MinutesZmanis)) : @{
                                       @"koshercocoa.name.hebrew" : @"שעה זמנית (72 דקות זמנית)",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"Sha'ah Zmanis (72 Dakos Zmanis)",
                                       @"koshercocoa.name.transliterated.sepharad" : @"Sha'ah Zmanit (72 Dakot Zmanit)",
                                       @"koshercocoa.name.english" : @"Temporal Hour (72 Temporal Minutes)",
                                       @"koshercocoa.explanation.english" : @"Method to return a shaah zmanis (temporal hour) according to the opinion of the Mogen Avraham based on alos being 72 minutes zmaniyos before sunrise. This calculation divides the day based on the opinion of the Mogen Avraham that the day runs from dawn to dusk. Dawn for this calculation is 72 minutes zmaniyos before sunrise and dusk is 72 minutes zmaniyos after sunset. This day is split into 12 equal parts with each part being a shaah zmanis. This is identical to 1/10th of the day from sunrise to sunset."
                                       },
                               NSStringFromSelector(@selector(shaahZmanis90Minutes)) : @{
                                       @"koshercocoa.name.hebrew" : @"שעה זמנית (90 דקות)",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"Sha'ah Zmanis (90 Dakos)",
                                       @"koshercocoa.name.transliterated.sepharad" : @"Sha'ah Zmanit (90 Dakot)",
                                       @"koshercocoa.name.english" : @"Temporal Hour (90 Minutes)",
                                       @"koshercocoa.explanation.english" : @"Method to return a shaah zmanis (temporal hour) calculated using a dip of 90 minutes. This calculation divides the day based on the opinion of the Mogen Avraham that the day runs from dawn to dusk. Dawn for this calculation is 90 minutes before sunrise and dusk is 90 minutes after sunset. This day is split into 12 equal parts with each part being a shaah zmanis."
                                       },
                               NSStringFromSelector(@selector(shaahZmanis90MinutesZmanis)) : @{
                                       @"koshercocoa.name.hebrew" : @"שעה זמנית (90 דקות זמנית)",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"Sha'ah Zmanis (90 Dakos Zmanis)",
                                       @"koshercocoa.name.transliterated.sepharad" : @"Sha'ah Zmanit (90 Dakot Zmanit)",
                                       @"koshercocoa.name.english" : @"Temporal Hour (90 Temporal Minutes)",
                                       @"koshercocoa.explanation.english" : @"Method to return a shaah zmanis (temporal hour) according to the opinion of the Mogen Avraham based on alos being 90 minutes zmaniyos before sunrise. This calculation divides the day based on the opinion of the Mogen Avraham that the day runs from dawn to dusk. Dawn for this calculation is 90 minutes zmaniyos before sunrise and dusk is 90 minutes zmaniyos after sunset. This day is split into 12 equal parts with each part being a shaah zmanis. This is identical to 1/8th of the day from sunrise to sunset."
                                       },
                               NSStringFromSelector(@selector(shaahZmanis96Minutes)) : @{
                                       @"koshercocoa.name.hebrew" : @"שעה זמנית (96 דקות)",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"Sha'ah Zmanis (96 Dakos)",
                                       @"koshercocoa.name.transliterated.sepharad" : @"Sha'ah Zmanit (96 Dakot)",
                                       @"koshercocoa.name.english" : @"Temporal Hour (96 Minutes)",
                                       @"koshercocoa.explanation.english" : @"Method to return a shaah zmanis (temporal hour) calculated using a dip of 96 minutes. This calculation divides the day based on the opinion of the Mogen Avraham that the day runs from dawn to dusk. Dawn for this calculation is 96 minutes before sunrise and dusk is 96 minutes after sunset. This day is split into 12 equal parts with each part being a shaah zmanis."
                                       },
                               NSStringFromSelector(@selector(shaahZmanis96MinutesZmanis)) : @{
                                       @"koshercocoa.name.hebrew" : @"שעה זמנית (96 דקות זמנית)",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"Sha'ah Zmanis (96 Dakos Zmanis)",
                                       @"koshercocoa.name.transliterated.sepharad" : @"Sha'ah Zmanit (96 Dakot Zmanit)",
                                       @"koshercocoa.name.english" : @"Temporal Hour (96 Temporal Minutes)",
                                       @"koshercocoa.explanation.english" : @"Method to return a shaah zmanis (temporal hour) according to the opinion of the Mogen Avraham based on alos being 96 minutes zmaniyos before sunrise. This calculation divides the day based on the opinion of the Mogen Avraham that the day runs from dawn to dusk. Dawn for this calculation is 96 minutes zmaniyos before sunrise and dusk is 96 minutes zmaniyos after sunset. This day is split into 12 equal parts with each part being a shaah zmanis. This is identical to 1/7.5th of the day from sunrise to sunset."
                                       },
                               NSStringFromSelector(@selector(shaahZmanisAteretTorah)) : @{
                                       @"koshercocoa.name.hebrew" : @"שעה זמנית (עטרת תורה)",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"Sha'ah Zmanis (Ateret Torah)",
                                       @"koshercocoa.name.transliterated.sepharad" : @"Sha'ah Zmanit (Ateret Torah)",
                                       @"koshercocoa.name.english" : @"Temporal Hour (Ateret Torah)",
                                       @"koshercocoa.explanation.english" : @"Method to return a shaah zmanis (temporal hour) according to the opinion of the Chacham Yosef Harari-Raful of Yeshivat Ateret Torah calculated with alos being 1/10th of sunrise to sunset day, or 72 minutes zmaniyos of such a day before sunrise, and tzais is usually calculated as 40 minutes (configurable to any offset by modifying AteretTorahSunsetOffset) after sunset. This day is split into 12 equal parts with each part being a shaah zmanis. Note that with this system, chatzos (mid-day) will not be the point that the sun is halfway across the sky."
                                       },
                               NSStringFromSelector(@selector(shaahZmanis120Minutes)) : @{
                                       @"koshercocoa.name.hebrew" : @"שעה זמנית (120 דקות)",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"Sha'ah Zmanis (120 Dakos)",
                                       @"koshercocoa.name.transliterated.sepharad" : @"Sha'ah Zmanit (120 Dakot)",
                                       @"koshercocoa.name.english" : @"Temporal Hour (120 Minutes)",
                                       @"koshercocoa.explanation.english" : @"A shaah zmanis (temporal hour) calculated using a dip of 120 minutes. This calculation divides the day based on the opinion of the Mogen Avraham that the day runs from dawn to dusk. Dawn for this calculation is 120 minutes before sunrise and dusk is 120 minutes after sunset. This day is split into 12 equal parts with each part being a shaah zmanis."
                                       },
                               NSStringFromSelector(@selector(shaahZmanis120MinutesZmanis))  : @{
                                       @"koshercocoa.name.hebrew" : @"שעה זמנית (120 דקות זמנית)",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"Sha'ah Zmanis (120 Dakos Zmanis)",
                                       @"koshercocoa.name.transliterated.sepharad" : @"Sha'ah Zmanit (120 Dakot Zmanit)",
                                       @"koshercocoa.name.english" : @"Temporal Hour (120 Temporal Minutes)",
                                       @"koshercocoa.explanation.english" : @"The time of plag hamincha based on sunrise being 120 minutes zmaniyos (GRA and the Baal Hatanya) or 1/6th of the day before sea level sunrise. This is calculated as 10.75 hours after dawn. The formula used is: 10.75 * ShaahZmanis120MinutesZmanis after dawn."
                                       },
                               
                               /**
                                *    Alos
                                */
                               
                               
                               NSStringFromSelector(@selector(alosHashachar))  : @{
                                       @"koshercocoa.name.hebrew" : @"עלות השחר",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"Alos HaShachar",
                                       @"koshercocoa.name.transliterated.sepharad" : @"Alot HaShachar",
                                       @"koshercocoa.name.english" : @"Dawn",
                                       @"koshercocoa.explanation.english" : @"Dawn, based on the time when the sun is 16.1 degrees below the eastern geometric horizon before sunrise. In some places, this calculation can't be computed, such as northern and southern locations even south of the Arctic Circle and north of the Antarctic Circle where the sun may not reach low enough below the horizon for this calculation."
                                       },
                               NSStringFromSelector(@selector(alos72))  : @{
                                       @"koshercocoa.name.hebrew" : @"עלות השחר (72 דקות)",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"Alos HaShachar (72 Dakos)",
                                       @"koshercocoa.name.transliterated.sepharad" : @"Alot HaShachar (72 Dakot)",
                                       @"koshercocoa.name.english" : @"Dawn (72 Minutes)",
                                       @"koshercocoa.explanation.english" : @" Dawn, calculated using 72 minutes before sunrise at sea level (no adjustment for elevation) based on the time to walk the distance of 4 \"mil\" at 18 minutes a \"mil\". This is based on the opinion of most rishonim who stated that the time of the \"neshef\" (time between dawn and sunrise) does not vary by the time of year or location but purely depends on the time it takes to walk the distance of 4 \"mil.\""
                                       },
                               NSStringFromSelector(@selector(alos60)) : @{
                                       @"koshercocoa.name.hebrew" : @"(עלות השחר (60 דקות",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"Alos HaShachar (60 Dakos)",
                                       @"koshercocoa.name.transliterated.sepharad" : @"Alot HaShachar (60 Dakot)",
                                       @"koshercocoa.name.english" : @"Dawn (60 Minutes)",
                                       @"koshercocoa.explanation.english" : @"Dawn calculated as 60 minutes before sea level sunrise. This is the time to walk the distance of 4 \"mil\" at 15 minutes a \"mil\" (the opinion of the Chavas Yair. See the Divrei Malkiel). Time based offset calculations for alos are based on the opinion of most Rishonim who stated that the time of the \"neshef\" (time between dawn and sunrise) does not vary by the time of year or location but purely depends on the time it takes to walk the distance of 4 \"mil.\""
                                       },
                               NSStringFromSelector(@selector(alos72Zmanis))  : @{
                                       @"koshercocoa.name.hebrew" : @"(עלות השחר (72 דקות זמנית",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"Alos HaShachar (72 Dakos Zmanis)",
                                       @"koshercocoa.name.transliterated.sepharad" : @"Alot HaShachar (72 Dakot Zmanit)",
                                       @"koshercocoa.name.english" : @"Dawn (72 Temporal Minutes)",
                                       @"koshercocoa.explanation.english" : @"Dawn calculated using 72 minutes zmaniyos (GRA and the Baal Hatanya) or 1/10th of the day before sea level sunrise. This is based on an 18 minute \"mil\" so the time for 4 \"mil\" is 72 minutes which is 1/10th of a day (12 * 60 = 720) based on the day starting at sea level sunrise and ending at sea level sunset. This calculation is used in the calendars published by Hisachdus Harabanim D'Artzos Habris Ve'Canada."
                                       },
                               NSStringFromSelector(@selector(alos90)) : @{
                                       @"koshercocoa.name.hebrew" : @"(עלות השחר (90 דקות",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"Alos HaShachar (90 Dakos)",
                                       @"koshercocoa.name.transliterated.sepharad" : @"Alot HaShachar (90 Dakot)",
                                       @"koshercocoa.name.english" : @"Dawn (90 Minutes)",
                                       @"koshercocoa.explanation.english" : @"Dawn calculated as 90 minutes before sea level sunrise based on the time to walk the distance of 4 \"mil\" at 22.5 minutes per \"mil.\" Time based offset calculations for alos are based on the opinion of most Rishonim who stated that the time of the \"neshef\" (time between dawn and sunrise) does not vary by the time of year or location but purely depends on the time it takes to walk the distance of 4 \"mil.\""
                                       },
                               NSStringFromSelector(@selector(alos90Zmanis)) : @{
                                       @"koshercocoa.name.hebrew" : @"(עלות השחר (90 דקות זמנית",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"Alos HaShachar (90 Dakos Zmanis)",
                                       @"koshercocoa.name.transliterated.sepharad" : @"Alot HaShachar (90 Dakot Zmanit)",
                                       @"koshercocoa.name.english" : @"Dawn (90 Temporal Minutes)",
                                       @"koshercocoa.explanation.english" : @"Dawn calculated using 90 minutes zmaniyos (GRA and the Baal Hatanya) or 1/10th of the day before sea level sunrise. This is based on an 22.5 minute \"mil\" so the time for 4 \"mil\" is 90 minutes which is 1/8th of a day (12 * 60) / 8 = 90 based on the day starting at sea level sunrise and ending at sea level sunset. This calculation is used in the calendars published by Hisachdus Harabanim D'Artzos Habris Ve'Canada."
                                       },
                               NSStringFromSelector(@selector(alos96))  : @{
                                       @"koshercocoa.name.hebrew" : @"(עלות השחר (96 דקות",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"Alos HaShachar (96 Dakos)",
                                       @"koshercocoa.name.transliterated.sepharad" : @"Alot HaShachar (96 Dakot)",
                                       @"koshercocoa.name.english" : @"Dawn (96 Minutes)",
                                       @"koshercocoa.explanation.english" : @"Dawn calculated using 96 minutes before sea level sunrise based on the time to walk the distance of 4 \"mil\" at 24 minutes a \"mil.\" Time based offset calculations for alos are based on the opinion of most Rishonim who stated that the time of the \"neshef\" (time between dawn and sunrise) does not vary by the time of year or location but purely depends on the time it takes to walk the distance of 4 \"mil.\""
                                       },
                               NSStringFromSelector(@selector(alos96Zmanis))  : @{
                                       @"koshercocoa.name.hebrew" : @"(עלות השחר (96 דקות זמנית",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"Alos HaShachar (96 Dakos Zmanis)",
                                       @"koshercocoa.name.transliterated.sepharad" : @"Alot HaShachar (96 Dakot Zmanit)",
                                       @"koshercocoa.name.english" : @"Dawn (96 Temporal Minutes)",
                                       @"koshercocoa.explanation.english" : @"Method to return alos (dawn) calculated using 120 minutes before sea level sunrise (no adjustment for elevation is made) based on the time to walk the distance of 5 \"mil\" (Ula) at 24 minutes a \"mil.\" Time based offset calculations for alos are based on the opinion of most Rishonim who stated that the time of the \"neshef\" (time between dawn and sunrise) does not vary by the time of year or location but purely depends on the time it takes to walk the distance of 5 \"mil\" (Ula)."
                                       },
                               NSStringFromSelector(@selector(alos120))  : @{
                                       @"koshercocoa.name.hebrew" : @"(עלות השחר (120 דקות",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"Alos HaShachar (120 Dakos)",
                                       @"koshercocoa.name.transliterated.sepharad" : @"Alot HaShachar (120 Dakot)",
                                       @"koshercocoa.name.english" : @"Dawn (120 Minutes)",
                                       @"koshercocoa.explanation.english" : @"Dawn calculated using 120 minutes before sea level sunrise (no adjustment for elevation is made) based on the time to walk the distance of 5 \"Mil\" (Ula) at 24 minutes a \"mil.\" Time based offset calculations for alos are based on the opinion of most Rishonim who stated that the time of the Neshef (time between dawn and sunrise) does not vary by the time of year or location but purely depends on the time it takes to walk the distance of 5 \"mil\"(Ula)."
                                       },
                               NSStringFromSelector(@selector(alos120Zmanis))  : @{
                                       @"koshercocoa.name.hebrew" : @"(עלות השחר (120 דקות זמנית",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"Alos HaShachar (120 Dakos Zmanis)",
                                       @"koshercocoa.name.transliterated.sepharad" : @"Alot HaShachar (120 Dakot Zmanit)",
                                       @"koshercocoa.name.english" : @"Dawn (120 Temporal Minutes)",
                                       @"koshercocoa.explanation.english" : @"Method to return alos (dawn) calculated using 120 minutes zmaniyos (GRA and the Baal Hatanya) or 1/6th of the day before sea level sunrise. This is based on a 24 minute \"mil\" so the time for 5 \"mil\" is 120 minutes which is 1/6th of a day (12 * 60) / 6 = 120 based on the day starting at sunrise and ending at sunset."
                                       },
                               NSStringFromSelector(@selector(alos26Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"(עלות השחר (26 מעלות",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"Alos HaShachar (26 Ma'alos)",
                                       @"koshercocoa.name.transliterated.sepharad" : @"Alot HaShachar (26 Ma'alot)",
                                       @"koshercocoa.name.english" : @"Dawn (26 Degrees)",
                                       @"koshercocoa.explanation.english" : @"Dawn calculated when the sun is 26° below the eastern geometric horizon before sunrise. This calculation is based on the same calculation of 120 minutes but uses a degree based calculation instead of 120 exact minutes. This calculation is based on the position of the sun 120 minutes before sunrise in Jerusalem during the equinox which calculates to 26° below geometric zenith."
                                       },
                               NSStringFromSelector(@selector(alos18Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"(עלות השחר (18 מעלות",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"Alos HaShachar (18 Ma'alos)",
                                       @"koshercocoa.name.transliterated.sepharad" : @"Alot HaShachar (18 Ma'alot)",
                                       @"koshercocoa.name.english" : @"Dawn (18 Degrees)",
                                       @"koshercocoa.explanation.english" : @"Dawn calculated when the sun is 18° below the eastern geometric horizon before sunrise."
                                       },
                               NSStringFromSelector(@selector(alos19Point8Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"(עלות השחר (19.8 מעלות",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"Alos HaShachar (19.8 Ma'alos)",
                                       @"koshercocoa.name.transliterated.sepharad" : @"Alot HaShachar (19.8 Ma'alot)",
                                       @"koshercocoa.name.english" : @"Dawn (19.8 Degrees)",
                                       @"koshercocoa.explanation.english" : @"Dawn calculated when the sun is 19.8° below the eastern geometric horizon before sunrise.  This calculation is based on the same calculation of 90 minutes but uses a degree based calculation instead of 90 exact minutes. This calculation is based on the position of the sun 90 minutes before sunrise in Jerusalem during the equinox which calculates to 19.8° below geometric zenith."
                                       },
                               NSStringFromSelector(@selector(alos16Point1Degrees))  : @{
                                       @"koshercocoa.name.hebrew" : @"(עלות השחר (16.1 מעלות",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"Alos HaShachar (16.1 Ma'alos)",
                                       @"koshercocoa.name.transliterated.sepharad" : @"Alot HaShachar (16.1 Ma'alot)",
                                       @"koshercocoa.name.english" : @"Dawn (16.1 Degrees)",
                                       @"koshercocoa.explanation.english" : @"Dawn calculated when the sun is 16.1° below the eastern geometric horizon before sunrise. This calculation is based on the same calculation of 72 minutes but uses a degree based calculation instead of 72 exact minutes. This calculation is based on the position of the sun 72 minutes before sunrise in Jerusalem during the equinox which calculates to 16.1° below geometric zenith."
                                       },
                               
                               /**
                                *    Misheyakir
                                */
                               
                               NSStringFromSelector(@selector(misheyakir10Point2Degrees))  : @{
                                       @"koshercocoa.name.hebrew" : @"משיכיר (10.20 מעלות)",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"Misheyakir (10.20 Ma'alos)",
                                       @"koshercocoa.name.transliterated.sepharad" : @"Misheyakir (10.20 Ma'alot)",
                                       @"koshercocoa.name.english" : @"First Sunlight (10.20 Degrees)",
                                       @"koshercocoa.explanation.english" : @"Based on the position of the sun when it is 10.2° below the geometric zenith (90°). This calculation is used for calculating misheyakir according to some opinions. This calculation is based on the position of the sun 45 minutes before sunrise in Jerusalem during the equinox which calculates to 10.2° below geometric zenith."
                                       },
                               NSStringFromSelector(@selector(misheyakir11Degrees))  : @{
                                       @"koshercocoa.name.hebrew" : @"משיכיר (11 מעלות)",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"Misheyakir (11 Ma'alos)",
                                       @"koshercocoa.name.transliterated.sepharad" : @"Misheyakir (11 Ma'alot)",
                                       @"koshercocoa.name.english" : @"First Sunlight (11 Degrees)",
                                       @"koshercocoa.explanation.english" : @"Based on the position of the sun when it is 11° below for calculating misheyakir according to some opinions. This calculation is based on the position of the sun 48 minutes beforesunrise in Jerusalem during the equinox which calculates to 11° below geometric zenith."
                                       },
                               NSStringFromSelector(@selector(misheyakir11Point5Degrees))  : @{
                                       @"koshercocoa.name.hebrew" : @"משיכיר (11.5 מעלות)",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"Misheyakir (11.5 Ma'alos)",
                                       @"koshercocoa.name.transliterated.sepharad" : @"Misheyakir (11.5 Ma'alot)",
                                       @"koshercocoa.name.english" : @"First Sunlight (11.5 Degrees)",
                                       @"koshercocoa.explanation.english" : @"Based on the position of the sun when it is 11.5° below for calculating misheyakir according to some opinions. This calculation is based on the position of the sun 52 minutes before sunrise in Jerusalem during the equinox which calculates to 11.5.° below geometric zenith."
                                       },
                               NSStringFromSelector(@selector(misheyakirAteretTorahWithMinutes:))  : @{
                                       @"koshercocoa.name.hebrew" : @"משיכיר (עטרת תורה)",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"Misheyakir (Ateret Torah)",
                                       @"koshercocoa.name.transliterated.sepharad" : @"Misheyakir (Ateret Torah)",
                                       @"koshercocoa.name.english" : @"First Sunlight (Ateret Torah)",
                                       @"koshercocoa.explanation.english" : @"This method calculates the misheyakir as an offset the Alos 72 minutes, zmanis calculation."
                                       },
                               /**
                                *   Sunrise
                                */
                               
                               NSStringFromSelector(@selector(sunrise))  : @{
                                       @"koshercocoa.name.hebrew" : @"נץ החמה",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"Naitz HAchama",
                                       @"koshercocoa.name.transliterated.sepharad" : @"Netz Hachama",
                                       @"koshercocoa.name.english" : @"Sunrise",
                                       @"koshercocoa.explanation.english" : @"Sunrise at the current location. The zenith used for the calculation uses geometric zenith of 90 degrees plus elevation. This is adjusted to add approximately 50/60 of a degree to account for 34 archminutes of refraction and 16 archminutes for the sun's radius for a total of 90.83333 degrees."
                                       },
                               
                               /**
                                *    Sof Zman Shma
                                */
                               
                               NSStringFromSelector(@selector(sofZmanShmaGra))  : @{
                                       @"koshercocoa.name.hebrew" : @"סוף זמן קריאת שמע (גר״א)",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Shema  (Gr\"a)",
                                       @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Shema (Gr\"a)",
                                       @"koshercocoa.name.english" : @"Latest Shema (Gr'a)",
                                       @"koshercocoa.explanation.english" : @"This time is 3 solar hours after sea level sunrise based on the opinion of the Vilna Gaon and the Baal Hatanya that the day is calculated from sunrise to sunset."
                                       },
                               NSStringFromSelector(@selector(sofZmanShmaMogenAvraham)) : @{
                                       @"koshercocoa.name.hebrew" : @"סוף זמן קריאת שמע (מ״א)",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Shema  (M\"A)",
                                       @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Shema (M\"A)",
                                       @"koshercocoa.name.english" : @"Latest Shema (M\"A)",
                                       @"koshercocoa.explanation.english" : @"The latest time to recite shema in the morning in the opinion of the Mogen Avraham based on alos being 72 minutes before sunrise. This time is 3 solar hours after dawn based on the opinion of the Mogen Avraham that the day is calculated from a dawn of 72 minutes before sunrise to nightfall of 72 minutes after sunset."
                                       },
                               NSStringFromSelector(@selector(sofZmanShmaFixedLocal)) : @{
                                       @"koshercocoa.name.hebrew" : @"סוף זמן קריאת שמע (קבוע)",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Shema  (Kavua)",
                                       @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Shema (Fixed Local)",
                                       @"koshercocoa.name.english" : @"Latest Shema (Kavuah)",
                                       @"koshercocoa.explanation.english" : @"The latest time  to recite Shema in the morning calculated as 3 hours before fixed local chatzos."
                                       },
                               
                               /* (19.8 מעלות) */
                               NSStringFromSelector(@selector(sofZmanShmaMGA19Point8Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"סוף זמן קריאת שמע (19.8 מעלות)",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Shema  (19.8 Maalos)",
                                       @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Shema (19.8 Ma'alot)",
                                       @"koshercocoa.name.english" : @"Latest Shema (19.8 Degrees)",
                                       @"koshercocoa.explanation.english" : @"The latest zman krias shema (time to recite Shema in the morning) according to the opinion of the Mogen Avraham based on alos being 19.8° before sunrise. This time is 3 solar hours after dawn based on the opinion of the MGA that the day is calculated from dawn to nightfall with both being 19.8° below sunrise or sunset."
                                       },
                               NSStringFromSelector(@selector(sofZmanShmaMGA16Point1Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"(16.1 מעלות) סוף זמן קריאת שמע",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Shema  (16.1 Maalos)",
                                       @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Shema (16.1 Ma'alot)",
                                       @"koshercocoa.name.english" : @"Latest Shema (16.1 Degrees)",
                                       @"koshercocoa.explanation.english" : @"the latest time to recite Shema in the morning according to the opinion of the Mogen Avraham  based on alos being 16.1° before sunrise. This time is 3 solar hours after dawn based on the opinion of the MGA that the day is calculated from dawn to nightfall with both being 16.1° below sunrise or sunset."
                                       },
                               NSStringFromSelector(@selector(sofZmanShmaMGA72Minutes)) : @{
                                       @"koshercocoa.name.hebrew" : @"(72 דקות) סוף זמן קריאת שמע",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Shema  (72 Dakos)",
                                       @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Shema (Dakot)",
                                       @"koshercocoa.name.english" : @"Latest Shema (72 Minutes)",
                                       @"koshercocoa.explanation.english" : @"The latest time to recite Shema in the morning according to the opinion of the Mogen Avraham based on alos being 72 minutes before sunrise. This time is 3 shaos solar hours after dawn based on the opinion of the Mogen Avraham that the day is calculated from a dawn of 72 minutes before sunrise to nightfall of 72 minutes after sunset."
                                       },
                               NSStringFromSelector(@selector(sofZmanShmaMGA72MinutesZmanis)) : @{
                                       @"koshercocoa.name.hebrew" : @"(72 דקות זמנית) סוף זמן קריאת שמע",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Shema  (72 Dakos Zmanis)",
                                       @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Shema (72 Dakot Zmanit)",
                                       @"koshercocoa.name.english" : @"Latest Shema (72 Temporal Minutes)",
                                       @"koshercocoa.explanation.english" : @"Latest time to recite Shema in the morning) according to the opinion of the Mogen Avraham based on dawn being 72 temporal minutes, or 1/10th of the day before sunrise. This time is 3 shaos solar hours after dawn based on the opinion of the Mogen Avraham that the day is calculated from a dawn of 72 minutes zmaniyos, or 1/10th of the day before sea level sunrise to nightfall of 72 minutes zmaniyos after sea level sunset."
                                       },
                               NSStringFromSelector(@selector(sofZmanShmaMGA90Minutes)) : @{
                                       @"koshercocoa.name.hebrew" : @"(90 דקות) סוף זמן קריאת שמע",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Shema  (90 Dakos)",
                                       @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Shema (90 Dakot)",
                                       @"koshercocoa.name.english" : @"Latest Shema (90 Minutes)",
                                       @"koshercocoa.explanation.english" : @"The latest time to recite Shema in the morning according to the opinion of the Mogen Avraham based on alos being 90 minutes before sunrise. This time is 3 solar hours after dawn based on the opinion of the Mogen Avraham that the day is calculated from a dawn of 90 minutes before sunrise to nightfall of 90 minutes after sunset."
                                       },
                               NSStringFromSelector(@selector(sofZmanShmaMGA90MinutesZmanis)) : @{
                                       @"koshercocoa.name.hebrew" : @"סוף זמן קריאת שמע (90 דקות זמנית)",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Shema  (90 Dakos)",
                                       @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Shema (90 Dakot)",
                                       @"koshercocoa.name.english" : @"Latest Shema (90 Minutes)",
                                       @"koshercocoa.explanation.english" : @"The latest time to recite Shema in the morning according to the opinion of the MGA based on alos being 90 minutes zmaniyos before sunrise. This time is 3 solar hours after dawn based on the opinion of the Magen Avraham that the day is calculated from a dawn of 90 minutes zmaniyos before sunrise to nightfall of 90 minutes zmaniyos after sunset. "
                                       },
                               NSStringFromSelector(@selector(sofZmanShmaMGA96Minutes)) : @{
                                       @"koshercocoa.name.hebrew" : @"(96 דקות) סוף זמן קריאת שמע",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Shema  (96 Dakos)",
                                       @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Shema (96 Dakot)",
                                       @"koshercocoa.name.english" : @"Latest Shema (96 Minutes)",
                                       @"koshercocoa.explanation.english" : @"The latest time to recite Shema in the morning according to the opinion of the MGA based on alos being 96 minutes before sunrise. This time is 3 shaos zmaniyos solar hours after dawn based on the opinion of the Magen Avraham that the day is calculated from a dawn of 96 minutes before sunrise to nightfall of 96 minutes after sunset. "
                                       },
                               NSStringFromSelector(@selector(sofZmanShmaMGA96MinutesZmanis)) : @{
                                       @"koshercocoa.name.hebrew" : @"סוף זמן קריאת שמע (96 דקות זמנית)",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Shema  (96 Dakos Zmanis)",
                                       @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Shema (96 Dakot Zmanit)",
                                       @"koshercocoa.name.english" : @"Latest Shema (96 Solar Minutes)",
                                       @"koshercocoa.explanation.english" : @"The latest time to recite Shema in the morning according to the opinion of the MGA based on alos being 96 minutes zmaniyos before sunrise. This time is 3 solar hours after dawn based on the opinion of the Magen Avraham that the day is calculated from a dawn of 96 minutes zmaniyos before sunrise to nightfall of 96 minutes zmaniyos after sunset."
                                       },
                               NSStringFromSelector(@selector(sofZmanShma3HoursBeforeChatzos)) : @{
                                       @"koshercocoa.name.hebrew" : @"סוף זמן קריאת שמע (3 שעות לפני חצות)",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Shema  (3 Shaos L'fnei Chatzos)",
                                       @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Shema (3 Sha'ot L'fnei Chatzot)",
                                       @"koshercocoa.name.english" : @"Latest Shema (3 Hours Before Chatzos)",
                                       @"koshercocoa.explanation.english" : @"The latest time to recite Shema in the morning according to the opinion of the Magen Avraham based on alos being 120 minutes or 1/6th of the day before sunrise. This time is 3 solar hours after dawn based on the opinion of the Magen Avraham that the day is calculated from a dawn of 120 minutes before sunrise to nightfall of 120 minutes after sunset. "
                                       },
                               NSStringFromSelector(@selector(sofZmanShmaMGA120Minutes)) : @{
                                       @"koshercocoa.name.hebrew" : @"סוף זמן קריאת שמע (120 דקות)",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Shema  (120 Dakos)",
                                       @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Shema (120 Dakot)",
                                       @"koshercocoa.name.english" : @"Latest Shema (120 Minutes)",
                                       @"koshercocoa.explanation.english" : @"The latest time to recite Shema in the morning according to the opinion of the Magen Avraham based on alos being 120 minutes or 1/6th of the day before sunrise. This time is 3 solar hours after dawn based on the opinion of the Magen Avraham that the day is calculated from a dawn of 120 minutes before sunrise to nightfall of 120 minutes after sunset. "
                                       },
                               NSStringFromSelector(@selector(sofZmanShmaAlos16Point1ToSunset)) : @{
                                       @"koshercocoa.name.hebrew" : @"סוף זמן קריאת שמע (16.1 מעלות עד שקיעה)",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Shema  (16.1 Maalos Ad Shkia)",
                                       @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Shema (16.1 Ma'alot Ad Shkia)",
                                       @"koshercocoa.name.english" : @"Latest Shema (16.1 Degrees to Sunset)",
                                       @"koshercocoa.explanation.english" : @"The latest time to recite Shema in the morning based on the opinion that the day starts at alos 16.1° and ends at sea level sunset. 3 solart hours are calculated based on this day and added to alos to reach this time. This time is 3 solar hours after dawn based on the opinion that the day is calculated from a alos 16.1° to sea level sunset. Note: Based on this calculation chatzos will not be at midday."
                                       },
                               NSStringFromSelector(@selector(sofZmanShmaAlos16Point1ToTzaisGeonim7Point083Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"סוף זמן קריאת שמע (צאת גאונים)",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Shema  (Tzais Geonim)",
                                       @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Shema (Tzait Ge'onim)",
                                       @"koshercocoa.name.english" : @"Latest Shema (Tzais Geonim)",
                                       @"koshercocoa.explanation.english" : @"The latest time to recite Shema in the morning based on the opinion that the day starts at alos 16.1° and ends at tzais 7.083°. 3 solar hours are calculated based on this day and added to alos to reach this time. This time is 3 shaos zmaniyos (temporal hours) after alos 16.1° based on the opinion that the day is calculated from a alos 16.1° to tzais 7.083°. Note: Based on this calculation chatzos will not be at midday."
                                       },
                               
                               /**
                                *    Sof Zman Tfila
                                */
                               
                               NSStringFromSelector(@selector(sofZmanTfilaMogenAvraham))  : @{
                                       @"koshercocoa.name.hebrew" : @"סוף זמן תפילה (מגן אברהם))",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman T'fila (Mogen Avraham)",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation.english" : @"The latest time to recite the morning prayers in the opinion of the Mogen Avraham based on alos being 72 minutes before sunrise. This time is 4 solar hours after dawn based on the opinion of the <em>MGA</em> that the day is calculated from a dawn of 72 minutes before sunrise to nightfall} of 72 minutes after sunset."
                                       },
                               NSStringFromSelector(@selector(sofZmanTfilaGra)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman T'fila (Gr'a)",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation.english" : @"The latest time to recite the morning prayers in the opinion of the Mogen Avraham based on alos being 72 minutes before sunrise. This time is 4 solar hours after dawn based on the opinion of the Mogen Avraham that the day is calculated from a dawn of 72 minutes before sunrise to nightfall of 72 minutes after sunset."
                                       },
                               NSStringFromSelector(@selector(sofZmanTfilaFixedLocal)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation.english" : @"<#explanation#>"
                                       },
                               NSStringFromSelector(@selector(sofZmanTfilaMGA19Point8Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation.english" : @"<#explanation#>"
                                       },
                               NSStringFromSelector(@selector(sofZmanTfilaMGA16Point1Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation.english" : @"<#explanation#>"
                                       },
                               NSStringFromSelector(@selector(sofZmanTfilaMGA72Minutes)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation.english" : @"<#explanation#>"
                                       },
                               NSStringFromSelector(@selector(sofZmanTfilaMGA72MinutesZmanis)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation.english" : @"<#explanation#>"
                                       },
                               NSStringFromSelector(@selector(sofZmanTfilaMGA90Minutes)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation.english" : @"<#explanation#>"
                                       },
                               NSStringFromSelector(@selector(sofZmanTfilaMGA90MinutesZmanis)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation.english" : @"<#explanation#>"
                                       },
                               NSStringFromSelector(@selector(sofZmanTfilaMGA96Minutes)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation.english" : @"<#explanation#>"
                                       },
                               NSStringFromSelector(@selector(sofZmanTfilaMGA96MinutesZmanis)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation.english" : @"<#explanation#>"
                                       },
                               NSStringFromSelector(@selector(sofZmanTfilaMGA120Minutes)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation.english" : @"<#explanation#>"
                                       },
                               NSStringFromSelector(@selector(sofZmanTfila2HoursBeforeChatzos))  : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation.english" : @"<#explanation#>"
                                       },
                               
                               /**
                                *   Chatzos
                                */
                               
                               NSStringFromSelector(@selector(chatzos))  : @{
                                       @"koshercocoa.name.hebrew" : @"חצות",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"Chatzos",
                                       @"koshercocoa.name.transliterated.sepharad" : @"Chatzot",
                                       @"koshercocoa.name.english" : @"Midday",
                                       @"koshercocoa.explanation.english" : @"Midday following the opinion of the GRA that the day for Jewish halachic times start at sea level sunrise and ends at sea level sunset."
                                       },
                               
                               NSStringFromSelector(@selector(fixedLocalChatzos))  : @{
                                       @"koshercocoa.name.hebrew" : @"(חצות (קבוע",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"Chatzos (Kavua)",
                                       @"koshercocoa.name.transliterated.sepharad" : @"Chatzot (Kavu'a)",
                                       @"koshercocoa.name.english" : @"Midday (Fixed Local)",
                                       @"koshercocoa.explanation.english" : @"This time is noon and midnight adjusted from standard time to account for the local latitude. The 360° of the globe divided by 24 calculates to 15° per hour with 4 minutes per degree, so at a longitude of 0 , 15, 30 etc... Chatzos in 12:00 noon. Lakewood, N.J., whose longitude is -74.2094, is 0.7906 away from the closest multiple of 15 at -75°. This is multiplied by 4 to yield 3 minutes and 10 seconds for a chatzos of 11:56:50.  This method is not tied to the theoretical 15° timezones, but will adjust to the actual timezone and Daylight saving time."
                                       },
                               
                               
                               /**
                                *    Mincha Gedola
                                */
                               
                               NSStringFromSelector(@selector(minchaGedola)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation.english" : @"<#explanation#>"
                                       },
                               NSStringFromSelector(@selector(minchaGedola30Minutes)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation.english" : @"<#explanation#>"
                                       },
                               NSStringFromSelector(@selector(minchaGedola72Minutes)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation.english" : @"<#explanation#>"
                                       },
                               NSStringFromSelector(@selector(minchaGedola16Point1Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"Mincha Gedola (16.1 Ma'alot)",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation.english" : @"The the earliest time to pray mincha according to the Mogen Avraham with the day starting and ending 16.1° below the horizon."
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
                                       @"koshercocoa.explanation.english" : @"<#explanation#>"
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
                               
                               /**
                                *    Mincha Ketana
                                */
                               
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
                                       @"koshercocoa.explanation.english" : @"The time of mincha ketana according to the Magen Avraham with the day starting and ending 16.1° below the horizon. This is the perfered earliest time to pray mincha according to the opinion of the Rambam and others. This is calculated as 9.5 solar hours after alos. "
                                       },
                               NSStringFromSelector(@selector(minchaKetana72Minutes)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation.english" : @"<#explanation#>"
                                       },
                               NSStringFromSelector(@selector(minchaKetanaAteretTorah))  : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation.english" : @"<#explanation#>"
                                       },
                               
                               /**
                                *    Plag Hamincha
                                */
                               
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
                                       @"koshercocoa.explanation.english" : @"<#explanation#>"
                                       },
                               NSStringFromSelector(@selector(plagHamincha72Minutes))  : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation.english" : @"<#explanation#>"
                                       },
                               NSStringFromSelector(@selector(plagHamincha72MinutesZmanis)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation.english" : @"<#explanation#>"
                                       },
                               NSStringFromSelector(@selector(plagHamincha90Minutes)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation.english" : @"<#explanation#>"
                                       },
                               NSStringFromSelector(@selector(plagHamincha90MinutesZmanis)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation.english" : @"<#explanation#>"
                                       },
                               NSStringFromSelector(@selector(plagHamincha96Minutes)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation.english" : @"<#explanation#>"
                                       },
                               NSStringFromSelector(@selector(plagHamincha96MinutesZmanis)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation.english" : @"<#explanation#>"
                                       },
                               NSStringFromSelector(@selector(plagHamincha16Point1Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation.english" : @"<#explanation#>"
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
                                       @"koshercocoa.explanation.english" : @"<#explanation#>"
                                       },
                               NSStringFromSelector(@selector(plagHamincha26Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation.english" : @"<#explanation#>"
                                       },
                               NSStringFromSelector(@selector(plagAlosToSunset)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation.english" : @"<#explanation#>"
                                       },
                               NSStringFromSelector(@selector(plagAlos16Point1ToTzaisGeonim7Point083Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation.english" : @"<#explanation#>"
                                       },
                               /**
                                *
                                */
                               
                               NSStringFromSelector(@selector(sunset)) : @{
                                       @"koshercocoa.name.hebrew" : @"שקיעת החמה",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"Shkias Hachama",
                                       @"koshercocoa.name.transliterated.sepharad" : @"Shki'at Hachama",
                                       @"koshercocoa.name.english" : @"Sunset",
                                       @"koshercocoa.explanation.english" : @"The time of sunset, taking elevation into account."
                                       },
                               
                               /**
                                *  Bain Hashmashos
                                */
                               
                               NSStringFromSelector(@selector(bainHashmashosRT13Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation.english" : @"<#explanation#>"
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
                               
                               /**
                                *    Tzais
                                */
                               
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
                                       @"koshercocoa.explanation.english" : @"<#explanation#>"
                                       },
                               NSStringFromSelector(@selector(tzaisGeonim5Point88Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation.english" : @"<#explanation#>"
                                       },
                               NSStringFromSelector(@selector(tzaisGeonim3Point65Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation.english" : @"<#explanation#>"
                                       },
                               NSStringFromSelector(@selector(tzaisGeonim4Point37Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation.english" : @"<#explanation#>"
                                       },
                               NSStringFromSelector(@selector(tzaisGeonim4Point61Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation.english" : @"<#explanation#>"
                                       },
                               NSStringFromSelector(@selector(tzaisGeonim4Point8Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation.english" : @"<#explanation#>"
                                       },
                               NSStringFromSelector(@selector(tzaisGeonim7Point083Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation.english" : @"<#explanation#>"
                                       },
                               NSStringFromSelector(@selector(tzaisGeonim8Point5Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation.english" : @"<#explanation#>"
                                       },
                               NSStringFromSelector(@selector(tzais50)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation.english" : @"<#explanation#>"
                                       },
                               NSStringFromSelector(@selector(tzais60)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation.english" : @"<#explanation#>"
                                       },
                               NSStringFromSelector(@selector(tzaisAteretTorah)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation.english" : @"<#explanation#>"
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
                                       @"koshercocoa.explanation.english" : @"<#explanation#>"
                                       },
                               NSStringFromSelector(@selector(tzais90)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation.english" : @"<#explanation#>"
                                       },
                               NSStringFromSelector(@selector(tzais90Zmanis)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation.english" : @"<#explanation#>"
                                       },
                               NSStringFromSelector(@selector(tzais96)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation.english" : @"<#explanation#>"
                                       },
                               NSStringFromSelector(@selector(tzais96Zmanis)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation.english" : @"<#explanation#>"
                                       },
                               NSStringFromSelector(@selector(tzais120)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation.english" : @"<#explanation#>"
                                       },
                               NSStringFromSelector(@selector(tzais120Zmanis)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation.english" : @"<#explanation#>"
                                       },
                               NSStringFromSelector(@selector(tzais16Point1Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation.english" : @"<#explanation#>"
                                       },
                               NSStringFromSelector(@selector(tzais26Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation.english" : @"<#explanation#>"
                                       },
                               NSStringFromSelector(@selector(tzais18Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation.english" : @"<#explanation#>"
                                       },
                               NSStringFromSelector(@selector(tzais19Point8Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation.english" : @"<#explanation#>"
                                       },
                               
                               
                               /**
                                *    Achilas Chametz
                                */
                               
                               NSStringFromSelector(@selector(sofZmanAchilasChametzGra)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation.english" : @"<#explanation#>"
                                       },
                               NSStringFromSelector(@selector(sofZmanAchilasChametzMGA72Minutes)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation.english" : @"<#explanation#>"
                                       },
                               NSStringFromSelector(@selector(sofZmanAchilasChametzMGA16Point1Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation.english" : @"<#explanation#>"
                                       },
                               
                               /**
                                *    Biur Chametz
                                */
                               
                               NSStringFromSelector(@selector(sofZmanBiurChametzGra)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation.english" : @"<#explanation#>"
                                       },
                               NSStringFromSelector(@selector(sofZmanBiurChametzMGA72Minutes)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation.english" : @"<#explanation#>"
                                       },
                               NSStringFromSelector(@selector(sofZmanBiurChametzMGA16Point1Degrees)) : @{
                                       @"koshercocoa.name.hebrew" : @"",
                                       @"koshercocoa.name.transliterated.ashkenaz" : @"",
                                       @"koshercocoa.name.transliterated.sepharad" : @"",
                                       @"koshercocoa.name.english" : @"",
                                       @"koshercocoa.explanation.english" : @"<#explanation#>"
                                       }
                               };
    }
    
    metadata = data[NSStringFromSelector(self.selector)];
    
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
