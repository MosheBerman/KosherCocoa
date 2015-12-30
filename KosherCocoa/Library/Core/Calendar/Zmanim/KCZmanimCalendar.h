/**
 *  KCZmanimCalendar.h
 *  KosherCocoa 3
 *
 *  Created by Moshe Berman on 7/19/11.
 *  Updated by Moshe Berman on 10/8/13.
 *
 *  Use of KosherCocoa 3 is governed by the LGPL 2.1 License.
 */

#import <Foundation/Foundation.h>
#import "KCAstronomicalCalendar.h"

@interface KCZmanimCalendar : KCAstronomicalCalendar

/**-----
 * @name Properties
 * -----
 */

/**
 *  Candle Lighting Offset from sunset (usually 18 minutes)
 */

@property (nonatomic) NSInteger candleLightingOffset;

/**-----
 * @name Calculations
 * -----
 */

/**
 * Returns <em>alos</em> (dawn) based on the time when the sun is 16.1&deg; below the eastern geometric horizon before sunrise.
 * @return The <code>NSDate</code> of dawn. If the calculation can't be computed such as northern and southern
 *         locations even south of the Arctic Circle and north of the Antarctic Circle where the sun may not reach
 *         low enough below the horizon for this calculation, nil will be returned.
 */

- (NSDate *)alosHashachar;

/**
 * Method to return <em>alos</em> (dawn) calculated using 72 minutes before sunrise at sea level (no adjustment for elevation) based on the time to walk the distance of 4 <em>Mil</em> at 18 minutes a
 * <em>Mil</em>. This is based on the opinion of most <em>Rishonim</em> who stated that the time of the
 * <em>Neshef</em> (time between dawn and sunrise) does not vary by the time of year or location but purely depends
 * on the time it takes to walk the distance of 4 <em>Mil</em>.
 *
 * @return the <code>NSDate</code> representing the time. If the calculation can't be computed such as in the Arctic
 *         Circle where there is at least one day a year where the sun does not rise, and one where it does not set,
 *         nil will be returned.
 */

- (NSDate *)alos72;

/**
 * This method returns <em>chatzos</em> (midday) following the opinion of the GRA that the day for Jewish halachic
 * times start at sea level sunrise and ends at sea level sunset.
 *
 * @return the <code>NSDate</code> of chatzos. If the calculation can't be computed such as in the Arctic Circle where
 *         there is at least one day where the sun does not rise, and one where it does not set, a null will be
 *         returned.
 */

- (NSDate *)chatzos;

/**
 * This method returns the latest <em>zman krias shema</em> (time to recite Shema in the morning). This time is 3 shaos zmaniyos</em> (solar hours) after sea level
 * sunrise based on the opinion of the <em>GRA</em> and the <em>Baal Hatanya</em> that the day is calculated from
 * sunrise to sunset.
 *
 * @return the <code>NSDate</code> of the latest zman shema according to the GRA and Baal Hatanya. If the calculation
 *         can't be computed such as in the Arctic Circle where there is at least one day a year where the sun does
 *         not rise, and one where it does not set, nil will be returned.
 */

- (NSDate *)sofZmanShmaGra;

/**
 * This method returns the latest <em>zman krias shema</em> (time to recite shema in the morning) in the opinion of
 * the <em>MGA</em> based on <em>alos</em> being 72 minutes before sunrise. This time is 3
 * <em>shaos zmaniyos</em> (solar hours) after dawn based on the opinion of the <em>MGA</em> that the day is
 * calculated from a dawn of 72 minutes before sunrise to nightfall of 72 minutes after sunset.
 *
 * @return the <code>NSDate</code> of the latest <em>zman shema</em>. If the calculation can't be computed such as in
 *         the Arctic Circle where there is at least one day a year where the sun does not rise, and one where it
 *         does not set, nil will be returned.
 */

- (NSDate *)sofZmanShmaMogenAvraham;

/**
 * A method to return candle lighting time. This is calculated as <code>CandleLightingOffset</code> minutes before
 * sea level sunset. This will return the time for any day of the week, since it can be
 * used to calculate candle lighting time for <em>yom tov</em> (mid-week holidays) as well.
 * @return candle lighting time. If the calculation can't be computed such as in the Arctic Circle where there is at
 *         least one day a year where the sun does not rise, and one where it does not set, nil will be returned.
 */

- (NSDate *)candleLighting;

/**
 *  A method to return the candle lighting time, calculated as offset
 *  minutes before sunset.
 *
 *  @param offsetInMinutes The number of minutes before sunset.
 *
 *  @return An NSDate representing the candle lighting time.
 */

