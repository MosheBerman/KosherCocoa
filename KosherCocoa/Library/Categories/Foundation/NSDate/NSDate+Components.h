/**
 *  NSDate+Components.h
 *  KosherCocoa 3
 *
 *  Created by Moshe Berman on 4/12/13.
 *  Updated by Moshe Berman on 11/12/15.
 *
 *  Use of KosherCocoa 3 is governed by the LGPL 2.1 License.
 */

#import <Foundation/Foundation.h>

@interface NSDate (Components)

#pragma mark Convenenience Intializers

+ (NSDate *)dateWithDay:(NSUInteger)day month:(NSUInteger)month year:(NSUInteger)year;
+ (NSDate *)dateWithDay:(NSUInteger)day Month:(NSUInteger)month Year:(NSUInteger)year andCalendar:(NSCalendar *)calendar;

+ (NSDate *)dateWithEra:(NSInteger)era year:(NSInteger)year month:(NSInteger)month day:(NSInteger)day hour:(NSInteger)hour minute:(NSInteger)minute second:(NSInteger)second week:(NSInteger)week weekday:(NSInteger)weekday weekdayOrdinal:(NSInteger)weekdayOrdinal andCalendar:(NSCalendar *)calendar;

#pragma mark - Default values

//    All default values return components of [NSDate date], using [NSCalendar currentCalendar].
+ (NSInteger)defaultEra;
+ (NSInteger)defaultYear;
+ (NSInteger)defaultMonth;
+ (NSInteger)defaultDay;
+ (NSInteger)defaultHour;
+ (NSInteger)defaultMinute;
+ (NSInteger)defaultSecond;
+ (NSInteger)defaultWeek;
+ (NSInteger)defaultWeekday;
+ (NSInteger)defaultWeekdayOrdinal;


//    All default values return components of [NSDate date], using the supplied calendar.
+ (NSInteger)defaultEraForCalendar:(NSCalendar *)calendar;
+ (NSInteger)defaultYearForCalendar:(NSCalendar *)calendar;
+ (NSInteger)defaultMonthForCalendar:(NSCalendar *)calendar;
+ (NSInteger)defaultDayForCalendar:(NSCalendar *)calendar;
+ (NSInteger)defaultHourForCalendar:(NSCalendar *)calendar;
+ (NSInteger)defaultMinuteForCalendar:(NSCalendar *)calendar;
+ (NSInteger)defaultSecondForCalendar:(NSCalendar *)calendar;
+ (NSInteger)defaultWeekForCalendar:(NSCalendar *)calendar;
+ (NSInteger)defaultWeekdayForCalendar:(NSCalendar *)calendar;
+ (NSInteger)defaultWeekdayOrdinalForCalendar:(NSCalendar *)calendar;


@end
