/** KCSunCalculationTypes.h
 *
 *  Created by Moshe Berman on Sunday, August 25, 2013.
 *
 *  This file contains constants related to
 *  the two possible sun calculations - sunrise and sunset.
 *
 *  The core methods upon which this entire API is built
 *  use these two contstants as a sort of boolean flag.
 */


#ifndef __KC_SUN_CALCULATION_TYPES_H
#define __KC_SUN_CALCULATION_TYPES_H

/** kTypeSunrise
 *
 *  Defined as 0. If passed to the appropriate method, sunrise will be returned.
 */

#define kTypeSunrise 0

/** kTypeSunset 
 *
 *  Defined as 1. If passed to the appropriate method, sunset will be returned.
 */

#define kTypeSunset 1

#endif // __KC_SUN_CALCULATION_TYPES_H