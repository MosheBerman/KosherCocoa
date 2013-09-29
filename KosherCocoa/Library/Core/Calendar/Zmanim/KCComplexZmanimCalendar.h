/**
 *  KCZComplexZmanimCalendar.h
 *  KosherCocoa 2
 *
 *  Created by Moshe Berman on 7/24/11.
 *  Updated by Moshe Berman on 9/8/13.
 *
 *  Use of KosherCocoa 2 is governed by the LGPL 2.1 License.
 */

#import "KCZmanimCalendar.h"

/**
 *  This class extends ZmanimCalendar and provides many
 *  more zmanim than available in the ZmanimCalendar.
 *
 *  The basis for most zmanim in this class are from the sefer 
 *  Yisroel Vehazmanim by Rabbi Yisroel Dovid Harfenes.
 *  As an example of the number of different zmanim made available
 *  by this class, there are methods to return 12 different
 *  calculations for alos (dawn) available in this class. 
 *  The real power of this API is the ease in calculating zmanim 
 *  that are not part of the API.
 *  
 *  The methods for doing zmanim calculations not present in this class or its
 *  superclass the KCZmanimCalendar are contained in KCAstronomicalCalendar,
 *  the base class of the calendars in our API since they are generic methods
 *  for calculating time based on degrees or time before or after sunrise and 
 *  sunset and
 *  are of interest for calculation beyond zmanim calculations.
 */

@interface KCComplexZmanimCalendar : KCZmanimCalendar

/**
 *  The default value is 40 minutes. In Israel, this should be 25 
 *  minutes.
 */

@property int ateretTorahSunsetOffset;

/**
 *  Method to return a <em>shaah zmanis</em> (temporal hour) calculated using a
 *  19.8&deg; dip.
 *  
 *  This calculation divides the day based on the opinion of the MGA that the day runs 
 *  from dawn to dusk. Dawn for this calculation is  when the sun is 19.8&deg; below the 
 *  eastern geometric horizon before sunrise.
 *  
 *  Dusk for this is when the sun is 19.8&deg; below the western geometric horizon 
 *  after sunset. This day is split into 12 equal parts with each part being a <em>shaah 
 *  zmanis</em>.
 *
 *  @return long The millisecond length of a *shaah zmanis*. 
 *  
 *  If the calculation can't be computed
 *  such as northern and southern locations even south of the Arctic Circle and north 
 *  of the Antarctic Circle
 *  where the sun may not reach low enough below the horizon for this calculation, a 
 *  MIN_VALUE will be returned. See detailed explanation on top of 
 *  KCAstronomicalCalendar documentation.
 */

- (long) shaahZmanis19Point8Degrees;

- (long) shaahZmanis18Degrees;

- (long) shaahZmanis26Degrees;

- (long) shaahZmanis16Point1Degrees;

- (long) shaahZmanis60Minutes;

- (long) shaahZmanis72Minutes;

- (long) shaahZmanis72MinutesZmanis;

- (long) shaahZmanis90Minutes;

- (long) shaahZmanis90MinutesZmanis;

- (long) shaahZmanis96Minutes;

- (long) shaahZmanis96MinutesZmanis;

- (long) shaahZmanisAteretTorah;

- (long) shaahZmanis120Minutes;

- (long) shaahZmanis120MinutesZmanis;

- (NSDate *) plagHamincha120Minutes;

- (NSDate *) plagHamincha120MinutesZmanis;

- (NSDate *) alos60;

- (NSDate *) alos72Zmanis;

- (NSDate *) alos90;

- (NSDate *) alos90Zmanis;

- (NSDate *) alos96;

- (NSDate *) alos96Zmanis;

- (NSDate *) alos120;

- (NSDate *) alos120Zmanis;

- (NSDate *) alos26Degrees;

- (NSDate *) alos18Degrees;

- (NSDate *) alos19Point8Degrees;

- (NSDate *) alos16Point1Degrees;

- (NSDate *) misheyakir11Point5Degrees;

- (NSDate *) misheyakir11Degrees;

- (NSDate *) misheyakir10Point2Degrees;

- (NSDate *) sofZmanShmaMGA19Point8Degrees;

- (NSDate *) sofZmanShmaMGA16Point1Degrees;

- (NSDate *) sofZmanShmaMGA72Minutes;

- (NSDate *) sofZmanShmaMGA72MinutesZmanis;

- (NSDate *) sofZmanShmaMGA90Minutes;

- (NSDate *) sofZmanShmaMGA90MinutesZmanis;

- (NSDate *) sofZmanShmaMGA96Minutes;

- (NSDate *) sofZmanShmaMGA96MinutesZmanis;

- (NSDate *) sofZmanShma3HoursBeforeChatzos;

