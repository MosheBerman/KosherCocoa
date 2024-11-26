/**
 *  KCZComplexZmanimCalendar.m
 *  KosherCocoa 3
 *
 *  Created by Moshe Berman on 7/24/11.
 *  Updated by Moshe Berman on 10/8/13.
 *
 *  Use of KosherCocoa 3 is governed by the LGPL 2.1 License.
 */

#import "KCComplexZmanimCalendar.h"
#import "MBCalendarCategories.h"
#import "KCAstronomicalCalendar+DateManipulation.h"

@implementation KCComplexZmanimCalendar

- (id)init
{
    self = [super init];
    if (self) {
        
        //In Israel, this value should be set to 25
        _ateretTorahSunsetOffset = 40;
    }
    
    return self;
}

- (long) shaahZmanis19Point8Degrees{
    return [self temporalHourFromSunrise:[self alos19Point8Degrees] toSunset:[self tzais19Point8Degrees]];
}


- (long) shaahZmanis18Degrees{
    return [self temporalHourFromSunrise:[self alos18Degrees] toSunset:[self tzais18Degrees]];
}


- (long) shaahZmanis26Degrees{
    return [self temporalHourFromSunrise:[self alos26Degrees] toSunset:[self tzais26Degrees]];
}


- (long) shaahZmanis16Point1Degrees{
    return [self temporalHourFromSunrise:[self alos16Point1Degrees] toSunset:[self tzais16Point1Degrees]];
}

- (long) shaahZmanis60Minutes{
    return [self temporalHourFromSunrise:[self alos60] toSunset:[self tzais60]];
}

- (long) shaahZmanis72Minutes{
    return [self shaahZmanisMogenAvraham];
}

- (long) shaahZmanis72MinutesZmanis{
    return [self temporalHourFromSunrise:[self alos72Zmanis] toSunset:[self tzais72Zmanis]];
}

- (long) shaahZmanis90Minutes{
    return [self temporalHourFromSunrise:[self alos90] toSunset:[self tzais90]];
}

- (long) shaahZmanis90MinutesZmanis{
    return [self temporalHourFromSunrise:[self alos90Zmanis] toSunset:[self tzais90Zmanis]];
}

- (long) shaahZmanis96Minutes{
    return [self temporalHourFromSunrise:[self alos96] toSunset:[self tzais96]];
}

- (long) shaahZmanis96MinutesZmanis{
    return [self temporalHourFromSunrise:[self alos96Zmanis] toSunset:[self tzais96Zmanis]];
}

- (long) shaahZmanisAteretTorah{
    return [self temporalHourFromSunrise:[self alos72Zmanis] toSunset:[self tzaisAteretTorah]];
}

- (long) shaahZmanis120Minutes{
    return [self temporalHourFromSunrise:[self alos120] toSunset:[self tzais120]];
}

- (long) shaahZmanis120MinutesZmanis{
    return [self temporalHourFromSunrise:[self alos120Zmanis] toSunset:[self tzais120Zmanis]];
}

- (nullable NSDate *) plagHamincha120Minutes{
    return [[self alos120Zmanis] dateByAddingTimeInterval:[self shaahZmanis120Minutes]*10.75];
}

- (nullable NSDate *) plagHamincha120MinutesZmanis{
    return [[self alos120Zmanis] dateByAddingTimeInterval:[self shaahZmanis120MinutesZmanis]*10.75];
}

- (nullable NSDate *) alos60{
    return [self dateBySubtractingHours:1 fromDate:[self seaLevelSunrise]];
}


- (nullable NSDate *)alos72Zmanis {
    long shaahZmanis = [self shaahZmanisGra];
    
    if (shaahZmanis == LONG_MIN) {
        return nil;
    }
    
    return [[self seaLevelSunrise] dateByAddingTimeInterval:shaahZmanis*-1.2];
}

- (nullable NSDate *) alos90{
    
    NSDate *baseDate = [self seaLevelSunrise];
    return [self dateBySubtractingMinutes:90 fromDate:baseDate];
}

