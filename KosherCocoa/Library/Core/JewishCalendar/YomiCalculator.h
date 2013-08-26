//
//  YomiCalculator.h
//  KosherCocoaCommandLine
//
//  Created by Moshe Berman on 11/13/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Daf.h"

@interface YomiCalculator : NSObject

@property (nonatomic, strong) NSDate *workingDate;

//Designated Initializer
- (id) initWithDate:(NSDate *)date;

//Return the daf yomi on a given date
- (Daf *)dafYomiBavliForDate:(NSDate *)date;

//Calculate the Julian Day
- (NSInteger) julianDayForDate:(NSDate *)date;

//Convenience method for making a gregorian date
- (NSDate *)gregorianDateForYear:(NSInteger)year month:(NSInteger)month andDay:(NSInteger)day;

@end
