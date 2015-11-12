/**
 *  KCAstronomical.h
 *  KosherCocoa 3
 *
 *  Created by Moshe Berman on 8/25/13.
 *  Updated by Moshe Berman on 10/11/13.
 *
 *  Use of KosherCocoa 3 is governed by the LGPL 2.1 License.
 */

#ifndef __KC_KCAstronomical_h
#define __KC_KCAstronomical_h

/** kDegreesPerHour
 *
 *  This is defined as 360.0 / 24.0. There are 24 hours in a day and 360 degrees per day.
 */

#define kDegreesPerHour (360.0f / 24.0f)

/** kSolarRadius
 *
 *  The commonly used average solar radius in minutes of a degree.
 *
 */

#define kSolarRadius (16.0f / 60.0f)

/** kRefraction
 *
 *  The commonly used average solar refraction.
 *
 *  Calendrical Calculations lists a more accurate global average of 34.478885263888294.
 */

#define kRefraction (34.0f / 60.0f)


/** kEarthRadiusInKilometers
 *
 *  The diameter of the earth's radius in kilometers.
 */

#define kEarthRadiusInKilometers 6356.9

#endif //__KC_KCAstronomical_h