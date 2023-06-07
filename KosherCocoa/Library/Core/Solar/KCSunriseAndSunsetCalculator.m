/**
 *  SunriseAndSunset.h
 *  KosherCocoa 3
 *
 *  Created by Moshe Berman on 3/29/11.
 *  Modified by Moshe Berman on 8/25/13
 *
 *  Use of KosherCocoa 3 is governed by the LGPL 2.1 License.
 */

#import "KCSunriseAndSunsetCalculator.h"
#import "trigonometry.h"

@implementation KCSunriseAndSunsetCalculator

- (id)initWithGeoLocation:(KCGeoLocation *)geolocation
{
    
    self = [super init];
    
    if (self)
    {
        [self setCalculatorName:@"United States Naval Almanac Algorithm"];
        
        //
        //  If there's no GeoLocation, then
        //  create one for where the equator
        //  and the prime meridian meet.
        //
        
        
        if (!geolocation)
        {
            
            //
            //  Create the default KCGeoLocation
            //
            
            KCGeoLocation *tempG = [[KCGeoLocation alloc] initWithName:@"Default" andLatitude:0.0 andLongitude:0.0 andTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0.0]];
            
            //
            //  Assign it to the geoLoc object
            //
            
            geolocation = tempG;
            
        }
        
        //
        //  Store the geoLocation object
        //
        
        _geoLocation = geolocation;
    }
    
    return self;
}



/**
 *  A method returning the sunrise  or sinsetin UTC as a double. If an error was
 *  encountered in the calculation (as expected in some locations, such
 *  as near the poles) NAN will be returned.
 *
 *  @param year A Gregorian year number as an integer.
 *
 *  @param month The month of the gregorian year. Valud values range from 1 to 12.
 *
 *  @param day The day of the gregorian month. Valid values range from 1 to 31.
 *
 *  @param longitude The longitude in degrees. (Longitude values west of Meridian are negative.)
 *
 *  @param latitude The latitude in degrees. longitudes south of Equator are negative
 *
 *  @param zenith Which zenith to use in the calculation.
 *
 *  @param type The type of calculation to carry out. Values are kCalcTypeSunrise or kCalcTypeSunset. (Alternatively, an integer 0 or 1)
 *
 *  @return The time that sunset occurs UTC as a double.
 */


- (double)sunriseOrSunsetForYear:(NSInteger)year andMonth:(NSInteger)month andDay:(NSInteger)day atLongitude:(double)longitude andLatitude:(double)latitude withZenith:(double)zenith andType:(NSInteger)type
{
    
    NSInteger dayOfYear = [self dayOfYearForYear:year andMonth:month andDay:day];
    
    double sunMeanAnomaly = [self meanAnomalyForDayOfYear:dayOfYear atLongitude:longitude forCalculationType:type];
    
    double sunTrueLong = [self sunTrueLongitudeFromAnomaly:sunMeanAnomaly];
    
    double sunRightAscensionHours = [self sunRightAscensionHoursForLongitude:sunTrueLong];
    
    double cosLocalHourAngle = [self cosLocalHourAngleForAngle:sunTrueLong andLatitude:latitude andZenith:zenith];
    
    double localHourAngle = 0;
    
    if (type == kTypeSunrise)
    {
        if (cosLocalHourAngle > 1)
        { // no rise. No need for an Exception
            // since the calculation
            // will return NaN
        }
        localHourAngle = 360.0 - acosDeg(cosLocalHourAngle);
    }
    else /* if (type == TYPE_SUNSET)*/
    {
        if (cosLocalHourAngle < -1)
        {// no SET. No need for an Exception
            // since the calculation
            // will return Double.NaN
        }
        localHourAngle = acosDeg(cosLocalHourAngle);
    }
    double localHour = localHourAngle / kDegreesPerHour;
    
    double localMeanTime = [self localMeanTimeForHour:localHour andAscension:sunRightAscensionHours andApproxTimeDays:[self approxTimeDaysForDayOfYear:dayOfYear withHoursFromMeridian:[self hoursFromMeridianForLongitude:longitude] forCalculationType:type]];
    
    double processedTime = localMeanTime - [self hoursFromMeridianForLongitude:longitude];
    
	while (processedTime < 0.0)
    {
		processedTime = processedTime + 24.0;
	}
	
	while (processedTime >= 24.0)
    {
		processedTime = processedTime - 24.0;
	}
    
    return processedTime;
}

