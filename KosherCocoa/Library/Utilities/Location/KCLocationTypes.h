//
//  KCLocationBlockTypes.h
//  KosherCocoa
//
//  Created by Moshe Berman on 11/26/18.
//  Copyright © 2018 Moshe Berman. All rights reserved.
//

#ifndef KCLocationBlockTypes_h
#define KCLocationBlockTypes_h
@class KCGeoLocation;


/**
 A completion block that is called when the location manager is finished.

 @param locations An array of KCGeoLocation objects, mapped from CLLocationManager's locations array.
 @param error If location detection fails, an error describing the failure. Otherwise, nil.
 */
typedef void(^KCLocationUpdateCompletionBlock)(NSArray <KCGeoLocation *> *_Nullable locations, NSError * _Nullable error);

#endif /* KCLocationBlockTypes_h */
