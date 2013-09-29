/**
 *  KCDaf.h
 *  KosherCocoa 2
 *
 *  Created by Moshe Berman on 11/13/11.
 *  Updated by Moshe Berman on 8/27/13.
 *
 *  Use of KosherCocoa 2 is governed by the LGPL 2.1 License.
 */

#import <Foundation/Foundation.h>

#import "KCConstants.h"
#import "KCTractates.h"

/** A class that represents a *daf* (or page) in the Talmud. */

@interface KCDaf : NSObject

/**-----
 * @name Accessing a *Daf*
 * -----
 */

/**
 *  The index of the tractate.
 *
 *  @see KCTractates.h
 */

@property NSInteger tractateIndex;

/**
 *
 */
@property NSInteger pageNumber;

- (id) initWithTractateIndex:(NSInteger)tractateIndex andPageNumber:(NSInteger)number;

- (NSString *)mesechtaName;


@end
