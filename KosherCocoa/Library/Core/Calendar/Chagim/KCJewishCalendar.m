/**
 *  KCJewishCalendar.m
 *  KosherCocoa 3
 *
 *  Created by Moshe Berman on 11/11/11.
 *  Updated by Moshe Berman on 8/26/13.
 *
 *  Use of KosherCocoa 3 is governed by the LGPL 2.1 License.
 */

#import "KCJewishCalendar.h"
#import "KCDafYomiCalculator.h"
#import "KCConstants.h"
#import "MBCalendarCategories.h"
#import "KCAstronomicalCalendar+DateManipulation.h"

@implementation KCJewishCalendar

- (id)init {
    
    self = [super init];
    
    if (self)
    {
        _inIsrael = NO;
        _returnsModernHolidays = NO;
    }
    
    return self;
}

//Returns the current Yom Tov Index
- (NSInteger)yomTovIndex
{
    
    BOOL inIsrael = [self inIsrael];
    BOOL useModernHolidays = [self returnsModernHolidays];
    
    switch ([self currentHebrewMonth])
    {
        case kNissan:
            if ([self currentHebrewDayOfMonth] == 14)
            {
                return kErevPesach;
            }
            else if ([self currentHebrewDayOfMonth] == 15 || [self currentHebrewDayOfMonth] == 21
                     || (!inIsrael && ([self currentHebrewDayOfMonth] == 16 || [self currentHebrewDayOfMonth] == 22)))
            {
                return kPesach;
            }
            else if (([self currentHebrewDayOfMonth] >= 17 && [self currentHebrewDayOfMonth] <= 20)
                     || ([self currentHebrewDayOfMonth] == 16 && inIsrael))
            {
                return kCholHamoedPesach;
            }
            if (useModernHolidays
                && (([self currentHebrewDayOfMonth] == 26 && [self currentDayOfTheWeek] == 5)
                    || ([self currentHebrewDayOfMonth] == 28 && [self currentDayOfTheWeek] == 1)
                    || ([self currentHebrewDayOfMonth] == 27 && [self currentDayOfTheWeek] == 3)|| ([self currentHebrewDayOfMonth] == 27 && [self currentDayOfTheWeek] == 5)))
            {
                return kYomHashoah;
            }
            break;
        case kIyar:
            if (useModernHolidays
                && (([self currentHebrewDayOfMonth] == 4 && [self currentDayOfTheWeek] == 3)
                    || (([self currentHebrewDayOfMonth] == 3 || [self currentHebrewDayOfMonth] == 2)&& [self currentDayOfTheWeek] == 4)|| ([self currentHebrewDayOfMonth] == 5 && [self currentDayOfTheWeek] == 2)))
            {
                    return kYomHazikaron;
                }
            // if 5 Iyar falls on Wed Yom Haatzmaut is that day. If it falls on Friday or Shabbos it is moved back to
            // Thursday. If it falls on Monday it is moved to Tuesday
            if (useModernHolidays
                && (([self currentHebrewDayOfMonth] == 5 && [self currentDayOfTheWeek] == 4)
                    || (([self currentHebrewDayOfMonth] == 4 || [self currentHebrewDayOfMonth] == 3)&& [self currentDayOfTheWeek] == 5)|| ([self currentHebrewDayOfMonth] == 6 && [self currentDayOfTheWeek] == 3)))
            {
                    return kYomHaatzmaut;
                }
            if ([self currentHebrewDayOfMonth] == 14)
            {
                return kPesachSheni;
            }
            if (useModernHolidays && [self currentHebrewDayOfMonth] == 28)
            {
                return kYomHashoah;
            }
            break;
        case kSivan:
            if ([self currentHebrewDayOfMonth] == 5)
            {
                return kErevShavuos;
            }
            else if ([self currentHebrewDayOfMonth] == 6 || ([self currentHebrewDayOfMonth] == 7 && !inIsrael))
            {
                return kShavuos;
            }
            break;
        case kTammuz:
            // push off the fast day if it falls on Shabbos
            if (([self currentHebrewDayOfMonth] == 17 && [self currentDayOfTheWeek] != 7)
                || ([self currentHebrewDayOfMonth] == 18 && [self currentDayOfTheWeek] == 1))
            {
                return kSeventeenthOfTammuz;
            }
            break;
        case kAv:
            // if Tisha B'av falls on Shabbos, push off until Sunday
            if (([self currentDayOfTheWeek] == 1 && [self currentHebrewDayOfMonth] == 10)
                || ([self currentDayOfTheWeek] != 7 && [self currentHebrewDayOfMonth] == 9))
            {
                return kTishaBeav;
            } else if ([self currentHebrewDayOfMonth] == 15){
                return kTuBeav;
            }
            break;
        case kElul:
            if ([self currentHebrewDayOfMonth] == 29)
            {
                return kErevRoshHashana;
            }
            break;
        case kTishrei:
            if ([self currentHebrewDayOfMonth] == 1 || [self currentHebrewDayOfMonth] == 2)
            {
                return kRoshHashana;
            }
            else if (([self currentHebrewDayOfMonth] == 3 && [self currentDayOfTheWeek] != 7)
                       || ([self currentHebrewDayOfMonth] == 4 && [self currentDayOfTheWeek] == 1))
            {
                // push off Tzom Gedalia if it falls on Shabbos
                return kFastOfGedalya;
            }
            else if ([self currentHebrewDayOfMonth] == 9)
            {
                return kErevYomKippur;
            }
            else if ([self currentHebrewDayOfMonth] == 10)
            {
                return kYomKippur;
            }
            else if ([self currentHebrewDayOfMonth] == 14)
            {
                return kErevSuccos;
            }
            if ([self currentHebrewDayOfMonth] == 15 || ([self currentHebrewDayOfMonth] == 16 && !inIsrael))
            {
                return kSuccos;
            }
            if (([self currentHebrewDayOfMonth] >= 17 && [self currentHebrewDayOfMonth] <= 20)|| ([self currentHebrewDayOfMonth] == 16 && inIsrael))
            {
                return kCholHamoedSuccos;
            }
            if ([self currentHebrewDayOfMonth] == 21)
            {
                return kHoshanaRabba;
            }
            if ([self currentHebrewDayOfMonth] == 22)
            {
                return kSheminiAtzeres;
            }
            if ([self currentHebrewDayOfMonth] == 23 && !inIsrael)
            {
                return kSimchasTorah;
            }
            break;
        case kKislev: //no yomtov in CHESHVAN
            if ([self currentHebrewDayOfMonth] == 24)
            {
                return kErevChanukah;
            }
            else
            {
                if ([self currentHebrewDayOfMonth] >= 25)
                {
                    return kChanukah;
                }
            }
            break;
        case kTeves:
            if ([self currentHebrewDayOfMonth] == 1 || [self currentHebrewDayOfMonth] == 2
                || ([self currentHebrewDayOfMonth] == 3 && [self isKislevShort]))
            {
                return kChanukah;
            }
            else if ([self currentHebrewDayOfMonth] == 10)
            {
                return kTenthOfTeves;
            }
            break;
        case kShevat:
            if ([self currentHebrewDayOfMonth] == 15)
            {
                return kTuBeshvat;
            }
            break;
        case kAdar:
            if (![self isCurrentlyHebrewLeapYear])
            {
                // if 13th Adar falls on Friday or Shabbos, push back to Thursday
                if ((([self currentHebrewDayOfMonth] == 11 || [self currentHebrewDayOfMonth] == 12)&& [self currentDayOfTheWeek] == 5)
                    || ([self currentHebrewDayOfMonth] == 13 && !([self currentDayOfTheWeek] == 6 || [self currentDayOfTheWeek] == 7)))
                {
                    return kFastOfEsther;
                }
                if ([self currentHebrewDayOfMonth] == 14)
                {
                    return kPurim;
                }
                else if ([self currentHebrewDayOfMonth] == 15)
                {
                    return kShushanPurim;
                }
            }
            // else if a leap year
            else
            {
                if ([self currentHebrewDayOfMonth] == 14)
                {
                    return kPurimKatan;
                }
            }
            break;
        case kAdar_II:
            // if 13th Adar falls on Friday or Shabbos, push back to Thursday
            if ((([self currentHebrewDayOfMonth] == 11 || [self currentHebrewDayOfMonth] == 12)&& [self currentDayOfTheWeek] == 5)
                || ([self currentHebrewDayOfMonth] == 13 && !([self currentDayOfTheWeek] == 6 || [self currentDayOfTheWeek] == 7)))
            {
                return kFastOfEsther;
            }
            if ([self currentHebrewDayOfMonth] == 14)
            {
                return kPurim;
            }
            else if ([self currentHebrewDayOfMonth] == 15)
            {
                return kShushanPurim;
            }
            break;
    }
    // if we get to this stage, then there are no holidays for the given date return -1
    return -1;
}