- (NSDate *)candleLightingWithOffsetFromSunset:(NSInteger)offsetInMinutes;


/**
 * A method to return candle lighting time. This is calculated as 15 minutes before
 * sea level sunset. This will return the time for any day of the week, since it can be
 * used to calculate candle lighting time for <em>yom tov</em> (mid-week holidays) as well.
 * @return candle lighting time. If the calculation can't be computed such as in the Arctic Circle where there is at
 *         least one day a year where the sun does not rise, and one where it does not set, nil will be returned.
 */

- (NSDate *)candleLighting15;

/**
 * A method to return candle lighting time. This is calculated as 18 minutes before
 * sea level sunset. This will return the time for any day of the week, since it can be
 * used to calculate candle lighting time for <em>yom tov</em> (mid-week holidays) as well.
 * @return candle lighting time. If the calculation can't be computed such as in the Arctic Circle where there is at
 *         least one day a year where the sun does not rise, and one where it does not set, nil will be returned.
 */

- (NSDate *)candleLighting18;

/**
 * A method to return candle lighting time. This is calculated as 20 minutes before
 * sea level sunset. This will return the time for any day of the week, since it can be
 * used to calculate candle lighting time for <em>yom tov</em> (mid-week holidays) as well.
 * @return candle lighting time. If the calculation can't be computed such as in the Arctic Circle where there is at
 *         least one day a year where the sun does not rise, and one where it does not set, nil will be returned.
 */

- (NSDate *)candleLighting20;

/**
 * A method to return candle lighting time. This is calculated as 22 minutes before
 * sea level sunset. This will return the time for any day of the week, since it can be
 * used to calculate candle lighting time for <em>yom tov</em> (mid-week holidays) as well.
 * @return candle lighting time. If the calculation can't be computed such as in the Arctic Circle where there is at
 *         least one day a year where the sun does not rise, and one where it does not set, nil will be returned.
 */

- (NSDate *)candleLighting22;

/**
 * A method to return candle lighting time. This is calculated as 30 minutes before
 * sea level sunset. This will return the time for any day of the week, since it can be
 * used to calculate candle lighting time for <em>yom tov</em> (mid-week holidays) as well.
 * @return candle lighting time. If the calculation can't be computed such as in the Arctic Circle where there is at
 *         least one day a year where the sun does not rise, and one where it does not set, nil will be returned.
 */

- (NSDate *)candleLighting30;

/**
 * A method to return candle lighting time. This is calculated as 40 minutes before
 * sea level sunset. This will return the time for any day of the week, since it can be
 * used to calculate candle lighting time for <em>yom tov</em> (mid-week holidays) as well.
 * @return candle lighting time. If the calculation can't be computed such as in the Arctic Circle where there is at
 *         least one day a year where the sun does not rise, and one where it does not set, nil will be returned.
 */

- (NSDate *)candleLighting40;

/**
 * This method returns the latest <em>zman tefilah</em> (time to recite the morning prayers). This time is 4
 * hours into the day based on the opinion of the <em>GRA</em> and the <em>Baal Hatanya</em> that the day is
 * calculated from sunrise to sunset.
 *
 * @return the <code>NSDate</code> of the latest zman tefilah. If the calculation can't be computed such as in the
 *         Arctic Circle where there is at least one day a year where the sun does not rise, and one where it does
 *         not set, nil will be returned.
 */

- (NSDate *)sofZmanTfilaGra;

/**
 * This method returns the latest <em>zman tfila</em> (time to recite the morning prayers) in the opinion of the
 * <em>MGA</em> based on <em>alos</em> being 72 minutes before sunrise.
 * This time is 4 shaos zmaniyos</em> (temporal hours) after
 * dawn based on the opinion of the <em>MGA</em> that the day is calculated from a dawn} of 72
 * minutes before sunrise to nightfall} of 72 minutes after sunset.
 *
 * @return the <code>NSDate</code> of the latest zman tfila. If the calculation can't be computed such as in the
 *         Arctic Circle where there is at least one day a year where the sun does not rise, and one where it does
 *         not set), nil will be returned.
 */

- (NSDate *)sofZmanTfilaMogenAvraham;

