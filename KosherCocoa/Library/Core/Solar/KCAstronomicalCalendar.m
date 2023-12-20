/**
 *  AstronomicalCalendar.m
 *  KosherCocoa 3
 *
 *  Created by Moshe Berman on 7/22/11.
 *  Modified by Moshe Berman on 1/12/15
 *
 *  Use of KosherCocoa 3 is governed by the LGPL 2.1 License.
 */

#import "KCAstronomicalCalendar.h"
#import "MBCalendarCategories.h"
#import "KCAstronomicalCalendar+DateManipulation.h"
#import "KCNOAACalculator.h"

@interface KCAstronomicalCalendar ()

@property (nonatomic, strong) NSCalendar *internalCalendar;

@end

@implementation KCAstronomicalCalendar

- (id)init
{
    self = [super init];
    if (self) {
        _internalCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        _workingDate = [NSDate date];
    }
    return self;
}

- (id) initWithLocation:(KCGeoLocation *)aGeoLocation
{
 
    self = [self init];
    
    if (self) {
        
        KCAstronomicalCalculator *tempCalc = [[KCNOAACalculator alloc] initWithGeoLocation:aGeoLocation];
        
        _astronomicalCalculator = tempCalc;
        
        _geoLocation = aGeoLocation;
        
        _workingDate = [NSDate date];
        
    }
    
    return self;
}

//
//
//

- (NSDate * _Nullable)sunrise
{
    double sunrise = [self UTCSunrise:kZenithGeometric];
    
    if (sunrise == NAN)
    {
        return nil;
    }
    
    return [self dateFromTime:sunrise];
    
}

- (NSDate * _Nullable)seaLevelSunrise
{
    double sunrise = [self UTCSeaLevelSunrise:kZenithGeometric];
    
    if (sunrise == NAN)
    {
        return nil;
    }
    
    return [self dateFromTime:sunrise];
}

- (NSDate * _Nullable)beginCivilTwilight
{
    return [self sunriseOffsetByDegrees:kZenithCivil];
}

- (NSDate * _Nullable)beginNauticalTwilight
{
    return [self sunriseOffsetByDegrees:kZenithNautical];
}

- (NSDate * _Nullable)beginAstronomicalTwilight
{
    return [self sunriseOffsetByDegrees:kZenithAstronomical];
}

- (NSDate * _Nullable)sunset
{
    double sunset = [self UTCSunset:kZenithGeometric];
    
    if (sunset == NAN)
    {
        return nil;
    }
    
    return [self adjustedSunsetDateWithSunset:[self dateFromTime:sunset] andSunrise:[self sunrise]];
}

- (NSDate * _Nullable)seaLevelSunset
{
    double sunset = [self UTCSeaLevelSunset:kZenithGeometric];
    
    if (sunset == NAN)
    {
        return nil;
    }
    
    return [self adjustedSunsetDateWithSunset:[self dateFromTime:sunset] andSunrise:[self sunrise]];
}

- (NSDate * _Nullable)adjustedSunsetDateWithSunset:(NSDate*)sunset andSunrise:(NSDate * _Nonnull)sunrise
{
 
    if (sunrise != nil && sunset != nil && ([sunrise timeIntervalSinceDate:sunset] > 0))
    {
        sunset = [self dateByAddingDays:1 toDate:sunset];
    }
    
    return sunset;
}

- (NSDate * _Nullable)endCivilTwilight
{
    return [self sunsetOffsetByDegrees:kZenithCivil];
}

- (NSDate * _Nullable)endNauticalTwilight{
    return [self sunsetOffsetByDegrees:kZenithNautical];
}

- (NSDate * _Nullable)endAstronomicalTwilight{
    return [self sunsetOffsetByDegrees:kZenithAstronomical];
}

- (NSDate * _Nullable)sunriseOffsetByDegrees:(double)offsetZenith
{
    double dawn = [self UTCSunrise:offsetZenith];
   
    if (dawn == NAN)
    {
        return nil;
    }
    
    return  [self dateFromTime:dawn];
}

- (NSDate * _Nullable)sunsetOffsetByDegrees:(double)offsetZenith
{
    double sunset = [self UTCSunset:offsetZenith];
    
    if (sunset == NAN)
    {
        return nil;
    }
    
    return [self adjustedSunsetDateWithSunset:[self dateFromTime:sunset] andSunrise:[self sunriseOffsetByDegrees:offsetZenith]];
}

- (double)UTCSunrise:(double)zenith
{
    return [self.astronomicalCalculator UTCSunriseForDate:self.workingDate andZenith:zenith adjustForElevation:YES];
}

- (double)UTCSeaLevelSunrise:(double)zenith
{
    double sunrise = [((KCNOAACalculator *)self.astronomicalCalculator) UTCSunriseForDate:self.workingDate andZenith:zenith adjustForElevation:NO];
    
    return sunrise;
}

- (double)UTCSunset:(double)zenith
{
    return [self.astronomicalCalculator UTCSunsetForDate:self.workingDate andZenith:zenith adjustForElevation:YES];
}

- (double)UTCSeaLevelSunset:(double)zenith
{
    return [self.astronomicalCalculator UTCSunsetForDate:self.workingDate andZenith:zenith adjustForElevation:NO];
}

#pragma mark - Temporal Hour (Shaa Zmanis)

- (double)temporalHourFromSunrise:(NSDate * _Nonnull)sunrise toSunset:(NSDate*)sunset
{
    if (sunrise == nil || sunset == nil)
    {
        return LONG_MIN;
    }
    
    return [sunset timeIntervalSinceDate:sunrise]/12;
    
}