//Returns true if the current day is Yom Tov. The method
//returns false for Chanukah, Erev Yom tov and fast days.
- (BOOL)isYomTov
{
    NSInteger holidayIndex = [self yomTovIndex];
    
    if ([self isErevYomTov] || holidayIndex == kChanukah || ([self isTaanis] && holidayIndex != kYomKippur))
    {
        return false;
    }
    
    return [self yomTovIndex] != -1;
}

//Returns true if the current day is Chol Hamoed of Pesach or Succos.
- (BOOL)isCholHamoed
{
    NSInteger holidayIndex = [self yomTovIndex];
    
    return (holidayIndex == kCholHamoedPesach || holidayIndex == kCholHamoedSuccos);
}

//Returns true if the current day is Chol Hamoed of Succos.
- (BOOL)isCholHamoedSuccos
{
    return ([self currentHebrewMonth] == kTishrei) && (([self currentHebrewDayOfMonth] >= 17 && [self currentHebrewDayOfMonth] <= 20) || ([self currentHebrewDayOfMonth] == 16 && _inIsrael));
}

//Returns true if the current day is Chol Hamoed of Pesach.
- (BOOL)isCholHamoedPesach
{
    return [self currentHebrewMonth] == kNissan && [self isCholHamoed];
}

//Returns true if the current day is erev Yom Tov. The method returns true
//for Erev - Pesach, Shavuos, Rosh Hashana, Yom Kippur and Succos.
- (BOOL)isErevYomTov
{
    NSInteger holidayIndex = [self yomTovIndex];

    return holidayIndex == kErevPesach || holidayIndex == kErevShavuos || holidayIndex == kErevRoshHashana
    || holidayIndex == kErevYomKippur || holidayIndex == kErevSuccos;
}