- (NSDate *) sofZmanShmaMGA120Minutes;

- (NSDate *) sofZmanShmaAlos16Point1ToSunset;

- (NSDate *) sofZmanShmaAlos16Point1ToTzaisGeonim7Point083Degrees;

- (NSDate *) sofZmanShmaKolEliyahu;

- (NSDate *) sofZmanTfilaMGA19Point8Degrees;

- (NSDate *) sofZmanTfilaMGA16Point1Degrees;

- (NSDate *) sofZmanTfilaMGA72Minutes;

- (NSDate *) sofZmanTfilaMGA72MinutesZmanis;

- (NSDate *) sofZmanTfilaMGA90Minutes;

- (NSDate *) sofZmanTfilaMGA90MinutesZmanis;

- (NSDate *) sofZmanTfilaMGA96Minutes;

- (NSDate *) sofZmanTfilaMGA96MinutesZmanis;

- (NSDate *) sofZmanTfilaMGA120Minutes;

- (NSDate *) sofZmanTfila2HoursBeforeChatzos;

- (NSDate *) minchaGedola30Minutes; //after chatzos

- (NSDate *) minchaGedola72Minutes;

- (NSDate *) minchaGedola16Point1Degrees;

- (NSDate *) minchaGedolaGreaterThan30;

- (NSDate *) minchaKetana16Point1Degrees;

- (NSDate *) minchaKetana72Minutes;

- (NSDate *) plagHamincha60Minutes;

- (NSDate *) plagHamincha72Minutes;

- (NSDate *) plagHamincha90Minutes;

- (NSDate *) plagHamincha96Minutes;

- (NSDate *) plagHamincha96MinutesZmanis;

- (NSDate *) plagHamincha90MinutesZmanis;

- (NSDate *) plagHamincha72MinutesZmanis;

- (NSDate *) plagHamincha16Point1Degrees;

- (NSDate *) plagHamincha19Point8Degrees;

- (NSDate *) plagHamincha26Degrees;

- (NSDate *) plagHamincha18Degrees;

- (NSDate *) plagAlosToSunset;

- (NSDate *) plagAlos16Point1ToTzaisGeonim7Point083Degrees;

- (NSDate *) bainHashmashosRT13Degrees;

- (NSDate *) bainHashmashosRT58Point5Minutes;

- (NSDate *) bainHashmashosRT13Point5MinutesBefore7Point083Degrees;

- (NSDate *) bainHashmashosRT2Stars;

- (NSDate *) tzaisGeonim5Point95Degrees;

- (NSDate *) tzaisGeonim3Point65Degrees;

- (NSDate *) tzaisGeonim4Point61Degrees;

- (NSDate *) tzaisGeonim4Point37Degrees;

- (NSDate *) tzaisGeonim5Point88Degrees;

- (NSDate *) tzaisGeonim4Point8Degrees;

- (NSDate *) tzaisGeonim7Point083Degrees;

- (NSDate *) tzaisGeonim8Point5Degrees;

//R' Moshe Feinstein's opinion
- (NSDate *) tzais50;

- (NSDate *) tzais60;

- (NSDate *) tzaisAteretTorah;

- (NSDate *) sofZmanShmaAteretTorah;

- (NSDate *) sofZmanTfilaAteretTorah;

- (NSDate *) minchaGedolaAteretTorah;

- (NSDate *) minchaKetanaAteretTorah;

- (NSDate *) plagHaminchaAteretTorah;

- (NSDate *) misheyakirAteretTorahWithMinutes:(double)minutes;

- (NSDate *) tzais72Zmanis;

- (NSDate *) tzais90Zmanis;

- (NSDate *) tzais96Zmanis;

- (NSDate *) tzais90;

- (NSDate *) tzais120;

- (NSDate *) tzais120Zmanis;

- (NSDate *) tzais16Point1Degrees;

- (NSDate *) tzais26Degrees;

- (NSDate *) tzais18Degrees;

- (NSDate *) tzais19Point8Degrees;

- (NSDate *) tzais96;

- (NSDate *) fixedLocalChatzos;

- (NSDate *) sofZmanShmaFixedLocal;

- (NSDate *) sofZmanTfilaFixedLocal;

- (NSDate *) sofZmanAchilasChametzGra;

- (NSDate *) sofZmanAchilasChametzMGA72Minutes;

- (NSDate *) sofZmanAchilasChametzMGA16Point1Degrees;

- (NSDate *) sofZmanBiurChametzGra;

- (NSDate *) sofZmanBiurChametzMGA72Minutes;

- (NSDate *) sofZmanBiurChametzMGA16Point1Degrees;

- (NSDate *)solarMidnight;

@end