- (NSDate * _Nullable)sunTransit
{
    return [[self sunrise] dateByAddingTimeInterval:[self temporalHourFromSunrise:[self sunrise] toSunset:[self sunset]]*6];
}


#pragma mark - NSDate Utility Methods

- (NSDate * _Nullable)dateFromTime:(double)time
{
    
    return [self dateFromTime:time inTimeZone:[NSTimeZone localTimeZone] onDate:self.workingDate];
}


//
//  A method that returns the calculated time
//  as an NSDate object based on a given time
//  zone and a given date.
//
//  Returns nil if the time passed in is NAN.
//

- (NSDate * _Nullable)dateFromTime:(double)time inTimeZone:(NSTimeZone *)tz onDate:(NSDate * _Nonnull)date
{
    
    //
    //  Return nil if the time is NAN
    //
    
    if (time == NAN)
    {
        NSLog(@"(%@: %@) Received an invalid number. I can't do anything with that...", self.class, NSStringFromSelector(_cmd));
        return nil;
    }
    
    if (date == nil) {
        NSLog(@"(%@: %@) Received an invalid date. I can't do anything with that...", self.description, NSStringFromSelector(_cmd));
        return nil;
    }
    
    //
    //  Copy the time, so we can
    //  manipulate it later when
    //  we need to break it into
    //  an NSDateComponents object.
    //
    
    double calculatedTime = time;
    
    //
    //  Create an instance of
    //  the Gregorian calendar.
    //
    
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    //
    //  Convert the current time
    //  into an NSDateComponents.
    //
    
    NSDateComponents *components = [gregorianCalendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitWeekOfYear | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitEra  fromDate:date];
    
    //
    //  Set the componenets time
    //  zone to GMT, since all of
    //  our calculations were done
    //  in GMT intially.
    //
    
    [components setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    
    int hours = (int) calculatedTime;               // retain only the hours
    calculatedTime -= hours;
    int minutes = (int) (calculatedTime *= 60);     // retain only the minutes
    calculatedTime -= minutes;
    int seconds = (int)(calculatedTime * 60);       // retain only the seconds
    //calculatedTime -= seconds;                    // remaining milliseconds - Commented out for Build & Analyze
    
    [components setHour: hours];
    [components setMinute:minutes];
    [components setSecond:seconds];
    
    //
    //  Convert the NSDateComponents
    //  to an NSDate which we will
    //  return to the user.
    //
    
    NSDate *returnDate = [gregorianCalendar dateFromComponents:components];
    
    //
    //  Here we apply a time zone
    //  offset. If the time is greater
    //  than 24, or less than 0, then
    //  we "roll" the date by a day.
    //
    //  We start by getting the
    //  timezone offset in hours...
    //
    
    double offsetFromGMT = [tz secondsFromGMTForDate:date]/3600.0;
    
    //
    //  ... here we perform the check
    //  then roll the date as necessary.
    //
    
    if (time + offsetFromGMT > 24)
    {
        returnDate = [NSDate dateWithTimeInterval:-86400 sinceDate:returnDate];
    }
    else if(time + offsetFromGMT < 0)
    {
        returnDate = [NSDate dateWithTimeInterval:86400 sinceDate:returnDate];
    }
    
    return returnDate;
}

- (NSString *)stringFromDate:(NSDate * _Nonnull)date forTimeZone:(NSTimeZone *)tz withSeconds:(BOOL)shouldShowSeconds{
    
    NSDateFormatter *form = [[NSDateFormatter alloc] init];
    
    if (shouldShowSeconds)
    {
        [form setTimeStyle:NSDateFormatterMediumStyle];
    }
    else
    {
        [form setTimeStyle:NSDateFormatterShortStyle];
    }

    [form setTimeZone:tz];
    
    return [form stringFromDate:date];
}

- (NSString *)stringFromDate:(NSDate * _Nonnull)date forTimeZone:(NSTimeZone *)timezone
{
    
    return [self stringFromDate:date forTimeZone:timezone withSeconds:YES];
    
}

#pragma mark - Message Forwarding

- (id)forwardingTargetForSelector:(SEL)aSelector
{
    //forward -setObject:forKey: and -objectForKey to the cache instance directly.
    SEL acceptableSelectors[] =
    {
        @selector(dateByAddingSeconds:toDate:),
        @selector(dateByAddingMinutes:toDate:),
        @selector(dateByAddingHours:toDate:),
        @selector(dateByAddingDays:toDate:),
        @selector(dateByAddingWeeks:toDate:),
        @selector(dateByAddingMonths:toDate:),
        @selector(dateByAddingYears:toDate:),
        @selector(dateBySubtractingSeconds:fromDate:),
        @selector(dateBySubtractingMinutes:fromDate:),
        @selector(dateBySubtractingHours:fromDate:),
        @selector(dateBySubtractingDays:fromDate:),
        @selector(dateBySubtractingWeeks:fromDate:),
        @selector(dateBySubtractingMonths:fromDate:),
        @selector(dateBySubtractingYears:fromDate:),
    };
    
    BOOL isAcceptable = NO;
    for(int i = 0; i < sizeof(acceptableSelectors) / sizeof(SEL); ++i)
    {
        if(acceptableSelectors[i] == aSelector)
        {
            isAcceptable = YES;
            break;
        }
    }
    
    if(isAcceptable && [_internalCalendar respondsToSelector:aSelector])
    {
        return _internalCalendar;
    }
    
    return [super forwardingTargetForSelector:aSelector];
}

#pragma mark - Internal Calendar

/** ---
 *  @name Internal Calendar
 *  ---
 */

/**
 *  Expose the internal calendar so the main class can
 *  appropriately forward methods.
 *
 */

- (NSCalendar *)internalCalendar
{
    return _internalCalendar;
}

@end
