//
//  SefiraDay.h
//  KosherCocoa 2
//
//  Created by Moshe Berman on 3/1/11.
//  Updated by Moshe Berman on 5/8/13.
//  Copyright 2011-2013 MosheBerman.com. All rights reserved.
//
//  Released under the MIT License.
//

#import <Foundation/Foundation.h>

@interface KCSefiratHaomer : NSObject

/* Check if a date falls during sefira */

+ (BOOL)fallsToday;
+ (BOOL)fallsOnDate:(NSDate *)date;

/* Get day of sefira, returns 0 for all non-sefira days. */

+ (NSInteger)dayOfSefira;
+ (NSInteger)dayOfSefiraForDate:(NSDate *)date;

@end
