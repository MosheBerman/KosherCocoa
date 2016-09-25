//
//  KCZmanMetadataCalculation.h
//  KosherCocoa
//
//  Created by Moshe Berman on 9/22/16.
//  Copyright © 2016 Moshe Berman. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KCZmanMetadataCalculation : NSObject

@property (assign, readonly) SEL selector;
@property (nonatomic, strong, readonly) NSString* methodName;

@property(nonatomic, strong, readonly) NSString* nameInHebrew;
@property(nonatomic, strong, readonly) NSString* nameInEnglish;
@property(nonatomic, strong, readonly) NSString* nameInTransliteratedAshkenaz;
@property(nonatomic, strong, readonly) NSString* nameInTransliteratedSepharad;

@property(nonatomic, strong, readonly) NSString* explanation;

/** The selector to for the calculation. */
- (id)initWithSelector:(SEL)selector;

@end

NS_ASSUME_NONNULL_END
