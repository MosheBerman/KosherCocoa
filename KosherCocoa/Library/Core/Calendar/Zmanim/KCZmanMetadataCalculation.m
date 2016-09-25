//
//  KCZmanMetadataCalculation.m
//  KosherCocoa
//
//  Created by Moshe Berman on 9/22/16.
//  Copyright © 2016 Moshe Berman. All rights reserved.
//

#import "KCZmanMetadataCalculation.h"

NS_ASSUME_NONNULL_BEGIN

@implementation KCZmanMetadataCalculation

- (id)initWithSelector:(SEL)selector
{
    self = [super init];
    
    if (self) {
        _selector = selector;
        _methodName = NSStringFromSelector(selector);
        
        
        
    }
    
    return self;
}

@end

NS_ASSUME_NONNULL_END