//
//  Calculate the local mean time of rising or setting.
//  By 'local' is meant the
//  exact time at the location, assuming that there were no time zone. That
//  is, the time difference between the location and the Meridian depended
//  entirely on the longitude. We can't do anything with this time directly;
//  we must convert it to UTC and then to a local time. The result is
//  expressed as a fractional number of hours since midnight
//

- (double)localMeanTimeForHour:(double)localHour andAscension:(double)sunRightAscensionHours andApproxTimeDays:(double)approxTimeDays
{
    
    double temp = localHour + sunRightAscensionHours - (0.06571 * approxTimeDays)
    - 6.622;
    
    //NSLog(@"- (double)localMeanTimeForHour:(double)localHour andAscension:(double)sunRightAscensionHours andApproxTimeDays:(double)approxTimeDays; %.15f", temp);
    
    return temp;
    
}

//
//  s the cosine of the Sun's local hour angle
//

- (double)cosLocalHourAngleForAngle:(double)sunTrueLongitude andLatitude:(double)latitude andZenith:(double)zenith
{
    
    //NSLog(@"\n\n\n Long: %.15f \n\n Lat: %.15f \n\n Zen: %.15f\n\n\n", sunTrueLongitude, latitude, zenith);
    double sinDec = 0.39782 * (sinDeg(sunTrueLongitude));
    double cosDec = cosDeg((asinDeg(sinDec)));
    
    double cosH = ((cosDeg(zenith))- (sinDec * (sinDeg(latitude))))/ (cosDec * (cosDeg(latitude)));
    
    //NSLog(@"- (double)cosLocalHourAngleForAngle:(double)sunTrueLongitude andLatitude:(double)latitude andZenith:(double)zenith; %.15f" ,cosH);
    
    return cosH;
    
}

//
//  Calculates the Sun's right ascension in hours, given the Sun's true
//  longitude in degrees. Input and output are angles greater than 0 and
//  less than 360.
//

- (double)sunRightAscensionHoursForLongitude:(double)sunTrueLongitude
{
    
    double a = 0.91764 * tanDeg(sunTrueLongitude);
    double ra = 360.0 / (2.0 * M_PI)* atan(a);
    
    // get result into 0-360 degree range
    // if (ra >= 360.0)ra = ra - 360.0;
    // if (ra < 0)ra = ra + 360.0;
    
    double lQuadrant = floor(sunTrueLongitude / 90.0)* 90.0;
    double raQuadrant = floor(ra / 90.0)* 90.0;
    ra = ra + (lQuadrant - raQuadrant);
    
    
    
    //NSLog(@"- (double)sunRightAscensionHoursForLongitude:(double)sunTrueLongitude; %.15f", ra/kDegreesPerHour);
    
    return ra / kDegreesPerHour; // convert to hours
}

//
//  Calculates the Sun's true longitude in degrees. The result is an angle
//  greater than 0 and less than 360. Requires the Sun's mean anomaly, also
//  in degrees.
//

- (double)sunTrueLongitudeFromAnomaly:(double)sunMeanAnomaly
{
    
    double l = sunMeanAnomaly + (1.916 * sinDeg(sunMeanAnomaly))
    + (0.020 * sinDeg(2 * sunMeanAnomaly))+ 282.634;
    
    // get longitude into 0-360 degree range
    if (l >= 360.0)
    {
        l = l - 360.0;
    }
    if (l < 0)
    {
        l = l + 360.0;
    }
    
    //NSLog(@"- (double)sunTrueLongitudeFromAnomaly:(double)sunMeanAnomaly{ Anomaly: %.15f", l);
    return l;
}

//
// Calculate the Sun's mean anomaly in degrees, at sunrise or sunset, given
// the longitude in degrees.
//


- (double)meanAnomalyForDayOfYear:(NSInteger)dayOfYear atLongitude:(double)longitude forCalculationType:(NSInteger)type
{
    
    double temp = (0.9856 * [self approxTimeDaysForDayOfYear:dayOfYear withHoursFromMeridian:[self hoursFromMeridianForLongitude:longitude] forCalculationType:type])- 3.289;
    
    //NSLog(@"- (double)getMeanAnamolyForDayOfYear:(int)dayOfYear atLongitude:(double)longitude forCalculationType:(int)type %.15f", temp);
    
    return temp;
}

