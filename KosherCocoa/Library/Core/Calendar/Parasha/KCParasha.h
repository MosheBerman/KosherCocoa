/**
  KCParasha.h
  KosherCocoa 4

  Created by Moshe Berman on 5/10/13.
  Updated by Moshe Berman on 9/24/13.

  Use of KosherCocoa 4 is governed by the LGPL 2.1 License.
 */

@import Foundation;
#import "KCParashaReadings.h"

NS_ASSUME_NONNULL_BEGIN

/**
 A class that represents a weekly parasha 
 */
NS_SWIFT_NAME(Parasha)
@interface KCParasha : NSObject

// MARK: - Properties
/**
 The parasha identifier.
 */

@property (nonatomic, assign) enum KCParashaIdentifier identifier;

// MARK: - Converting an identifier into a parasha.

/**
  This method returns a KCParasha instance.

  @param identifier An identifier, defined in KCParashaReadings.
  @return A KCParasha instance.
 */

- (nonnull instancetype)initWithIdentifier:(enum KCParashaIdentifier)identifier;

/**
  This method returns a KCParasha instance.

  This method simply calls [[KCParasha alloc] initWithIdentifier:identifier]. 
  It exists for convenience.

  @param identifier An identifier, defined in KCParashaReadings.
  @return A KCParasha instance.
 */

+ (nonnull instancetype)parashaWithIdentifier:(enum KCParashaIdentifier)identifier;

// MARK: - Human Readable Parasha Names


/**
 A string with hebrew name of the parsha, spelled in Hebrew characters.
 */
@property (nonatomic, readonly) NSString *name;

/**
 A string with hebrew name of the parsha, spelled in English characters.
 */
@property (nonatomic, readonly) NSString *nameTransliterated;

@end

NS_ASSUME_NONNULL_END
