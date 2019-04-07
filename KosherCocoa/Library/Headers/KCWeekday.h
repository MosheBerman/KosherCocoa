//
//  KCWeekday.h
//  KosherCocoa
//
//  Created by Moshe Berman on 4/7/19.
//  Copyright © 2019 Moshe Berman. All rights reserved.
//

#ifndef KCWeekday_h
#define KCWeekday_h

/**
 A type representing the days of the week. 1-based. (i.e. Sunday is 1, Monday is 2, etc.)
 
 - kWeekdaySunday: The first day after shabbos.
 - kWeekdayMonday: The second day after shabbos.
 - kWeekdayTuesday: The third day after shabbos.
 - kWeekdayWednesday: The fourth day after shabbos.
 - kWeekdayThursday: The fifth day after shabbos.
 - kWeekdayFriday: The sixth day after shabbos.
 - kWeekdaySaturday: Shabbos.
 */
typedef NS_ENUM(NSInteger, kWeekday)
{
    kWeekdaySunday = 1,
    kWeekdayMonday,
    kWeekdayTuesday,
    kWeekdayWednesday,
    kWeekdayThursday,
    kWeekdayFriday,
    kWeekdaySaturday
};

#endif /* KCWeekday_h */
