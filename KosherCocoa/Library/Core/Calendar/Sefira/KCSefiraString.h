/**
 *  KCSefiraString.h
 *  KosherCocoa 2
 *
 *  Created by Moshe Berman on 1/17/11.
 *  Updated by Moshe Berman on 10/7/13.
 *
 *  Use of KosherCocoa 2 is governed by the LGPL 2.1 License.
 */

//
//  NOTE: This should be refactored into a KCSefiratHaomerFormatter.
//

#import <Foundation/Foundation.h>

#warning The KCSefiraString class is unfinished and is mostly useless at this time.

@interface KCSefiraString : NSObject

@property NSInteger day;

/**
 *  This method initializes a new KCSefiraString instance.
 *
 *  @param day An integer between 1 and 49.
 *  @return A KCSefiraString
 */

- (id)initWithDay:(NSInteger)day;

//
//  This method returns a string in hebrew for the current day's number
//

- (NSString *)stringRepresentationForDay:(NSInteger)day;

//
//  This returns a string for today's middah in hebrew
//

- (NSString *)middahStringInHebrewForDay:(NSInteger)tempDay;

@end
