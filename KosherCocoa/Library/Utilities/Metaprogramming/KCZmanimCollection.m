//
//  KCZmanimCollection.m
//  KosherCocoa
//
//  Created by Moshe Berman on 11/26/18.
//  Copyright © 2018 Moshe Berman. All rights reserved.
//

#import "KCZmanimCollection.h"
#import "KCPersistence.h"

@interface KCZmanimCollection ()

@property (strong) NSString *identifier;

@end

/**
 This class models a subset of the zmanim available in the framework.
 It's primary job is to provide metadata about which zmanim are currently
 supported, and which zmanim the user may wish to display.
 */
@implementation KCZmanimCollection

// MARK: - Convenience Initializers

/**
 A list containing the default collection of metadata for zmanim.
 */
+ (KCZmanimCollection *) defaultCollection; {
    return [[KCZmanimCollection alloc] initWithIdentifier:KCZmanimCollectionIdentifierDefault];
}

/**
 A collection containing the metadata of zmanim preferred by the user.
 */
+ (KCZmanimCollection *) preferredZmanim; {
    return [[KCZmanimCollection alloc] initWithIdentifier:KCZmanimCollectionIdentifierPreferred];
}


// MARK: - Initializer


/**
 Initializes a zmanim container matching a given identifier.

 @param identifier The identifier to use. If `nil`, a new collection is created.
 @return A collection.
 */
- (KCZmanimCollection *)initWithIdentifier:(NSString * _Nullable)identifier; {
    self = [super init];
    
    if (self) {
        _identifier = (NSString *)identifier;
        KCPersistence *container = [[KCPersistence alloc] init];
        self.items = (NSArray <KCZman *> *)[container persistedObjectForKey:(NSString *)identifier];
    }
    
    return self;
}

@end
