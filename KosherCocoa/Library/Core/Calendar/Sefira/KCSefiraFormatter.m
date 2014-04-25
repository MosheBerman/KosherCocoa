//
//  KCSefiraFormatter.m
//  KosherCocoa
//
//  Created by Moshe Berman on 10/23/13.
//  Copyright (c) 2013 Moshe Berman. All rights reserved.
//

#import "KCSefiraFormatter.h"

#warning This class isn't finished yet.

@interface KCSefiraFormatter ()

/**  An array of counts in english. */

@property (nonatomic, strong) NSArray *englishStrings;

/** An array of Ashkenaz Hebrew counts. */
@property (nonatomic, strong) NSArray *ashkenazHebrewStrings;

/** An array of Sefard Hebrew counts. */
@property (nonatomic, strong) NSArray *sefardHebrewStrings;

/** An array of Sephardic Hebrew counts. */
@property (nonatomic, strong) NSArray *sephardicHebrewStrings;

/**  An array of Ashkenaz transliterated counts. */
@property (nonatomic, strong) NSArray *ashkenazTransliteratedStrings;

/**  An array of Sefard Transliterated counts. */
@property (nonatomic, strong) NSArray *sefardTransliteratedStrings;

/**  An array of Sephardic transliterated counts. */
@property (nonatomic, strong) NSArray *sephardicTransliteratedStrings;

@end

@implementation KCSefiraFormatter

/**
 *  The designated initializer.
 */

- (id)init
{
    self = [super init];
    if (self) {
        _language = KCSefiraLanguageHebrew; //  Default language is Hebrew
        _custom = KCSefiraCustomSefard;     //  Default custom is Sefard
    }
    return self;
}

- (NSString *)stringFromInteger:(NSInteger)integer
{
    
    if (integer < 0 || integer > 49) {
        return nil;
    }
    
    NSArray *composite = @[
                           /** Hebrew */
                           @[
                               _ashkenazHebrewStrings,
                               _sefardHebrewStrings,
                               _sephardicHebrewStrings,
                               ],
                           /** English */
                           @[
                               @[_englishStrings]
                               ],
                           /** Transliterated. */
                           @[_ashkenazTransliteratedStrings,
                             _sefardTransliteratedStrings,
                             _sephardicTransliteratedStrings]
                           ];
    
    NSInteger language = self.language;
    NSInteger custom = self.custom;
    
    /** Ensure we don't out-of-bounds on English. */
    if (language == KCSefiraLanguageEnglish) {
        custom = 0; //  There's only one version of English.
    }
    
    return composite[language][custom][integer];
}

@end
