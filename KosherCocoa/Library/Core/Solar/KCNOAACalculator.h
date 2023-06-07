//
//  KCNOAACalculator.h
//  KosherCocoa
//
//  Created by Elyahu on 1/23/23.
//

@import Foundation;
#import "KCGeoLocation.h"
#import "KCConstants.h"
#import "KCAstronomicalCalculator.h"

/** A class that uses the US National Oceanic and Atmospheric Administration Algorithm to calculate sunrise and sunset.
 * Implementation of sunrise and sunset methods to calculate astronomical times based on the <a
 * href="http://noaa.gov">NOAA</a> algorithm. This calculator uses the Java algorithm based on the implementation by <a
 * href="http://noaa.gov">NOAA - National Oceanic and Atmospheric Administration</a>'s <a href =
 * "http://www.srrb.noaa.gov/highlights/sunrise/sunrise.html">Surface Radiation Research Branch</a>. NOAA's <a
 * href="http://www.srrb.noaa.gov/highlights/sunrise/solareqns.PDF">implementation</a> is based on equations from <a
 * href="http://www.willbell.com/math/mc1.htm">Astronomical Algorithms</a> by <a
 * href="http://en.wikipedia.org/wiki/Jean_Meeus">Jean Meeus</a>. Added to the algorithm is an adjustment of the zenith
 * to account for elevation. The algorithm can be found in the <a
 * href="http://en.wikipedia.org/wiki/Sunrise_equation">Wikipedia Sunrise Equation</a> article.
*/

NS_SWIFT_NAME(NOAACalculator)
@interface KCNOAACalculator : KCAstronomicalCalculator

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
 *  This method instantiates a new KCNOAACalculator
 *  using the supplied KCGeolocation.
 *
 *  @param geolocation A Geolocation object.
 *  @return An instance of KCNOAACalculator.
 */

- (nonnull instancetype)initWithGeoLocation:(nonnull KCGeoLocation *)geolocation;

@end
