/**
 *  AstronomicalCalculator.h
 *  KosherCocoa 2
 *
 *  Created by Moshe Berman on 7/22/11.
 *  Updated by Moshe Berman on 8/25/13.
 *
 *  Use of KosherCocoa 2 is governed by the LGPL 2.1 License.
 */

#import <Foundation/Foundation.h>


/** An abstract class whos subclasses return sunrise and sunset times.
 */

@interface AstronomicalCalculator : NSObject

/**-----
 * @name Calculations
 * -----
 */

- (double) UTCSunriseForDate:(NSDate*)date andZenith:(double)zenith adjustForElevation:(BOOL)adjustForElevation;

- (double) UTCSunsetForDate:(NSDate*)date andZenith:(double)zenith adjustForElevation:(BOOL)adjustForElevation;

@end