// Returns true if the current day is Erev Rosh
// Chodesh. Returns false for Erev Rosh Hashana
- (BOOL)isErevRoshChodesh
{
    return ([self currentHebrewDayOfMonth] == 29 && [self currentHebrewMonth] != kElul);
}

//Return true if the day is a Taanis (fast day). Return true for
//17 of Tammuz, Tisha B'Av, Yom Kippur, Fast of Gedalyah, 10 of
//Teves and the Fast of Esther
- (BOOL)isTaanis
{
    NSInteger holidayIndex = [self yomTovIndex];
    
    return holidayIndex == kSeventeenthOfTammuz || holidayIndex == kTishaBeav || holidayIndex == kYomKippur
    || holidayIndex == kFastOfGedalya || holidayIndex == kTenthOfTeves || holidayIndex == kFastOfEsther;
}

//Returns the day of Chanukah or -1 if it is not Chanukah.
- (NSInteger)dayOfChanukah
{
    if ([self isChanukah])
    {
        if ([self currentHebrewMonth] == kKislev)
        {
            return [self currentHebrewDayOfMonth] - 24;
        }
        else     // teves
        {
            return [self isKislevShort] ? [self currentHebrewDayOfMonth] + 5 : [self currentHebrewDayOfMonth] + 6;
        }
    }
    else
    {
        return -1;
    }
}

