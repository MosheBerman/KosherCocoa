/**
  KCZmanimCalendar.h
  KosherCocoa 4

  Created by Moshe Berman on 7/19/11.
  Updated by Moshe Berman on 10/8/13.

  Use of KosherCocoa 4 is governed by the LGPL 2.1 License.
 */

@import Foundation;
#import "KCAstronomicalCalendar.h"

NS_SWIFT_NAME(ZmanimCalendar)
@interface KCZmanimCalendar : KCAstronomicalCalendar

/**-----
 @name Properties
 -----
 */

/**
  Candle Lighting Offset from sunset (usually 18 minutes)
 */

@property (nonatomic) NSInteger candleLightingOffset;

/**-----
 @name Calculations
 -----
 */

/**
 Returns _alos_ (dawn) based on the time when the sun is 16.1&deg; below the eastern geometric horizon before sunrise.
 @return The `NSDate` of dawn. If the calculation can't be computed such as northern and southern
         locations even south of the Arctic Circle and north of the Antarctic Circle where the sun may not reach
         low enough below the horizon for this calculation, nil will be returned.
 */

- (nullable NSDate *)alosHashachar;

/**
 Method to return _alos_ (dawn) calculated using 72 minutes before sunrise at sea level (no adjustment for elevation) based on the time to walk the distance of 4 _Mil_ at 18 minutes a
 _Mil_. This is based on the opinion of most _Rishonim_ who stated that the time of the
 _Neshef_ (time between dawn and sunrise) does not vary by the time of year or location but purely depends
 on the time it takes to walk the distance of 4 _Mil_.

 @return the `NSDate` representing the time. If the calculation can't be computed such as in the Arctic
         Circle where there is at least one day a year where the sun does not rise, and one where it does not set,
         nil will be returned.
 */

- (nullable NSDate *)alos72;

/**
 This method returns _chatzos_ (midday) following the opinion of the GRA that the day for Jewish halachic
 times start at sea level sunrise and ends at sea level sunset.

 @return the `NSDate` of chatzos. If the calculation can't be computed such as in the Arctic Circle where
         there is at least one day where the sun does not rise, and one where it does not set, a null will be
         returned.
 */

- (nullable NSDate *)chatzos;

/**
 This method returns the latest _zman krias shema_ (time to recite Shema in the morning). This time is 3 shaos zmaniyos (solar hours) after sea level
 sunrise based on the opinion of the _GRA_ and the _Baal Hatanya_ that the day is calculated from
 sunrise to sunset.

 @return the `NSDate` of the latest zman shema according to the GRA and Baal Hatanya. If the calculation
         can't be computed such as in the Arctic Circle where there is at least one day a year where the sun does
         not rise, and one where it does not set, nil will be returned.
 */

- (nullable NSDate *)sofZmanShmaGra;

/**
 This method returns the latest _zman krias shema_ (time to recite shema in the morning) in the opinion of
 the _MGA_ based on _alos_ being 72 minutes before sunrise. This time is 3
 _shaos zmaniyos_ (solar hours) after dawn based on the opinion of the _MGA_ that the day is
 calculated from a dawn of 72 minutes before sunrise to nightfall of 72 minutes after sunset.

 @return the `NSDate` of the latest _zman shema_. If the calculation can't be computed such as in
         the Arctic Circle where there is at least one day a year where the sun does not rise, and one where it
         does not set, nil will be returned.
 */

- (nullable NSDate *)sofZmanShmaMogenAvraham;

/**
 A method to return candle lighting time. This is calculated as `CandleLightingOffset` minutes before
 sea level sunset. This will return the time for any day of the week, since it can be
 used to calculate candle lighting time for _yom tov_ (mid-week holidays) as well.
 @return candle lighting time. If the calculation can't be computed such as in the Arctic Circle where there is at
         least one day a year where the sun does not rise, and one where it does not set, nil will be returned.
 */

- (nullable NSDate *)candleLighting;

/**
  A method to return the candle lighting time, calculated as offset
  minutes before sunset.

  @param offsetInMinutes The number of minutes before sunset.

  @return An NSDate representing the candle lighting time.
 */

