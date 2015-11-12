/**
 *  NSCalendar+hebrewYearTypes.m
 *  KosherCocoa 3
 *
 *  Created by Moshe Berman on 5/9/13.
 *  Updated by Moshe Berman on 11/12/15.
 *
 *  Use of KosherCocoa 3 is governed by the LGPL 2.1 License.
 */
#import "MBCalendarCategories.h"

@implementation NSCalendar (HebrewYearTypes)

//  Returns a weekday, 1-7
+ (enum kWeekday)firstWeekdayOfHebrewYearContainingDate:(NSDate *)date;
{
    NSCalendar *hebrewCalendar = [self hebrewCalendar];
    
    NSInteger hebrewYear = [hebrewCalendar yearsInDate:date];
    
    NSDate *roshHashana = [NSDate dateWithDay:1 Month:1 Year:hebrewYear andCalendar:hebrewCalendar];
    
    return [hebrewCalendar weekdayInDate:roshHashana];
}

// Returns a year length, as per the comments in the kYearLength enum

+ (enum kYearLength)lengthOfHebrewYearContainingDate:(NSDate *)date
{
    
    NSCalendar *hebrewCalendar = [self hebrewCalendar];
    
    NSInteger hebrewYear = [[NSCalendar hebrewCalendar] yearsInDate:date];
    
    NSDate *previousRoshHashana = [NSDate dateWithDay:1 Month:1 Year:hebrewYear andCalendar:hebrewCalendar];
    NSDate *nextRoshHashana = [NSDate dateWithDay:1 Month:1 Year:hebrewYear+1 andCalendar:hebrewCalendar];
    
    //  We only care about the ones place in the length.
    NSInteger length = [[NSCalendar hebrewCalendar] daysFromDate:previousRoshHashana toDate:nextRoshHashana];
    
    length = length % 10;
    
    //  Years that end in a '3' are considered short
    if (length == 3)
    {
        return kYearLengthShort;
    }
    else if (length == 4)
    {
        return kYearLengthRegular;
    }
    else if (length == 5)
    {
        return kYearLengthLong;
    }
    
    return -1;
}

//  YES if the given date is represented by a hebrew year containing 13 months, else NO

+ (BOOL)isHebrewYearContainingDateALeapYear:(NSDate *)date
{
    NSInteger hebrewYear = [[NSCalendar hebrewCalendar] yearsInDate:date];
    
    NSDate *previousRoshHashana = [NSDate dateWithDay:1 Month:1 Year:hebrewYear andCalendar:[NSCalendar hebrewCalendar]];
    NSDate *nextRoshHashana = [NSDate dateWithDay:1 Month:1 Year:hebrewYear+1 andCalendar:[NSCalendar hebrewCalendar]];
    
    NSInteger months = [[self hebrewCalendar] monthsFromDate:previousRoshHashana toDate:nextRoshHashana];
    
    return months == 13;
}

//  Returns one of fourteen types. See the kHebrewYearType enum above.
+ (enum kHebrewYearType)typeOfHebrewYearContainingDate:(NSDate *)date
{
    enum kWeekday weekday = [self firstWeekdayOfHebrewYearContainingDate:date];

    enum kYearLength length = [self lengthOfHebrewYearContainingDate:date];
    
    BOOL isLeapYear = [self isHebrewYearContainingDateALeapYear:date];
    
    //  The first 7 types of years are not leap years.
    //  Non-leap years...
    if (!isLeapYear)
    {
        //  ...that are short years...
        if (length == kYearLengthShort)
        {
            //  ...that begin on Monday are type A
            if (weekday == kWeekdayMonday)
            {
                return kHebrewYearTypeA;
            }
            
            //  ...that begin on Saturday are type B
            else if(weekday == kWeekdaySaturday)
            {
                return kHebrewYearTypeB;
            }
        }
        
        //  ...that are regular years...
        else if (length == kYearLengthRegular)
        {
            //  ...that begin on Tuesday are type C
            if (weekday == kWeekdayTuesday)
            {
                return kHebrewYearTypeC;
            }
            
            // ...that begin on Thursday are type D
            else if (weekday == kWeekdayThursday) {
                return kHebrewYearTypeD;
            }
        }
        
        // ...that are long years...
        else if (length == kYearLengthLong)
        {
            
            //  ...that begin on Monday are type E
            if (weekday == kWeekdayMonday) {
                return kHebrewYearTypeE;
            }
            
            //  ...that begin on Thursday are type F
            else if (weekday == kWeekdayThursday) {
                return kHebrewYearTypeF;
            }
            
            //  ...that begin on Saturday are type G
            else if (weekday == kWeekdaySaturday) {
                return kHebrewYearTypeG;
            }
        }
    }
    
    //  The next 7 types of years are leap years. Leap years...
    else if (isLeapYear)
    {
        //  ...that are short years...
        if (length == kYearLengthShort)
        {
            //  ...that begin on Monday are type H.
            if (weekday == kWeekdayMonday)
            {
                return kHebrewYearTypeH;
            }
            
            //  ...that begin on Thursday are type I.
            else if (weekday == kWeekdayThursday) {
                return kHebrewYearTypeI;
            }
            
            //  ...that begin on Saturday are type J.
            else if (weekday == kWeekdaySaturday)
            {
                return kHebrewYearTypeJ;
            }
        }
        
        //  ...that are regular years...
        else if (length == kYearLengthRegular)
        {
            //  ...that begin on Tuesdat are type K
            if (weekday == kWeekdayTuesday)
            {
                return kHebrewYearTypeK;
            }
        }
        
        //  ...that are long years...
        else if(length == kYearLengthLong)
        {
            //  ...that begin on Monday are type L
            if (weekday == kWeekdayMonday)
            {
                return kHebrewYearTypeL;
            }
            
            //  ...that begin on Thursday are type M
            else if (weekday == kWeekdayThursday)
            {
                return kHebrewYearTypeM;
            }
            
            //  ...that begin on Saturday are type N
            else if (weekday == kWeekdaySaturday)
            {
                return kHebrewYearTypeN;
            }
        }
    }
    
    return -1;
}

//  Returns an NSCalendar initialized with the NSCalendarIdentifierHebrew identifier.
+ (NSCalendar *)hebrewCalendar
{
    return [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierHebrew];
}

@end
