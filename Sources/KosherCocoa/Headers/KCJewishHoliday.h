//
//  KCJewishHoliday.h
//  KosherCocoa
//
//  Created by Moshe Berman on 6/8/14.
//  Copyright (c) 2014 Moshe Berman. All rights reserved.
//

@import Foundation;

/**
 This class represents a Jewish holiday, including major and minor fasts, as well as modern Israeli holidays.
 */
NS_SWIFT_NAME(JewishHoliday)
@interface KCJewishHoliday : NSObject

/**
 *  The index saying which holiday the object represents.
 */

@property (nonatomic, assign) NSInteger holidayIndex;

/**
 *  A convenience accessor to get a holiday from an index.
 */

+ (nonnull instancetype)holidayWithIndex:(NSInteger)index;

/**
 *  @return the hebrew name of the holiday.
 */

- (nonnull NSString *)name;

/**
 *  @return the transliterated hebrew name of the holiday.
 */

- (nonnull NSString *)nameTransliterated;

@end