//Returns if a given day is chanukah
- (BOOL)isChanukah
{
    return [self yomTovIndex] == kChanukah;
}

// Returns if a given day is purim
- (BOOL)isPurim
{
    return [self yomTovIndex] == kPurim;
}

//Returns if the day is Rosh Chodesh. Rosh Hashana will return false
- (BOOL)isRoshChodesh
{
    return ([self currentHebrewDayOfMonth] == 1 && [self currentHebrewMonth] != kTishrei)|| [self currentHebrewDayOfMonth] == 30;
}

//returns if a given day is pesach
- (BOOL)isPesach
{
    return [self yomTovIndex] == kPesach;
}

//Returns if a given day is shavuos
- (BOOL)isShavuos
{
    return [self yomTovIndex] == kShavuos;
}

//Returns if a given day is succos
- (BOOL)isSuccos
{
    return [self yomTovIndex] == kSuccos;
}

//Returns if a given day is simchat torah
- (BOOL)isSimchasTorah
{
    if ([self currentHebrewMonth] == kTishrei)
    {
        if(([self currentHebrewDayOfMonth] == 22 && !_inIsrael)|| [self currentHebrewDayOfMonth] == 21)
        {
            return YES;
        }
    }
    
    return NO;
}

//Returns if a given day is Shmini Atzeres
- (BOOL)isShminiAtzeres
{
    return ([self currentHebrewMonth] == kTishrei && [self currentHebrewDayOfMonth] == 22);
}

#pragma mark - Kiddush Levana Code.

- (NSDate *)moladTohuAsDate
{
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents *tohuComponents = [[NSDateComponents alloc] init];
    [tohuComponents setCalendar:gregorianCalendar];
    [tohuComponents setYear:-3760];
    [tohuComponents setMonth:9];
    [tohuComponents setDay:6];
    [tohuComponents setHour:5];
    [tohuComponents setMinute:0];
    [tohuComponents setSecond:204*3.5];
    
    NSDate *tohu = [gregorianCalendar dateFromComponents:tohuComponents];
    
    return tohu;
}

- (NSDate *)moladByAddingMonthsToTohu:(NSInteger)numberOfMonths
{
    
    NSDate *tohu = [self moladTohuAsDate];
    
    
    //
    //  For each month, add 1 day 12 hours 793 chalakim
    //
    
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSUInteger componentTypes = (NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond);
    
    NSDateComponents *components = [gregorianCalendar components:componentTypes fromDate:tohu];
    
    NSInteger day = [components day] + (1*numberOfMonths);
    NSInteger hour = [components hour] + (12*numberOfMonths);
    NSInteger seconds = [components second] + (793*3.5*numberOfMonths);
    
    [components setDay:day];
    [components setHour:hour];
    [components setSecond:seconds];
    
    NSDate *newMolad = [gregorianCalendar dateFromComponents:components];
    
    return newMolad;
}

- (NSInteger)numberOfMonthsBetweenMoladTohuAndDate:(NSDate *)date
{
    
    NSDate *tohu = [self moladTohuAsDate];
    
    NSCalendar *hebrewCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierHebrew];
    
    NSDateComponents *comps = [hebrewCalendar components:NSCalendarUnitMonth fromDate:tohu toDate:date options:0];
    
    return [comps month];
}

- (NSDate *)moladForDate:(NSDate*)date
{
    NSUInteger monthDifference = [self numberOfMonthsBetweenMoladTohuAndDate:date];
    return [self moladByAddingMonthsToTohu:monthDifference];
}

