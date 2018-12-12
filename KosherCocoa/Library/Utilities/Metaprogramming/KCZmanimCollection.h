//
//  KCZmanimCollection.h
//  KosherCocoa
//
//  Created by Moshe Berman on 11/26/18.
//  Copyright © 2018 Moshe Berman. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "KCZmanimCollectionIdentifier.h"
#import "KCZman.h"

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(ZmanMetadataCollection)
@interface KCZmanimCollection : NSObject

// MARK: - Convenience Initializers

/**
 A list containing the default collection of metadata for zmanim.
 */
+ (KCZmanimCollection *) defaultCollection;

/**
 A collection containing the metadata of zmanim preferred by the user.
 */
+ (KCZmanimCollection *) preferredZmanim;


// MARK: - Initializer
- (KCZmanimCollection *)initWithIdentifier:(NSString * _Nullable)identifier;

// MARK: - Accessing Collection Contents

/**
 The items in the collection.
 */
@property (strong) NSArray <KCZman *> *items;

@end

NS_ASSUME_NONNULL_END
