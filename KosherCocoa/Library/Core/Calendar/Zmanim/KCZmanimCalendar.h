//
//  ZmanimCalendar.h
//  KosherCocoa
//
//  Created by Moshe Berman on 7/19/11.
//  Copyright 2011 MosheBerman.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KCAstronomicalCalendar.h"

@interface KCZmanimCalendar : KCAstronomicalCalendar

@property (nonatomic) NSInteger candleLightingOffset;

- (NSDate *) alosHashachar;

- (NSDate *) alos72;

- (NSDate *) chatzos;

- (NSDate *) sofZmanShmaGra;

- (NSDate *) sofZmanShmaMogenAvraham;

- (NSDate *) candleLighting;

- (NSDate *) candleLighting15;

- (NSDate *) candleLighting18;

- (NSDate *) candleLighting20;

- (NSDate *) candleLighting22;

- (NSDate *) candleLighting30;

- (NSDate *) candleLighting40;

- (NSDate *) sofZmanTfilaGra;

- (NSDate *) sofZmanTfilaMogenAvraham;

- (NSDate *) minchaGedola;

- (NSDate *) minchaKetana;

- (NSDate *) plagHamincha;

- (NSDate *)tzais;

- (NSDate *) tzais72;

- (double) shaahZmanisGra;

- (double) shaahZmanisMogenAvraham;

@end
