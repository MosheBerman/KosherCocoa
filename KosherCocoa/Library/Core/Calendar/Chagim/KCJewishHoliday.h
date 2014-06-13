//
//  KCJewishHoliday.h
//  KosherCocoa
//
//  Created by Moshe on 6/11/14.
//  Copyright (c) 2014 Moshe Berman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KCJewishHoliday : NSObject

/**
 *  The index saying which holiday the object represents.
 */

@property (nonatomic, assign) NSInteger holidayIndex;

/**
 *  @return the hebrew name of the holiday.
 */

- (NSString *)name;

/**
 *  @return the transliterad hebrew name of the holiday.
 */

- (NSString *)nameTransliterated;

@end
