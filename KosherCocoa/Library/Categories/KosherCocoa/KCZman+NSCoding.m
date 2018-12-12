//
//  KCZman+NSCoding.m
//  KosherCocoa
//
//  Created by Moshe Berman on 12/12/18.
//  Copyright © 2018 Moshe Berman. All rights reserved.
//

#import "KCZman+NSCoding.h"

@implementation KCZman (NSCoding) 


- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
    [aCoder encodeObject: NSStringFromSelector(self.selector) forKey:@"stringName"];
    
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)aDecoder {
    SEL selector = NSSelectorFromString([aDecoder decodeObjectForKey:@"stringName"]);
    return [self initWithSelector:selector];
}

@end