//  Returns the molad in Standard Time in Yerushalayim as an NSDate.
//  The traditional calculation uses local time. This
//  method subtracts 20.94 minutes (20 minutes and 56.496 seconds)
//  from the local time (Har Habayis with a longitude
//  of 35.2354&deg; is 5.2354&deg; away from the %15 timezone longitude)
//  to get to standard time. This method
//  intentionally uses standard time and not daylight savings time.
//  Java will implicitly format the time to the default (or set)Timezone.
//
//  The Java version of this method expects 1 for Nissan and 13 for Adar II. Use the constants to avoid
//  any confusion. Objective-C handles this differently though... Read on:
//
//  Objective-C uses 1 for Tishri and *8* for Nissan. Adar is 6 and 7 during a regular year.
//  During a leap year, 7 is Adar II.
//
//

- (NSDate *)moladAsDateForMonth:(NSInteger)month ofYear:(NSInteger)year
{
    NSDate *dateFromMonthAndYear = [NSDate dateWithHebrewMonth:month andDay:1 andYear:year];
    return [self moladForDate:dateFromMonthAndYear];
}

//Returns the earliest time of Kiddush Levana calculated as 3 days after the molad.
//TODO: Currently returns the time even if it is during the day. It should return
//the 72 Minute Tzais after to the time if the zman is between Alos and Tzais.

- (NSDate *)tchilasZmanKidushLevana3DaysForDate:(NSDate *)date
{
    NSDate *molad = [self moladForDate:date];
    
    NSCalendar *hebrewCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierHebrew];
    [hebrewCalendar dateByAddingDays:3 toDate:molad];
    
    return [self moladForDate:molad];
}

//  This method exists only for KosherJava compatibility
- (NSDate *)tchilasZmanKidushLevana3DaysForMonth:(NSInteger)month ofYear:(NSInteger)year
{
    NSDate *dateFromMonthAndYear = [NSDate dateWithHebrewMonth:month andDay:1 andYear:year];
    
    return [self tchilasZmanKidushLevana3DaysForDate:dateFromMonthAndYear];
}

//Returns the earliest time of Kiddush Levana calculated as 7 days after the molad.
//TODO: Currently returns the time even if it is during the day. It should return
//the 72 Minute Tzais after to the time if the zman is between Alos and Tzais.

- (NSDate *)tchilasZmanKidushLevana7DaysForDate:(NSDate *)date
{
    NSDate *molad = [self moladForDate:date];
    
    NSCalendar *hebrewCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierHebrew];
    [hebrewCalendar dateByAddingDays:7 toDate:molad];
    
    return [self moladForDate:molad];
}

//  This method exists only for KosherJava compatibility
- (NSDate *)tchilasZmanKidushLevana7DaysForMonth:(NSInteger)month ofYear:(NSInteger)year
{
    
    NSDate *dateFromMonthAndYear = [NSDate dateWithHebrewMonth:month andDay:1 andYear:year];
    
    return [self tchilasZmanKidushLevana7DaysForDate:dateFromMonthAndYear];
}

//Returns the latest time of Kiddush Levana according to the
//<a href="http://en.wikipedia.org/wiki/Yaakov_ben_Moshe_Levi_Moelin">Maharil's</a> opinion
//that it is calculated as
//halfway between molad and molad. This adds half the 29 days, 12 hours and 793 chalakim
//time between molad and
// molad (14 days, 18 hours, 22 minutes and 666 milliseconds)to the month's molad.
//TODO:Currently returns the time even if it is during the day.
//It should return the 72 Minute Alos
// prior to the time if the zman is between Alos and Tzais.

- (NSDate *)sofZmanKidushLevanaBetweenMoldosForDate:(NSDate *)date
{
    
    //  Get the molad
    
    NSDate *molad = [self moladForDate:date];
    
    //
    //  Get an NSDate for one month later
    //
    
    NSCalendar *hebrewCalendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierHebrew];
    
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setMonth:1];
    
    NSDate *nextMonth = [hebrewCalendar dateByAddingMonths:1 toDate:date];
    
    //  Get the next molad
    
    NSDate *nextMolad = [self moladForDate:nextMonth];
    
    //  Pull out the number of seconds in between the two moladot
    NSDateComponents *secondsComps = [hebrewCalendar components:NSCalendarUnitSecond fromDate:molad toDate:nextMolad options:0];

    molad = [molad dateByAddingTimeInterval:[secondsComps second]];
    
    return molad;
}

