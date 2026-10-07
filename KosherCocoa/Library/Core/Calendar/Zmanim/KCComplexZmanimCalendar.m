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

@implementation KCComplexZmanimCalendar (BaalHatanya)

- (nullable NSDate *)alosBaalHatanya {
    return [self sunriseOffsetByDegrees:kZenithGeometric + 16.9];
}

- (double)shaahZmanisBaalHatanya {
    return [self temporalHourFromSunrise:[self sunriseOffsetByDegrees:kZenithGeometric + 1.583]
                               toSunset:[self sunsetOffsetByDegrees:kZenithGeometric + 1.583]];
}

- (nullable NSDate *)sofZmanShmaBaalHatanya {
    double shaahZmanis = [self shaahZmanisBaalHatanya];

    if (shaahZmanis == LONG_MIN) {
        return nil;
    }

    return [[self sunriseOffsetByDegrees:kZenithGeometric + 1.583] dateByAddingTimeInterval:shaahZmanis * 3];
}

- (nullable NSDate *)sofZmanTfilaBaalHatanya {
    double shaahZmanis = [self shaahZmanisBaalHatanya];

    if (shaahZmanis == LONG_MIN) {
        return nil;
    }

    return [[self sunriseOffsetByDegrees:kZenithGeometric + 1.583] dateByAddingTimeInterval:shaahZmanis * 4];
}

- (nullable NSDate *)minchaGedolaBaalHatanya {
    double shaahZmanis = [self shaahZmanisBaalHatanya];

    if (shaahZmanis == LONG_MIN) {
        return nil;
    }

    return [[self sunriseOffsetByDegrees:kZenithGeometric + 1.583] dateByAddingTimeInterval:shaahZmanis * 6.5];
}

- (nullable NSDate *)minchaKetanaBaalHatanya {
    double shaahZmanis = [self shaahZmanisBaalHatanya];

    if (shaahZmanis == LONG_MIN) {
        return nil;
    }

    return [[self sunriseOffsetByDegrees:kZenithGeometric + 1.583] dateByAddingTimeInterval:shaahZmanis * 9.5];
}

- (nullable NSDate *)plagHaminchaBaalHatanya {
    double shaahZmanis = [self shaahZmanisBaalHatanya];

    if (shaahZmanis == LONG_MIN) {
        return nil;
    }

    return [[self sunriseOffsetByDegrees:kZenithGeometric + 1.583] dateByAddingTimeInterval:shaahZmanis * 10.75];
}

- (nullable NSDate *)tzaisBaalHatanya {
    return [self sunsetOffsetByDegrees:kZenithGeometric + 6];
}

- (nullable NSDate *)tzaisGeonim3Point7Degrees {
    return [self sunsetOffsetByDegrees:kZenithThreePointSeven];
}

- (nullable NSDate *)tzaisGeonim3Point8Degrees {
    return [self sunsetOffsetByDegrees:kZenithGeometric + 3.8];
}

- (nullable NSDate *)minchaGedolaAhavatShalom {
    NSDate *chatzos = [self chatzos];
    NSDate *minchaGedola30 = [self minchaGedola30Minutes];
    double shaahZmanis = [self temporalHourFromSunrise:[self alos16Point1Degrees]
                                             toSunset:[self tzaisGeonim3Point7Degrees]];

    if (chatzos == nil || minchaGedola30 == nil || shaahZmanis == LONG_MIN) {
        return nil;
    }

    NSDate *minchaGedolaAhavatShalom = [chatzos dateByAddingTimeInterval:shaahZmanis / 2];
    return [minchaGedola30 compare:minchaGedolaAhavatShalom] == NSOrderedDescending ? minchaGedola30 : minchaGedolaAhavatShalom;
}

- (nullable NSDate *)minchaKetanaAhavatShalom {
    double shaahZmanis = [self temporalHourFromSunrise:[self alos16Point1Degrees]
                                             toSunset:[self tzaisGeonim3Point8Degrees]];

    if (shaahZmanis == LONG_MIN) {
        return nil;
    }

    return [[self tzaisGeonim3Point8Degrees] dateByAddingTimeInterval:shaahZmanis * -2.5];
}

- (nullable NSDate *)plagHaminchaAhavatShalom {
    double shaahZmanis = [self temporalHourFromSunrise:[self alos16Point1Degrees]
                                             toSunset:[self tzaisGeonim3Point8Degrees]];

    if (shaahZmanis == LONG_MIN) {
        return nil;
    }

    return [[self tzaisGeonim3Point8Degrees] dateByAddingTimeInterval:shaahZmanis * -1.25];
}

