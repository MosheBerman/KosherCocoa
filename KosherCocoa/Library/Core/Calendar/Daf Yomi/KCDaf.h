/**
 *  KCDaf.h
 *  KosherCocoa 4
 *
 *  Created by Moshe Berman on 11/13/11.
 *  Updated by Moshe Berman on 8/27/13.
 *
 *  Use of KosherCocoa 4 is governed by the LGPL 2.1 License.
 */

@import Foundation;

#import "KCConstants.h"
#import "KCTractates.h"

NS_ASSUME_NONNULL_BEGIN

/**
 This class represents a folio of the talmud.
 
 A folio is a two-sided page. (i.e. Pages 2a and 2b together make up a folio.)
 */
NS_SWIFT_NAME(Daf)
@interface KCDaf : NSObject

/**
 The index of the tractate.
 
 The index can be translated into a string by calling `displayName` or `displayNameTransliterated`.
 
 @see displayName
 @see displayNameTransliterated
 */
@property (nonatomic) NSInteger tractateIndex;

/**
 The page number that the given Daf represents.
 */
@property (nonatomic) NSInteger pageNumber;


// MARK: - Initializers

/**
 This method instantiates a Daf with an index and page number.
 
 For valid index values and what they represent, see KCTractates.h
 
 @param tractateIndex The index of the tractate.
 @param number The page number.
 @return An instance of KCDaf.
 */
- (nonnull instancetype)initWithTractateIndex:(NSInteger)tractateIndex andPageNumber:(NSInteger)number;

// MARK: - Displaying a Daf

/**
 A string with hebrew name of the volume, spelled in Hebrew characters.
 */
@property (nonatomic, readonly) NSString *name;

/**
A string with hebrew name of the volume, spelled in English characters.
 */
@property (nonatomic, readonly) NSString *nameTransliterated;

@end

NS_ASSUME_NONNULL_END
