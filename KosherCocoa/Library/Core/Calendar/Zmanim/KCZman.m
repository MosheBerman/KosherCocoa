/**
 *  KCZman.m
 *  KosherCocoa 3
 *
 *  Created by Moshe Berman on 4/8/15.
 *
 *  Use of KosherCocoa 3 is governed by the LGPL 2.1 License.
 */

#import "KCZman.h"

NS_ASSUME_NONNULL_BEGIN

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

- (nonnull instancetype)initWithSelector:(nonnull SEL)selector
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
 *  The shortened hebrew name.
 *
 *  @return The short hebrew name of the zman, such as שמע.
 */

- (nonnull NSString *)shortHebrewName
{
    NSInteger index = 0;
    NSString *selector = NSStringFromSelector(self.selector);
    NSArray <NSArray <NSString*>*>* mappings = KCZman.relatedZmanimMapping;
    NSArray <NSString *>* names =  KCZman.shortHebrewNames;
    
    for (NSArray <NSString*> *group in mappings)
    {
        if ([group containsObject:selector])
        {
            index = [mappings indexOfObject:group];
            break;
        }
    }
    
    NSString *name = @"";
    
    if (names.count > index)
    {
        name = names[index];
    }
    
    return name;
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
    return [self _metadataForCurrentZman][@"koshercocoa.name.localized"];
}

/**
 *
 */

