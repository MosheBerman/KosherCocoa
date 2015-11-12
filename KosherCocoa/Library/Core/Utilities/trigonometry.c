/** 
 *  MathAdditions.c
 *  KosherCocoa 3
 *
 *  Created by Moshe Berman on 3/24/11.
 *  Modified by Moshe Berman on 8/25/13.
 *
 *  
 */

#include "trigonometry.h"

/** toRadians
 *
 *  A utility function for converting degrees to radians
 *
 *  @param degrees The number of degrees to convert.
 *  @return The number of radians that corresponds to the supplied number of degrees.
 */

double toRadians(double degrees){
    return degrees * M_PI / 180.0;
}

/**
 *  A utility function for converting radians to degrees
 *
 *
 */

double toDegrees(double radians){
    return radians * 180.0 / M_PI;
}

/**
 * sin of an angle in degrees
 */

double sinDeg(double deg) {
    return sin(deg * 2.0 * M_PI / 360.0);
}

/**
 * acos of an angle, result in degrees
 */
 double acosDeg(double x) {
    return acos(x) * 360.0 / (2 * M_PI);
}

/**
 * asin of an angle, result in degrees
 */

 double asinDeg(double x) {
    return asin(x) * 360.0 / (2 * M_PI);
}

/**
 * tan of an angle in degrees
 */
 double tanDeg(double deg) {
    return tan(deg * 2.0 * M_PI / 360.0);
}

/**
 * cos of an angle in degrees
 */
 double cosDeg(double deg) {
    return cos(deg * 2.0 * M_PI / 360.0);
}