@end

/**
 *  Returns YES when the given date is 14 Nissan (Erev Pesach), the only day
 *  the chametz deadlines apply. Canonical KosherJava returns null for these
 *  zmanim on any other date.
 */
static BOOL KCIsErevPesach(NSDate *date, NSTimeZone *timeZone) {
    NSCalendar *hebrewCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierHebrew];
    hebrewCalendar.timeZone = timeZone;
    NSDateComponents *components = [hebrewCalendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay)
                                                    fromDate:date];
    // Apple's Hebrew calendar numbers months from Tishrei = 1, so Nissan is 7
    // (8 in a leap year, when Adar I and Adar II take 6 and 7).
    BOOL leapYear = ((7 * components.year + 1) % 19) < 7;
    NSInteger nissan = leapYear ? 8 : 7;
    return components.month == nissan && components.day == 14;
}

@implementation KCComplexZmanimCalendar (Chametz)

- (nullable NSDate *)sofZmanAchilasChametzBaalHatanya {
    if (!KCIsErevPesach(self.workingDate, self.geoLocation.timeZone)) {
        return nil;
    }
    return [self sofZmanTfilaBaalHatanya];
}

- (nullable NSDate *)sofZmanAchilasChametzMGA72MinutesZmanis {
    if (!KCIsErevPesach(self.workingDate, self.geoLocation.timeZone)) {
        return nil;
    }
    return [self sofZmanTfilaMGA72MinutesZmanis];
}

- (nullable NSDate *)sofZmanBiurChametzBaalHatanya {
    if (!KCIsErevPesach(self.workingDate, self.geoLocation.timeZone)) {
        return nil;
    }
    double shaahZmanis = [self shaahZmanisBaalHatanya];

    if (shaahZmanis == LONG_MIN) {
        return nil;
    }

    return [[self sunriseOffsetByDegrees:kZenithGeometric + 1.583] dateByAddingTimeInterval:shaahZmanis * 5];
}

- (nullable NSDate *)sofZmanBiurChametzMGA72MinutesZmanis {
    if (!KCIsErevPesach(self.workingDate, self.geoLocation.timeZone)) {
        return nil;
    }
    double shaahZmanis = [self shaahZmanis72MinutesZmanis];

    if (shaahZmanis == LONG_MIN) {
        return nil;
    }

    return [[self alos72Zmanis] dateByAddingTimeInterval:shaahZmanis * 5];
}

@end

@implementation KCComplexZmanimCalendar (FixedLocalChatzos)

- (nullable NSDate *)minchaGedolaGRAFixedLocalChatzos30Minutes {
    return [self dateByAddingMinutes:30 toDate:[self fixedLocalChatzos]];
}

- (nullable NSDate *)minchaGedolaGRAGreaterThan30 {
    NSDate *minchaGedola30 = [self minchaGedola30Minutes];
    NSDate *minchaGedola = [self minchaGedola];

    if (minchaGedola30 == nil || minchaGedola == nil) {
        return nil;
    }

    return [minchaGedola30 compare:minchaGedola] == NSOrderedDescending ? minchaGedola30 : minchaGedola;
}

- (nullable NSDate *)minchaKetanaGRAFixedLocalChatzosToSunset {
    NSDate *startOfHalfDay = [self fixedLocalChatzos];
    NSDate *endOfHalfDay = [self sunset];

    if (startOfHalfDay == nil || endOfHalfDay == nil) {
        return nil;
    }

    double shaahZmanis = [endOfHalfDay timeIntervalSinceDate:startOfHalfDay] / 6;
    return [startOfHalfDay dateByAddingTimeInterval:shaahZmanis * 3.5];
}

- (nullable NSDate *)plagHaminchaGRAFixedLocalChatzosToSunset {
    NSDate *startOfHalfDay = [self fixedLocalChatzos];
    NSDate *endOfHalfDay = [self sunset];

    if (startOfHalfDay == nil || endOfHalfDay == nil) {
        return nil;
    }

    double shaahZmanis = [endOfHalfDay timeIntervalSinceDate:startOfHalfDay] / 6;
    return [startOfHalfDay dateByAddingTimeInterval:shaahZmanis * 4.75];
}

