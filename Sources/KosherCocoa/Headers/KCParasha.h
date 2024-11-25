/**
 *  KCParasha.h
 *  KosherCocoa 3
 *
 *  Created by Moshe Berman on 5/10/13.
 *  Updated by Moshe Berman on 9/24/13.
 *
 *  Use of KosherCocoa 3 is governed by the LGPL 2.1 License.
 */

@import Foundation;
#import "KCParashaReadings.h"

/**
 A class that represents a weekly parasha 
 */
NS_SWIFT_NAME(Parasha)
@interface KCParasha : NSObject

// MARK: - Properties
/**
 * The parasha identifier.
 */

@property (nonatomic, assign) enum KCParashaIdentifier identifier;

// MARK: - Converting an identifier into a parasha.

/**
 *  This method returns a KCParasha instance.
 *
 *  @param identifier An identifier, defined in KCParashaReadings.
 *  @return A KCParasha instance.
 */

- (nonnull instancetype)initWithIdentifier:(enum KCParashaIdentifier)identifier;

/**
 *  This method returns a KCParasha instance.
 *
 *  This method simply calls [[KCParasha alloc] initWithIdentifier:identifier]. 
 *  It exists for convenience.
 *
 *  @param identifier An identifier, defined in KCParashaReadings.
 *  @return A KCParasha instance.
 */

+ (nonnull instancetype)parashaWithIdentifier:(enum KCParashaIdentifier)identifier;

// MARK: - Human Readable Parasha Names

/**
 *  This method returns the name of the parasha, transliterated into English
 *
 *  @return A string composed of hebrew characters that 
 *  corresponds to the instance's identifier.
 */

- (nonnull NSString *)name; //  The hebrew name of the parasha

/**
 *  This method returns the hebrew name of the parasha.
 *
 *  @return A string composed of english characters that
 *  spells out the hebrew name that corresponds to the
 *  instance's identifier.
 */

- (nonnull NSString *)nameTransliterated;   //  The name of the parasha, transliterated into English

@end
