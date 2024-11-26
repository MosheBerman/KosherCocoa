/**
 *  KCSefiratHaomerCalculator.m
 *  KosherCocoa 3
 *
 *  Created by Moshe Berman on 3/1/11.
 *  Updated by Moshe Berman on 10/8/13.
 *
 *  Use of KosherCocoa 3 is governed by the LGPL 2.1 License.
 */

#import "KCSefiratHaomerCalculator.h"
#import "MBCalendarCategories.h"

//  There are always 49 days in the sefira count
const NSInteger lengthOfSefira = 49;

@implementation KCSefiratHaomerCalculator

#pragma mark - Ranges

/* Checking If a Date Falls During Sefira */

+ (BOOL)fallsToday
{
    return [KCSefiratHaomerCalculator fallsOnDate:[NSDate date]];
}

//  YES if date is during the omer, else NO
+ (BOOL)fallsOnDate:(NSDate * _Nonnull)date
{
    return [KCSefiratHaomerCalculator dayOfSefiraForDate:date] != 0;
}

#pragma mark - Day of Sefira

/* Get Day of Sefira */

+ (NSInteger)dayOfSefira
{
	return [KCSefiratHaomerCalculator dayOfSefiraForDate:[NSDate date]];
}

// Returns 1-49, or 0 for all other days
+ (NSInteger)dayOfSefiraForDate:(NSDate * _Nonnull)date
{
	NSDate *firstDayOfTheOmer = [KCSefiratHaomerCalculator dateOfSixteenNissanForYearOfDate:date];
    
    NSCalendar *hebrewCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierHebrew];
    
    NSInteger day = [hebrewCalendar daysFromDate:firstDayOfTheOmer toDate:date] + 1;     //  Add one because the sixteenth is the first night, but is zero days since sixteen.
    
    if (day < 0 || day > 49)
    {
        day = 0;
    }
    
    return day;
}

#pragma mark - Utility Method

/**
 *  Constructs an NSDate representing the first day of
 *  counting - 16 Nissan, during the year supplied by
 *  the date parameter.
 *
 *  @param date An NSDate to use to get the year of the return date.
 *
 *  @return A date representing the 16th of Nissan during the year
 *          of the supplied date.
 */

+ (NSDate *)dateOfSixteenNissanForYearOfDate:(NSDate * _Nonnull)date
{
	NSCalendar *hebrewCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierHebrew];
	
    NSInteger hebrewYearInDate = [hebrewCalendar yearsInDate:date];
	
    //  Foundation reserves 7 for Adar II, so Nissan is 8
	return [NSDate dateWithDay:16 Month:8 Year:hebrewYearInDate andCalendar:hebrewCalendar];
}

@end