- (nullable NSDate *)sofZmanShmaGRASunriseToFixedLocalChatzos {
    NSDate *startOfHalfDay = [self sunrise];
    NSDate *endOfHalfDay = [self fixedLocalChatzos];

    if (startOfHalfDay == nil || endOfHalfDay == nil) {
        return nil;
    }

    double shaahZmanis = [endOfHalfDay timeIntervalSinceDate:startOfHalfDay] / 6;
    return [startOfHalfDay dateByAddingTimeInterval:shaahZmanis * 3];
}

- (nullable NSDate *)sofZmanShmaMGA16Point1DegreesToFixedLocalChatzos {
    NSDate *startOfHalfDay = [self alos16Point1Degrees];
    NSDate *endOfHalfDay = [self fixedLocalChatzos];

    if (startOfHalfDay == nil || endOfHalfDay == nil) {
        return nil;
    }

    double shaahZmanis = [endOfHalfDay timeIntervalSinceDate:startOfHalfDay] / 6;
    return [startOfHalfDay dateByAddingTimeInterval:shaahZmanis * 3];
}

- (nullable NSDate *)sofZmanShmaMGA18DegreesToFixedLocalChatzos {
    NSDate *startOfHalfDay = [self alos18Degrees];
    NSDate *endOfHalfDay = [self fixedLocalChatzos];

    if (startOfHalfDay == nil || endOfHalfDay == nil) {
        return nil;
    }

    double shaahZmanis = [endOfHalfDay timeIntervalSinceDate:startOfHalfDay] / 6;
    return [startOfHalfDay dateByAddingTimeInterval:shaahZmanis * 3];
}

- (nullable NSDate *)sofZmanShmaMGA72MinutesToFixedLocalChatzos {
    NSDate *startOfHalfDay = [self alos72];
    NSDate *endOfHalfDay = [self fixedLocalChatzos];

    if (startOfHalfDay == nil || endOfHalfDay == nil) {
        return nil;
    }

    double shaahZmanis = [endOfHalfDay timeIntervalSinceDate:startOfHalfDay] / 6;
    return [startOfHalfDay dateByAddingTimeInterval:shaahZmanis * 3];
}

- (nullable NSDate *)sofZmanShmaMGA90MinutesToFixedLocalChatzos {
    NSDate *startOfHalfDay = [self alos90];
    NSDate *endOfHalfDay = [self fixedLocalChatzos];

    if (startOfHalfDay == nil || endOfHalfDay == nil) {
        return nil;
    }

    double shaahZmanis = [endOfHalfDay timeIntervalSinceDate:startOfHalfDay] / 6;
    return [startOfHalfDay dateByAddingTimeInterval:shaahZmanis * 3];
}

- (nullable NSDate *)sofZmanTfilaGRASunriseToFixedLocalChatzos {
    NSDate *startOfHalfDay = [self sunrise];
    NSDate *endOfHalfDay = [self fixedLocalChatzos];

    if (startOfHalfDay == nil || endOfHalfDay == nil) {
        return nil;
    }

    double shaahZmanis = [endOfHalfDay timeIntervalSinceDate:startOfHalfDay] / 6;
    return [startOfHalfDay dateByAddingTimeInterval:shaahZmanis * 4];
}

@end

@implementation KCComplexZmanimCalendar (GeonimDegreesMinutes)

- (nullable NSDate *)tzaisGeonim4Point42Degrees {
    return [self sunsetOffsetByDegrees:kZenithFourPointFortyTwo];
}

- (nullable NSDate *)tzaisGeonim4Point66Degrees {
    return [self sunsetOffsetByDegrees:kZenithFourPointSixtySix];
}

- (nullable NSDate *)tzaisGeonim6Point45Degrees {
    return [self sunsetOffsetByDegrees:kZenithSixPointFortyFive];
}

- (nullable NSDate *)tzaisGeonim7Point67Degrees {
    return [self sunsetOffsetByDegrees:kZenithSevenPointSixtySeven];
}

- (nullable NSDate *)tzaisGeonim9Point3Degrees {
    return [self sunsetOffsetByDegrees:kZenithNinePointThree];
}

- (nullable NSDate *)tzaisGeonim9Point75Degrees {
    return [self sunsetOffsetByDegrees:kZenithNinePointSeventyFive];
}

- (nullable NSDate *)misheyakir7Point65Degrees {
    return [self sunriseOffsetByDegrees:kZenithSevenPointSixtyFive];
}

