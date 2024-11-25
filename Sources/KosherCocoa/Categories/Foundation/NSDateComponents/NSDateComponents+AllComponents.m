/**
 *  NSDateComponents+AllComponents.m
 *  KosherCocoa 3
 *
 *  Created by Moshe Berman on 4/12/13.
 *  Updated by Moshe Berman on 11/12/15.
 *
 *  Use of KosherCocoa 3 is governed by the LGPL 2.1 License.
 */

#import "NSDateComponents+AllComponents.h"

@implementation NSDateComponents (AllComponents)

#pragma mark - All Components

+ (NSUInteger)allComponents
{
return (NSCalendarUnitEra | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekOfYear);
}

@end
