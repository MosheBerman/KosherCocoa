/** KCZenith.h
 *
 * Created by Moshe Berman on Sunday, August 25, 2013.
 *
 *  This file contains several zenith constants used for various calculations. 
 *  There are more in the KCZenithExtended header.
 */

#ifndef __KC_ZENITH_H
#define __KC_ZENITH_H

/** kZenithGeometric
 *
 *  The zenith of astronomical sunrise and sunset. 
 *  The sun is 90 degrees from the vertical 0 degrees.
 *  It is important to note that for sunrise and sunset the adjusted zenith is required to account for the radius of the sun and refraction. The adjusted zenith should not
 * be used for calculations above or below 90 degrees since they are usually are calculated as an offset to 90 degrees.
 */

#define kZenithGeometric 90.0f

/** kZenithCivil
 *
 *  The sun's zenith at civil twilight (96 degrees)
 */

#define kZenithCivil 96.0f

/** kZenithNautical
 *
 *  The sun's zenith at nautical twilight (102 degrees)
 */

#define kZenithNautical 102.0f

/** kZenithAstronomical
 *
 *  The sun's zenith at astronomical twilight (108 degrees)
 */

#define kZenithAstronomical 108.0f

#endif // __KC_ZENITH_H