- (nullable NSDate *)misheyakir9Point5Degrees {
    return [self sunriseOffsetByDegrees:kZenithNinePointFive];
}

- (nullable NSDate *)misheyakir12Point85Degrees {
    return [self sunriseOffsetByDegrees:kZenithTwelvePointEightyFive];
}

- (nullable NSDate *)alos19Degrees {
    return [self sunriseOffsetByDegrees:kZenithNineteenDegrees];
}

@end

@implementation KCComplexZmanimCalendar (BainHashmashos)

- (nullable NSDate *)bainHashmashosYereim13Point5Minutes {
    return [[self seaLevelSunset] dateByAddingTimeInterval:-13.5 * 60];
}

- (nullable NSDate *)bainHashmashosYereim16Point875Minutes {
    return [[self seaLevelSunset] dateByAddingTimeInterval:-16.875 * 60];
}

- (nullable NSDate *)bainHashmashosYereim18Minutes {
    return [self dateBySubtractingMinutes:18 fromDate:[self seaLevelSunset]];
}

- (nullable NSDate *)bainHashmashosYereim2Point1Degrees {
    return [self sunsetOffsetByDegrees:kZenithMinus2Point1];
}

- (nullable NSDate *)bainHashmashosYereim2Point8Degrees {
    return [self sunsetOffsetByDegrees:kZenithMinus2Point8];
}

- (nullable NSDate *)bainHashmashosYereim3Point05Degrees {
    return [self sunsetOffsetByDegrees:kZenithMinus3Point05];
}

- (nullable NSDate *)bainHashmashosRT13Point24Degrees {
    return [self sunsetOffsetByDegrees:kZenithThirteenPointTwentyFourDegrees];
}

- (nullable NSDate *)samuchLeMinchaKetanaGRA {
    return [[self seaLevelSunrise] dateByAddingTimeInterval:[self shaahZmanisGra] * 9];
}

- (nullable NSDate *)samuchLeMinchaKetana72Minutes {
    return [[self alos72] dateByAddingTimeInterval:[self shaahZmanis72Minutes] * 9];
}

- (nullable NSDate *)samuchLeMinchaKetana16Point1Degrees {
    return [[self alos16Point1Degrees] dateByAddingTimeInterval:[self shaahZmanis16Point1Degrees] * 9];
}

- (long)shaahZmanisAlos16Point1DegreesToTzaisGeonim3Point7Degrees {
    return [self temporalHourFromSunrise:[self alos16Point1Degrees] toSunset:[self tzaisGeonim3Point7Degrees]];
}

- (long)shaahZmanisAlos16Point1DegreesToTzaisGeonim3Point8Degrees {
    return [self temporalHourFromSunrise:[self alos16Point1Degrees] toSunset:[self tzaisGeonim3Point8Degrees]];
}

- (long)shaahZmanisAlos16Point1DegreesToTzaisGeonim7Point083Degrees {
    return [self temporalHourFromSunrise:[self alos16Point1Degrees] toSunset:[self tzaisGeonim7Point083Degrees]];
}

@end

#import <math.h>

/* Degree-based trig helpers, implemented in trigonometry.c. */
double sinDeg(double deg);
double cosDeg(double deg);
double tanDeg(double deg);
double acosDeg(double x);

/* NOAA calculator primitives (declared here because KCNOAACalculator.h does
 * not publish them; they exist in KCNOAACalculator.m). */
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

/* Port of NOAACalculator.getUTCNoon / getUTCMidnight: UTC solar noon or
 * midnight in fractional hours, normalized to [0, 24). negLongitude is the
 * negated location longitude, as Java passes it. */
static double KCPolarUTCNoonOrMidnight(KCNOAACalculator *calculator, NSDate *date, double negLongitude, BOOL isNoon) {
    double julianDay = [calculator getJulianDay:date];
    double tnoon = [calculator getJulianCenturiesFromJulianDay:(julianDay + negLongitude / 360.0)];
    double equationOfTime = [calculator getEquationOfTime:tnoon];
    double solNoonUTC = negLongitude * 4.0 - equationOfTime;
    for (int i = 0; i < 2; i++) {
        double newt = [calculator getJulianCenturiesFromJulianDay:(julianDay + solNoonUTC / 1440.0)];
        equationOfTime = [calculator getEquationOfTime:newt];
        solNoonUTC = (isNoon ? 720.0 : 1440.0) + negLongitude * 4.0 - equationOfTime;
    }
    double normalized = fmod(solNoonUTC / 60.0, 24.0);
    if (normalized < 0.0) {
        normalized += 24.0;
    }
    return normalized;
}

