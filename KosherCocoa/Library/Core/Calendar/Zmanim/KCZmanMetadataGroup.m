//
//  KCZmanMetadataGroup.m
//  KosherCocoa
//
//  Created by Moshe Berman on 9/22/16.
//  Copyright © 2016 Moshe Berman. All rights reserved.
//

#import "KCZmanMetadataGroup.h"

NS_ASSUME_NONNULL_BEGIN

@implementation KCZmanMetadataGroup

- (id)initWithHebrewName:(nonnull NSString *)hebrew englishName:(nonnull NSString*)english transliteratedName:(nonnull NSString*)transliterated andCalculationMethods:(nonnull NSArray<KCZmanMetadataCalculation*>*)calculations
{
    self = [super init];
    
    if (self)
    {
        _hebrewName = hebrew;
        _englishName = english;
        _transliteratedName = transliterated;
        _calculations = calculations;
    }
    
    return self;
}

@end

NS_ASSUME_NONNULL_END
