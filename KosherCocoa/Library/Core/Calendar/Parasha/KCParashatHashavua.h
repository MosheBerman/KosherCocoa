//
//  WeeklyParsha.h
//  ParshaPort
//
//  Created by Moshe Berman on 1/17/11.
//  Copyright 2011 MosheBerman.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBCalendarCategories.h"
#import "KCParasha.h"

@interface KCParashatHashavua : NSObject

@property (nonatomic, assign) BOOL useHebrewNames;

//
//  Return the parsha for the weekly parsha for a given date
//

- (KCParasha *)parashaInDiasporaForDate:(NSDate *)date;
- (KCParasha *)parashaInIsraelForDate:(NSDate *)date;

/**
 *  Returns a listing of all parshiot in diaspora for the specificed year type.
 *  
 *  You can get the year type from the NSCalendar class method,
 *  `typeOfHebrewYearContainingDate:` as defined
 *  in NSDate+HebrewYearTypes category method.
 *
 *  @return An array of KCParasha objects.
 *
 */

- (NSArray *)parshiotInDiasporaDuringYearType:(kHebrewYearType)typeOfYear;
- (NSArray *)parshiotInIsraelDuringYearType:(kHebrewYearType)typeOfYear;

@end