/* NOAA refraction adjustment for solar elevation. */
static double KCPolarRefractionAdjustment(double elevation) {
    if (elevation > 85.0) {
        return 0.0;
    }
    double te = tanDeg(elevation);
    double correction;
    if (elevation > 5.0) {
        correction = 58.1 / te - 0.07 / pow(te, 3.0) + 0.000086 / pow(te, 5.0);
    } else if (elevation > -0.575) {
        correction = 1735.0 + elevation * (-518.2 + elevation * (103.4 + elevation * (-12.79 + 0.711 * elevation)));
    } else {
        correction = -20.774 / te;
    }
    return correction / 3600.0;
}

/* Port of NOAACalculator.getSolarElevation (elevation, not azimuth). Returns
 * NAN for a nil date. */
static double KCPolarSolarElevation(NSDate *date, KCGeoLocation *geoLocation, KCNOAACalculator *calculator) {
    if (date == nil || geoLocation == nil || calculator == nil) {
        return NAN;
    }
    double lat = geoLocation.latitude;
    double lon = geoLocation.longitude;
    NSCalendar *utcCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    utcCalendar.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
    NSDateComponents *comps = [utcCalendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitNanosecond)
                                            fromDate:date];
    double fractionalDay = (comps.hour + (comps.minute + (comps.second + comps.nanosecond / 1000000000.0) / 60.0) / 60.0) / 24.0;
    /* Julian day of the UTC date (port of NOAACalculator.getJulianDay). */
    long year = comps.year;
    long month = comps.month;
    long day = comps.day;
    if (month <= 2) {
        year -= 1;
        month += 12;
    }
    long a = year / 100;
    long b = 2 - a + a / 4;
    double julianDay = floor(365.25 * (year + 4716)) + floor(30.6001 * (month + 1)) + day + b - 1524.5 + fractionalDay;
    double julianCenturies = (julianDay - kJulianDayJan_1_2000) / kJulianDaysPerCentury;
    double decl = [calculator getSunDeclination:julianCenturies];
    double eot = [calculator getEquationOfTime:julianCenturies];
    double trueSolarTime = fmod((fractionalDay + eot / 1440.0 + lon / 360.0) + 2.0, 1.0);
    if (trueSolarTime < 0.0) {
        trueSolarTime += 1.0;
    }
    double hourAngle = trueSolarTime * 2.0 * M_PI - M_PI;
    double cosZenith = sinDeg(lat) * sinDeg(decl) + cosDeg(lat) * cosDeg(decl) * cos(hourAngle);
    if (cosZenith > 1.0) {
        cosZenith = 1.0;
    } else if (cosZenith < -1.0) {
        cosZenith = -1.0;
    }
    double zenithDeg = acosDeg(cosZenith);
    return (90.0 - zenithDeg) + KCPolarRefractionAdjustment(90.0 - zenithDeg);
}

/* Solar noon or midnight as an NSDate, following Java's getSunTransit /
 * getSolarMidnight (calculator based, so it works in polar regions where the
 * port's sunTransit/solarMidnight return nil), with getInstantFromTime's
 * NOON/MIDNIGHT date-shift rules. */
static NSDate *KCPolarNoonOrMidnightDate(KCAstronomicalCalendar *calendar, BOOL isMidnight) {
    KCNOAACalculator *calculator = (KCNOAACalculator *)calendar.astronomicalCalculator;
    double longitude = calendar.geoLocation.longitude;
    double timeUTC = KCPolarUTCNoonOrMidnight(calculator, calendar.workingDate, -longitude, !isMidnight);
    NSCalendar *locationCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    locationCalendar.timeZone = calendar.geoLocation.timeZone;
    NSDateComponents *ymd = [locationCalendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay)
                                                fromDate:calendar.workingDate];
    double localTimeHours = (longitude / 15.0) + timeUTC;
    NSInteger day = ymd.day;
    if (isMidnight) {
        if (localTimeHours < 12.0) {
            day += 1;
        }
    } else {
        if (localTimeHours < 0.0) {
            day += 1;
        } else if (localTimeHours > 24.0) {
            day -= 1;
        }
    }
    return KCPolarUTCDate(ymd.year, ymd.month, day, timeUTC);
}

