/**
 *  KCDafYomiCalculator.h
 *  KosherCocoa 3
 *
 *  Created by Moshe Berman on 11/13/11.
 *  Updated by Moshe Berman on 10/7/13.
 *
 *  Use of KosherCocoa 3 is governed by the LGPL 2.1 License.
 */

#import "KCDafYomiCalculator.h"

@interface KCDafYomiCalculator ()

//Calculate the Julian Day
- (NSInteger) julianDayForDate:(NSDate *)date;

//Convenience method for making a gregorian date
- (NSDate *)gregorianDateForYear:(NSInteger)year month:(NSInteger)month andDay:(NSInteger)day;

@end

@implementation KCDafYomiCalculator

#define kNumberOfMasechtos 40

- (id) initWithDate:(NSDate *)date
{
    
    self = [super init];
    
    if (self)
    {
        self.workingDate = date;
    }
    
    return self;
}

- (KCDaf *)dafYomiBavli
{
    return [self dafYomiBavliForDate:[NSDate date]];
}

- (KCDaf *)dafYomiBavliForDate:(NSDate *)date
{
    
    //Start on September 11, 1923
    NSDate *dafYomiStartDate = [self gregorianDateForYear:1923 month:9 andDay:11];
    NSInteger dafYomiJulianStartDay = [self julianDayForDate:dafYomiStartDate];
    NSDate *shekalimChangeDate = [self gregorianDateForYear:1975 month:6 andDay:24];
    NSInteger shekalimJulianChangeDay = [self julianDayForDate:shekalimChangeDate];
    
    //An array of the lengths of the meschtos
    NSInteger blattPerMasechta[] = {64, 157, 105, 121, 22, 88, 56, 40, 35, 31, 32, 29, 27, 122, 112, 91, 66, 49, 90, 82, 119, 119, 176, 113, 24, 49, 76, 14, 120, 110, 142, 61, 34, 34, 28, 22, 4, 10, 4, 73 };
    
    KCDaf *dafYomi;
    
    NSInteger julianDay = [self julianDayForDate:date];
    NSInteger cycleNo = 0;
    NSInteger dafNo = 0;
    
    if ([date timeIntervalSinceDate:dafYomiStartDate] < 0)
    {
        
        // Return nil, since the date passed in was before the beginning of the daf yomi cycle
        return nil;
    }
    
    if ([date timeIntervalSinceDate:shekalimChangeDate] >= 0) {
        cycleNo = 8 + ((julianDay - shekalimJulianChangeDay) / 2711);
        dafNo = ((julianDay - shekalimJulianChangeDay) % 2711);
    }
    else
    {
        cycleNo = 1 + ((julianDay - dafYomiJulianStartDay) / 2702);
        dafNo = ((julianDay - dafYomiJulianStartDay) % 2702);
    }
    
    NSInteger total = 0;
    NSInteger masechta = -1;
    NSInteger blatt = 0;
    
    /* Fix Shekalim for old cycles. */
    if (cycleNo <= 7)
    {
        blattPerMasechta[4] = 13;
    }
    /* Finally find the daf. */
    for (int j = 0; j < kNumberOfMasechtos; j++)
    {
        masechta++;
        total = total + blattPerMasechta[j] - 1;
        if (dafNo < total)
        {
            blatt = 1 + blattPerMasechta[j] - (total - dafNo);
            /* Fiddle with the weird ones near the end. */
            if (masechta == 36)
            {
                blatt += 21;
            }
            else if (masechta == 37)
            {
                blatt += 24;
            }
            else if (masechta == 38)
            {
                blatt += 33;
            }
            dafYomi = [[KCDaf alloc] initWithTractateIndex:masechta andPageNumber:blatt];
            break;
        }
    }
    
    return dafYomi;
}

#pragma mark - Date convenience methods

- (NSInteger) julianDayForDate:(NSDate *)date
{
    
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSInteger year = [[gregorianCalendar components:NSCalendarUnitYear fromDate:date] year];
    NSInteger month = [[gregorianCalendar components:NSCalendarUnitMonth fromDate:date] month];
    NSInteger day = [[gregorianCalendar components:NSCalendarUnitDay fromDate:date] day];
    
    
    if (month <= 2)
    {
        year -= 1;
        month += 12;
    }
    
    NSInteger a = year / 100;
    NSInteger b = 2 - a + a / 4;
    
    return (NSInteger) (floor(365.25 * (year + 4716)) + floor(30.6001 * (month + 1)) + day + b - 1524.5);
}

- (NSDate *)gregorianDateForYear:(NSInteger)year month:(NSInteger)month andDay:(NSInteger)day
{
    
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setYear:year];
    [dateComponents setMonth:month];
    [dateComponents setDay:day];
    
    NSDate *returnDate = [gregorianCalendar dateFromComponents:dateComponents];
    
    return returnDate;
}

@end