- (nullable NSDate *) alos90Zmanis{
    long shaahZmanis = [self shaahZmanisGra];
    
    if (shaahZmanis == LONG_MIN) {
        return nil;
    }
    
    return [[self seaLevelSunrise] dateByAddingTimeInterval:(shaahZmanis * -1.5)];
}

- (nullable NSDate *) alos96{
    NSDate *baseDate = [self seaLevelSunrise];
    return [self dateBySubtractingMinutes:96 fromDate:baseDate];
}

- (nullable NSDate *) alos96Zmanis{

    long shaahZmanis = [self shaahZmanisGra];
    
    if (shaahZmanis == LONG_MIN) {
        return nil;
    }
    
    return [[self seaLevelSunrise] dateByAddingTimeInterval:shaahZmanis * -1.6];
}

- (nullable NSDate *) alos120{
    NSDate *baseDate = [self seaLevelSunrise];
    return [self dateBySubtractingMinutes:120 fromDate:baseDate];
}

- (nullable NSDate *) alos120Zmanis{
    long shaahZmanis = [self shaahZmanisGra];
    
    if (shaahZmanis == LONG_MIN) {
        return nil;
    }
    
    return [[self seaLevelSunrise] dateByAddingTimeInterval:shaahZmanis * -2];
}

- (nullable NSDate *) alos26Degrees{
    return [self sunriseOffsetByDegrees:kZenithTwentySix];
}

- (nullable NSDate *) alos18Degrees{
    return [self sunriseOffsetByDegrees:kZenithAstronomical];
}

- (nullable NSDate *) alos19Point8Degrees{
    return [self sunriseOffsetByDegrees:kZenithNineteenPointEight];
}

- (nullable NSDate *) alos16Point1Degrees{
    return [self sunriseOffsetByDegrees:kZenithSixteenPointOne];
}

- (nullable NSDate *) misheyakir11Point5Degrees{
    return [self sunriseOffsetByDegrees:kZenithElevenPointFive];
}

- (nullable NSDate *) misheyakir11Degrees{
    return [self sunriseOffsetByDegrees:kZenithElevenDegrees];
}

- (nullable NSDate *) misheyakir10Point2Degrees{
    return [self sunriseOffsetByDegrees:kZenithTenPointTwo];
}

- (nullable NSDate *) sofZmanShmaMGA19Point8Degrees{
    return [[self sunriseOffsetByDegrees:kZenithNineteenPointEight] dateByAddingTimeInterval:[self shaahZmanis19Point8Degrees]*3];
}

- (nullable NSDate *) sofZmanShmaMGA16Point1Degrees{
    return [[self alos16Point1Degrees] dateByAddingTimeInterval:[self shaahZmanis16Point1Degrees] *3];
}

- (nullable NSDate *) sofZmanShmaMGA72Minutes{
    return [self sofZmanShmaMogenAvraham];
}

- (nullable NSDate *) sofZmanShmaMGA72MinutesZmanis{
    return [[self alos72Zmanis] dateByAddingTimeInterval:[self shaahZmanis72MinutesZmanis]*3];
}

- (nullable NSDate *) sofZmanShmaMGA90Minutes{
    return [[self alos90] dateByAddingTimeInterval:[self shaahZmanis90Minutes]*3];
}

- (nullable NSDate *) sofZmanShmaMGA90MinutesZmanis{
    return [[self alos90Zmanis] dateByAddingTimeInterval:[self shaahZmanis90MinutesZmanis]*3];
}

- (nullable NSDate *) sofZmanShmaMGA96Minutes{
    return [[self alos96] dateByAddingTimeInterval:[self shaahZmanis96Minutes]*3];
}

- (nullable NSDate *) sofZmanShmaMGA96MinutesZmanis{
    return [[self alos96Zmanis] dateByAddingTimeInterval:[self shaahZmanis96MinutesZmanis] *3];
}

- (nullable NSDate *) sofZmanShma3HoursBeforeChatzos{
    NSDate *baseDate = [self chatzos];
    return [self dateBySubtractingHours:3 fromDate:baseDate];
}