- (nullable NSDate *)candleLightingWithOffsetFromSunset:(NSInteger)offsetInMinutes;


/**
 A method to return candle lighting time. This is calculated as 15 minutes before
 sea level sunset. This will return the time for any day of the week, since it can be
 used to calculate candle lighting time for _yom tov_ (mid-week holidays) as well.
 @return candle lighting time. If the calculation can't be computed such as in the Arctic Circle where there is at
         least one day a year where the sun does not rise, and one where it does not set, nil will be returned.
 */

- (nullable NSDate *)candleLighting15;

/**
 A method to return candle lighting time. This is calculated as 18 minutes before
 sea level sunset. This will return the time for any day of the week, since it can be
 used to calculate candle lighting time for _yom tov_ (mid-week holidays) as well.
 @return candle lighting time. If the calculation can't be computed such as in the Arctic Circle where there is at
         least one day a year where the sun does not rise, and one where it does not set, nil will be returned.
 */

- (nullable NSDate *)candleLighting18;

/**
 A method to return candle lighting time. This is calculated as 20 minutes before
 sea level sunset. This will return the time for any day of the week, since it can be
 used to calculate candle lighting time for _yom tov_ (mid-week holidays) as well.
 @return candle lighting time. If the calculation can't be computed such as in the Arctic Circle where there is at
         least one day a year where the sun does not rise, and one where it does not set, nil will be returned.
 */

- (nullable NSDate *)candleLighting20;

/**
 A method to return candle lighting time. This is calculated as 22 minutes before
 sea level sunset. This will return the time for any day of the week, since it can be
 used to calculate candle lighting time for _yom tov_ (mid-week holidays) as well.
 @return candle lighting time. If the calculation can't be computed such as in the Arctic Circle where there is at
         least one day a year where the sun does not rise, and one where it does not set, nil will be returned.
 */

- (nullable NSDate *)candleLighting22;

/**
 A method to return candle lighting time. This is calculated as 30 minutes before
 sea level sunset. This will return the time for any day of the week, since it can be
 used to calculate candle lighting time for _yom tov_ (mid-week holidays) as well.
 @return candle lighting time. If the calculation can't be computed such as in the Arctic Circle where there is at
         least one day a year where the sun does not rise, and one where it does not set, nil will be returned.
 */

- (nullable NSDate *)candleLighting30;

/**
 A method to return candle lighting time. This is calculated as 40 minutes before
 sea level sunset. This will return the time for any day of the week, since it can be
 used to calculate candle lighting time for _yom tov_ (mid-week holidays) as well.
 @return candle lighting time. If the calculation can't be computed such as in the Arctic Circle where there is at
         least one day a year where the sun does not rise, and one where it does not set, nil will be returned.
 */

- (nullable NSDate *)candleLighting40;

/**
 This method returns the latest _zman tefilah_ (time to recite the morning prayers). This time is 4
 hours into the day based on the opinion of the _GRA_ and the _Baal Hatanya_ that the day is
 calculated from sunrise to sunset.

 @return the `NSDate` of the latest zman tefilah. If the calculation can't be computed such as in the
         Arctic Circle where there is at least one day a year where the sun does not rise, and one where it does
         not set, nil will be returned.
 */

- (nullable NSDate *)sofZmanTfilaGra;

/**
 This method returns the latest _zman tfila_ (time to recite the morning prayers) in the opinion of the
 _MGA_ based on _alos_ being 72 minutes before sunrise.
 This time is 4 shaos zmaniyos (temporal hours) after
 dawn based on the opinion of the _MGA_ that the day is calculated from a dawn} of 72
 minutes before sunrise to nightfall} of 72 minutes after sunset.

 @return the `NSDate` of the latest zman tfila. If the calculation can't be computed such as in the
         Arctic Circle where there is at least one day a year where the sun does not rise, and one where it does
         not set), nil will be returned.
 */

- (nullable NSDate *)sofZmanTfilaMogenAvraham;

