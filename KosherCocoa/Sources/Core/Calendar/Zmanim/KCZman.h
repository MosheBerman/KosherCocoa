/**
 *  KCZman.h
 *  KosherCocoa 3
 *
 *  Created by Moshe Berman on 4/8/15.
 *
 *  Use of KosherCocoa 3 is governed by the LGPL 2.1 License.
 */

@import Foundation;
#import "KCComplexZmanimCalendar.h"

NS_SWIFT_NAME(Zman)
@interface KCZman : NSObject

/**
 *  The selector used to calculate the zman.
 */

@property (nonnull, readonly) SEL selector;

// MARK: - Instantiating a Zman

/**
 *  Takes a selector and converts it into a KCZman object.
 *
 *  @return A zman object for the supplied selector.
 */

+ (nonnull KCZman *)zmanForSelector:(nonnull SEL)selector;

/**
 *  Instantiates a zman for the supplied selector.
 *
 *  @return A zman with with the supplied selector.
 */

- (nonnull instancetype)initWithSelector:(nonnull SEL)selector;

// MARK: - Display Name

/**
 *  The hebrew name of the zman.
 *
 *  @return The name of the zman, in Hebrew.
 */

- (nonnull NSString *)hebrewName;

/**
 *  The shortened hebrew name.
 *
 *  @return The short hebrew name of the zman, such as שמע.
 */

- (nonnull NSString *)shortHebrewName;

/**
 *  The transliterated name of the zman, using the ashkenazic pronunciation.
 *
 *  @discussion Transliterations use the Ashkenazic pronunciation. (For example: "Alos" for sunrise.)
 *
 *  @return The name of the zman.
 */

- (nonnull NSString *)transliteratedNameAshkenazic;

/**
 *  The transliterated name of the zman, using the sephardic pronunciation.
 *
 *  @discussion Transliterations use the sephardic pronunciation. (For example: "Alot" for sunrise.)
 *
 *  @return The name of the zman.
 */

- (nonnull NSString *)transliteratedNameSephardic;

/**
 *  The name of the zman in English.
 *
 *  @return The name of the zman.
 */

- (nonnull NSString *)englishName;

/**
 *  The shortened english name.
 *
 *  @return The short English name of the zman, such as Shma.
 */

- (nonnull NSString *)shortEnglishName;

/**
 *  Grabs the main zman name, discarding rabbinic opinion.
 *
 *  @param displayName The full display name containing the calculation and rabbinic opinion.
 *
 *  @return The calculation name, stripped of any rabbinic opinion.
 */

- (nonnull NSString *)nameFromDisplayName:(nonnull NSString *)displayName;

/**
 *  Grabs the rabbinic opinion from display name.
 *
 *  @param displayName The full display name containing the calculation and rabbinic opinion.
 *
 *  @return The calculation name, without the calculation name.
 */

- (nullable NSString *)rabbinicOpinionFromDisplayName:(nonnull NSString *)displayName;

// Mark: - Explanation


/**
 *  The explanation for the zman.
 *
 *  @return An explanation of the halachic background behind the zman.
 */

- (nonnull NSString *)explanation;

// Mark: - Related Zmanim

/**
 *  Other zmanim that are related to this zman.
 *
 *  @discussion Related zmanim are other versions of the same zman. Related zmanim always contains self.
 *
 *  @return An NSArray of KCZman objects that are related to this zman.
 */

- (nonnull NSArray *)relatedZmanim;

// MARK: - Comparison

- (BOOL)isEqual:(nullable id)object;
- (BOOL)isEqualToZman:(nonnull KCZman *)anotherZman;

#pragma mark - Metadata mappings 

/**
 * A mapping of related calculations.
 *
 *  @return A nested array of zmanim selectors, each group containing related selectors.
 */

+ (nonnull NSArray<NSArray<NSString* >* >*)relatedZmanimMapping;

/**
 *  The list of zmanim metadata.
 *
 *  @return An NSDictionary containing data for all of the zmanim.
 */

+ (nonnull NSDictionary<NSString*,NSDictionary<NSString*, NSString*>*>*)metadata;
 
@end