- (nullable NSDate *) sofZmanShmaMGA120Minutes{
    return [[self alos120] dateByAddingTimeInterval:[self shaahZmanis120Minutes]*3];
}

- (nullable NSDate *) sofZmanShmaAlos16Point1ToSunset{
    long shaahZmanis = [self temporalHourFromSunrise:[self alos16Point1Degrees] toSunset:[self seaLevelSunset]];
    
    if (shaahZmanis == LONG_MIN) {
        return nil;
    }
    
    return [[self alos16Point1Degrees] dateByAddingTimeInterval:shaahZmanis*3];
}

- (nullable NSDate *) sofZmanShmaAlos16Point1ToTzaisGeonim7Point083Degrees{
    long shaahZmanis = [self temporalHourFromSunrise:[self alos16Point1Degrees] toSunset:[self tzaisGeonim7Point083Degrees]];
    
     if (shaahZmanis == LONG_MIN) {
        return nil;
     }
    
    return [[self alos16Point1Degrees] dateByAddingTimeInterval:shaahZmanis * 3];
                        
}

- (nullable NSDate *) sofZmanTfilaMGA19Point8Degrees{
    return [[self alos19Point8Degrees] dateByAddingTimeInterval:[self shaahZmanis19Point8Degrees]*4];
}

- (nullable NSDate *) sofZmanTfilaMGA16Point1Degrees{
    return [[self alos16Point1Degrees] dateByAddingTimeInterval:[self shaahZmanis16Point1Degrees]*4];
}

- (nullable NSDate *) sofZmanTfilaMGA72Minutes{
    return [self sofZmanTfilaMogenAvraham];
}

- (nullable NSDate *) sofZmanTfilaMGA72MinutesZmanis{
    return [[self alos72Zmanis] dateByAddingTimeInterval:[self shaahZmanis72MinutesZmanis] *4];
}

- (nullable NSDate *) sofZmanTfilaMGA90Minutes{
    return [[self alos90] dateByAddingTimeInterval:[self shaahZmanis90Minutes]*4];
}

- (nullable NSDate *) sofZmanTfilaMGA90MinutesZmanis{
    return [[self alos90Zmanis] dateByAddingTimeInterval:[self shaahZmanis90MinutesZmanis]*4];
}

- (nullable NSDate *) sofZmanTfilaMGA96Minutes{
    return [[self alos96] dateByAddingTimeInterval:[self shaahZmanis96Minutes] *4];
}

- (nullable NSDate *) sofZmanTfilaMGA96MinutesZmanis{
    return [[self alos96Zmanis] dateByAddingTimeInterval:[self shaahZmanis96MinutesZmanis] *4];
}

- (nullable NSDate *) sofZmanTfilaMGA120Minutes{
    return [[self alos120] dateByAddingTimeInterval:[self shaahZmanis120Minutes] *4];
}

- (nullable NSDate *) sofZmanTfila2HoursBeforeChatzos{
        
    return [self dateBySubtractingHours:2 fromDate:[self chatzos]];
}

- (nullable NSDate *) minchaGedola30Minutes{

    return [self dateByAddingMinutes:30 toDate:[self chatzos]];
    
} //30 minutes after chatzos

- (nullable NSDate *) minchaGedola72Minutes{
    return [[self alos72] dateByAddingTimeInterval:[self shaahZmanis72Minutes]*6.5];
}

- (nullable NSDate *) minchaGedola16Point1Degrees{
    return [[self alos16Point1Degrees]dateByAddingTimeInterval:[self shaahZmanis16Point1Degrees]*6.5];
}

- (nullable NSDate *) minchaGedolaGreaterThan30{
    if ([self minchaGedola30Minutes] == nil || [self minchaGedola] == nil) {
        return nil;
    }
    
    if ([self minchaGedola] > 0) {
        return [self minchaGedola30Minutes];
    }else{
        return [self minchaGedola];
    }
    
}