/**
 This method returns the time of _mincha gedola_. _Mincha gedola_ is the earliest time one can pray
 mincha. The Ramba"m is of the opinion that it is better to delay _mincha_ until
 _mincha ketana}_ while the _Ra"sh,
 Tur, GRA_ and others are of the opinion that _mincha_ can be prayed _lechatchila_ starting at
 _mincha gedola_. This is calculated as 6.5 sea level solar hours after
 sea level sunrise}. This calculation is based on the opinion of the _GRA_ and
 the _Baal Hatanya_ that the day is calculated from sunrise to sunset.
 @return the `NSDate` of the time of mincha gedola. If the calculation can't be computed such as in the
         Arctic Circle where there is at least one day a year where the sun does not rise, and one where it does
         not set, nil will be returned.
 */

- (nullable NSDate *)minchaGedola;

/**
 This method returns the time of _mincha ketana_. This is the preferred earliest time to pray
 _mincha_ in the opinion of the Rambam and others. For more information on this see the documentation on
 mincha gedola. This is calculated as 9.5 sea
 level solar hours after sea level sunrise. This calculation is calculated based on
 the opinion of the _GRA_ and the _Baal Hatanya_ that the day is calculated from sunrise to sunset.
 @return the `NSDate` of the time of mincha ketana. If the calculation can't be computed such as in the
         Arctic Circle where there is at least one day a year where the sun does not rise, and one where it does
         not set, nil will be returned.
 */

- (nullable NSDate *)minchaKetana;

/**
 This method returns the time of _plag hamincha_. This is calculated as 10.75 hours after sunrise. This
 calculation is based on the opinion of the _GRA_ and the _Baal Hatanya_ that the day is calculated
 from sunrise to sunset.

 @return the `NSDate` of the time of _plag hamincha_. If the calculation can't be computed such as
         in the Arctic Circle where there is at least one day a year where the sun does not rise, and one where it
         does not set, nil will be returned.
 */

- (nullable NSDate *)plagHamincha;

/**
  This calculation is based on the position of the sun 36 minutes after sunset in Jerusalem on March 16,
  about 4 days before the equinox, the day that a solar hour is 60 minutes, which is 8.5degrees below geometric
  zenith. The Ohr Meir considers this the time that 3 small stars are visible, which is later than the required
  3 medium stars.
 */

- (nullable NSDate *)tzais;

/**
  Calculated as 72 minutes after sunset, not taking elevation into account.
 */

- (nullable NSDate *)tzais72;

/**
 A method that returns a _shaah zmanis_ (temporal hour) according to
 the opinion of the _GRA_ and the _Baal Hatanya_. This calculation divides the day based on the
 opinion of the _GRA_ and the _Baal Hatanya_ that the day runs from
 sunrise to  sunset. The calculations are based on a day from
 sea level sunrise to sea level sunset. The day is
 split into 12 equal parts with each one being a _shaah zmanis_. An explanation and
 detailed sources for not using elevation for anything besides sunrise and sunset can be found in "http://www.worldcat.org/oclc/659793988" Zmanim Kehilchasam (second edition published in 2007) by Rabbi
 Dovid Yehuda Bursztyn chapter 2 (pages 186-187).

 @return the `double` millisecond length of a _shaah zmanis_ calculated from
         sea level sunrise to sea level sunset. If the
         calculation can't be computed such as in the Arctic Circle where there is at least one day a year where
         the sun does not rise, and one where it does not set, `LONG_MIN` will be returned.
 */

- (double)shaahZmanisGra;

/**
 A method that returns a _shaah zmanis_ (temporal hour) according to the opinion of the Magen Avraham. This
 calculation divides the day based on the opinion of the _MGA_ that the day runs from dawn to dusk (for sof
 zman krias shema and tfila). Dawn for this calculation is 72 minutes before sunrise and dusk is 72 minutes after
 sunset. This day is split into 12 equal parts with each part being a _shaah zmanis_. Alternate methods of
 calculating a _shaah zmanis_ are available in the subclass `ComplexZmanimCalendar`.

 @return the `NSDate` millisecond length of a _shaah zmanis_. If the calculation can't be computed
         such as in the Arctic Circle where there is at least one day a year where the sun does not rise, and one
         where it does not set, `LONG_MIN` will be returned.
 */

- (double)shaahZmanisMogenAvraham;

@end