@implementation KCComplexZmanimCalendar (Polar)

- (nullable NSDate *)polarSunriseBenIshChai {
    if ([self seaLevelSunrise] == nil) {
        return [self timeAtAzimuth90Or270:90.0];
    }
    return nil;
}

- (nullable NSDate *)polarSunsetBenIshChai {
    if ([self seaLevelSunset] == nil) {
        return [self timeAtAzimuth90Or270:270.0];
    }
    return nil;
}

- (nullable NSDate *)polarPlagHaminchaBenIshChai {
    NSDate *polarSunrise = [self polarSunriseBenIshChai];
    NSDate *polarSunset = [self polarSunsetBenIshChai];
    double shaahZmanis = [self temporalHourFromSunrise:polarSunrise toSunset:polarSunset];
    if (shaahZmanis == LONG_MIN) {
        return nil;
    }
    return [polarSunrise dateByAddingTimeInterval:shaahZmanis * 10.75];
}

- (nullable NSDate *)polarStartOfDayTeshuvosVehanhagos {
    if ([self seaLevelSunrise] == nil && [self seaLevelSunset] == nil) {
        if (![self.astronomicalCalculator isKindOfClass:[KCNOAACalculator class]]) {
            return nil;
        }
        KCNOAACalculator *calculator = (KCNOAACalculator *)self.astronomicalCalculator;
        NSDate *chatzosHayom = KCPolarNoonOrMidnightDate(self, NO);
        NSDate *chatzosHalayla = KCPolarNoonOrMidnightDate(self, YES);
        double chatzosHayomSolarElevation = KCPolarSolarElevation(chatzosHayom, self.geoLocation, calculator);
        double chatzosHalaylaSolarElevation = KCPolarSolarElevation(chatzosHalayla, self.geoLocation, calculator);
        /* Java defaults: solar radius 16' + refraction 34'. */
        double sunriseElevation = (16.0 / 60.0) + (34.0 / 60.0);
        if (chatzosHayomSolarElevation < (0 - sunriseElevation) && chatzosHalaylaSolarElevation < (0 - sunriseElevation) &&
            [self alos16Point1Degrees] == nil && [self seaLevelSunrise] == nil) {
            return chatzosHayom;
        } else if (chatzosHayomSolarElevation > (0 - sunriseElevation) && chatzosHalaylaSolarElevation > (0 - sunriseElevation)) {
            return chatzosHalayla;
        }
    }
    return nil;
}

- (nullable NSDate *)polarPlagHaminchaTeshuvosVehanhagos {
    NSDate *polarStartOfDay = [self polarStartOfDayTeshuvosVehanhagos];
    if (polarStartOfDay == nil) {
        return nil;
    }
    NSDate *yesterday = [polarStartOfDay dateByAddingTimeInterval:-24 * 60 * 60];
    double shaahZmanis = [self temporalHourFromSunrise:yesterday toSunset:polarStartOfDay];
    if (shaahZmanis == LONG_MIN) {
        return nil;
    }
    return [yesterday dateByAddingTimeInterval:shaahZmanis * 10.75];
}

@end

#import "KCJewishCalendar.h"

/* Port of the alos == nil || tzais == nil branch of
 * ComprehensiveZmanimCalendar.getMoladBasedTime: returns the molad-based time
 * only if it falls on the working date (midnight to midnight in the
 * location's timezone), otherwise nil. */
static NSDate *KCMoladBasedTimeOnWorkingDate(KCComplexZmanimCalendar *calendar, NSDate *moladBasedTime) {
    if (moladBasedTime == nil) {
        return nil;
    }
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    gregorian.timeZone = calendar.geoLocation.timeZone;
    NSDate *lastMidnight = [gregorian startOfDayForDate:calendar.workingDate];
    NSDateComponents *oneDay = [[NSDateComponents alloc] init];
    oneDay.day = 1;
    NSDate *midnightTonight = [gregorian startOfDayForDate:[gregorian dateByAddingComponents:oneDay
                                                                                     toDate:calendar.workingDate
                                                                                    options:0]];
    if ([moladBasedTime compare:lastMidnight] == NSOrderedAscending ||
        [moladBasedTime compare:midnightTonight] == NSOrderedDescending) {
        return nil;
    }
    return moladBasedTime;
}

/* A KCJewishCalendar bound to the complex calendar's location and working
 * date, for the working date's Hebrew month/year/day. initWithLocation: is
 * used (not plain init) because the Hebrew date accessors consult sunset. */