- (nullable NSDate *) minchaKetana16Point1Degrees{
    return [[self alos16Point1Degrees] dateByAddingTimeInterval:[self shaahZmanis16Point1Degrees] * 9.5];
}

- (nullable NSDate *) minchaKetana72Minutes{
    return [[self alos72] dateByAddingTimeInterval:[self shaahZmanis72MinutesZmanis]*9.5];
}

- (nullable NSDate *) plagHamincha60Minutes{
    return [[self alos60] dateByAddingTimeInterval:[self shaahZmanis60Minutes] * 10.75];
}

- (nullable NSDate *) plagHamincha72Minutes{
    return [[self alos72] dateByAddingTimeInterval:[self shaahZmanis72Minutes] * 10.75];
}

- (nullable NSDate *) plagHamincha90Minutes{
    return [[self alos90] dateByAddingTimeInterval:[self shaahZmanis90Minutes] * 10.75];
}

- (nullable NSDate *) plagHamincha96Minutes{
    return [[self alos96] dateByAddingTimeInterval:[self shaahZmanis96Minutes] * 10.75];
}

- (nullable NSDate *) plagHamincha96MinutesZmanis{
    return [[self alos96Zmanis] dateByAddingTimeInterval:[self shaahZmanis96MinutesZmanis] * 10.75];
}

- (nullable NSDate *) plagHamincha90MinutesZmanis{
    return [[self alos90Zmanis] dateByAddingTimeInterval:[self shaahZmanis90MinutesZmanis] * 10.75];
}

- (nullable NSDate *) plagHamincha72MinutesZmanis{
    return [[self alos72Zmanis] dateByAddingTimeInterval:[self shaahZmanis72MinutesZmanis] * 10.75];
}

- (nullable NSDate *) plagHamincha16Point1Degrees{
    return [[self alos16Point1Degrees] dateByAddingTimeInterval:[self shaahZmanis16Point1Degrees] * 10.75];
}

- (nullable NSDate *) plagHamincha19Point8Degrees{
    return [[self alos19Point8Degrees] dateByAddingTimeInterval:[self shaahZmanis19Point8Degrees] * 10.75];
}

- (nullable NSDate *) plagHamincha26Degrees{
    return [[self alos26Degrees] dateByAddingTimeInterval:[self shaahZmanis26Degrees] * 10.75];
}

- (nullable NSDate *) plagHamincha18Degrees{
    return [[self alos18Degrees] dateByAddingTimeInterval:[self shaahZmanis18Degrees] * 10.75];
}

- (nullable NSDate *) plagAlosToSunset{
    long shaaZmanis = [self temporalHourFromSunrise:[self alos16Point1Degrees] toSunset:[self seaLevelSunset]];
    return [[self alos16Point1Degrees] dateByAddingTimeInterval:shaaZmanis*10.75];
}

- (nullable NSDate *) plagAlos16Point1ToTzaisGeonim7Point083Degrees{
    long shaahZmanis = [self temporalHourFromSunrise:[self alos16Point1Degrees] toSunset:[self tzaisGeonim7Point083Degrees]];
    return [[self alos16Point1Degrees] dateByAddingTimeInterval:shaahZmanis * 10.75];
}

- (nullable NSDate *) bainHashmashosRT13Degrees{
    return [self sunsetOffsetByDegrees:kZenithThirteenPointTwentyFourDegrees];
}

- (nullable NSDate *) bainHashmashosRT58Point5Minutes{
    NSDate *baseDate = [self seaLevelSunset];
    return [self dateByAddingMinutes:58.5 toDate:baseDate];
}

- (nullable NSDate *) bainHashmashosRT13Point5MinutesBefore7Point083Degrees{
    NSDate *baseDate = [self sunsetOffsetByDegrees:kZenithSevenPointZeroEightThree];
    return [self dateBySubtractingMinutes:13.5 fromDate:baseDate];
}

