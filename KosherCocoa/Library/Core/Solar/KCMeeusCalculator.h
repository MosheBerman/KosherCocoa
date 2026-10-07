//
//  KCMeeusCalculator.h
//  KosherCocoa
//
//  Created by Moshe Berman on 10/7/26.
//

@import Foundation;
#import "KCGeoLocation.h"
#import "KCConstants.h"
#import "KCAstronomicalCalculator.h"

/** A class that uses Jean Meeus's higher-accuracy solar position algorithm to calculate sunrise and sunset.
 * Implementation of sunrise and sunset methods to calculate astronomical times based on the algorithm in
 * <a href="https://www.willbell.com/math/mc1.htm">Astronomical Algorithms</a> (2nd ed.) by
 * <a href="https://en.wikipedia.org/wiki/Jean_Meeus">Jean Meeus</a>. Unlike KCNOAACalculator (which uses the
 * low-accuracy method from the same work, good to roughly 0.01 degrees / about 1 minute of time), this calculator
 * computes the Earth's heliocentric position from the abridged
 * <a href="https://en.wikipedia.org/wiki/VSOP_(planets)">VSOP87</a> series printed in Meeus's Appendix III, then
 * derives the Sun's apparent geocentric longitude (applying the FK5 frame correction, nutation in longitude and the
 * aberration of light), apparent right ascension and declination, and the equation of time per Meeus chapter 28. The
 * resulting solar position is good to roughly an arc-second. Meeus computes positions in Terrestrial Time (TT), so an
 * estimate of &Delta;T (TT - UT) is applied when evaluating the Sun's position.
 *
 * The following public KosherJava MeeusCalculator methods are intentionally not ported because
 * KCAstronomicalCalculator has no hook for them: getUTCNoon, getUTCMidnight, getTimeAtAzimuth, getSolarElevation,
 * getSolarAzimuth, and setApplyDeltaT/isApplyDeltaT. The &Delta;T (TT - UT) correction is always applied, matching
 * the KosherJava default.
*/

NS_SWIFT_NAME(MeeusCalculator)
@interface KCMeeusCalculator : KCAstronomicalCalculator

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
 *  This method instantiates a new KCMeeusCalculator
 *  using the supplied KCGeolocation.
 *
 *  @param geolocation A Geolocation object.
 *  @return An instance of KCMeeusCalculator.
 */

- (nonnull instancetype)initWithGeoLocation:(nonnull KCGeoLocation *)geolocation;

@end
