//
//  KCPersistence.h
//  KosherCocoa
//
//  Created by Moshe Berman on 11/26/18.
//  Copyright © 2018 Moshe Berman. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


/**
 This class is responsible for several tasks related to persisting objects to disk.
 The purpose of this class is to abstract the underlying store, and if you do adopt it,
 do not rely on underlying implementation details remaining the same forever.
 
 - Write an object to a specified store.
 - Retrieve an object from a specified store.
 - TODO: Basic iCloud (Key-Value) support.
 */
@interface KCPersistence : NSObject

/**
 Stores a given object with the specified key.

 @param object The object to store. Must conform to NSCoding.
 @param key The key used to identify the object.
 @return YES if persisting succeeds, otherwise NO.
 */
- (BOOL)persistObject:(id<NSCoding>)object forKey:(NSString *)key;


/**
 Returns the object stored for a given key, if it exists.

 @param key The key to look up the object by.
 @return The object stored with the specified key, if it exists. Otherwise, returns nil.
 */
- (id<NSCoding> _Nullable)objectForKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
