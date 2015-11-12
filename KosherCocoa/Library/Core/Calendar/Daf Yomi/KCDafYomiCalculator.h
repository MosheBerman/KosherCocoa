/**
 *  KCDafYomiCalculator.h
 *  KosherCocoa 3
 *
 *  Created by Moshe Berman on 11/13/11.
 *  Updated by Moshe Berman on 10/7/13.
 *
 *  Use of KosherCocoa 3 is governed by the LGPL 2.1 License.
 */

#import <Foundation/Foundation.h>
#import "KCDaf.h"

/** A class that calculates Daf Yomi pages. */

@interface KCDafYomiCalculator : NSObject

/**-----
 * @name Properties
 * -----
 */

/** 
 *  The reference date used by the calculator.
 */

@property (nonatomic, strong) NSDate *workingDate;

/**-----
 * @name Initializers
 * -----
 */

/**
 *  This method instantiates a new KCDafYomiCalculator.
 *
 *  @param date The default reference date for the calculator to use.
 *  @return an instance of KCDafYomiCalculator
 */

- (id)initWithDate:(NSDate *)date;

/**-----
 * @name Getting "the Daf"
 * -----
 */

/**
 *  This method returns a KCDaf object representing
 *  the page of talmud bavli being studied today.
 *
 *  @return a KCDaf object.
 */

- (KCDaf *)dafYomiBavli;

/**
 *  This method returns a KCDaf object representing
 *  the page of talmud bavli being studied on the 
 *  supplied date.
 *
 *  @param date A reference date to calculate with.
 *
 *  @return a KCDaf object.
 */

- (KCDaf *)dafYomiBavliForDate:(NSDate *)date;

@end