/**
 * This method returns the time of <em>mincha gedola</em>. <em>Mincha gedola</em> is the earliest time one can pray
 * mincha. The Ramba"m is of the opinion that it is better to delay <em>mincha</em> until
 * <em>mincha ketana}</em> while the <em>Ra"sh,
 * Tur, GRA</em> and others are of the opinion that <em>mincha</em> can be prayed <em>lechatchila</em> starting at
 * <em>mincha gedola</em>. This is calculated as 6.5 sea level solar hours after
 * sea level sunrise}. This calculation is based on the opinion of the <em>GRA</em> and
 * the <em>Baal Hatanya</em> that the day is calculated from sunrise to sunset.
 * @return the <code>NSDate</code> of the time of mincha gedola. If the calculation can't be computed such as in the
 *         Arctic Circle where there is at least one day a year where the sun does not rise, and one where it does
 *         not set, nil will be returned.
 */

- (NSDate *)minchaGedola;

/**
 * This method returns the time of <em>mincha ketana</em>. This is the preferred earliest time to pray
 * <em>mincha</em> in the opinion of the Rambam and others. For more information on this see the documentation on
 * mincha gedola</em>. This is calculated as 9.5 sea
 * level solar hours after sea level sunrise. This calculation is calculated based on
 * the opinion of the <em>GRA</em> and the <em>Baal Hatanya</em> that the day is calculated from sunrise to sunset.
 * @return the <code>NSDate</code> of the time of mincha ketana. If the calculation can't be computed such as in the
 *         Arctic Circle where there is at least one day a year where the sun does not rise, and one where it does
 *         not set, nil will be returned.
 */

- (NSDate *)minchaKetana;

/**
 * This method returns the time of <em>plag hamincha</em>. This is calculated as 10.75 hours after sunrise. This
 * calculation is based on the opinion of the <em>GRA</em> and the <em>Baal Hatanya</em> that the day is calculated
 * from sunrise to sunset.
 *
 * @return the <code>NSDate</code> of the time of <em>plag hamincha</em>. If the calculation can't be computed such as
 *         in the Arctic Circle where there is at least one day a year where the sun does not rise, and one where it
 *         does not set, nil will be returned.
 */

- (NSDate *)plagHamincha;

/**
 *  This calculation is based on the position of the sun 36 minutes after sunset in Jerusalem on March 16,
 *  about 4 days before the equinox, the day that a solar hour is 60 minutes, which is 8.5degrees below geometric
 *  zenith. The Ohr Meir considers this the time that 3 small stars are visible, which is later than the required
 *  3 medium stars.
 */

- (NSDate *)tzais;

/**
 *  Calculated as 72 minutes after sunset, not taking elevation into account.
 */

- (NSDate *)tzais72;

/**
 * A method that returns a <em>shaah zmanis</em> (temporal hour) according to
 * the opinion of the <em>GRA</em> and the <em>Baal Hatanya</em>. This calculation divides the day based on the
 * opinion of the <em>GRA</em> and the <em>Baal Hatanya</em> that the day runs from
 * sunrise to  sunset. The calculations are based on a day from
 * sea level sunrise to sea level sunset. The day is
 * split into 12 equal parts with each one being a <em>shaah zmanis</em>. An explanation and
 * detailed sources for not using elevation for anything besides sunrise and sunset can be found in <a
 * href="http://www.worldcat.org/oclc/659793988">Zmanim Kehilchasam (second edition published in 2007)</a> by Rabbi
 * Dovid Yehuda Bursztyn chapter 2 (pages 186-187).
 *
 * @return the <code>double</code> millisecond length of a <em>shaah zmanis</em> calculated from
 *         sea level sunrise to sea level sunset. If the
 *         calculation can't be computed such as in the Arctic Circle where there is at least one day a year where
 *         the sun does not rise, and one where it does not set, <code>LONG_MIN</code> will be returned.
 */

- (double)shaahZmanisGra;

/**
 * A method that returns a <em>shaah zmanis</em> (temporal hour) according to the opinion of the Magen Avraham. This
 * calculation divides the day based on the opinion of the <em>MGA</em> that the day runs from dawn to dusk (for sof
 * zman krias shema and tfila). Dawn for this calculation is 72 minutes before sunrise and dusk is 72 minutes after
 * sunset. This day is split into 12 equal parts with each part being a <em>shaah zmanis</em>. Alternate methods of
 * calculating a <em>shaah zmanis</em> are available in the subclass <code>ComplexZmanimCalendar</code>.
 *
 * @return the <code>NSDate</code> millisecond length of a <em>shaah zmanis</em>. If the calculation can't be computed
 *         such as in the Arctic Circle where there is at least one day a year where the sun does not rise, and one
 *         where it does not set, <code>LONG_MIN</code> will be returned.
 */

- (double)shaahZmanisMogenAvraham;

@end
