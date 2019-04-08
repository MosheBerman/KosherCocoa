//
//  KCJewishHoliday.h
//  KosherCocoa
//
//  Created by Moshe Berman on 6/8/14.
//  Copyright (c) 2014 Moshe Berman. All rights reserved.
//

@import Foundation;

NS_ASSUME_NONNULL_BEGIN

/**
 This class represents a Jewish holiday, including major and minor fasts, as well as modern Israeli holidays.
 */
NS_SWIFT_NAME(JewishHoliday)
@interface KCJewishHoliday : NSObject

/**
 The index saying which holiday the object represents.
 */
@property (nonatomic, assign) NSInteger holidayIndex;

/**
  A convenience accessor to get a holiday from an index.

 @param index The index of the holiday.
 @return An instance of `KCJewishHoliday`, if the index is in bounds. Otherwise
 */
+ (nullable instancetype)holidayWithIndex:(NSInteger)index;

/**
 The hebrew name of the holiday.
 */
@property (nonatomic, readonly) NSString * _Nonnull name;

/**
 The transliterated hebrew name of the holiday.
 */
@property (nonatomic, readonly) NSString * _Nonnull nameTransliterated;

@end

NS_ASSUME_NONNULL_END