static KCJewishCalendar *KCMoladJewishCalendarForDate(KCComplexZmanimCalendar *calendar, NSDate *date) {
    KCJewishCalendar *jewishCalendar = [[KCJewishCalendar alloc] initWithLocation:calendar.geoLocation];
    jewishCalendar.workingDate = date;
    return jewishCalendar;
}

@implementation KCComplexZmanimCalendar (Molad)

- (nullable NSDate *)zmanMolad {
    KCJewishCalendar *jewishCalendar = KCMoladJewishCalendarForDate(self, self.workingDate);
    NSInteger dayOfMonth = [jewishCalendar currentHebrewDayOfMonth];
    if (dayOfMonth > 2 && dayOfMonth < 27) {
        return nil;
    }
    NSDate *molad = KCMoladBasedTimeOnWorkingDate(self, [jewishCalendar moladAsDateForMonth:[jewishCalendar currentHebrewMonth]
                                                                                   ofYear:[jewishCalendar currentHebrewYear]]);
    if (molad == nil && dayOfMonth > 26) {
        /* The molad can fall at the end of the previous month; try the next month. */
        NSCalendar *hebrewCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierHebrew];
        NSDate *nextMonthDate = [hebrewCalendar dateByAddingMonths:1 toDate:self.workingDate];
        KCJewishCalendar *nextJewishCalendar = KCMoladJewishCalendarForDate(self, nextMonthDate);
        molad = KCMoladBasedTimeOnWorkingDate(self, [jewishCalendar moladAsDateForMonth:[nextJewishCalendar currentHebrewMonth]
                                                                                ofYear:[nextJewishCalendar currentHebrewYear]]);
    }
    return molad;
}

- (nullable NSDate *)tchilasZmanKidushLevana3Days {
    KCJewishCalendar *jewishCalendar = KCMoladJewishCalendarForDate(self, self.workingDate);
    NSInteger dayOfMonth = [jewishCalendar currentHebrewDayOfMonth];
    if (dayOfMonth > 5 && dayOfMonth < 30) {
        return nil;
    }
    NSDate *zman = KCMoladBasedTimeOnWorkingDate(self, [jewishCalendar tchilasZmanKidushLevana3DaysForDate:self.workingDate]);
    if (zman == nil && dayOfMonth == 30) {
        /* Extreme case: the zman can fall on Rosh Chodesh of the next month. */
        NSCalendar *hebrewCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierHebrew];
        NSDate *nextMonthDate = [hebrewCalendar dateByAddingMonths:1 toDate:self.workingDate];
        zman = KCMoladBasedTimeOnWorkingDate(self, [jewishCalendar tchilasZmanKidushLevana3DaysForDate:nextMonthDate]);
    }
    return zman;
}

- (nullable NSDate *)tchilasZmanKidushLevana7Days {
    KCJewishCalendar *jewishCalendar = KCMoladJewishCalendarForDate(self, self.workingDate);
    NSInteger dayOfMonth = [jewishCalendar currentHebrewDayOfMonth];
    if (dayOfMonth < 4 || dayOfMonth > 9) {
        return nil;
    }
    return KCMoladBasedTimeOnWorkingDate(self, [jewishCalendar tchilasZmanKidushLevana7DaysForDate:self.workingDate]);
}

- (nullable NSDate *)sofZmanKidushLevana15Days {
    KCJewishCalendar *jewishCalendar = KCMoladJewishCalendarForDate(self, self.workingDate);
    NSInteger dayOfMonth = [jewishCalendar currentHebrewDayOfMonth];
    if (dayOfMonth < 11 || dayOfMonth > 17) {
        return nil;
    }
    return KCMoladBasedTimeOnWorkingDate(self, [jewishCalendar sofZmanKidushLevana15DaysForDate:self.workingDate]);
}

- (nullable NSDate *)sofZmanKidushLevanaBetweenMoldos {
    KCJewishCalendar *jewishCalendar = KCMoladJewishCalendarForDate(self, self.workingDate);
    NSInteger dayOfMonth = [jewishCalendar currentHebrewDayOfMonth];
    if (dayOfMonth < 11 || dayOfMonth > 16) {
        return nil;
    }
    return KCMoladBasedTimeOnWorkingDate(self, [jewishCalendar sofZmanKidushLevanaBetweenMoldosForDate:self.workingDate]);
}

@end
