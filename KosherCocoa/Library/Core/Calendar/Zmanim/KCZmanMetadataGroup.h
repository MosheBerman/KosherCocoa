//
//  KCZmanMetadataGroup.h
//  KosherCocoa
//
//  Created by Moshe Berman on 9/22/16.
//  Copyright © 2016 Moshe Berman. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class KCZmanMetadataCalculation;

@interface KCZmanMetadataGroup : NSObject

@property (nonnull, strong) NSString* hebrewName;
@property (nonnull, strong) NSString* englishName;
@property (nonnull, strong) NSString* transliteratedName;
@property (nonnull, strong) NSArray<KCZmanMetadataCalculation*>* calculations;

- (id)initWithHebrewName:(nonnull NSString *)hebrew englishName:(nonnull NSString*)english transliteratedName:(nonnull NSString*)transliterated andCalculationMethods:(nonnull NSArray<KCZmanMetadataCalculation*>*)calculations;

@end

NS_ASSUME_NONNULL_END
