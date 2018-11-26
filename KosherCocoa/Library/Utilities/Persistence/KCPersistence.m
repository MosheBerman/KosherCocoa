//
//  KCPersistence.m
//  KosherCocoa
//
//  Created by Moshe Berman on 11/26/18.
//  Copyright © 2018 Moshe Berman. All rights reserved.
//

#import "KCPersistence.h"

@implementation KCPersistence

/**
 Stores a given object with the specified key.
 
 @param object The object to store. Must conform to NSCoding.
 @param key The key used to identify the object.
 @return YES if persisting succeeds, otherwise NO.
 */
- (BOOL)persistObject:(id<NSCoding>)object forKey:(NSString *)key;
{
    [NSUserDefaults.standardUserDefaults setObject:object forKey:key];
    return YES;
}

/**
 Returns the object stored for a given key, if it exists.
 
 @param key The key to look up the object by.
 @return The object stored with the specified key, if it exists. Otherwise, returns nil.
 */
- (id<NSCoding> _Nullable)objectForKey:(NSString *)key;
{
   return [NSUserDefaults.standardUserDefaults objectForKey:key];
}
@end
