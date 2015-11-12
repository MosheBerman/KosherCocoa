/**
 *  KCDaf.h
 *  KosherCocoa 3
 *
 *  Created by Moshe Berman on 11/13/11.
 *  Updated by Moshe Berman on 8/27/13.
 *
 *  Use of KosherCocoa 3 is governed by the LGPL 2.1 License.
 */

#import <Foundation/Foundation.h>

#import "KCConstants.h"
#import "KCTractates.h"

/** A class that represents a page in the Talmud. */

@interface KCDaf : NSObject

/**-----
 * @name Accessing a *Daf*
 * -----
 */

/**
 *  The index of the tractate. 
 *
 *  The index can be translated into a string 
 *  by calling displayName or displayNameTransliterated.
 *
 *  @see name
 *  @see nameTransliterated
 */

@property NSInteger tractateIndex;

/**
 *  The page number that the given Daf represents.
 */

@property NSInteger pageNumber;

/**-----
 *  @name Instantiating a Daf.
 * -----
 */

/**
 *  This method instantiates a Daf with an index and page number.
 *
 *  For valid index values and what they represent, see KCTractates.h
 *
 *  @param tractateIndex The index of the tractate.
 *  @param number The page number.
 *  @return An instance of KCDaf.
 */

- (id)initWithTractateIndex:(NSInteger)tractateIndex andPageNumber:(NSInteger)number;

/**-----
 *  @name Displaying a Tractate
 * -----
 */

/**
 *  This method returns the display name of a given tractate 
 *  as a Hebrew string.
 *
 *  @return A string with hebrew name of the tractate that corresponds to the tractateIndex.
 */

- (NSString *)name;

/**
 *  This method returns the dispolay name of a given tractate
 *  as a transliterated Hebrew string.
 *
 *  @return A string with transliterated name of the tractate that corresponds to the tractateIndex.
 */

- (NSString *)nameTransliterated;


@end
