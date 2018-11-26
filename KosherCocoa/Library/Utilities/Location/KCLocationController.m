//
//  KCLocationController.m
//  KosherCocoa
//
//  Created by Moshe Berman on 11/25/18.
//  Copyright © 2018 Moshe Berman. All rights reserved.
//

#import "KCLocationController.h"
#import "KCPersistence.h"

NSString * persistedLocationsKey = @"com.zmanimkit.persisted-locations";

@interface KCLocationController () <CLLocationManagerDelegate>

/**
 The internal location manager object.
 */
@property (strong, nonatomic) CLLocationManager *locationManager;

/**
 A persistent store.
 */
@property (strong, nonatomic) KCPersistence *store;
@end

@implementation KCLocationController

// MARK: - Initializer

- (instancetype)init
{
    self = [super init];
    if (self) {
        _locationManager = [[CLLocationManager alloc] init];
        _store = [[KCPersistence alloc] init];
    }
    return self;
}


// MARK: - User Core Location to detect the user's location.

/**
 Updates the location using CoreLocation. Prompts for permission if necessary.
 
 @param completion A completion hander
 */
- (void)automaticLocationWithCompletion:(KCLocationUpdateCompletionBlock)completion;
{
    
}

// MARK: - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    
}

// MARK: - Maintain a list of locations

/**
 Access array of locations that the user has persisted to disk.
 */
- (nonnull NSArray <KCGeoLocation *> *)persistedLocations;
{
    NSArray <KCGeoLocation *> * locations = (NSArray <KCGeoLocation *> *)[self.store objectForKey:persistedLocationsKey];
    if (!locations) {
        locations = @[];
    }
    return locations;
}

// TODO: Document keying mechanism for these two methods, once determined.

/**
 Persists a geolocation to disk.
 
 @param geoLocation The location object to persist.
 */
- (void)persistLocation:(KCGeoLocation *)geoLocation;
{
    NSArray <KCGeoLocation *> * persistedLocations = [self.persistedLocations arrayByAddingObject:geoLocation];
    [self.store persistObject:persistedLocations forKey:persistedLocationsKey];
}

/**
 Deletes a location object from the persisted store.
 
 @param geoLocation The object to delete.
 */
- (void)deletePersistedLocation:(KCGeoLocation *)geoLocation;
{
    NSMutableArray *locations = self.persistedLocations.mutableCopy;
    [locations removeObject:geoLocation];
    [self.store persistObject:locations forKey:persistedLocationsKey];
}



@end