- (nullable NSDate *) bainHashmashosRT2Stars{
    NSDate *alos19Point8 = [self alos19Point8Degrees];
    NSDate *sunrise = [self seaLevelSunrise];
    
    if (alos19Point8 == nil || sunrise == nil) {
        return nil;
    }

    return [[self seaLevelSunrise] dateByAddingTimeInterval:([sunrise timeIntervalSinceReferenceDate]-[[self alos19Point8Degrees]timeIntervalSinceReferenceDate])*(5/18)];
}

- (nullable NSDate *) tzaisGeonim5Point95Degrees{
    return [self sunsetOffsetByDegrees:kZenithFivePointNinetyFive];
}

- (nullable NSDate *) tzaisGeonim3Point65Degrees{
    return [self sunsetOffsetByDegrees:kZenithThreePointSixtyFive];
}

- (nullable NSDate *) tzaisGeonim4Point61Degrees{
    return [self sunsetOffsetByDegrees:kZenithFourPointSixtyOne];
}

- (nullable NSDate *) tzaisGeonim4Point37Degrees{
    return [self sunsetOffsetByDegrees:kZenithFourPointThirtySeven];
}

- (nullable NSDate *) tzaisGeonim5Point88Degrees{
    return [self sunsetOffsetByDegrees:kZenithFivePointEightyEight];
}

- (nullable NSDate *) tzaisGeonim4Point8Degrees{
    return [self sunsetOffsetByDegrees:kZenithFourPointEight];
}

- (nullable NSDate *) tzaisGeonim7Point083Degrees{
    return [self sunsetOffsetByDegrees:kZenithSevenPointZeroEightThree];
}

- (nullable NSDate *) tzaisGeonim8Point5Degrees{
    return  [self sunsetOffsetByDegrees:kZenithEightPointFive];
}

- (nullable NSDate *) tzais50{
    return [self dateByAddingMinutes:50 toDate:[self seaLevelSunset]];
}

- (nullable NSDate *) tzais60{
    return [self dateByAddingMinutes:60 toDate:[self seaLevelSunset]];
}

- (nullable NSDate *) tzaisAteretTorah{
    return [self dateByAddingMinutes:[self ateretTorahSunsetOffset] toDate:[self seaLevelSunset]];
}

- (nullable NSDate *) sofZmanShmaAteretTorah{
    return [[self alos72Zmanis] dateByAddingTimeInterval:[self shaahZmanisAteretTorah]*3];
}

- (nullable NSDate *) sofZmanTfilaAteretTorah{
    return [[self alos72Zmanis] dateByAddingTimeInterval:[self shaahZmanisAteretTorah]*4];
}

- (nullable NSDate *) minchaGedolaAteretTorah{
    return [[self alos72Zmanis] dateByAddingTimeInterval:[self shaahZmanisAteretTorah]*6.5];
}

- (nullable NSDate *) minchaKetanaAteretTorah{
    return [[self alos72Zmanis] dateByAddingTimeInterval:[self shaahZmanisAteretTorah]*9.5];
}

- (nullable NSDate *) plagHaminchaAteretTorah{
    return [[self alos72Zmanis] dateByAddingTimeInterval:[self shaahZmanisAteretTorah]*10.75];
}

- (nullable NSDate *) misheyakirAteretTorahWithMinutes:(double)minutes{
    return [self dateByAddingMinutes:minutes toDate:[self alos72Zmanis]];
}

- (nullable NSDate *) tzais72Zmanis{
    long shaahZmanis = [self shaahZmanisGra];
    
    if (shaahZmanis == LONG_MIN) {
        return nil;
    }
    
    return [[self seaLevelSunset] dateByAddingTimeInterval:shaahZmanis*1.2];
}

- (nullable NSDate *) tzais90Zmanis{
    long shaahZmanis = [self shaahZmanisGra];
    
    if (shaahZmanis == LONG_MIN) {
        return nil;
    }
    
    return [[self seaLevelSunset] dateByAddingTimeInterval:shaahZmanis*1.5];
}

- (nullable NSDate *) tzais96Zmanis{
    long shaahZmanis = [self shaahZmanisGra];
    
    if (shaahZmanis == LONG_MIN) {
        return nil;
    }
    
    return [[self seaLevelSunset] dateByAddingTimeInterval:shaahZmanis*1.6];
}

