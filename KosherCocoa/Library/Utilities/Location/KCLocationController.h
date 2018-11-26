//
//  KCLocationController.h
//  KosherCocoa
//
//  Created by Moshe Berman on 11/25/18.
//  Copyright © 2018 Moshe Berman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "KCLocationTypes.h"

NS_ASSUME_NONNULL_BEGIN

@class KCGeoLocation;

/**
 KCLocationController provides a central interface for apps to perform the following location-related operations:
 - Use CoreLocation to detect the user's location.
 - Maintain a list of one or more locations for use with the framework.
 - Convert between Core Location and KCGeoLocation.
 */
@interface KCLocationController : NSObject

// MARK: - User Core Location to detect the user's location.

/**
 Updates the location using CoreLocation. Prompts for permission if necessary.

 @param completion A completion hander
 */
- (void)automaticLocationWithCompletion:(KCLocationUpdateCompletionBlock)completion;

// MARK: - Maintain a list of locations

/**
 Access array of locations that the user has persisted to disk.
 */
@property (strong, nonatomic) NSArray <KCGeoLocation *> *persistedLocations;

// TODO: Document keying mechanism for these two methods, once determined.

/**
 Persists a geolocation to disk. 

 @param geoLocation The location object to persist.
 */
- (void)persistLocation:(KCGeoLocation *)geoLocation;


/**
 Deletes a location object from the persisted store.
 
 @param geoLocation The object to delete.
 */
- (void)deletePersistedLocation:(KCGeoLocation *)geoLocation;

@end

NS_ASSUME_NONNULL_END
