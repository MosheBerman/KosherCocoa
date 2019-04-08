/**
 *  KCDafYomiCalculator.h
 *  KosherCocoa 4
 *
 *  Created by Moshe Berman on 11/13/11.
 *  Updated by Moshe Berman on 10/7/13.
 *
 *  Use of KosherCocoa 4 is governed by the LGPL 2.1 License.
 */



@import Foundation;
#import "KCDaf.h"

NS_ASSUME_NONNULL_BEGIN

/**
 This class calculates the current Daf Yomi being studied.
 */
NS_SWIFT_NAME(DafYomiCalculator)
@interface KCDafYomiCalculator : NSObject

// MARK: - Initializers

/**
 Creates a new KCDafYomiCalculator.

 @param date The default reference date for the calculator to use.
 @return An instance of KCDafYomiCalculator.
 */
- (instancetype)initWithDate:(NSDate *)date;


// MARK: - Properties

/**
 The reference date used by the calculator.
 */
@property (nonatomic, strong) NSDate * _Nonnull workingDate;


// MARK: - Getting the Daf

/**
 This method returns a KCDaf object representing the folio of talmud bavli being studied today.
 */
@property (nonatomic, readonly)  KCDaf *dafYomiBavli;

/**
   This method returns a KCDaf object representing
   the page of talmud bavli being studied on the
   supplied date.
 

 @param date A reference date to calculate with.
 @return A KCDaf object.
 */
- (nonnull KCDaf *)dafYomiBavliForDate:(NSDate *)date;

@end

NS_ASSUME_NONNULL_END