- (nullable NSDate *) tzais90{
    return [self dateByAddingMinutes:90 toDate:[self seaLevelSunset]];
}

- (nullable NSDate *) tzais120{
    return [self dateByAddingMinutes:120 toDate:[self seaLevelSunset]];
}

- (nullable NSDate *) tzais120Zmanis{
    long shaahZmanis = [self shaahZmanisGra];
    if (shaahZmanis == LONG_MIN) {
        return nil;
    }
    return [[self seaLevelSunset] dateByAddingTimeInterval:shaahZmanis*2.0];
}

- (nullable NSDate *) tzais16Point1Degrees{
    return [self sunsetOffsetByDegrees:kZenithSixteenPointOne];
}

- (nullable NSDate *) tzais26Degrees{
    return [self sunsetOffsetByDegrees:kZenithTwentySix];
}

- (nullable NSDate *) tzais18Degrees{
    return [self sunsetOffsetByDegrees:kZenithAstronomical];
}

- (nullable NSDate *) tzais19Point8Degrees{
    return [self sunsetOffsetByDegrees:kZenithNineteenPointEight];
}

- (nullable NSDate *) tzais96{
    return [self dateByAddingMinutes:96 toDate:[self seaLevelSunset]];
}

- (nullable NSDate *) fixedLocalChatzos{
    return [[self dateFromTime:(12.0-[self.geoLocation.timeZone secondsFromGMT])] dateByAddingTimeInterval:[self.geoLocation localMeanTimeOffset]];
}

- (nullable NSDate *) sofZmanShmaFixedLocal{
    return [self dateBySubtractingMinutes:180 fromDate:[self fixedLocalChatzos]];
}

- (nullable NSDate *) sofZmanTfilaFixedLocal{
    return [self dateBySubtractingMinutes:120 fromDate:[self fixedLocalChatzos]];
}

- (nullable NSDate *) sofZmanAchilasChametzGra{
    return [self sofZmanTfilaGra];
}

- (nullable NSDate *) sofZmanAchilasChametzMGA72Minutes{
    return [self sofZmanTfilaMGA72Minutes];
}

- (nullable NSDate *) sofZmanAchilasChametzMGA16Point1Degrees{
    return [self sofZmanTfilaMGA16Point1Degrees];
}

- (nullable NSDate *) sofZmanBiurChametzGra{
    return [[self seaLevelSunrise] dateByAddingTimeInterval:[self shaahZmanisGra] * 5];
}

- (nullable NSDate *) sofZmanBiurChametzMGA72Minutes{
    return [[self alos72] dateByAddingTimeInterval:[self shaahZmanisMogenAvraham] * 5];
}

- (nullable NSDate *) sofZmanBiurChametzMGA16Point1Degrees{
    return [[self alos16Point1Degrees]dateByAddingTimeInterval:[self shaahZmanis16Point1Degrees] * 5];
}

/**
 * A method that returns "solar" midnight, or the time when the sun is at its "http://en.wikipedia.org/wiki/Nadir"nadir.
 * <br/>
 * <b>Note:</b> this method is experimental and might be removed.
 * 
 * @return the <code>Date</code> of Solar Midnight (chatzos layla). If the calculation can't be computed such as in
 *         the Arctic Circle where there is at least one day a year where the sun does not rise, and one where it
 *         does not set, a null will be returned. See detailed explanation on top of the
 *         {@link AstronomicalCalendar} documentation.
 */

- (nullable NSDate *)solarMidnight {
    KCComplexZmanimCalendar *clonedCalendar = [self copy];
    [clonedCalendar setWorkingDate:[self dateByAddingDays:1 toDate:clonedCalendar.workingDate]];
    NSDate *sunset = [self sunset];
    NSDate *sunrise = [self sunrise];
    
    return [[self sunset] dateByAddingTimeInterval:[self temporalHourFromSunrise:sunrise toSunset:sunset] *6];
}



@end
