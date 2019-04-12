/**
  AstronomicalCalculator.h
  KosherCocoa 4

  Created by Moshe Berman on 7/22/11.
  Updated by Moshe Berman on 8/25/13.

  Use of KosherCocoa 4 is governed by the LGPL 2.1 License.
 */

@import Foundation;

/**
  A protocol defining methods to return sunrise and sunset times.
 */
NS_SWIFT_NAME(AstronomicalCalculator)
@protocol KCAstronomicalCalculator  <NSObject>

// MARK: - Calculating Sunrise

/**
  A method that calculates UTC sunrise as well as any time based on an angle above or below sunrise. This abstract
  method is implemented by the classes that extend this class.

  @param date Used to calculate day of year.
  @param zenith the azimuth below the vertical zenith of 90 degrees. for sunrise typically the zenith used for
  the calculation uses geometric zenith of 90 degrees and adjusts this slightly to account for solar refraction
  and the sun's radius. Another example would be beginNauticalTwilight that passes NAUTICAL_ZENITH to this method.
  @param adjustForElevation Determines if we calculate at sea level or the altitude of the calculator's location.
  @return The number of milliseconds since 
 */

- (double)UTCSunriseForDate:(nonnull NSDate*)date andZenith:(double)zenith adjustForElevation:(BOOL)adjustForElevation;

// MARK: - Calculating Sunset

/**
  A method that calculates UTC sunrise as well as any time based on an angle above or below sunset. This abstract
  method is implemented by the classes that extend this class.

  @param date Used to calculate day of year.
  @param zenith the azimuth below the vertical zenith of 90 degrees. for sunrise typically the zenith used for
  the calculation uses geometric zenith of 90 degrees and adjusts this slightly to account for solar refraction
  and the sun's radius. Another example would be beginNauticalTwilight that passes NAUTICAL_ZENITH to this method.
  @param adjustForElevation Determines if we calculate at sea level or the altitude of the calculator's location.

  @return The UTC time of sunrise in 24 hour format. 5:45:00 AM will return 5.75.0. If an error was encountered in
  the calculation (expected behavior for some locations such as near the poles, NaN will be returned.
 */

- (double)UTCSunsetForDate:(nonnull NSDate*)date andZenith:(double)zenith adjustForElevation:(BOOL)adjustForElevation;

@end