//  This method exists only for KosherJava compatibility
- (NSDate *)sofZmanKidushLevanaBetweenMoldosForMonth:(NSInteger)month ofYear:(NSInteger)year
{
    
    //
    //  Convert the month and day into an NSDate
    //
    
    NSDate *dateFromMonthAndYear = [NSDate dateWithHebrewMonth:month andDay:1 andYear:year];
    
    return [self sofZmanKidushLevanaBetweenMoldosForDate:dateFromMonthAndYear];
}

//Returns the latest time of Kiddush Levana calculated as 15 days after the molad.
//  This is the opinion brought down
// in the Shulchan Aruch (Orach Chaim 426). It should be noted that some opinions hold that the
// <http://en.wikipedia.org/wiki/Moses_Isserles">Rema</a> who brings down the opinion of the <a
// href="http://en.wikipedia.org/wiki/Yaakov_ben_Moshe_Levi_Moelin">Maharil's</a> of calculating
// half way between molad and molad is of the opinion that the Mechaber agrees to his opinion.
//  Also see the Aruch Hashulchan.
//  For additional details on the subject, See Rabbi
// Dovid Heber's very detailed writeup in Siman Daled (chapter 4)of <a
// href="http://www.worldcat.org/oclc/461326125">Shaarei Zmanim</a>. TODO: Currently returns the time even if it is
// during the day. It should return the  Alos prior to the
// time if the zman is between Alos and Tzais.

- (NSDate *)sofZmanKidushLevana15DaysForDate:(NSDate *)date
{
    //  Get the molad
    
    NSDate *molad = [self moladForDate:date];
    
    NSCalendar *hebrewCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierHebrew];
    return [hebrewCalendar dateByAddingDays:15 toDate:molad];
}

//  This method exists only for KosherJava compatibility
- (NSDate *)sofZmanKidushLevana15DaysForMonth:(NSInteger)month ofYear:(NSInteger)year
{
    
    //
    //  Convert the month and day into an NSDate
    //
    
    NSDate *dateFromMonthAndYear = [NSDate dateWithHebrewMonth:month andDay:1 andYear:year];
    
    return [self sofZmanKidushLevana15DaysForDate:dateFromMonthAndYear];
    
}

//Returns the Daf Yomi (Bavli)for the date that the calendar is set to.
- (KCDaf *)dafYomiBavli
{
    KCDafYomiCalculator *calculator = [[KCDafYomiCalculator alloc] initWithDate:self.workingDate];

    return [calculator dafYomiBavliForDate:self.workingDate];
}

#pragma mark - Calendar Utility Methods

//Returns the current hebrew month
- (NSInteger)currentHebrewMonth
{
    NSCalendar *hebrewCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierHebrew];
    
    return [[hebrewCalendar components:NSCalendarUnitMonth fromDate:[self workingDateAdjustedForSunset]] month];
}

//Returns the day of the current hebrew month
- (NSInteger)currentHebrewDayOfMonth
{
    NSDate *now = [self workingDateAdjustedForSunset];
    NSCalendar *hebrewCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierHebrew];

    return [[hebrewCalendar components:NSCalendarUnitDay fromDate:now] day];
}

//Returns the current day of the week
- (NSInteger)currentDayOfTheWeek
{
    NSDate *now = self.workingDate;
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];

    return [[gregorianCalendar components:NSCalendarUnitWeekday fromDate:now] weekday];
}

//Determine if the current year is a hebrew leap year
- (BOOL)isCurrentlyHebrewLeapYear
{
    NSDate *now = [self workingDateAdjustedForSunset];
    NSCalendar *hebrewCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierHebrew];
    NSInteger year = [[hebrewCalendar components:NSCalendarUnitYear fromDate:now] year];

    return [self isHebrewLeapYear:year];
}

//	Check if a given year is a leap year
- (BOOL)isHebrewLeapYear:(NSInteger)year
{
	return ((7 * year + 1)% 19)< 7;
}

