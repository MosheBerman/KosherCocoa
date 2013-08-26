//
//  Daf.h
//  KosherCocoaCommandLine
//
//  Created by Moshe Berman on 11/13/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Daf : NSObject
@property NSInteger mesechtaNumber;
@property NSInteger daf;

- (id) initWithMesechta:(NSInteger)aMesechtaNumber andDaf:(NSInteger)aDaf;

@end
