//
//  KCSPACalculator.h
//  KosherCocoa
//
//  Created by Pikachu on 10/7/26.
//

@import Foundation;
#import "KCGeoLocation.h"
#import "KCConstants.h"
#import "KCAstronomicalCalculator.h"

/** A class that calculates sunrise and sunset using the NREL Solar Position Algorithm (SPA) of Ibrahim Reda and
 * Afshin Andreas. SPA computes the Earth's heliocentric position from the VSOP87 series, applies nutation, aberration
 * and the obliquity of the ecliptic to obtain the Sun's apparent geocentric right ascension and declination, then
 * performs the full topocentric reduction (observer parallax and atmospheric refraction) to yield the observed
 * topocentric zenith and azimuth. Its stated uncertainty is +/-0.0003 degrees for the years -2000 to +6000.
 *
 * Deviations from the canonical KosherJava SPACalculator:
 * - Pressure (1013.25 mbar) and temperature (10.0 C) are fixed at the canonical defaults; they are not configurable
 *   in this port.
 * - The Delta-T (TT-UT) correction is applied using the Espenak-Meeus estimate; the applyDeltaT and deltaTOverride
 *   configurability is not ported.
 * - The solar radius is the fixed 16 arc-minute value (self.solarRadius); the date-based apparent-solar-radius table
 *   is not ported.
 * - Not ported: the canonical class's UTC noon, UTC midnight, time-at-azimuth, solar elevation and solar azimuth
 *   methods. KCAstronomicalCalculator has no hook for them, so no API is invented for them here.
*/

NS_SWIFT_NAME(SPACalculator)
@interface KCSPACalculator : KCAstronomicalCalculator

/**
 *
 *
 *  A string representing the name of the calculator
 */

@property (nonatomic, strong, nullable) NSString *calculatorName;

/**
 *  The location of the user.
 */

@property (nonatomic, strong, nonnull) KCGeoLocation *geoLocation;

/**
 *  This method instantiates a new KCSPACalculator
 *  using the supplied KCGeolocation.
 *
 *  @param geolocation A Geolocation object.
 *  @return An instance of KCSPACalculator.
 */

- (nonnull instancetype)initWithGeoLocation:(nonnull KCGeoLocation *)geolocation;

@end
