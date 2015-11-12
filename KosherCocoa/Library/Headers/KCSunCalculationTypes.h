/**
 *  KCSunCalculationTypes.h
 *  KosherCocoa 3
 *
 *  Created by Moshe Berman on 8/25/13.
 *  Updated by Moshe Berman on 10/11/13.
 *
 *  This file contains constants related to
 *  the two possible sun calculations - sunrise and sunset.
 *
 *  The core methods upon which this entire API is built
 *  use these two contstants as a sort of boolean flag.
 *
 *  Use of KosherCocoa 3 is governed by the LGPL 2.1 License.
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