/** 
 *  AstronomicalCalculator.h
 *  KosherCocoa 2
 *
 *  Created by Moshe Berman on 7/22/11.
 *  Modified by Moshe Berman on 8/25/13.
 *
 *  Use of KosherCocoa 2 is governed by the LGPL 2.1 License
 */

#import "KCAstronomicalCalculator.h"

/** 
 *  An abstract class whose subclasses calculate sunrise and sunset.
 */

@implementation KCAstronomicalCalculator

- (double)UTCSunriseForDate:(NSDate*)date andZenith:(double)zenith adjustForElevation:(BOOL)adjustForElevation
{
    [super doesNotRecognizeSelector:_cmd];
    return 0;
}

/**-----
 * @name Calculating Sunset
 * -----
 */


- (double)UTCSunsetForDate:(NSDate*)date andZenith:(double)zenith adjustForElevation:(BOOL)adjustForElevation
{
    [super doesNotRecognizeSelector:_cmd];
    return 0;
}

@end

