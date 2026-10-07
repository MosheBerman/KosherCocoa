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
    
    if (isnan(sunrise))
    {
        return nil;
    }
    
    return [self dateFromTime:sunrise];
    
}

- (NSDate * _Nullable)seaLevelSunrise
{
    double sunrise = [self UTCSeaLevelSunrise:kZenithGeometric];
    
    if (isnan(sunrise))
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
    
    if (isnan(sunset))
    {
        return nil;
    }
    
    return [self adjustedSunsetDateWithSunset:[self dateFromTime:sunset] andSunrise:[self sunrise]];
}

- (NSDate * _Nullable)seaLevelSunset
{
    double sunset = [self UTCSeaLevelSunset:kZenithGeometric];
    
    if (isnan(sunset))
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
   
    if (isnan(dawn))
    {
        return nil;
    }
    
    return  [self dateFromTime:dawn];
}

- (NSDate * _Nullable)sunsetOffsetByDegrees:(double)offsetZenith
{
    double sunset = [self UTCSunset:offsetZenith];
    
    if (isnan(sunset))
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
    
    if (isnan(time))
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
        returnDate = [self dateBySubtractingDays:1 fromDate:returnDate];
    }
    else if(time + offsetFromGMT < 0)
    {
        returnDate = [self dateByAddingDays:1 toDate:returnDate];
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

#import <math.h>

/* Degree-based trig helpers, implemented in trigonometry.c. */
double sinDeg(double deg);
double cosDeg(double deg);
double tanDeg(double deg);
double acosDeg(double x);

/* NOAA calculator primitives used by the time-at-azimuth algorithm below.
 * Declared here because KCNOAACalculator.h does not publish them; they exist
 * in KCNOAACalculator.m. */
@interface KCNOAACalculator (PolarInternal)
- (double)getJulianDay:(NSDate *)date;
- (double)getJulianCenturiesFromJulianDay:(double)julianDay;
- (double)getSunDeclination:(double)julianCenturies;
- (double)getEquationOfTime:(double)julianCenturies;
@end

/* Anchor a UTC fractional-hour time on a Y/M/D, exactly like Java's
 * getInstantFromTime: UTC midnight of the date plus the time. */
static NSDate *KCPolarUTCDate(NSInteger year, NSInteger month, NSInteger day, double timeUTC) {
    NSCalendar *utcCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    utcCalendar.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    comps.year = year;
    comps.month = month;
    comps.day = day;
    NSDate *utcMidnight = [utcCalendar dateFromComponents:comps];
    return [utcMidnight dateByAddingTimeInterval:timeUTC * 3600.0];
}

@implementation KCAstronomicalCalendar (Polar)

- (nullable NSDate *)timeAtAzimuth90Or270:(double)azimuth {
    if (azimuth != 90.0 && azimuth != 270.0) {
        @throw [NSException exceptionWithName:NSInvalidArgumentException
                                       reason:@"The targetAzimuth must be 90 or 270. Other azimuth values are not supported."
                                     userInfo:nil];
    }
    if (![self.astronomicalCalculator isKindOfClass:[KCNOAACalculator class]]) {
        return nil;
    }
    KCNOAACalculator *calculator = (KCNOAACalculator *)self.astronomicalCalculator;
    double longitude = self.geoLocation.longitude;
    double latitude = self.geoLocation.latitude;

    /* Port of NOAACalculator.getTimeAtAzimuth: iterate 3 times refining the
     * fraction of the day at which the sun hits the target azimuth. */
    double julianDay = [calculator getJulianDay:self.workingDate];
    double solarNoonBase = 0.5 - (longitude / 360.0);
    double dateTime = solarNoonBase + ((azimuth == 90.0) ? 0.25 : 0.75);
    for (int i = 0; i < 3; i++) {
        double julianCenturies = [calculator getJulianCenturiesFromJulianDay:(julianDay + dateTime)];
        double ratio = tanDeg([calculator getSunDeclination:julianCenturies]) / tanDeg(latitude);
        if (isnan(ratio) || ratio > 1.0 || ratio < -1.0) {
            return nil;
        }
        double offset = ((azimuth == 90.0) ? -1.0 : 1.0) * (acosDeg(ratio) / 360.0);
        dateTime = solarNoonBase + offset - ([calculator getEquationOfTime:julianCenturies] / 1440.0);
    }
    /* (dateTime * 24 % 24 + 24) % 24 */
    double timeUTC = fmod(dateTime * 24.0, 24.0);
    if (timeUTC < 0.0) {
        timeUTC += 24.0;
    }

    /* Port of AstronomicalCalendar.getInstantFromTime's date shift: the
     * location-local Y/M/D of the working date (the port does not implement
     * Java's antimeridian adjustment), rolled a day for the SUNRISE/SUNSET
     * edge cases, anchored at UTC midnight. */
    NSCalendar *locationCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    locationCalendar.timeZone = self.geoLocation.timeZone;
    NSDateComponents *ymd = [locationCalendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay)
                                               fromDate:self.workingDate];
    double localTimeHours = (longitude / 15.0) + timeUTC;
    NSInteger day = ymd.day;
    if (azimuth == 90.0) {
        if (localTimeHours > 18.0) {
            day -= 1;
        }
    } else {
        if (localTimeHours < 6.0) {
            day += 1;
        }
    }
    return KCPolarUTCDate(ymd.year, ymd.month, day, timeUTC);
}

@end
