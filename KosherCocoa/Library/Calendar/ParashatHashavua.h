//
//  WeeklyParsha.h
//  ParshaPort
//
//  Created by Moshe Berman on 1/17/11.
//  Copyright 2011 MosheBerman.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBCalendarCategories.h"

@interface ParashatHashavua : NSObject

@property (nonatomic, assign) BOOL useHebrewNames;

//
//  Return the parsha for the weekly parsha for a given date
//

- (NSString *)parashaForDate:(NSDate *)date inDiaspora:(BOOL)isInDiaspora;

//
//
//

- (NSArray *)parshiotForYearType:(kHebrewYearType)type inDiaspora:(BOOL)diaspora;

@end
