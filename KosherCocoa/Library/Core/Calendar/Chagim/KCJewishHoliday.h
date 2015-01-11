//
//  KCJewishHoliday.h
//  KosherCocoa
//
//  Created by Moshe Berman on 6/8/14.
//  Copyright (c) 2014 Moshe Berman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KCJewishHoliday : NSObject

/**
 *  The index saying which holiday the object represents.
 */

@property (nonatomic, assign) NSInteger holidayIndex;

/**
 *  A convenience accessor to get a holiday from an index.
 */

+ (id)holidayWithIndex:(NSInteger)index;

/**
 *  @return the hebrew name of the holiday.
 */

- (NSString *)name;

/**
 *  @return the transliterad hebrew name of the holiday.
 */

- (NSString *)nameTransliterated;

@end