//Determine if kislev is short this year
- (BOOL)isKislevShort
{
    return [self lengthOfHebrewYear:[self currentHebrewYear]] % 10 == 3;
}

//Get the current hebrew year
- (NSInteger)currentHebrewYear
{
    NSDate *now = [self workingDateAdjustedForSunset];
    NSCalendar *hebrewCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierHebrew];

    return [[hebrewCalendar components:NSCalendarUnitYear fromDate:now] year];
}

#pragma mark - Year Length

- (NSInteger)lengthOfHebrewYear:(NSInteger)year
{
    //  Create a Hebrew calendar object.
	NSCalendar *hebrewCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierHebrew];
	
    NSDate *thisRoshHashana = [NSDate dateWithDay:1 Month:1 Year:year andCalendar:hebrewCalendar];
	NSDate *nextRoshHashana = [NSDate dateWithDay:1 Month:1 Year:year+1 andCalendar:hebrewCalendar];
    
    //
	//	Length of this year
    //  in days, as an NSTimeInterval
    //  which actually a double
    //
    
	NSTimeInterval totalDaysInTheYear = [hebrewCalendar daysFromDate:thisRoshHashana toDate:nextRoshHashana];
    
    //
    //  Here, we convert the result
    //  into an integer, so that we
    //  can easily use the result
    //  later on, in the yeartype
    //  dependent methods.
    //
    
    if(totalDaysInTheYear == 353 || totalDaysInTheYear == 383)
    {
		totalDaysInTheYear = 0;
	}
    else if(totalDaysInTheYear == 354 || totalDaysInTheYear == 384)
    {
		totalDaysInTheYear = 1;
	}
    else if(totalDaysInTheYear == 355 || totalDaysInTheYear == 385)
    {
		totalDaysInTheYear = 2;
	}
    
    return totalDaysInTheYear;
}

#pragma mark - Molad Methods

//Converts the the Nissan based constants used by
//this class to numeric month starting from Tishrei.
//This is required for Molad claculations.

- (NSInteger)adjustedMonthToStartFromTishreiForMonth:(NSInteger)month ofYear:(NSInteger)year
{
    BOOL isLeapYear = [self isHebrewLeapYear:[self currentHebrewYear]];

    return (month + (isLeapYear ? 6 : 5))% (isLeapYear ? 13 : 12)+ 1;
}

- (NSInteger)chalakimSinceMoladTohuForMonth:(NSInteger)month andYear:(NSInteger)year
{
    NSInteger monthOfYear = [self adjustedMonthToStartFromTishreiForMonth:month ofYear:year];
    NSInteger monthsElapsed = (235 * ((year - 1)/ 19))// Months in complete 19 year lunar (Metonic)cycles so far
    + (12 * ((year - 1)% 19))// Regular months in this cycle
    + ((7 * ((year - 1)% 19)+ 1)/ 19)// Leap months this cycle
    + (monthOfYear - 1); // add elapsed months till the start of the molad of the month
    // return chalakim prior to BeHaRaD + number of chalakim since

    return kChalakimMoladTohu + (kChalakimPerMonth * monthsElapsed);
}

//
//  Returns the friday following a given date
//

- (NSDate *)fridayFollowingDate:(NSDate *)workingDate
{
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
	
	NSDateComponents *gregorianDateComponents = [gregorianCalendar components:NSCalendarUnitWeekday fromDate:workingDate];
 	
	NSInteger weekday = [gregorianDateComponents weekday];
    
    return [self dateByAddingDays:(6-weekday) toDate:workingDate];
}

#pragma mark - Working Date

- (NSDate *)workingDateAdjustedForSunset
{
    NSDate *returnDate = [super workingDate];
    
    BOOL isAfterSunset = [[self sunset] timeIntervalSinceNow] < 0;
    
    if (isAfterSunset)
    {
        NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        returnDate = [gregorianCalendar dateByAddingDays:1 toDate:returnDate];
    }
    
    return returnDate;
}

@end