- (NSString *)shortEnglishName
{
    NSInteger index = 0;
    NSString *selector = NSStringFromSelector(self.selector);
    NSArray <NSArray <NSString*>*>* mappings = KCZman.relatedZmanimMapping;
    NSArray <NSString *>* names =  KCZman.shortEnglishNames;
    
    for (NSArray <NSString*> *group in mappings)
    {
        if ([group containsObject:selector])
        {
            index = [mappings indexOfObject:group];
            break;
        }
    }
    
    
    
    NSString *name = @"";
    
    if (names.count > index)
    {
        name = names[index];
    }
    
    return name;
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
    return [self _metadataForCurrentZman][@"koshercocoa.explanation.localized"];
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
    
    NSArray* sets = [KCZman relatedZmanimMapping];
    
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
 * A mapping of related calculations.
 *
 *  @return A nested array of zmanim selectors, each group containing related selectors.
 */

+ (NSArray<NSArray<NSString* >* >*)relatedZmanimMapping
{
    /**
     *  All of the related sets
     */
    
    static NSArray* sets = nil;
    
    if (sets == nil)
    {
        
        sets = @[
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
                  *    Sunrise
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
                     NSStringFromSelector(@selector(minchaGedola72Minutes)),
                     NSStringFromSelector(@selector(minchaGedola30Minutes)),
                     NSStringFromSelector(@selector(minchaGedola16Point1Degrees)),
                     NSStringFromSelector(@selector(minchaGedolaGreaterThan30)),
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
    }
    
    return sets;
}

/**
 *  Short Hebrew Names
 */

+ (NSArray <NSString *> *)shortHebrewNames
{
    return @[
             @"ש״ז",
             @"עלות",
             @"משיכיר",
             @"נץ",
             @"סז״ש",
             @"סז״ת",
             @"חצות",
             @"מ״ג",
             @"מ״ק",
             @"פלג",
             @"שקיעה",
             @"ב״ה",
             @"צאת",
             @"סזא״ח",
             @"סזב״ח",
             ];
}

/**
 *  Short English Names
 */

+ (NSArray <NSString *> *)shortEnglishNames
{
    return @[
             @"Hour",
             @"Alot",
             @"Dawn",
             @"Netz",
             @"Shma",
             @"Tfila",
             @"Hatzot",
             @"M'G",
             @"M'K",
             @"Plag",
             @"Shkia",
             @"Twilight",
             @"Tzait",
             @"Eat",
             @"Burn"
             ];
}

/**
 *  Grabs the main zman name, discarding rabbinic opinion.
 *
 *  @param displayName The full display name containing the calculation and rabbinic opinion.
 *
 *  @return The calculation name, stripped of any rabbinic opinion.
 */

- (nonnull NSString *)nameFromDisplayName:(NSString *)displayName
{
    NSString *name = displayName;
    
    /*
     For english-language strings, this should be able to split the strings into two parts.
     */
    
    NSArray *components = [displayName componentsSeparatedByString:@"("];
    
    /**
     For Hebrew text, it's more complicated...
     
     Some strings are typed in the incorrect order, even if they display as "Time (Opinion)"
     This means that:
     
     1. rangeOfString: (or localized variants) won't give consistent results
     2. Splitting by @"(" is sometimes correct, but other times, we want @")"
     3. Even when that does work, we sometimes get an empty component as the first element of that array
     4. Sometimes the opinion and the Time name are flipped.
     5. Sometimes the opinion and time are grouped, because they were flipped.
     
     */
    
    NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(id  _Nullable evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {
        NSString *string = evaluatedObject;
        
        return string.length > 0;
    }];
    
    /** Handle empty components entry. (case 3) */
    components = [components filteredArrayUsingPredicate:predicate];
    
    /** Handle grouped time and opinion (case 5) */
    if (components.count != 2)
    {
        /** Handle flipped time & opinion. (case 4) */
        components = [[[displayName componentsSeparatedByString:@")"] reverseObjectEnumerator] allObjects];
        
        /** Handle empty components entry. (case 3) */
        components = [components filteredArrayUsingPredicate:predicate];
    }
    
    name = components[0];
    
    /** In all cases trim whitespace. */
    name = [name stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    return name;
}

/**
 *  Grabs the rabbinic opinion from display name.
 *
 *  @param displayName The full display name containing the calculation and rabbinic opinion.
 *
 *  @return The calculation name, without the calculation name.
 */

- (nullable NSString *)rabbinicOpinionFromDisplayName:(NSString *)displayName
{
    NSString *opinion = @"";
    NSCharacterSet *parenthesis = [NSCharacterSet characterSetWithCharactersInString:@"()"];
    
    /**
     Because of the complexities outlined in `nameFromDisplayName:`,
     we need to do some manual labor here...
     
     We can't get the rabbinic opinion by replacing the name with an empty string,
     then trimming parenthesis and whitespace because the hebrew word for degrees "מעלות"
     contains the word for dawn: עלות.
     */
    
    NSString *name = displayName;
    
    /*
     For english-language strings, this should be able to split the strings into two parts.
     */
    
    NSArray *components = [displayName componentsSeparatedByString:@"("];
    
    /**
     For Hebrew text, it's more complicated...
     
     Some strings are typed in the incorrect order, even if they display as "Time (Opinion)"
     This means that:
     
     1. rangeOfString: (or localized variants) won't give consistent results
     2. Splitting by @"(" is sometimes correct, but other times, we want @")"
     3. Even when that does work, we sometimes get an empty component as the first element of that array
     4. Sometimes the opinion and the Time name are flipped.
     5. Sometimes the opinion and time are grouped, because they were flipped.
     
     */
    
    NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(id  _Nullable evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {
        NSString *string = evaluatedObject;
        
        return string.length > 0;
    }];
    
    /** Handle empty components entry. (case 3) */
    components = [components filteredArrayUsingPredicate:predicate];
    
    /** Handle grouped time and opinion (case 5) */
    if (components.count != 2)
    {
        /** Handle flipped time & opinion. (case 4) */
        components = [[[displayName componentsSeparatedByString:@")"] reverseObjectEnumerator] allObjects];
        
        /** Handle empty components entry. (case 3) */
        components = [components filteredArrayUsingPredicate:predicate];
    }
    
    /** 
     If there's no opinion, there will be only one component
     at this point. We'll want to skip in this case.
     */
    if (components.count > 1)
    {
        name = components.lastObject;
        
        /** Some strings will have an extra parenthesis at this point.*/
        name = [name stringByTrimmingCharactersInSet:parenthesis];
        
        /** In all cases trim whitespace. */
        name = [name stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        opinion = name;
    }
    return opinion;
}

/**
 *  The list of zmanim metadata.
 *
 *  @return An NSDictionary containing data for all of the zmanim.
 */

+ (NSDictionary<NSString*,NSDictionary<NSString*, NSString*>*>*)metadata
{
    
    static NSDictionary *data = nil;
    
    if (data == nil)
    {
        data = @{
                 NSStringFromSelector(@selector(shaahZmanisMogenAvraham)) : @{
                         @"koshercocoa.name.hebrew" : @"שעה זמנית (מ״א)",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Sha'ah Zmanis (Mogen Avraham)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Sha'ah Zmanit (Mogen Avraham)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Temporal Hour (Mogen Avraham)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"A temporal hour according to the opinion of the Mogen Avraham. This calculation divides the day based on the opinion of the Mogen Avraham that the day runs from dawn to dusk (for Sof Zman Shema and Sof Zman Tefila). Dawn for this calculation is 72 minutes before sunrise and dusk is 72 minutes after sunset. This day is split into 12 equal parts with each part being a temporal hour.", @"")
                         },
                 
                 NSStringFromSelector(@selector(shaahZmanisGra)) : @{
                         @"koshercocoa.name.hebrew" : @"שעה זמנית (גר״א)",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Sha'ah Zmanis (Vilna Gaon)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Sha'ah Zmanit (Vilna Gaon)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Temporal Hour (Vilna Gaon)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"A temporal hour according to the opinion of the Gra and the Baal Hatanya. This calculation divides the day based on the opinion of the GRA and the Baal Hatanya that the day runs from sunrise to sunset. The calculations are based on a day from sea level sunrise to sea level sunset. The day is split into 12 equal parts with each one being a shaah zmanis. An explanation and detailed sources for not using elevation for anything besides sunrise and sunset can be found in Zmanim Kehilchasam (second edition published in 2007) by Rabbi Dovid Yehuda Bursztyn chapter 2. (pages 186-187)", @"")
                         },
                 NSStringFromSelector(@selector(shaahZmanis16Point1Degrees)) : @{
                         @"koshercocoa.name.hebrew" : @"שעה זמנית (16.1 מעלות)",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Sha'ah Zmanis (16.1 Maalos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Sha'ah Zmanit (16.1 Maalot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Temporal Hour (16.1 Degrees)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"A temporal hour calculated using a 16.1 degree dip. This calculation divides the day based on the opinion that the day runs from dawn to dusk. Dawn for this calculation is when the sun is 16.1 degrees below the eastern geometric horizon before sunrise. Dusk for this is when the sun is 16.1 degrees below the western geometric horizon after sunset. This day is split into 12 equal parts with each part being a temporal hour.", @"")
                         },
                 NSStringFromSelector(@selector(shaahZmanis18Degrees)) : @{
                         @"koshercocoa.name.hebrew" : @"שעה זמנית (18 מעלות)",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Sha'ah Zmanis (18 Ma'alos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Sha'ah Zmanit (18 Ma'alot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Temporal Hour (18 Degrees)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"A temporal hour calculated using an 18 degree dip. This calculation divides the day based on the opinion of the Mogen Avraham that the day runs from dawn to dusk. Dawn for this calculation is when the sun is 18 degrees below the eastern geometric horizon before sunrise. Dusk for this is when the sun is 18 degrees below the western geometric horizon after sunset. This day is split into 12 equal parts with each part being a temporal hour.", @"")
                         },
                 NSStringFromSelector(@selector(shaahZmanis19Point8Degrees)) : @{
                         @"koshercocoa.name.hebrew" : @"שעה זמנית (19.8 מעלות)",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Sha'ah Zmanis (19.8 Ma'alos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Sha'ah Zmanit (19.8 Ma'alot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Temporal Hour (19.8 Degrees)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"A temporal hour calculated using a 19.8 degree dip. This calculation divides the day based on the opinion of the Mogen Avraham that the day runs from dawn to dusk. Dawn for this calculation is when the sun is 19.8 degrees below the eastern geometric horizon before sunrise. Dusk for this is when the sun is 19.8 degrees below the western geometric horizon after sunset. This day is split into 12 equal parts with each part being a temporal hour.", @"")
                         },
                 NSStringFromSelector(@selector(shaahZmanis26Degrees)) : @{
                         @"koshercocoa.name.hebrew" : @"שעה זמנית (26 מעלות)",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Sha'ah Zmanis (26 Ma'alos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Sha'ah Zmanit (26 Ma'alot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Temporal Hour (26 Degrees)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"Temporal hour calculated using a 26 degree dip. This calculation divides the day based on the opinion of the Mogen Avraham that the day runs from dawn to dusk. Dawn for this calculation is when the sun is 26 degrees below the eastern geometric horizon before sunrise. Dusk for this is when the sun is 26 degree below the western geometric horizon after sunset. This day is split into 12 equal parts with each part being a temporal hour.", @"")
                         },
                 NSStringFromSelector(@selector(shaahZmanis60Minutes)) : @{
                         @"koshercocoa.name.hebrew" : @"שעה זמנית (60 דקות)",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Sha'ah Zmanis (60 Dakos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Sha'ah Zmanit (60 Dakot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Temporal Hour (60 Minutes)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"Temporal hour according to the opinion of the Mogen Avraham. This calculation divides the day based on the opinion of the Mogen Avraham that the day runs from dawn to dusk. Dawn for this calculation is 60 minutes before sunrise and dusk is 60 minutes after sunset. This day is split into 12 equal parts with each part being a temporal hour.", @"")
                         },
                 NSStringFromSelector(@selector(shaahZmanis72Minutes)) : @{
                         @"koshercocoa.name.hebrew" : @"שעה זמנית (72 דקות)",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Sha'ah Zmanis (72 Dakos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Sha'ah Zmanit (72 Dakot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Temporal Hour (72 Minutes)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"Temporal hour according to the opinion of the Mogen Avraham. This calculation divides the day based on the opinion of the Mogen Avraham that the day runs from dawn to dusk. Dawn for this calculation is 72 minutes before sunrise and dusk is 72 minutes after sunset. This day is split into 12 equal parts with each part being a temporal hour.", @"")
                         },
                 NSStringFromSelector(@selector(shaahZmanis72MinutesZmanis)) : @{
                         @"koshercocoa.name.hebrew" : @"שעה זמנית (72 דקות זמנית)",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Sha'ah Zmanis (72 Dakos Zmaniyos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Sha'ah Zmanit (72 Dakot Zmaniyot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Temporal Hour (72 Temporal Minutes)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"Temporal hour according to the opinion of the Mogen Avraham based on alos being 72 minutes zmaniyos before sunrise. This calculation divides the day based on the opinion of the Mogen Avraham that the day runs from dawn to dusk. Dawn for this calculation is 72 minutes zmaniyos before sunrise and dusk is 72 minutes zmaniyos after sunset. This day is split into 12 equal parts with each part being a shaah zmanis. This is identical to 1/10th of the day from sunrise to sunset.", @"")
                         },
                 NSStringFromSelector(@selector(shaahZmanis90Minutes)) : @{
                         @"koshercocoa.name.hebrew" : @"שעה זמנית (90 דקות)",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Sha'ah Zmanis (90 Dakos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Sha'ah Zmanit (90 Dakot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Temporal Hour (90 Minutes)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"Temporal hour calculated using a dip of 90 minutes. This calculation divides the day based on the opinion of the Mogen Avraham that the day runs from dawn to dusk. Dawn for this calculation is 90 minutes before sunrise and dusk is 90 minutes after sunset. This day is split into 12 equal parts with each part being a shaah zmanis.", @"")
                         },
                 NSStringFromSelector(@selector(shaahZmanis90MinutesZmanis)) : @{
                         @"koshercocoa.name.hebrew" : @"שעה זמנית (90 דקות זמנית)",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Sha'ah Zmanis (90 Dakos Zmaniyos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Sha'ah Zmanit (90 Dakot Zmaniyot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Temporal Hour (90 Temporal Minutes)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"Temporal hour according to the opinion of the Mogen Avraham based on alos being 90 minutes zmaniyos before sunrise. This calculation divides the day based on the opinion of the Mogen Avraham that the day runs from dawn to dusk. Dawn for this calculation is 90 minutes zmaniyos before sunrise and dusk is 90 minutes zmaniyos after sunset. This day is split into 12 equal parts with each part being a shaah zmanis. This is identical to 1/8th of the day from sunrise to sunset.", @"")
                         },
                 NSStringFromSelector(@selector(shaahZmanis96Minutes)) : @{
                         @"koshercocoa.name.hebrew" : @"שעה זמנית (96 דקות)",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Sha'ah Zmanis (96 Dakos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Sha'ah Zmanit (96 Dakot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Temporal Hour (96 Minutes)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"Temporal hour calculated using a dip of 96 minutes. This calculation divides the day based on the opinion of the Mogen Avraham that the day runs from dawn to dusk. Dawn for this calculation is 96 minutes before sunrise and dusk is 96 minutes after sunset. This day is split into 12 equal parts with each part being a shaah zmanis.", @"")
                         },
                 NSStringFromSelector(@selector(shaahZmanis96MinutesZmanis)) : @{
                         @"koshercocoa.name.hebrew" : @"שעה זמנית (96 דקות זמנית)",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Sha'ah Zmanis (96 Dakos Zmaniyos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Sha'ah Zmanit (96 Dakot Zmaniyot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Temporal Hour (96 Temporal Minutes)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"Temporal hour according to the opinion of the Mogen Avraham based on alos being 96 minutes zmaniyos before sunrise. This calculation divides the day based on the opinion of the Mogen Avraham that the day runs from dawn to dusk. Dawn for this calculation is 96 minutes zmaniyos before sunrise and dusk is 96 minutes zmaniyos after sunset. This day is split into 12 equal parts with each part being a shaah zmanis. This is identical to 1/7.5th of the day from sunrise to sunset.", @"")
                         },
                 NSStringFromSelector(@selector(shaahZmanisAteretTorah)) : @{
                         @"koshercocoa.name.hebrew" : @"שעה זמנית (עטרת תורה)",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Sha'ah Zmanis (Ateret Torah)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Sha'ah Zmanit (Ateret Torah)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Temporal Hour (Ateret Torah)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"Temporal hour according to the opinion of the Chacham Yosef Harari-Raful of Yeshivat Ateret Torah calculated with alos being 1/10th of sunrise to sunset day, or 72 minutes zmaniyos of such a day before sunrise, and tzais is usually calculated as 40 minutes (configurable to any offset by modifying AteretTorahSunsetOffset) after sunset. This day is split into 12 equal parts with each part being a shaah zmanis. Note that with this system, mid-day) will not be the point that the sun is halfway across the sky.", @"")
                         },
                 NSStringFromSelector(@selector(shaahZmanis120Minutes)) : @{
                         @"koshercocoa.name.hebrew" : @"שעה זמנית (120 דקות)",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Sha'ah Zmanis (120 Dakos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Sha'ah Zmanit (120 Dakot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Temporal Hour (120 Minutes)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"A temporal hour calculated using a dip of 120 minutes. This calculation divides the day based on the opinion of the Mogen Avraham that the day runs from dawn to dusk. Dawn for this calculation is 120 minutes before sunrise and dusk is 120 minutes after sunset. This day is split into 12 equal parts with each part being a temporal-hour.", @"")
                         },
                 NSStringFromSelector(@selector(shaahZmanis120MinutesZmanis)) : @{
                         @"koshercocoa.name.hebrew" : @"שעה זמנית (120 דקות זמנית)",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Sha'ah Zmanis (120 Dakos Zmaniyos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Sha'ah Zmanit (120 Dakot Zmaniyot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Temporal Hour (120 Temporal Minutes)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"Plag hamincha based on sunrise being 120 minutes zmaniyos (GRA and the Baal Hatanya) or 1/6th of the day before sea level sunrise. This is calculated as 10.75 hours after dawn.", @"")
                         },
                 /**
                  *    Alos
                  */
                 
                 NSStringFromSelector(@selector(alos72)) : @{
                         @"koshercocoa.name.hebrew" : @"(עלות (72 דקות",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Alos HaShachar (72 Dakos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Alot HaShachar (72 Dakot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Dawn (72 minutes)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"Dawn calculated using 72 minutes before sunrise at sea level (no adjustment for elevation) based on the time to walk the distance of 4 Mil at 18 minutes a Mil. This is based on the opinion of most Rishonim who stated that the Neshef (time between dawn and sunrise) does not vary by year or location but purely depends on the time it takes to walk the istance of 4 Mil.", @"")
                         },
                 NSStringFromSelector(@selector(alos60)) : @{
                         @"koshercocoa.name.hebrew" : @"(עלות (60 דקות",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Alos HaShachar (60 Dakos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Alot HaShachar (60 Dakot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Dawn (60 Minutes)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"Dawn calculated as 60 minutes before sea level sunrise. This is the time to walk the distance of 4 Mil at 15 minutes a Mil (the opinion of the Chavas Yair. See the Divray Malkiel). Time based offset calculations for alos are based on the opinion of most Rishonim who stated that the Neshef (time between dawn and sunrise) does not vary by year or location but purely depends on the time it takes to walk the distance of 4 Mil.", @"")
                         },
                 NSStringFromSelector(@selector(alos72Zmanis)) : @{
                         @"koshercocoa.name.hebrew" : @"(עלות (72 דקות זמניות",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Alos HaShachar (72 Dakos Zmaniyos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Alot HaShachar (72 Dakot Zmaniyot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Dawn (72 Temporal Minutes)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"Dawn calculated using 72 minutes zmaniyos (GRA and the Baal Hatanya) or 1/10th of the day before sea level sunrise. This is based on an 18 minute Mil so the time for 4 Mil is 72 minutes which is 1/10th of a day (12 * 60 = 720) based on the day starting at sea level sunrise and ending at sea level sunset. This calculation is used in the calendars published by Hisachdus Harabanim D'Artzos Habris Ve'Canada.", @"")
                         },
                 NSStringFromSelector(@selector(alos90)) : @{
                         @"koshercocoa.name.hebrew" : @"(עלות (90 דקות",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Alos HaShachar (90 Dakos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Alot HaShachar (90 Dakot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Dawn (90 Minutes)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"Dawn calculated using 90 minutes before sea level sunrise based on the time to walk the distance of 4 Mil at 22.5 minutes a Mil. Time based offset calculations for alos are based on the opinion of most Rishonim who stated that the Neshef (time between dawn and sunrise) does not vary by year or location but purely depends on the time it takes to walk the distance of 4 Mil.", @"")
                         },
                 NSStringFromSelector(@selector(alos90Zmanis)) : @{
                         @"koshercocoa.name.hebrew" : @"(עלות (90 דקות זמניות",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Alos HaShachar (90 Dakos Zmaniyos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Alot HaShachar (90 Dakot Zmaniyot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Dawn (90 Temporal Minutes)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"Dawn calculated using 90 minutes zmaniyos (GRA and the Baal Hatanya) or 1/8th of the day before sea level sunrise. This is based on a 22.5 minute Mil so the time for 4 Mil is 90 minutes which is 1/8th of a day (12 * 60) / 8 = 90 based on the day starting at sunrise and ending at sunset.", @"")
                         },
                 NSStringFromSelector(@selector(alos96)) : @{
                         @"koshercocoa.name.hebrew" : @"(עלות (96 דקות",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Alos HaShachar (96 Dakos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Alot HaShachar (96 Dakot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Dawn (96 Minutes)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"Dawn calculated using 96 minutes before sea level sunrise based on the time to walk the distance of 4 Mil at 24 minutes a Mil. Time based offset calculations for alos are based on the opinion of most Rishonim who stated that the Neshef (time between dawn and sunrise) does not vary by year or location but purely depends on the time it takes to walk the distance of 4 Mil.", @"")
                         },
                 NSStringFromSelector(@selector(alos96Zmanis)) : @{
                         @"koshercocoa.name.hebrew" : @"(עלות (96 דקות זמניות",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Alos HaShachar (96 Dakos Zmaniyos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Alot HaShachar (96 Dakot Zmaniyot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Dawn (96 Temporal Minutes)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"Dawn calculated using 96 minutes zmaniyos (GRA and the Baal Hatanya) or 1/8th of the day before sea level sunrise. This is based on a 24 minute Mil so the time for 4 Mil is 96 minutes which is 1/7.5th of a day (12 * 60) / 7.5 = 96 based on the day starting at sunrise and ending at sunset.", @"")
                         },
                 NSStringFromSelector(@selector(alos120)) : @{
                         @"koshercocoa.name.hebrew" : @"(עלות (120 דקות",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Alos HaShachar (120 Dakos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Alot HaShachar (120 Dakot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Dawn (120 Minutes)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"Dawn calculated using 120 minutes before sea level sunrise based on the time to walk the distance of 5 Mil at 24 minutes a Mil. (No adjustment for elevation is made.) Time based offset calculations for alos are based on the opinion of most Rishonim who stated that the Neshef (time between dawn and sunrise) does not vary by year or location but purely depends on the time it takes to walk the distance of 5 Mil.", @"")
                         },
                 NSStringFromSelector(@selector(alos120Zmanis)) : @{
                         @"koshercocoa.name.hebrew" : @"(עלות (120 דקות זמניות",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Alos HaShachar (120 Dakos Zmaniyos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Alot HaShachar (120 Dakot Zmaniyot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Dawn (120 Temporal Minutes)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"Dawn calculated using 120 minutes zmaniyos (GRA and the Baal Hatanya) or 1/6th of the day before sea level sunrise. This is based on a 24 minute Mil so the time for 5 Mil is 120 minutes which is 1/6th of a day (12 * 60) / 6 = 120 based on the day starting at sunrise and ending at sunset.", @"")
                         },
                 
                 NSStringFromSelector(@selector(alos26Degrees)) : @{
                         @"koshercocoa.name.hebrew" : @"(עלות (96 מעלות",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Alos HaShachar (26 Ma'alot)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Alot HaShachar (26 Ma'alot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Dawn (26 Degrees)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"Dawn calculated when the sun is 26° below the eastern geometric horizon before sunrise. This calculation is based on the same calculation of 120 minutes but uses a degree based calculation instead of 120 exact minutes. This calculation is based on the position of the sun 120 minutes before sunrise in Jerusalem during the equinox which calculates to 26° below geometric zenith.", @"")
                         },
                 NSStringFromSelector(@selector(alos18Degrees)) : @{
                         @"koshercocoa.name.hebrew" : @"(עלות (18 מעלות",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Alos HaShachar (18 Ma'alot)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Alot HaShachar (18 Ma'alot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Dawn (18 Degrees)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"Dawn calculated when the sun is 18° below the eastern geometric horizon before sunrise.", @"")
                         },
                 NSStringFromSelector(@selector(alos19Point8Degrees)) : @{
                         @"koshercocoa.name.hebrew" : @"(עלות (19.8 מעלות",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Alos HaShachar (19.8 Ma'alot)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Alot HaShachar (19.8 Ma'alot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Dawn (19.8 Degrees)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"Dawn calculated when the sun is 19.8° below the eastern geometric horizon before sunrise. This calculation is based on the same calculation of 90 minutes but uses a degree based calculation instead of 90 exact minutes. This calculation is based on the position of the sun 90 minutes before sunrise in Jerusalem during the equinox which calculates to 19.8° below geometric zenith", @"")
                         },
                 NSStringFromSelector(@selector(alos16Point1Degrees)) : @{
                         @"koshercocoa.name.hebrew" : @"(עלות (16.1 מעלות",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Alos HaShachar (16.1 Ma'alot)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Alot HaShachar (16.1 Ma'alot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Dawn (16.1 Degrees)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"Dawn calculated when the sun is 16.1° below the eastern geometric horizon before sunrise. This calculation is based on the same calculation of 72 minutes but uses a degree based calculation instead of 72 exact minutes. This calculation is based on the position of the sun 72 minutes before sunrise in Jerusalem during the equinox which calculates to 16.1° below geometric zenith.", @"")
                         },
                 
                 /**
                  *    Misheyakir
                  */
                 
                 NSStringFromSelector(@selector(misheyakir10Point2Degrees)) : @{
                         @"koshercocoa.name.hebrew" : @"(משיכיר (10.2 מעלות",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Misheyakir (10.2 Ma'alos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Misheyakir (10.2 Ma'alot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Misheyakir (10.2 Degrees)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"The misheyakir based on the position of the sun when it is 10.2° below geometric zenith (90°). This calculation is based on the position of the sun 45 minutes before sunrise in Jerusalem during the equinox which calculates to 10.2° below geometric zenith.\n\nThis can't be computed in some areas such as northern and southern locations even south of the Arctic Circle and north of the Antarctic Circle, because the sun may not reach low enough below the horizon.", @"")
                         },
                 NSStringFromSelector(@selector(misheyakir11Degrees)) : @{
                         @"koshercocoa.name.hebrew" : @"(משיכיר (11 מעלות",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Misheyakir (11 Ma'alos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Misheyakir (11 Ma'alot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Misheyakir (11 Degrees)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"The misheyakir based on the position of the sun when it is 11° below geometric zenith (90°). This calculation is based on the position of the sun 48 minutes before sunrise in Jerusalem during the equinox which calculates to 11° below geometric zenith.\n\nThis can't be computed in some areas such as northern and southern locations even south of the Arctic Circle and north of the Antarctic Circle,because the sun may not reach low enough below the horizon.", @"")
                         },
                 NSStringFromSelector(@selector(misheyakir11Point5Degrees)) : @{
                         @"koshercocoa.name.hebrew" : @"(משיכיר (11.5 מעלות",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Misheyakir (11.5 Ma'alos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Misheyakir (11.5 Ma'alot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Misheyakir (11.5 Degrees)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"The misheyakir based on the position of the sun when it is 11.5° below geometric zenith (90°). This calculation is based on the position of the sun 52 minutes before sunrise in Jerusalem during the equinox which calculates to 11.5° below geometric zenith.\n\nThis can't be computed in some areas such as northern and southern locations even south of the Arctic Circle and north of the Antarctic Circle, because the sun may not reach low enough below the horizon.", @"")
                         },
                 NSStringFromSelector(@selector(misheyakirAteretTorahWithMinutes:)) : @{
                         @"koshercocoa.name.hebrew" : @"משיכיר (עטרת תורה)",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Misheyakir (Ateret Torah)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Misheyakir (Ateret Torah)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"First Sunlight (Ateret Torah)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"The misheyakir as an offset the Alos 72 minutes, zmanis calculation.", @"")
                         },
                 /**
                  *   Sunrise
                  */
                 
                 NSStringFromSelector(@selector(sunrise)) : @{
                         @"koshercocoa.name.hebrew" : @"נץ החמה",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Naitz Hachama",
                         @"koshercocoa.name.transliterated.sepharad" : @"Netz Hachama",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Sunrise", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"Sunrise at the current location. The zenith used for the calculation uses geometric zenith of 90 degrees plus elevation. This is adjusted to add approximately 50/60 of a degree to account for 34 archminutes of refraction and 16 archminutes for the sun's radius for a total of 90.83333 degrees.", @"")
                         },
                 
                 /**
                  *    Sof Zman Shma
                  */
                 
                 NSStringFromSelector(@selector(sofZmanShmaGra)) : @{
                         @"koshercocoa.name.hebrew" : @"(סוף זמן קריאת שמע (גר״א",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Krias Shema (Vilna Gaon)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Kriat Shema (Vilna Gaon)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Latest Shema (Vilna Gaon)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"The latest zman krias shema (time to recite Shema in the morning). This time is 3 shaos zmaniyos (solar hours) after sea level sunrise based on the opinion of the GRA and the Baal Hatanya that the day is calculated from sunrise to sunset.", @"")
                         },
                 NSStringFromSelector(@selector(sofZmanShmaMogenAvraham)) : @{
                         @"koshercocoa.name.hebrew" : @"(סוף זמן קריאת שמע (מ״א",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Krias Shema (Mogen Avraham)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Kriat Shema (Mogen Avraham)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Latest Shema (Mogen Avraham)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"The latest zman krias shema (time to recite shema in the morning) in the opinion of the MGA based on alos being 72 minutes before sunrise. This time is 3 shaos zmaniyos (solar hours) after dawn based on the opinion of the Mogen Avraham that the day is calculated from a dawn of 72 minutes before sunrise to nightfall of 72 minutes after sunset.", @"")
                         },
                 NSStringFromSelector(@selector(sofZmanShmaFixedLocal)) : @{
                         @"koshercocoa.name.hebrew" : @"סוף זמן קריאת שמע (קבוע)",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Krias Shema (Kavua)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Kriat Shema (Kavua)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Latest Shema (Fixed Local)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"The latest zman krias shema (time to recite Shema in the morning) calculated as 3 hours before fixed local chatzos.", @"")
                         },
                 
                 NSStringFromSelector(@selector(sofZmanShmaMGA19Point8Degrees)) : @{
                         @"koshercocoa.name.hebrew" : @"(סוף זמן קריאת שמע  (מ״א 19.8 מעלות",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Krias Shema (M'A 19.8 Ma'alos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Kriat Shema (M'A 19.8 Ma'alot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Latest Shema (M'A 19.8 Degrees)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"The latest zman krias shema (time to recite Shema in the morning) according to the opinion of the MGA based on alos being 19.8° before sunrise. This time is 3 shaos zmaniyos (solar hours) after dawn based on the opinion of the MGA that the day is calculated from dawn to nightfall with both being 19.8° below sunrise or sunset.", @"")
                         },
                 NSStringFromSelector(@selector(sofZmanShmaMGA16Point1Degrees)) : @{
                         @"koshercocoa.name.hebrew" : @"(סוף זמן קריאת שמע  (מ״א 16.1 מעלות",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Krias Shema (M'A 16.1 Ma'alos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Kriat Shema (M'A 16.1 Ma'alot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Latest Shema (M'A 16.1 Degrees)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"The latest zman krias shema (time to recite Shema in the morning) according to the opinion of the MGA based on alos being 16.1° before sunrise. This time is 3 shaos zmaniyos (solar hours) after dawn based on the opinion of the MGA that the day is calculated from dawn to nightfall with both being 16.1° below sunrise or sunset.", @"")
                         },
                 NSStringFromSelector(@selector(sofZmanShmaMGA72Minutes)) : @{
                         @"koshercocoa.name.hebrew" : @"(סוף זמן קריאת שמע (מ״א 72 דקות",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Krias Shema (M'A 72 Dakos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Kriat Shema (M'A 72 Dakot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Latest Shema (M'A 72 Minutes)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"The latest zman krias shema (time to recite Shema in the morning) according to the opinion of the MGA based on alos being 72 minutes before sunrise. This time is 3 shaos zmaniyos (solar hours) after dawn based on the opinion of the Magen Avraham that the day is calculated from a dawn of 72 minutes before sunrise to nightfall of 72 minutes after sunset. This is an identical time to the MGA.", @"")
                         },
                 NSStringFromSelector(@selector(sofZmanShmaMGA72MinutesZmanis)) : @{
                         @"koshercocoa.name.hebrew" : @"(סוף זמן קריאת שמע (מ״א 72 דקות זמניות",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Krias Shema (M'A 72 Dakos Zmaniyos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Kriat Shema (M'A 72 Dakot Zmaniyot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Latest Shema (M'A 72 Temporal Minutes)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"The latest zman krias shema (time to recite Shema in the morning) according to the opinion of the MGA based on alos being 72 minutes zmaniyos , or 1/10th of the day before sunrise. This time is 3 shaos zmaniyos (solar hours) after dawn based on the opinion of the Magen Avraham that the day is calculated from a dawn of 72 minutes zmaniyos, or 1/10th of the day before sea level sunrise to nightfall of 72 minutes zmaniyos after sea level sunset.", @"")
                         },
                 NSStringFromSelector(@selector(sofZmanShmaMGA90Minutes)) : @{
                         @"koshercocoa.name.hebrew" : @"(סוף זמן קריאת שמע (מ״א 90 דקות",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Krias Shema (M'A 90 Dakos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Kriat Shema (M'A 90 Dakot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Latest Shema (M'A 90 Minutes)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"The latest zman krias shema (time to recite Shema in the morning) according to the opinion of the Magen Avraham based on alos being 90 minutes before sunrise. This time is 3 shaos zmaniyos (solar hours) after dawn based on the opinion of the Magen Avraham that the day is calculated from a dawn of 90 minutes before sunrise to nightfall of 90 minutes after sunset.", @"")
                         },
                 NSStringFromSelector(@selector(sofZmanShmaMGA90MinutesZmanis)) : @{
                         @"koshercocoa.name.hebrew" : @"(סוף זמן קריאת שמע (מ״א 90 דקות זמניות",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Krias Shema (M'A 90 Dakos Zmaniyos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Kriat Shema (M'A 90 Dakot Zmaniyot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Latest Shema (M'A 90 Temporal Minutes)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"The latest zman krias shema (time to recite Shema in the morning) according to the opinion of the MGA based on alos being 90 minutes zmaniyos before sunrise. This time is 3 shaos zmaniyos (solar hours) after dawn based on the opinion of the Magen Avraham that the day is calculated from a dawn of 90 minutes zmaniyos before sunrise to nightfall of 90 minutes zmaniyos after sunset.", @"")
                         },
                 NSStringFromSelector(@selector(sofZmanShmaMGA96Minutes)) : @{
                         @"koshercocoa.name.hebrew" : @"(סוף זמן קריאת שמע (מ״א 96 דקות",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Krias Shema (M'A 96 Dakos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Kriat Shema (M'A 96 Dakot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Latest Shema (M'A 96 Minutes)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"The latest zman krias shema (time to recite Shema in the morning) according to the opinion of the MGA based on alos being 96 minutes before sunrise. This time is 3 shaos zmaniyos (solar hours) after dawn based on the opinion of the Magen Avraham that the day is calculated from a dawn of 96 minutes before sunrise to nightfall of 96 minutes after sunset.", @"")
                         },
                 NSStringFromSelector(@selector(sofZmanShmaMGA96MinutesZmanis)) : @{
                         @"koshercocoa.name.hebrew" : @"(סוף זמן קריאת שמע (מ״א 96 דקות זמניות",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Krias Shema (M'A 96 Dakos Zmaniyos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Kriat Shema (M'A 96 Dakot Zmaniyot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Latest Shema (M'A 96 Temporal Minutes)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"The latest zman krias shema (time to recite Shema in the morning) according to the opinion of the MGA based on alos being 96 minutes zmaniyos before sunrise. This time is 3 shaos zmaniyos (solar hours) after dawn based on the opinion of the Magen Avraham that the day is calculated from a dawn of 96 minutes zmaniyos before sunrise to nightfall of 96 minutes zmaniyos after sunset.", @"")
                         },
                 NSStringFromSelector(@selector(sofZmanShma3HoursBeforeChatzos)) : @{
                         @"koshercocoa.name.hebrew" : @"סוף זמן קריאת שמע (3 שעות לפני חצות)",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Krias Shema (3 Shaos Lifnei Chatzos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Kriat Shema (3 Shaot L'fnei Chatzot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Latest Shema (3 Hours before Chatzot)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"The latest zman krias shema (time to recite Shema in the morning) calculated as 3 hours (regular and not zmaniyos) before chatzos. This is the opinion of the Shach in the Nekudas Hakesef (Yora Deah 184), Shevus Yaakov, Chasam Sofer and others.", @"")
                         },
                 NSStringFromSelector(@selector(sofZmanShmaMGA120Minutes)) : @{
                         @"koshercocoa.name.hebrew" : @"(סוף זמן קריאת שמע (מ״א 9120 דקות",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Krias Shema (M'A 120 Dakos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Kriat Shema (M'A 120 Dakot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Latest Shema (M'A 120 Minutes)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"The latest zman krias shema (time to recite Shema in the morning) according to the opinion of the Magen Avraham based on alos being 120 minutes or 1/6th of the day before sunrise. This time is 3 shaos zmaniyos (solar hours) after dawn based on the opinion of the Magen Avraham that the day is calculated from a dawn of 120 minutes before sunrise to nightfall of 120 minutes after sunset. ", @"")
                         },
                 NSStringFromSelector(@selector(sofZmanShmaAlos16Point1ToSunset)) : @{
                         @"koshercocoa.name.hebrew" : @"סוף זמן קריאת שמע (16.1 לפני שקיעה)",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Krias Shema (16.1 Lifnei Shkiya)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Kriat Shema (16.1 L'fnei Shki'a)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Latest Shema (16.1 Degrees before Sunset)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"The latest zman krias shema (time to recite Shema in the morning) based on the opinion that the day starts at alos 16.1° and ends at sea level sunset. 3 shaos zmaniyos are calculated based on this day and added to alosto reach this time. This time is 3 shaos zmaniyos (solar hours) after dawn based on the opinion that the day is calculated from a alos 16.1° to sea level sunset. Note: Based on this calculation chatzos will not be at midday.", @"")
                         },
                 NSStringFromSelector(@selector(sofZmanShmaAlos16Point1ToTzaisGeonim7Point083Degrees)) : @{
                         @"koshercocoa.name.hebrew" : @"סוף זמן קריאת שמע (16.1 עד צאת גאונים)",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Krias Shema (16.1 Ad Tzais Geonim)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Kriat Shema (16.1 Ad Tzait Ge'onim)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Latest Shema (16.1 Until Gaonic Nightfall)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"The latest zman krias shema (time to recite Shema in the morning) based on the opinion that the day starts at alos 16.1° and ends at tzais 7.083°. 3 shaos zmaniyos are calculated based on this day and added to alos to reach this time. This time is 3 shaos zmaniyos (temporal hours) after alos 16.1° based on the opinion that the day is calculated from a alos 16.1° to tzais 7.083°. Note: Based on this calculation chatzos will not be at midday.", @"")
                         },
                 /**
                  *    Sof Zman Tfila
                  */
                 
                 NSStringFromSelector(@selector(sofZmanTfilaMogenAvraham)) : @{
                         @"koshercocoa.name.hebrew" : @"(סוף זמן תפילה (מ״א",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Tefila (Mogen Avraham)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Tefila (Mogen Avraham)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Latest Tefila (Mogen Avraham)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"The latest zman tfila (time to recite the morning prayers) in the opinion of the MGA based on alos being 72 minutes before sunrise. This time is 4 shaos zmaniyos (temporal hours) after dawn based on the opinion of the MGA that the day is calculated from a dawn} of 72 minutes before sunrise to nightfall} of 72 minutes after sunset.", @"")
                         },
                 NSStringFromSelector(@selector(sofZmanTfilaGra)) : @{
                         @"koshercocoa.name.hebrew" : @"(סוף זמן תפילה (גר״א",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Tefila (Vilna Gaon)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Tefila (Vilna Gaon)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Latest Tefila (Vilna Gaon)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"The latest zman tefilah (time to recite the morning prayers). This time is 4 hours into the day based on the opinion of the GRA and the Baal Hatanya that the day is calculated from sunrise to sunset.", @"")
                         },
                 NSStringFromSelector(@selector(sofZmanTfilaFixedLocal)) : @{
                         @"koshercocoa.name.hebrew" : @"(סוף זמן תפילה (קבוע",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Tefila (Kavua)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Tefila (Kavua)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Latest Tefila (Fixed Local)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"The latest zman tfila (time to recite the morning prayers) calculated as 2 hours before fixed local midday.", @"")
                         },
                 NSStringFromSelector(@selector(sofZmanTfilaMGA19Point8Degrees)) : @{
                         @"koshercocoa.name.hebrew" : @"(סוף זמן תפילה (מ״א 19.8 מעלות",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Tefila (M'A 19.8 Ma'alos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Tfila (M'A 19.8 Ma'alot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"The latest ime to recite the morning prayers (M'A 19.8 Degrees)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"The latest zman tfila (time to recite the morning prayers) according to the opinion of the Magen Avraham based on alos being 19.8° before sunrise. This time is 4 shaos zmaniyos (solar hours) after dawn based on the opinion of the Magen Avraham that the day is calculated from dawn to nightfall with both being 19.8° below sunrise or sunset. Calculated as four 19.8º solar hours after dawn.", @"")
                         },
                 NSStringFromSelector(@selector(sofZmanTfilaMGA16Point1Degrees)) : @{
                         @"koshercocoa.name.hebrew" : @"(סוף זמן תפילה  (מ״א 16.1 מעלות",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Tefila (M'A 16.1 Ma'alos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Tfila (M'A 16.1 Ma'alot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Latest Tefila (M'A 16.1 Degrees)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"The latest zman tfila (time to recite the morning prayers) according to the opinion of the Magen Avraham based on alos being 16.1° before sunrise. This time is 4 shaos zmaniyos (solar hours) after dawn based on the opinion of the Magen Avraham that the day is calculated from dawn to nightfall with both being 16.1° below sunrise or sunset. Calculated as four 16.1º solar hours after dawn.", @"")
                         },
                 NSStringFromSelector(@selector(sofZmanTfilaMGA72Minutes)) : @{
                         @"koshercocoa.name.hebrew" : @"(סוף זמן תפילה (מ״א 72 דקות",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Tefila (M'A 72 Dakos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Tfila (M'A72 Dakot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Latest Tefila M'A 72 Minutes)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"The latest zman tfila (time to recite the morning prayers) according to the opinion of the Magen Avraham based on alos being 72 minutes before sunrise. This time is 4 shaos zmaniyos (solar hours) after dawn based on the opinion of the Magen Avraham that the day is calculated from a dawn of 72 minutes before sunrise to nightfall of 72 minutes after sunset. Calculated as for 72 minute solar hours after dawn.", @"")
                         },
                 NSStringFromSelector(@selector(sofZmanTfilaMGA72MinutesZmanis)) : @{
                         @"koshercocoa.name.hebrew" : @"(סוף זמן תפילה (מ״א 72 דקות זמניות",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Tefila (M'A 72 Dakos Zmaniyos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Tfila (M'A72 Dakot Zmaniyot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Latest Tefila (M'A 72 Temporal Minutes)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"The latest zman tfila (time to the morning prayers) according to the opinion of the Magen Avraham based on alos being 72 minutes zmaniyos before sunrise. This time is 4 shaos zmaniyos (solar hours) after dawn based on the opinion of the Magen Avraham that the day is calculated from a dawn of 72 minutes zmaniyos before sunrise to nightfall of 72 minutes zmaniyos after sunset.", @"")
                         },
                 NSStringFromSelector(@selector(sofZmanTfilaMGA90Minutes)) : @{
                         @"koshercocoa.name.hebrew" : @"(סוף זמן תפילה (מ״א 90 דקות",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Tefila (M'A 90 Dakos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Tfila (M'A90 Dakot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Latest Tefila M'A 90 Minutes)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"The latest zman tfila (time to recite the morning prayers) according to the opinion of the Magen Avraham based on alos being 90 minutes before sunrise. This time is 4 shaos zmaniyos (solar hours) after dawn based on the opinion of the Magen Avraham that the day is calculated from a dawn of 90 minutes before sunrise to nightfall of 90 minutes after sunset.", @"")
                         },
                 NSStringFromSelector(@selector(sofZmanTfilaMGA90MinutesZmanis)) : @{
                         @"koshercocoa.name.hebrew" : @"(סוף זמן תפילה (מ״א 90 דקות זמניות",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Tefila (M'A 90 Dakos Zmaniyos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Tfila (M'A 90 Dakot Zmaniyot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Latest Tefila (M'A 90 Temporal Minutes)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"The latest zman tfila (time to the morning prayers) according to the opinion of the Magen Avraham based on alos being 90 minutes zmaniyos before sunrise. This time is 4 shaos zmaniyos (solar hours) after dawn based on the opinion of the Magen Avraham that the day is calculated from a dawn of 90 minutes zmaniyos before sunrise to nightfall of 90 minutes zmaniyos after sunset.", @"")
                         },
                 NSStringFromSelector(@selector(sofZmanTfilaMGA96Minutes)) : @{
                         @"koshercocoa.name.hebrew" : @"(סוף זמן תפילה (מ״א 96 דקות",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Tefila (M'A 96 Dakos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Tfila (M'A96 Dakot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Latest Tefila M'A 90 Minutes)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"The latest zman tfila (time to recite the morning prayers) according to the opinion of the Magen Avraham based on alos being 96 minutes before sunrise. This time is 4 shaos zmaniyos (solar hours) after dawn based on the opinion of the Magen Avraham that the day is calculated from a dawn of 96 minutes before sunrise to nightfall of 96 minutes after sunset.", @"")
                         },
                 NSStringFromSelector(@selector(sofZmanTfilaMGA96MinutesZmanis)) : @{
                         @"koshercocoa.name.hebrew" : @"(סוף זמן תפילה (מ״א 96 דקות זמניות",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Tefila (M'A 96 Dakos Zmaniyos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Tfila (M'A96 Dakot Zmaniyot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Latest Tefila (M'A 96 Temporal Minutes)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"The latest zman tfila (time to the morning prayers) according to the opinion of the Magen Avraham based on alos being 96 minutes zmaniyos before sunrise. This time is 4 shaos zmaniyos (solar hours) after dawn based on the opinion of the Magen Avraham that the day is calculated from a dawn of 96 minutes zmaniyos before sunrise to nightfall of 96 minutes zmaniyos after sunset.", @"")
                         },
                 NSStringFromSelector(@selector(sofZmanTfilaMGA120Minutes)) : @{
                         @"koshercocoa.name.hebrew" : @"(סוף זמן תפילה (מ״א 120 דקות",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Tefila (M'A 120 Dakos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Tfila (M'A 120 Dakot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Latest Tefila M'A 120 Minutes)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"The latest zman tfila (time to recite the morning prayers) according to the opinion of the Magen Avraham based on alos being 120 minutes before sunrise. This time is 4 shaos zmaniyos (solar hours) after dawn based on the opinion of the Magen Avraham that the day is calculated from a dawn of 120 minutes before sunrise to nightfall of 120 minutes after sunset.", @"")
                         },
                 NSStringFromSelector(@selector(sofZmanTfila2HoursBeforeChatzos)) : @{
                         @"koshercocoa.name.hebrew" : @"סוף זמן תפילה (2 שעות לפני חצות)",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Sof Zman Tefila (2 Shaos Lifnei Chatzos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Sof Zman Tfila (2 Sha'ot Lifnei Chatzot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Latest Tefila (2 Hours before Midday)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"The latest zman tfila (time to recite the morning prayers) calculated as 2 hours before chatzos. This is based on the opinions that calculate sof zman krias shema as 3 hours before chatzos.", @"")
                         },
                 
                 /**
                  * Chatzos
                  */
                 NSStringFromSelector(@selector(chatzos)) : @{
                         @"koshercocoa.name.hebrew" : @"(גר״א) חצות",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Chatzos (Vilna Gaon)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Chatzot (Vilna Gaon)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Midday (Vilna Gaon)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"Midday following the opinion of the GRA that the day for Jewish halachic times start at sea level sunrise and ends at sea level sunset.", @"")
                         },
                 
                 NSStringFromSelector(@selector(fixedLocalChatzos)) : @{
                         @"koshercocoa.name.hebrew" : @"(חצות (קבוע",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Chatzos (Kavua)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Chatzot (Kavua)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Midday (Fixed Local)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"This time is noon and midnight adjusted from standard time to account for the local latitude. The 360° of the globe divided by 24 calculates to 15° per hour with 4 minutes per degree, so at a longitude of 0 , 15, 30 etc... Chatzos is 12:00 noon. Lakewood, N.J., whose longitude is -74.2094, is 0.7906 away from the closest multiple of 15 at -75°. This is multiplied by 4 to yield 3 minutes and 10 seconds for a chatzos of 11:56:50. This calculation is not tied to the theoretical 15° timezones, but will adjust to the actual timezone and Daylight saving time.", @"")
                         },
                 
                 
                 /**
                  *    Mincha Gedola
                  */
                 
                 NSStringFromSelector(@selector(minchaGedola)) : @{
                         @"koshercocoa.name.hebrew" : @"(גר״א) מנחה גדולה",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Mincha Gedola (Gra/Baal Hatanya)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Mincha Gedola (Gra/Baal Hatanya)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Earliest Mincha (Gra/Baal Hatanya)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"This is the preferred earliest time to pray mincha in the opinion of the Rambam and others. This is calculated as 9.5 sea level solar hours after sea level sunrise. This calculation is calculated based on the opinion of the Vilna Ga'on and the Baal Hatanya that the day is calculated from sunrise to sunset.", @"")
                         },
                 NSStringFromSelector(@selector(minchaGedola30Minutes)) : @{
                         @"koshercocoa.name.hebrew" : @"מנחה גדולה (30 דקות)",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Mincha Gedolah (30 Dakos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Mincha Gedola (30 Dakot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Earliest Mincha (30 Minutes)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"Mincha gedola calculated as 30 minutes after chatzos and not 1/2 of a shaah zmanis after chatzos as calculated according to the Mincha Gedola calculation. Some use this time to delay the start of mincha in the winter when 1/2 of a shaah zmanis is less than 30 minutes. One should not use this time to start mincha before the standard mincha gedola. See Shulchan Aruch Orach Chayim סימן רל״ג סעיף א׳ and the Shaar Hatziyon סעיף קטן ח.", @"")
                         },
                 NSStringFromSelector(@selector(minchaGedola72Minutes)) : @{
                         @"koshercocoa.name.hebrew" : @"(72 דקות) מנחה גדולה",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Mincha Gedolah (72 Dakos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Mincha Gedola (72 Dakot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Earliest Mincha (72 Minutes)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"Mincha gedola according to the Magen Avraham with the day starting 72 minutes before sunrise and ending 72 minutes after sunset. This is the earliest time to pray mincha. For more information on this see the documentation on mincha gedola.x This is calculated as 6.5 solar hours (using 72 minute zmaniyos) after alos.", @"")
                         },
                 NSStringFromSelector(@selector(minchaGedola30Minutes)) : @{
                         @"koshercocoa.name.hebrew" : @"(30 דקות) מנחה גדולה",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Mincha Gedolah (30 Dakos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Mincha Gedola (30 Dakot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Earliest Mincha (30 Minutes)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"Mincha gedola calculated as 30 minutes after chatzos and not 1/2 of a shaah zmanis after chatzos as calculated by the regular mincha gedolah. Some use this time to delay the start of mincha in the winter when 1/2 of a shaah zmanis is less than 30 minutes. One should not use this time to start mincha before the standard mincha gedola. See Shulchan Aruch Orach Chayim סימן רל״ג סעיף א׳ and the Shaar Hatziyon סעיף קטן ח.", @"")
                         },
                 NSStringFromSelector(@selector(minchaGedola16Point1Degrees)) : @{
                         @"koshercocoa.name.hebrew" : @"(16.1 מעלות) מנחה גדולה",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Mincha Gedolah (16.1 Maalos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Mincha Gedola (16.1 Ma'alot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Earliest Mincha (16.1 Degrees)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"Mincha gedola according to the Magen Avraham with the day starting and ending 16.1° below the horizon. This is the earliest time to pray mincha. For more information on this see the documentation on mincha gedola. This is calculated as 6.5 solar hours after alos.", @"")
                         },
                 NSStringFromSelector(@selector(minchaGedolaGreaterThan30)) : @{
                         @"koshercocoa.name.hebrew" : @"(לפחות 30) מנחה גדולה",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Mincha Gedolah (Lipachos 30 Dakot)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Mincha Gedola (Liphachot 30)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Earliest Mincha (At least 30 Minutes)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"Calculates the later time between 30 minutes after midday and the standard mincha gedolah calculation. Whichever is later in the day is used.", @"")
                         },
                 NSStringFromSelector(@selector(minchaGedolaAteretTorah)) : @{
                         @"koshercocoa.name.hebrew" : @"(עטרת תורה) מנחה גדולה",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Mincha Gedolah (Ateret Torah)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Mincha Gedola (Ateret Torah)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Earliest Mincha (Ateret Torah)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"mincha ketana based on the calculation of Chacham Yosef Harari-Raful of Yeshivat Ateret Torah, that the day starts 1/10th of the day before sunrise and is usually calculated as ending 40 minutes after sunset. This is the preferred earliest time to pray mincha according to the opinion of the Rambam and others.", @"")
                         },
                 
                 /**
                  *    Mincha Ketana
                  */
                 
                 NSStringFromSelector(@selector(minchaKetana)) : @{
                         @"koshercocoa.name.hebrew" : @"(גר״א) מנחה קטנה",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Mincha Ketanah (Gra/Baal Hatanya)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Mincha Ketana (Gra/Baal Hatanya)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Optimal Mincha (Gra/Baal Hatanya)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"Plag hamincha. This is calculated as 10.75 hours after sunrise. This calculation is based on the opinion of the GRA and the Baal Hatanya that the day is calculated from sunrise to sunset.", @"")
                         },
                 NSStringFromSelector(@selector(minchaKetana16Point1Degrees)) : @{
                         @"koshercocoa.name.hebrew" : @"מנחה קטנה (16.1 מעלות)",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Mincha Ketanah (16.1 Maalos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Mincha Ketana (16.1 Ma'alot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Optimal Mincha (16.1 Degrees)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"Mincha ketana according to the Magen Avraham with the day starting and ending 16.1° below the horizon. This is the perfered earliest time to pray mincha according to the opinion of the Rambam and others. For more information on this see the documentation on mincha gedola. This is calculated as 9.5 solar hours after alos.", @"")
                         },
                 NSStringFromSelector(@selector(minchaKetana72Minutes)) : @{
                         @"koshercocoa.name.hebrew" : @"מנחה קטנה (72 דקות)",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Mincha Ketanah (72 Dakos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Mincha Ketana (72 Dakot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Optimal Mincha (72 Minutes)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"mincha ketana according to the Magen Avraham with the day starting 72 minutes before sunrise and ending 72 minutes after sunset. This is the perfered earliest time to pray mincha according to the opinion of the Rambam and others. For more information on this see the documentation on mincha gedola. This is calculated as 9.5 times the \"72 minute shaah zmanis\" after alos.", @"")
                         },
                 NSStringFromSelector(@selector(minchaKetanaAteretTorah)) : @{
                         @"koshercocoa.name.hebrew" : @"מנחה קטנה (עטרת תורה)",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Mincha Ketanah (Ateret Torah)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Mincha Ketana (Ateret Torah)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Optimal Mincha (Ateret Torah)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"mincha ketana based on the calculation of Chacham Yosef Harari-Raful of Yeshivat Ateret Torah, that the day starts 1/10th of the day before sunrise and is usually calculated as ending 40 minutes after sunset. This is the perfered earliest time to pray mincha according to the opinion of the Rambam and others. For more information on this see the documentation on mincha gedola. This is calculated as 9.5 solar hours after alos.", @"")
                         },
                 
                 /**
                  *    Plag Hamincha
                  */
                 
                 NSStringFromSelector(@selector(plagHamincha)) : @{
                         @"koshercocoa.name.hebrew" : @"(גר״א) פלג המנחה",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Plag Hamincha (Gra/Baal Hatanya)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Plag Hamincha (Gra/Baal Hatanya)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Latest Mincha (Gra/Baal Hatanya)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"This is calculated as 10.75 hours after sunrise. This calculation is based on the opinion of the GRA and the Baal Hatanya that the day is calculated from sunrise to sunset.", @"")
                         },
                 NSStringFromSelector(@selector(plagHamincha60Minutes)) : @{
                         @"koshercocoa.name.hebrew" : @"(60 דקות) פלג המנחה",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Plag Hamincha (60 Dakos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Plag Hamincha (60 Dakot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Latest Mincha (60 Minutes)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"Plag hamincha according to the Magen Avraham with the day starting 60 minutes before sunrise and ending 60 minutes after sunset. This is calculated as 10.75 hours after dawn.", @"")
                         },
                 NSStringFromSelector(@selector(plagHamincha72Minutes)) : @{
                         @"koshercocoa.name.hebrew" : @"(72 דקות) פלג המנחה",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Plag Hamincha (72 Dakos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Plag Hamincha (72 Dakot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Latest Mincha (72 Minutes)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"Plag hamincha according to the Magen Avraham with the day starting 72 minutes before sunrise and ending 72 minutes after sunset. This is calculated as 10.75 hours after dawn.", @"")
                         },
                 NSStringFromSelector(@selector(plagHamincha72MinutesZmanis)) : @{
                         @"koshercocoa.name.hebrew" : @"(72 דקות זמניות) פלג המנחה",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Plag Hamincha (72 Dakos Zmaniyos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Plag Hamincha (72 Dakot Zmaniyot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Latest Mincha (72 Solar Minutes)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"Plag hamincha. This is calculated as 10.75 hours after dawn using 72 minute solar hours.", @"")
                         },
                 NSStringFromSelector(@selector(plagHamincha90Minutes)) : @{
                         @"koshercocoa.name.hebrew" : @"(90 דקות) פלג המנחה",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Plag Hamincha (90 Dakos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Plag Hamincha (90 Dakot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Latest Mincha (90 Minutes)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"Plag hamincha according to the Magen Avraham with the day starting 90 minutes before sunrise and ending 90 minutes after sunset. This is calculated as 10.75 hours after dawn using 72 minute solar hours after alos.", @"")
                         },
                 NSStringFromSelector(@selector(plagHamincha90MinutesZmanis)) : @{
                         @"koshercocoa.name.hebrew" : @"(90 דקות זמניות) פלג המנחה",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Plag Hamincha (90 Dakos Zmaniyos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Plag Hamincha (90 Dakot Zmaniyot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Latest Mincha (90 Solar Minutes)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"Plag hamincha. This is calculated as 10.75 hours after dawn. The formula used is 10.75 solar hours (90 minute solar hours) after dawn.", @"")
                         },
                 NSStringFromSelector(@selector(plagHamincha96Minutes)) : @{
                         @"koshercocoa.name.hebrew" : @"(96 דקות) פלג המנחה",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Plag Hamincha (96 Dakos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Plag Hamincha (96 Dakot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Latest Mincha (96 Minutes)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"Plag hamincha according to the Magen Avraham with the day starting 96 minutes before sunrise and ending 96 minutes after sunset. This is calculated as 10.75 hours after dawn. The formula used is 10.75 solar hours (96 minute hours) after dawn.", @"")
                         },
                 NSStringFromSelector(@selector(plagHamincha96MinutesZmanis)) : @{
                         @"koshercocoa.name.hebrew" : @"(96 דקות זמניות) פלג המנחה",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Plag Hamincha (96 Dakos Zmaniyos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Plag Hamincha (96 Dakot Zmaniyot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Latest Mincha (96 Solar Minutes)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"Plag hamincha. This is calculated as 10.75 hours after dawn. The formula used is 10.75 solar hours (96 minute solar hours) after dawn.", @"")
                         },
                 NSStringFromSelector(@selector(plagHamincha16Point1Degrees)) : @{
                         @"koshercocoa.name.hebrew" : @"(16.1 מעלות) פלג המנחה",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Plag Hamincha (16.1 Maalos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Plag Hamincha (16.1 Ma'alot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Latest Mincha (96 Degrees)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"Plag hamincha based on the opinion that the day starts at alos 16.1° and ends at tzais 16.1°. This is calculated as 10.75 hours zmaniyos after dawn. The formula used is 10.75 solar hours (16.1º solar hours) after 16.1º dawn.", @"")
                         },
                 NSStringFromSelector(@selector(plagHamincha18Degrees)) : @{
                         @"koshercocoa.name.hebrew" : @"(18 מעלות) פלג המנחה",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Plag Hamincha (18 Maalos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Plag Hamincha (18 Ma'alot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Latest Mincha (18 Degrees)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"Plag hamincha based on the opinion that the day starts at alos 18° and ends at tzais 18°. This is calculated as 10.75 solar hours (using 18º solar hours) after 18º dawn.", @"")
                         },
                 NSStringFromSelector(@selector(plagHamincha19Point8Degrees)) : @{
                         @"koshercocoa.name.hebrew" : @"(19.8 מעלות) פלג המנחה",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Plag Hamincha (19.8 Maalos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Plag Hamincha (19.8 Ma'alot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Latest Mincha (19.8 Degrees)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"Plag hamincha based on the opinion that the day starts at alos 19.8° and ends at tzais 19.8°. This is calculated as 10.75 solar hours (using 19.8º solar hours) after 19.8º dawn.", @"")
                         },
                 NSStringFromSelector(@selector(plagHamincha26Degrees)) : @{
                         @"koshercocoa.name.hebrew" : @"(26 מעלות) פלג המנחה",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Plag Hamincha (26 Maalos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Plag Hamincha (26 Ma'alot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Latest Mincha (26 Degrees)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"Plag hamincha based on the opinion that the day starts at alos 26° and ends at tzais 26° . This is calculated as 10.75 solar hours (using 26º solar hours) after 26º dawn.", @"")
                         },
                 NSStringFromSelector(@selector(plagAlosToSunset)) : @{
                         @"koshercocoa.name.hebrew" : @"(עד שקיעה) פלג המנחה",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Plag Hamincha (Ad Shkiah)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Plag Hamincha (Ad Shkiah)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Latest Mincha (Until Sunset)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"Plag hamincha based on the opinion that the day starts at alos 16.1° and ends at sunset. 10.75 shaos zmaniyos are calculated based on this day and added to alos to reach this time. This time is 10.75 shaos zmaniyos (temporal hours) after dawn based on the opinion that the day is calculated from a dawn of 16.1 degrees before sunrise to sea level sunset.", @"")
                         },
                 NSStringFromSelector(@selector(plagAlos16Point1ToTzaisGeonim7Point083Degrees)) : @{
                         @"koshercocoa.name.hebrew" : @"(צאת גאונים) פלג המנחה",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Plag Hamincha (Tzais Gaonim)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Plag Hamincha (Tzait Gaonim)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Latest Mincha (Gaonic Dusk)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"Plag hamincha based on the opinion that the day starts at alos 16.1° and ends at tzais. 10.75 shaos zmaniyos are calculated based on this day and added to alos to reach this time. This time is 10.75 shaos zmaniyos (temporal hours) after dawn based on the opinion that the day is calculated from a dawn of 16.1 degrees before sunrise to tzais . This returns 10.75 * the calculated shaah zmanis after dawn.", @"")
                         },
                 
                 /**
                  *   Sunset
                  */
                 
                 NSStringFromSelector(@selector(sunset)) : @{
                         @"koshercocoa.name.hebrew" : @"שקיעת החמה",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Shkiyas Hachamah",
                         @"koshercocoa.name.transliterated.sepharad" : @"Shki'at Hachama",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Sunset", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"Sea level sunset according to the National Oceanic and Atmospheric Association, using a 90º zenith.", @"")
                         },
                 
                 /**
                  *  Bain Hashmashos
                  */
                 
                 NSStringFromSelector(@selector(bainHashmashosRT13Degrees)) : @{
                         @"koshercocoa.name.hebrew" : @"(13 מעלות) בין השמשות",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Bein Hashmashos (13 Maalos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Bein Hashmashot (13 Ma'alot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Twilight (13 Degrees)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"Bain Hashmashos according to Rabainu Tam calculated when the sun is 13.24° below the western geometric horizon (90°) after sunset. This calculation is based on the same calculation of Bain Hasmashos Rabainu Tam 58.5 minutes but uses a degree based calculation instead of 58.5 exact minutes. This calculation is based on the position of the sun 58.5 minutes after sunset in Jerusalem during the equinox which calculates to 13.24° below geometric zenith.", @"")
                         },
                 NSStringFromSelector(@selector(bainHashmashosRT58Point5Minutes)) : @{
                         @"koshercocoa.name.hebrew" : @"(58.5 דקות) בין השמשות",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Bein Hashmashos (58.5 Dakos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Bein Hashmashot (58.5 Dakot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Twilight (58.5 Minutes)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"Bain Hashmashos according to Rabainu Tam calculated as a 58.5 minute offset after sunset. Bain hashmashos is 3/4 of a Mil before tzais or 3 1/4 Mil after sunset. A Mil is calculated as 18 minutes, 3.25 * 18 = 58.5 minutes.", @"")
                         },
                 NSStringFromSelector(@selector(bainHashmashosRT13Point5MinutesBefore7Point083Degrees)) : @{
                         @"koshercocoa.name.hebrew" : @"(13.5 דקות) בין השמשות",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Bein Hashmashos (13.5 Dakos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Bein Hashmashot (13.5 Dakot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Twilight (13.5 Minutes)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"Bain hashmashos based on the calculation of 13.5 minutes (3/4 of an 18 minute Mil before shkiah calculated as 7.083°.)", @"")
                         },
                 NSStringFromSelector(@selector(bainHashmashosRT2Stars)) : @{
                         @"koshercocoa.name.hebrew" : @"(2 כוכבים) בין השמשות",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Bein Hashmashos (2 Kochavim)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Bein Hashmashot (2 Kochavim)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Twilight (2 Stars)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"Bain Hashmashos according to Rabainu Tam calculated according to the opinion of the Divray Yosef (see Yisrael Vehazmanim) calculated 5/18th (27.77%) of the time between Alos HaShachar (calculated as 19.8° before sunrise) and sunrise. This is added to sunset to arrive at the time for Bain Hashmashos according to Rabainu Tam).", @"")
                         },
                 
                 /**
                  *    Tzais
                  */
                 
                 NSStringFromSelector(@selector(tzais)) : @{
                         @"koshercocoa.name.hebrew" : @"(3 כוכבים) צאת הכוכבים",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Tzais Hakochavim (3 Kochavim)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Tzait Hakochavim (3 Kochavim)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Starlight (3 Stars)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"This calculation is based on the position of the sun 36 minutes after sunset in Jerusalem on March 16, about 4 days before the equinox, the day that a solar hour is 60 minutes, which is 8.5 degrees below geometric zenith. The Ohr Meir considers this the time that 3 small stars are visible, which is later than the required 3 medium stars.", @"")
                         },
                 NSStringFromSelector(@selector(tzaisGeonim5Point95Degrees)) : @{
                         @"koshercocoa.name.hebrew" : @"(5.95 מעלות) צאת הכוכבים",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Tzais Hakochavim (5.95 Maalos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Tzait Hakochavim (5.95 Ma'alot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Starlight (8.5 Degrees)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"The nightfall based on the opinion of the Geonim calculated at the sun's position at 5.95° below the western horizon.", @"")
                         },
                 NSStringFromSelector(@selector(tzaisGeonim5Point88Degrees)) : @{
                         @"koshercocoa.name.hebrew" : @"(5.88 מעלות) צאת הכוכבים",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Tzais Hakochavim (5.88 Maalos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Tzait Hakochavim (5.88 Ma'alot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Starlight (5.88 Degrees)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"The nightfall based on the opinion of the Geonim calculated as 3/4 of a 24 minute Mil, (Baal Hatanya) based on a Mil being 24 minutes, and is calculated as 18 + 2 + 4 for a total of 24 minutes (FIXME: additional documentation details needed). It is the sun's position at 5.88° below the western horizon. This is a very early zman and should not be relied on without Rabbinical guidance.", @"")
                         },
                 NSStringFromSelector(@selector(tzaisGeonim3Point65Degrees)) : @{
                         @"koshercocoa.name.hebrew" : @"(3.65 מעלות) צאת הכוכבים",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Tzais Hakochavim (3.65 Maalos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Tzait Hakochavim (3.65 Ma'alot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Starlight (3.65 Degrees)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"The nightfall based on the opinion of the Geonim calculated as 3/4 of a Mil based on an 18 minute Mil, or 13.5 minutes. It is the sun's position at 3.65° below the western horizon. This is a very early zman and should not be relied on without Rabbinical guidance.", @"")
                         },
                 NSStringFromSelector(@selector(tzaisGeonim4Point37Degrees)) : @{
                         @"koshercocoa.name.hebrew" : @"(4.37 מעלות) צאת הכוכבים",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Tzais Hakochavim (4.37 Maalos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Tzait Hakochavim (4.37 Ma'alot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Starlight (4.37 Degrees)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"The nightfall based on the opinion of the Geonim calculated as 3/4 of a Mil, based on a 22.5 minute Mil, or 16 7/8 minutes. It is the sun's position at 4.37° below the western horizon. This is a very early zman and should not be relied on without Rabbinical guidance.", @"")
                         },
                 NSStringFromSelector(@selector(tzaisGeonim4Point61Degrees)) : @{
                         @"koshercocoa.name.hebrew" : @"(4.61 מעלות) צאת הכוכבים",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Tzais Hakochavim (4.61 Maalos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Tzait Hakochavim (4.61 Ma'alot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Starlight (4.61 Degrees)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"The nightfall based on the opinion of the Geonim calculated as 3/4 of a Mil based on an 24 minute Mil, or 18 minutes. It is the sun's position at 4.61° below the western horizon. This is a very early zman and should not be relied on without Rabbinical guidance.", @"")
                         },
                 NSStringFromSelector(@selector(tzaisGeonim4Point8Degrees)) : @{
                         @"koshercocoa.name.hebrew" : @"(4.8 מעלות) צאת הכוכבים",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Tzais Hakochavim (4.8 Maalos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Tzait Hakochavim (4.8 Ma'alot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Starlight (4.8 Degrees)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"The nightfall based on the opinion of the Geonim calculated as 3/4 of a Mil based on the sun's position at 4.8° below the western horizon. This is based on Rabbi Leo Levi's calculations. This is the This is a very early zman and should not be relied on without Rabbinical guidance.", @"")
                         },
                 NSStringFromSelector(@selector(tzaisGeonim7Point083Degrees)) : @{
                         @"koshercocoa.name.hebrew" : @"(7.083 מעלות) צאת הכוכבים",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Tzais Hakochavim (7.083 Maalos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Tzait Hakochavim (7.083 Ma'alot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Starlight (7.083 Degrees)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"The nightfall based on the opinion of the Geonim calculated as 30 minutes after sunset during the equinox in Yerushalayim. The sun's position at this time computes to 7.083° (or 7° 5? below the western horizon. Note that this is a common and rounded number. Computation shows the accurate number is 7.2°", @"")
                         },
                 NSStringFromSelector(@selector(tzaisGeonim8Point5Degrees)) : @{
                         @"koshercocoa.name.hebrew" : @"(8.5 מעלות) צאת הכוכבים",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Tzais Hakochavim (8.5 Maalos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Tzait Hakochavim (8.5 Ma'alot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Starlight (8.5 Degrees)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"The nightfall based on the opinion of the Geonim calculated at the sun's position at 8.5° below the western horizon.", @"")
                         },
                 NSStringFromSelector(@selector(tzais50)) : @{
                         @"koshercocoa.name.hebrew" : @"(50 דקות) צאת הכוכבים",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Tzais Hakochavim (50 Dakos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Tzait Hakochavim (50 Dakot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Starlight (50 Minutes)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"The nightfall based on R' Moshe Feinstein's opinion that the time to walk the distance of a Mil is 12.5 minutes for a total of 50 minutes for 4 Mil after sea level sunset.", @"")
                         },
                 NSStringFromSelector(@selector(tzais60)) : @{
                         @"koshercocoa.name.hebrew" : @"(60 דקות) צאת הכוכבים",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Tzais Hakochavim (60 Dakos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Tzait Hakochavim (60 Dakot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Starlight (60 Minutes)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"The nightfall based on the opinion of the Chavas Yair and Divray Malkiel that the time to walk the distance of a Mil is 15 minutes for a total of 60 minutes for 4 Mil after sea level sunset.", @"")
                         },
                 NSStringFromSelector(@selector(tzaisAteretTorah)) : @{
                         @"koshercocoa.name.hebrew" : @"(עטרת תורה) צאת הכוכבים",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Tzais Hakochavim (Ateret Torah)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Tzait Hakochavim (Ateret Torah)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Starlight (Ateret Torah)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"Tzais usually calculated as 40 minutes (configurable to any offset by modifying AteretTorahSunsetOffset) after sunset. Please note that Chacham Yosef Harari-Raful of Yeshivat Ateret Torah who uses this time, does so only for calculating various other zmanai hayom such as Sof Zman Krias Shema and Plag Hamincha. His calendars do not publish a zman for Tzais. It should also be noted that Chacham Harari-Raful provided a 25 minute zman for Israel. This API uses 40 minutes year round in any place on the globe by default. This offset can be changed by modifying AteretTorahSunsetOffset.", @"")
                         },
                 NSStringFromSelector(@selector(tzais72)) : @{
                         @"koshercocoa.name.hebrew" : @"(72 דקות) צאת הכוכבים",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Tzais Hakochavim (72 Dakos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Tzait Hakochavim (72 Dakot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Starlight (72 Minutes)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"Calculated as 72 minutes after sunset, not taking elevation into account.", @"")
                         },
                 NSStringFromSelector(@selector(tzais72Zmanis)) : @{
                         @"koshercocoa.name.hebrew" : @"(72 דקות זמניות) צאת הכוכבים",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Tzais Hakochavim (72 Dakos Zmaniyos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Tzait Hakochavim (72 Dakot Zmaniyot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Starlight (72 Solar Minutes)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"Dusk calculated as 72 minutes zmaniyos, or 1/10th of the day after sea level sunset.", @"")
                         },
                 NSStringFromSelector(@selector(tzais90)) : @{
                         @"koshercocoa.name.hebrew" : @"(90 דקות) צאת הכוכבים",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Tzais Hakochavim (90 Dakos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Tzait Hakochavim (90 Dakot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Starlight (90 Minutes)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"Dusk calculated as 90 minutes after sea level sunset. This calculation is based on the opinion of the Magen Avraham that the time to walk the distance of a Mil according to the Rambam's opinion is 18 minutes for a total of 90 minutes based on the opinion of Ula who calculated tzais as 5 Mil after sea level shkiah (sunset). A similar calculation \"Tzais (19.8 degrees)\" uses solar position calculations based on this time.", @"")
                         },
                 NSStringFromSelector(@selector(tzais90Zmanis)) : @{
                         @"koshercocoa.name.hebrew" : @"(90 דקות זמניות) צאת הכוכבים",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Tzais Hakochavim (90 Dakos Zmaniyos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Tzait Hakochavim (90 Dakot Zmaniyot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Starlight (90 Solar Minutes)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"Dusk calculated using 90 minutes zmaniyos (GRA and the Baal Hatanya) after sea level sunset.", @"")
                         },
                 NSStringFromSelector(@selector(tzais96)) : @{
                         @"koshercocoa.name.hebrew" : @"(96 דקות) צאת הכוכבים",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Tzais Hakochavim (96 Dakos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Tzait Hakochavim (96 Dakot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Starlight (96 Minutes)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"Dusk calculated as 96 minutes after sea level sunset. For information on how this is calculated see the comments on \"Alos HaShachar (96 Minutes).\"", @"")
                         },
                 NSStringFromSelector(@selector(tzais96Zmanis)) : @{
                         @"koshercocoa.name.hebrew" : @"(96 דקות זמניות) צאת הכוכבים",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Tzais Hakochavim (96 Dakos Zmaniyos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Tzait Hakochavim (96 Dakot Zmaniyot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Starlight (96 Solar Minutes)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@" Dusk calculated using 96 minutes zmaniyos (GRA and the Baal Hatanya) after sea level sunset.", @"")
                         },
                 NSStringFromSelector(@selector(tzais120)) : @{
                         @"koshercocoa.name.hebrew" : @"(120 דקות) צאת הכוכבים",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Tzais Hakochavim (120 Dakos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Tzait Hakochavim (120 Dakot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Starlight (120 Minutes)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"nightfall based on the opinion of the Magen Avraham that the time to walk the distance of a Mil according to the Rambam's opinion is 2/5 of an hour (24 minutes) for a total of 120 minutes based on the opinion of Ula who calculated tzais as 5 Mil after sea level shkiah (sunset). A similar calculation \"Tzais (26 Degrees)\" uses temporal calculations based on this time.", @"")
                         },
                 NSStringFromSelector(@selector(tzais120Zmanis)) : @{
                         @"koshercocoa.name.hebrew" : @"(120 דקות זמניות) צאת הכוכבים",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Tzais Hakochavim (120 Dakos Zmaniyos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Tzait Hakochavim (120 Dakot Zmaniyot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Starlight (120 Solar Minutes)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"Dusk calculated using 120 minutes zmaniyos (GRA and the Baal Hatanya) after sea level sunset.", @"")
                         },
                 NSStringFromSelector(@selector(tzais16Point1Degrees)) : @{
                         @"koshercocoa.name.hebrew" : @"(16.1 מעלות) צאת הכוכבים",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Tzais Hakochavim (16.1 Maalos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Tzait Hakochavim (16.1 Maalot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Starlight (16.1 Degrees)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"For information on how this is calculated see the comments on \"Alos HaShachar (16.1 Degrees)\".", @"")
                         },
                 NSStringFromSelector(@selector(tzais26Degrees)) : @{
                         @"koshercocoa.name.hebrew" : @"(26 מעלות) צאת הכוכבים",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Tzais Hakochavim (26 Maalos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Tzait Hakochavim (26 Maalot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Starlight (26 Degrees)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"For information on how this is calculated see the comments on \"Alos HaShachar (26 Degrees)\".", @"")
                         },
                 NSStringFromSelector(@selector(tzais18Degrees)) : @{
                         @"koshercocoa.name.hebrew" : @"(18 מעלות) צאת הכוכבים",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Tzais Hakochavim (18 Maalos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Tzait Hakochavim (18 Maalot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Starlight (18 Degrees)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"For information on how this is calculated see the comments on \"Alos HaShachar (18 Degrees)\".", @"")
                         },
                 NSStringFromSelector(@selector(tzais19Point8Degrees)) : @{
                         @"koshercocoa.name.hebrew" : @"(19.8 מעלות) צאת הכוכבים",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Tzais Hakochavim (19.8 Maalos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Tzait Hakochavim (19.8 Maalot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Starlight (19.8 Degrees)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"For information on how this is calculated see the comments on \"Alos HaShachar (19.8 Degrees)\".", @"")
                         },
                 
                 /**
                  *    Achilas Chametz
                  */
                 
                 NSStringFromSelector(@selector(sofZmanAchilasChametzGra)) : @{
                         @"koshercocoa.name.hebrew" : @"סוף זמן אכילת חמץ (גר״א)",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Achilas Chametz (G\"ra)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Achilat Chametz (G\"ra)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Eat Chametz By (G\"ra)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"The latest time one is allowed eating chametz on Erev Pesach according to the opinion of the GRA and the Baal Hatanya. This time is identical to the Sof zman tefilah GRA. This time is 4 solar hours into the day based on the opinion of the GRA and the Baal Hatanya that the day is calculated from sunrise to sunset.", @"")
                         },
                 NSStringFromSelector(@selector(sofZmanAchilasChametzMGA72Minutes)) : @{
                         @"koshercocoa.name.hebrew" : @"סוף זמן אכילת חמץ (מ״א 72 דקות)",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Achilas Chametz (M\"A 72 Dakos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Achilat Chametz (M\"A 72 Dakot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Eat Chametz By (M\"A 72 Minutes)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"The latest time one is allowed eating chametz on Erev Pesach according to the opinion of the MGA based on alos being 72 minutes before sunrise. This time is identical to the Sof zman tefilah MGA 72 minutes. This time is 4 solar hours after dawn based on the opinion of the MGA that the day is calculated from a dawn of 72 minutes before sunrise to nightfall of 72 minutes after sunset.", @"")
                         },
                 NSStringFromSelector(@selector(sofZmanAchilasChametzMGA16Point1Degrees)) : @{
                         @"koshercocoa.name.hebrew" : @"סוף זמן אכילת חמץ (מ״א 16.1 מעלות)",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Achilas Chametz (M\"A 16.1 Maalot)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Achilat Chametz (M\"A 16.1 Maalot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Eat Chametz By (M\"A 16.1 Degrees)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"The latest time one is allowed eating chametz on Erev Pesach according to the opinion of the MGA based on alos being 16.1° before sunrise. This time is 4 shaos zmaniyos (solar hours) after dawn based on the opinion of the MGA that the day is calculated from dawn to nightfall with both being 16.1° below sunrise or sunset.", @"")
                         },
                 
                 /**
                  *    Biur Chametz
                  */
                 
                 NSStringFromSelector(@selector(sofZmanBiurChametzGra)) : @{
                         @"koshercocoa.name.hebrew" : @"סוף זמן ביעור חמץ (גר״א)",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Biur Chametz (Gr\"a)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Biur Chametz (Gr\"a)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Burn Chametz By (Gr\"a)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"The latest time for burning chametz on Erev Pesach according to the opinion of the GRA and the Baal Hatanya. This time is 5 solar hours into the day based on the opinion of the GRA and the Baal Hatanya that the day is calculated from sunrise to sunset.", @"")
                         },
                 NSStringFromSelector(@selector(sofZmanBiurChametzMGA72Minutes)) : @{
                         @"koshercocoa.name.hebrew" : @"סוף זמן ביעור חמץ (מ״א 72 דקות)",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Biur Chametz (M\"A 72 Dakos)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Biur Chametz (M\"A 72 Dakot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Burn Chametz By (72 Minutes)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"The latest time for burning chametz on Erev Pesach according to the opinion of the Magen Avraham based on alos being 72 minutes before sunrise. This time is 5 shaos zmaniyos (temporal hours) after dawn based on the opinion of the Magen Avraham that the day is calculated from a dawn of 72 minutes before sunrise to nightfall of 72 minutes after sunset.", @"")
                         },
                 NSStringFromSelector(@selector(sofZmanBiurChametzMGA16Point1Degrees)) : @{
                         @"koshercocoa.name.hebrew" : @"סוף זמן ביעור חמץ (מ״א 16.1 מעלות)",
                         @"koshercocoa.name.transliterated.ashkenaz" : @"Biur Chametz (M\"A 16.1 Maalot)",
                         @"koshercocoa.name.transliterated.sepharad" : @"Biur Chametz (M\"A 16.1 Maalot)",
                         @"koshercocoa.name.localized" : NSLocalizedString(@"Burn Chametz By (M\"A 16.1 Degrees)", @""),
                         @"koshercocoa.explanation.localized" : NSLocalizedString(@"The latest time for burning chametz on Erev Pesach according to the opinion of the MGA based on alos being 16.1° before sunrise. This time is 5 shaos zmaniyos (solar hours) after dawn based on the opinion of the MGA that the day is calculated from dawn to nightfall with both being 16.1° below sunrise or sunset.", @"")
                         }
                 };
        
        
    }
    
    return data;
    
}

- (NSDictionary *)_metadataForCurrentZman
{
    NSDictionary * metadata = KCZman.metadata[NSStringFromSelector(self.selector)];
    
    return metadata;
}

/**
 *  Comparisons
 */

- (BOOL)isEqual:(nullable id)object
{
    BOOL isOtherAlsoZman = [object isKindOfClass:[KCZman class]];
    BOOL equal = [super isEqual:object] || (isOtherAlsoZman && [self isEqualToZman:(KCZman *)object]);
    
    return equal;
}

- (BOOL)isEqualToZman:(KCZman *)anotherZman
{
    NSString *mySelector = NSStringFromSelector(self.selector);
    NSString *otherZmanSelector = NSStringFromSelector(anotherZman.selector);
    
    return [mySelector isEqualToString:otherZmanSelector];
}

- (NSUInteger)hash
{
    return NSStringFromSelector(self.selector).hash;
}

@end

NS_ASSUME_NONNULL_END
