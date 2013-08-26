//
//  SefiraDay.m
//  KosherCocoa 2
//
//  Created by Moshe Berman on 3/1/11.
//  Updated by Moshe Berman on 5/8/13.
//  Copyright 2011-2013 MosheBerman.com. All rights reserved.
//
//  Released under the MIT License.
//

#import "SefiratHaomer.h"
#import "MBCalendarCategories.h"

//  There are always 49 days in the sefira count
const NSInteger lengthOfSefira = 49;

@implementation SefiratHaomer

#pragma mark - Ranges

/* Checking If a Date Falls During Sefira */

+ (BOOL)fallsToday
{
    return [SefiratHaomer fallsOnDate:[NSDate date]];
}

//  YES if date is during the omer, else NO
+ (BOOL)fallsOnDate:(NSDate *)date
{
    return [SefiratHaomer dayOfSefiraForDate:date] != 0;
}

#pragma mark - Day of Sefira

/* Get Day of Sefira */

+ (NSInteger)dayOfSefira
{
	return [SefiratHaomer dayOfSefiraForDate:[NSDate date]];
}

// Returns 1-49, or 0 for all other days
+ (NSInteger)dayOfSefiraForDate:(NSDate *)date
{
	NSDate *firstDayOfTheOmer = [SefiratHaomer _dateOfSixteenNissanForYearOfDate:date];
    
    NSCalendar *hebrewCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSHebrewCalendar];
    
    return MAX(MIN([hebrewCalendar daysFromDate:firstDayOfTheOmer toDate:date], lengthOfSefira), 0);
}

#pragma mark - Utility Method

+ (NSDate *)_dateOfSixteenNissanForYearOfDate:(NSDate *)date
{
	NSCalendar *hebrewCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSHebrewCalendar];
	
    NSInteger hebrewYearInDate = [hebrewCalendar yearsInDate:date];
	
    //  Foundation reserves 7 for Adar II, so Nissan is 8
	return [NSDate dateWithDay:16 Month:8 Year:hebrewYearInDate andCalendar:hebrewCalendar];
}

@end
