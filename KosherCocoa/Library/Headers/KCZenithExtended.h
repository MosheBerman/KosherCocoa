/**
 *  KCZenithExtended.h
 *  KosherCocoa 3
 *
 *  Created by Moshe Berman on 8/25/13.
 *  Updated by Moshe Berman on 10/11/13.
 *
 *  This file contains exnteded zenith constants used for zmanim
 *  calculations according to various rabbinic opinions.
 *
 *  Use of KosherCocoa 3 is governed by the LGPL 2.1 License.
 */

#ifndef __KC_ZENITH_EXTENDED_H
#define __KC_ZENITH_EXTENDED_H

/** kZenithSixteenPointOne
 *
 *  The zenith of 16.1 degrees below geometric zenith (90 degrees). 
 *
 *  This calculation is used for determining *alos* (dawn) and *tzais* (nightfall) 
 *  in some opinions. It is based on the calculation that the time between dawn
 *  and sunrise (and sunset to nightfall) is 72 minutes, the time that is takes to
 *  walk 4 *mil* at 18 minutes a mil (*Rambam* and others). The sun's position at 72
 *  minutes before sunrise in Jerusalem on the equinox is 16.1 degrees below geometric zenith.
 */

#define kZenithSixteenPointOne (kZenithGeometric + 16.1)

/** kZenithEightPointFive
 *
 *  The zenith of 8.5 degrees below geometric zenith (90 degrees). 
 *
 *  This calculation is used for calculating *alos* (dawn) and *tzais* (nightfall) in some opinions.
 *  This calculation is based on the position of the sun 36 minutes after sunset in Jerusalem 
 *  on March 16, about 4 days before the equinox, the day that a
 *  solar hour is 60 minutes, which is 8.5degrees below geometric zenith. The Ohr Meir
 *  considers this the time that 3 small stars are visible, which is later than the
 *  required 3 medium stars.
 */

#define kZenithEightPointFive (kZenithGeometric + 8.5)

/** kZenithThreePointSeven
 *
 *  The zenith of 3.7 degrees below geometric zenith (90 degrees). 
 *  This calculation is used for calculating *tzais* (nightfall) based on the opinion of 
 *  the *Geonim* that *tzais* is the time it takes to walk 3/4 of a *Mil*
 *  at 18 minutes a *Mil*, or 13.5 minutes after sunset. The sun is 3.7 degrees below
 *  geometric zenith at this time in Jerusalem on March 16, 
 *  about 4 days before the equinox, the day that a solar hour is 60 minutes.
 */

#define kZenithThreePointSeven kZenithGeometric + 3.7

/** kZenithFivePointNinetyFive
 *
 *  The zenith that is 5.95 degrees below geometric zenith (90 degrees).
 *  
 *  This calculation is used for calculating *tzais* (nightfall) according to some opinions.
 *  This calculation is based on the position of the sun 24 minutes after sunset in Jerusalem 
 *  on March 16, about 4 days before the equinox, the day that a solar hour is 60 minutes, 
 *  which calculates to 5.95 degrees below geometric zenith.
 */

#define kZenithFivePointNinetyFive kZenithGeometric + 5.95

/** kZenithSevenPointZeroEightThree
 *
 *  The zenith of 7.083 degrees below geometric zenith (90 degrees).
 *  
 *  This is often referred to as 7 degrees and 5 minutes. This calculation is used for 
 *  calculating *alos* (dawn) and *tzais* (nightfall) according to some opinions. This 
 *  calculation is based on the position of the sun 30
 *  minutes after sunset in Jerusalem on March 16, about 4 days before the equinox, the day that 
 *  a solar hour is 60 minutes, which calculates to 7.0833333 degrees below geometric zenith.
 *  This is time some opinions consider dark enough for 3 stars to be visible.
 *  This is the opinion of the *Sh"Ut Melamed Leho'il*, *Sh"Ut Binyan Tziyon*,
 *  *Tenuvas Sadeh* and very close to the time of the *Mekor Chesed* on 
 *  the *Sefer chasidim*.
 */

#define kZenithSevenPointZeroEightThree kZenithGeometric + 7 + (5/60)

/** kZenithTenPointTwo
 *
 *  The zenith of 10.2 degrees below geometric zenith (90 degrees).
 *
 *  This calculation is used for calculating *misheyakir* according to some opinions.
 *  This calculation is based on the position of the sun 45 minutes sunrise in Jerusalem on
 *  March 16, about 4 days before the equinox, the day that a solar hour is 60 minutes, which
 *  calculates to 10.2 degrees below geometric zenith.
 */

#define kZenithTenPointTwo kZenithGeometric + 10.2

/** kZenithElevenDegrees
 *
 * The zenith of 11 degrees below geometric zenith (90 degrees). 
 *
 *  This calculation is used for calculating *misheyakir* according to some 
 *  opinions. This calculation is based on the position of the sun 48 minutes before
 *  sunrise in Jerusalem on March 16, about 4 days before the
 *  equinox, the day that a solar hour is 60 minutes which calculates to 11 degrees
 *  below geometric zenith
 */

#define kZenithElevenDegrees kZenithGeometric + 11