//
// s the approximate time of sunset or sunrise In DAYS since midnight
// Jan 1st, assuming 6am and 6pm events. We need this figure to derive the
// Sun's mean anomaly.
//

- (double)approxTimeDaysForDayOfYear:(NSInteger)dayOfYear withHoursFromMeridian:(double)hoursFromMeridian forCalculationType:(NSInteger)type
{
    
    if (type == kTypeSunrise)
    {
        return dayOfYear + ((6.0 - hoursFromMeridian)/ 24);
    } else /* if (type == TYPE_SUNSET)*/
    {
        return dayOfYear + ((18.0 - hoursFromMeridian)/ 24);
    }
    
}

//
//  Get time difference between location's longitude and the Meridian, in
//  hours. West of Meridian has a negative time offset.
//

- (double)hoursFromMeridianForLongitude:(double)longitude
{
    return longitude/kDegreesPerHour;
}

//
// Calculate the day of the year, where Jan 1st is day 1. Note that this
// method needs to know the year, because leap years have an impact here
//


//
// Calculate the day of the year, where Jan 1st is day 1. Note that this
// method needs to know the year, because leap years have an impact here
//

- (NSInteger)dayOfYearForYear:(NSInteger)year andMonth:(NSInteger)month andDay:(NSInteger)day
{
    NSInteger n1 = 275 * month / 9;
    NSInteger n2 = (month + 9)/ 12;
    NSInteger n3 = (1 + ((year - 4 * (year / 4)+ 2)/ 3));
    NSInteger n = n1 - (n2 * n3)+ day - 30;
    
    //NSLog(@"- (int)getDayOfYearForYear:(int)year andMonth:(int)month andDay:(int)day;  %i", n);
    return n;
}

//
//
//

- (double)UTCSunsetForDate:(NSDate*)date andZenith:(double)zenith adjustForElevation:(BOOL)adjustForElevation
{
    
    double doubleTime = NAN;
    
    if (adjustForElevation)
    {
        zenith = [self adjustZenith:zenith forElevation:self.geoLocation.altitude];
    }
    else
    {
        zenith = [self adjustZenith:zenith forElevation:0];
    }
    
    NSDateComponents *components = [self yearMonthAndDayFromDate:date];
    
    NSInteger year = components.year;
    
    NSInteger month = components.month;
    
    NSInteger day = components.day;
    
    doubleTime = [self sunriseOrSunsetForYear:year andMonth:month andDay:day atLongitude:self.geoLocation.longitude andLatitude:self.geoLocation.latitude withZenith:zenith andType:kTypeSunset];
    
    return doubleTime;
}

//
//
//

- (double)UTCSunriseForDate:(NSDate*)date andZenith:(double)zenith adjustForElevation:(BOOL)adjustForElevation
{
    
    double doubleTime = NAN;
    
    if (adjustForElevation)
    {
        zenith = [self adjustZenith:zenith forElevation:self.geoLocation.altitude];
    }
    else
    {
        zenith = [self adjustZenith:zenith forElevation:0];
    }
    
    NSDateComponents *components = [self yearMonthAndDayFromDate:date];
    
    NSInteger year = components.year;
    
    NSInteger month = components.month;
    
    NSInteger day = components.day;

    doubleTime = [self sunriseOrSunsetForYear:year andMonth:month andDay:day atLongitude:self.geoLocation.longitude andLatitude:self.geoLocation.latitude withZenith:zenith andType:kTypeSunrise];
    
    return doubleTime;
}

// Mark: - Method to get day, month, and year

//
//  Break up a date object into day, month, year
//

- (nullable NSDateComponents *)yearMonthAndDayFromDate:(nonnull NSDate *)date
{
    
    //
    //  Create a calendar
    //
    
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    //
    //  Set up the date components
    //
    
    NSDateComponents *parts = [gregorianCalendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:date];
    
    return parts;
    
}


//
//  The dealloc method, as required for 
//  iOS/Cocoa touch memory management
//


@end
