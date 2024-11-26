/**
 *  KCDafYomiCalculator.h
 *  KosherCocoa 3
 *
 *  Created by Moshe Berman on 11/13/11.
 *  Updated by Moshe Berman on 10/7/13.
 *
 *  Use of KosherCocoa 3 is governed by the LGPL 2.1 License.
 */

@import Foundation;
#import "KCDaf.h"

/**
 This class calculates the current Daf Yomi being studied.
 */
NS_SWIFT_NAME(DafYomiCalculator)
@interface KCDafYomiCalculator : NSObject

// MARK: - Properties
/** 
 *  The reference date used by the calculator.
 */

@property (nonatomic, strong, nonnull) NSDate * workingDate;

// MARK: - Initializers

/**
 *  This method instantiates a new KCDafYomiCalculator.
 *
 *  @param date The default reference date for the calculator to use.
 *  @return an instance of KCDafYomiCalculator
 */

- (nonnull instancetype)initWithDate:(nonnull NSDate *)date;


// MARK: - Getting "the Daf"

/**
 *  This method returns a KCDaf object representing
 *  the page of talmud bavli being studied today.
 *
 *  @return a KCDaf object.
 */

- (nullable KCDaf *)dafYomiBavli;

/**
 *  This method returns a KCDaf object representing
 *  the page of talmud bavli being studied on the 
 *  supplied date.
 *
 *  @param date A reference date to calculate with.
 *
 *  @return a KCDaf object.
 */

- (nonnull KCDaf *)dafYomiBavliForDate:(nonnull NSDate *)date;

@end