/** kZenithElevenPointFive
 *
 *  The zenith of 11.5 degrees below geometric zenith. (90 degrees).
 *
 *  This calculation is used for calculating *misheyakir* 
 *  according to some opinions. This calculation is based on the 
 *  position of the sun 52 minutes before sunrise in Jerusalem on 
 *  March 16, about 4 days before the equinox, the day that a solar hour
 *  is 60 minutes which calculates to 11.5 degrees below geometric zenith.
 */

#define kZenithElevenPointFive kZenithGeometric + 11.5

/** kZenithThirteenDegrees
 *
 *  The zenith of 13 degrees below geometric zenith} (90 degrees).
 *
 *  No further details were available in KosherJava.
 */

#define kZenithThirteenDegrees kZenithGeometric + 13

/** kZenithThirteenPointTwentyFourDegrees
 *
 *  The zenith of 13.24 degrees below geometric zenith (90 degrees).
 *  This calculation is used for calculating *Rabainu Tam's bain hashmashos*
 *  according to some opinions. <br/>
 *
 *  NOTE: See comments on bainHashmashosRT13Point24Degrees for additional
 *  details about the degrees.
 */

#define kZenithThirteenPointTwentyFourDegrees kZenithGeometric + 13.24

/** kZenithNineteenPointEight
 *
 * The zenith of 19.8 degrees below geometric zenith (90 degrees). 
 *
 *  This calculation is used for calculating *alos* (dawn) and *tzais* (nightfall) 
 *  according to some opinions. This calculation is based on the position of the sun 
 *  90 minutes after sunset in Jerusalem on March 16, about 4 days before the
 *  equinox, the day that a solar hour is 60 minutes which calculates to 19.8 degrees 
 *  below geometric zenith
 *
 * @see tzais19Point8Degrees
 * @see alos19Point8Degrees
 * @see alos90
 * @see tzais90
 *
 */

#define kZenithNineteenPointEight kZenithGeometric + 19.8

/** kZenithTwentySix
 *
 *  The zenith of 26 degrees below geometric zenith (90 degrees).
 *  This calculation is used for calculating *alos* (dawn) and *tzais* (nightfall) 
 *  according to some opinions. This calculation is based on the position of the
 *  sun 120 minutes after sunset in Jerusalem on March 16,
 *  about 4 days before the equinox, the day that a solar hour is 60 minutes which 
 *  calculates to 26 degrees below geometric zenith
 *
 * @see alos26Degrees
 * @see tzais26Degrees
 * @see alos120
 * @see tzais120
 */

#define kZenithTwentySix kZenithGeometric + 26.0

/** 
 *  In KosherJava, this was marked experimentimal and might not
 *  make the 1.3 version of the API.
 */

/** kZenithFourPointThirtySeven
 *
 *  The zenith of 4.37 degrees below geometric zenith (90 degrees).
 *
 *  This calculation is used for  calculating *tzais* (nightfall)
 *  according to some opinions. This calculation is based on the position of the
 *  sun tzaisGeonim4Point37Degrees 16 7/8 minutes after sunset (3/4 of a 22.5 
 *  minute Mil) Jerusalem on March 16, about 4 days before the equinox, the day that
 *  a solar hour is 60 minutes which calculates to 4.37 degrees below geometric zenith.
 */

#define kZenithFourPointThirtySeven kZenithGeometric + 4.37

/** kZenithFourPointSixtyOne
 *
 * The zenith of 4.61 degrees below geometric zenith (90 degrees). 
 *
 *  This calculation is used for calculating *tzais* (nightfall) according to some opinions.
 *  This calculation is based on the position of the sun tzaisGeonim4Point37Degrees
 *  18 minutes after sunset (3/4 of a 24 minute Mil) in Jerusalem on March 16,
 *  about 4 days before the equinox, the day that a solar hour is 60 minutes which 
 *  calculates to 4.61 degrees below geometric zenith
 *
 *  @see tzaisGeonim4Point61Degrees
 */

#define kZenithFourPointSixtyOne kZenithGeometric + 4.61

/** kZenithFourPointEight
 *
 *  The zenith of 4.8 degrees below geometric zenith (90 degrees)
 *
 *  No further details were available in KosherJava.
 */

#define kZenithFourPointEight kZenithGeometric + 4.8

/** kZenithThreePointSixtyFive
 *
 * The zenith of 3.65 degrees below geometric zenith (90 degrees). 
 *
 *  This calculation is used for calculating *tzais* (nightfall) according
 *  to some opinions. This calculation is based on the position of the sun tzaisGeonim3Point65Degrees
 *  13.5 minutes after sunset (3/4 of an 18 minute Mil) in Jerusalem on March 16, about
 *  4 days before the equinox, the day that a solar hour is 60 minutes which calculates to
 *  3.65 degrees below geometric zenith
 *
 *  @see tzaisGeonim3Point65Degrees
 */

#define kZenithThreePointSixtyFive kZenithGeometric + 3.65

/** kZenithFivePointEightyEight
 *
 *  The zenith of 5.88 degrees below geometric zenith (90 degrees).
 *
 *  No further details were available in KosherJava.
 */

#define kZenithFivePointEightyEight kZenithGeometric + 5.88

#endif // __KC_ZENITH_EXTENDED_H