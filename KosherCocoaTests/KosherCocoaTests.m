//
//  KosherCocoaTests.m
//  KosherCocoaTests
//
//  Created by Moshe Berman on 11/26/12.
//  Copyright (c) 2012 Moshe Berman. All rights reserved.
//

#import "KosherCocoaTests.h"

#import "MBCalendarCategories.h"
#import "NSDate+Components.h"

#import "KCParashatHashavuaCalculator.h"


@interface KosherCocoaTests ()

@property (nonatomic, strong) NSCalendar *hebrewCalendar;

@property (nonatomic, strong) NSArray *yearsToTest;
@property (nonatomic, strong) NSArray *weekdays;
@property (nonatomic, strong) NSArray *lengths;
@property (nonatomic, strong) NSArray *leaps;

@end

@implementation KosherCocoaTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
    
    _hebrewCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSHebrewCalendar];
    
    [self generateTestCases];
    
    /*
     
     These test cases were generated and then verified
     against Arthur Spier's book, 'The Comprehensive 
     Hebrew Calendar, 3rd edition' (Behrman House 1986, 
     ISBN 087306-398-8.
     
     */
    
    _yearsToTest = @[@(5675),   //  Type A
                     @(5683),   //  Type B
                     @(5688),   //  Type C
                     @(5694),   //  Type D
                     @(5702),   //  Type E
                     @(5734),   //  Type F
                     @(5740),   //  Type G
                     @(5746),   //  Type H
                     @(5765),   //  Type I
                     @(5784),   //  Type J
                     @(5809),   //  Type K
                     @(5850),   //  Type L
                     @(5852),   //  Type M
                     @(5858)    //  Type N
                     ];
    
    _weekdays =  @[@(kWeekdayMonday),       //  Type A
                   @(kWeekdaySaturday),     //  Type B
                   @(kWeekdayTuesday),      //  Type C
                   @(kWeekdayThursday),     //  Type D
                   @(kWeekdayMonday),       //  Type E
                   @(kWeekdayThursday),     //  Type F
                   @(kWeekdaySaturday),     //  Type G
                   @(kWeekdayMonday),       //  Type H
                   @(kWeekdayThursday),     //  Type I
                   @(kWeekdaySaturday),     //  Type J
                   @(kWeekdayTuesday),      //  Type K
                   @(kWeekdayMonday),       //  Type L
                   @(kWeekdayThursday),     //  Type M
                   @(kWeekdaySaturday)      //  Type N
                   ];
    
    _lengths =  @[@(kYearLengthShort),      //  Type A
                  @(kYearLengthShort),      //  Type B
                  @(kYearLengthRegular),    //  Type C
                  @(kYearLengthRegular),    //  Type D
                  @(kYearLengthLong),       //  Type E
                  @(kYearLengthLong),       //  Type F
                  @(kYearLengthLong),       //  Type G
                  @(kYearLengthShort),      //  Type H
                  @(kYearLengthShort),      //  Type I
                  @(kYearLengthShort),      //  Type J
                  @(kYearLengthRegular),    //  Type K
                  @(kYearLengthLong),       //  Type L
                  @(kYearLengthLong),       //  Type M
                  @(kYearLengthLong)        //  Type N
                  ];
    
    _leaps = @[@NO,     //  Type A
               @NO,     //  Type B
               @NO,     //  Type C
               @NO,     //  Type D
               @NO,     //  Type E
               @NO,     //  Type F
               @NO,     //  Type G
               @YES,    //  Type H
               @YES,    //  Type I
               @YES,    //  Type J
               @YES,    //  Type K
               @YES,    //  Type L
               @YES,    //  Type M
               @YES     //  Type N
               ];
    
    [self showParashaArrangementsForTestCases];    
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];

    [self setHebrewCalendar:nil];
    [self setYearsToTest:nil];
}

#pragma mark - NSCalendar+HebrewYearTypes

/* 
    
    Test sample data length:
    Ensure that we have 14 sets of sample data,
    else the tests will fail.
 
 */

- (void)testSampleDataLength
{
    
    NSInteger yearsCount = [[self yearsToTest] count];
    NSInteger lengthsCount = [[self lengths] count];
    NSInteger leapsCount = [[self leaps] count];
    NSInteger weekdaysCount = [[self weekdays] count];
    
    XCTAssertEqual(14, yearsCount, @"There are %i years", yearsCount);
    XCTAssertEqual(14, lengthsCount, @"There are %i lengths", lengthsCount);
    XCTAssertEqual(14, leapsCount, @"There are %i leaps", leapsCount);
    XCTAssertEqual(14, weekdaysCount, @"There are %i weekdays", weekdaysCount);
}

/* Rosh Hashana Weekday */

- (void)testWeekdayThatBeginsTheYear
{
    for (NSUInteger i = 0; i < 14; i++) {
        
        NSInteger hebrewYear = [[self yearsToTest][i] integerValue];
        kYearLength assumedDay = [[self weekdays][i] integerValue];
        
        NSDate *workingDate = [NSDate dateWithDay:1 Month:1 Year:hebrewYear andCalendar:[self hebrewCalendar]];
        
        kYearLength actualDay = [NSCalendar firstWeekdayOfHebrewYearContainingDate:workingDate];
        
        XCTAssertEqual(assumedDay, actualDay, @"[%i] Year: %i Actual Day: %i", i, hebrewYear, actualDay);
    }
}

/* Year Length */
- (void)testYearLengthForYear
{
    for (NSUInteger i = 0; i < 14; i++) {
        
        NSInteger hebrewYear = [[self yearsToTest][i] integerValue];
        kYearLength assumedLength = [[self lengths][i] integerValue];
        
        NSDate *workingDate = [NSDate dateWithDay:1 Month:1 Year:hebrewYear andCalendar:[self hebrewCalendar]];
        
        kYearLength actualLength = [NSCalendar lengthOfHebrewYearContainingDate:workingDate];
        
        XCTAssertEqual(assumedLength, actualLength, @"[%i] Year: %i Actual Length: %i", i, hebrewYear, actualLength);
    }
}

/* Leap Year */


- (void)testYearForLeaps
{
    for (NSUInteger i = 0; i < 14; i++) {
        
        NSInteger hebrewYear = [[self yearsToTest][i] integerValue];
        kYearLength assumedLeap = [[self leaps][i] integerValue];
        
        NSDate *workingDate = [NSDate dateWithDay:1 Month:1 Year:hebrewYear andCalendar:[self hebrewCalendar]];
        
        kYearLength actualLeap = [NSCalendar isHebrewYearContainingDateALeapYear:workingDate];
        
        XCTAssertEqual(assumedLeap, actualLeap, @"[%i] Year: %i Actual Leap: %i", i, hebrewYear, actualLeap);
    }
}

/* Year Type */

- (void)testYearTypes
{
    for (NSUInteger i = 0; i < 14; i++) {
        
        NSInteger hebrewYear = [[self yearsToTest][i] integerValue];
        kHebrewYearType assumedType = i;
        
        NSDate *workingDate = [NSDate dateWithDay:1 Month:2 Year:hebrewYear andCalendar:[self hebrewCalendar]];
        
        kYearLength actualType = [NSCalendar typeOfHebrewYearContainingDate:workingDate];
        
        XCTAssertEqual(assumedType, actualType, @"[%i] Year: %i Actual Type: %i", i, hebrewYear, actualType);
    }
}

/* Test Parashat Hashavua */
/*
- (void)testParasha
{
    
    NSDate *date = [NSDate date];
    
    // Parashat Hashavua
    
    ParashatHashavua *parasha = [ParashatHashavua new];
    [parasha setUseHebrewNames:NO];
    
    NSString *parashaInDiaspora = [parasha parashaForDate:date inDiaspora:YES];
    NSString *parashaInIsrael = [parasha parashaForDate:date inDiaspora:NO];
    
    NSLog(@"Diaspora: %@", parashaInDiaspora);
    NSLog(@"Israel: %@", parashaInIsrael);
}*/

#pragma mark - Test Data & Diagnostics

/*
 
 This method finds candidate test years for each type.
 
 */

- (void)generateTestCases
{
    NSMutableArray *testYears = [NSMutableArray new];
    
    //
    NSInteger yearType = 0;
    
    NSUInteger seedYear = 5660;     //  The hebrew year from which we'll start looking
    NSInteger seedOffset = 0;       //  The offset to try
    
    while (yearType < 14) {
        
        NSInteger hebrewYear = seedOffset + seedYear;
        NSDate *workingDate = [NSDate dateWithDay:1 Month:1 Year:hebrewYear andCalendar:[self hebrewCalendar]];
        
        kHebrewYearType type = [NSCalendar typeOfHebrewYearContainingDate:workingDate];
        
        if (type == yearType) {
            [testYears addObject:@(hebrewYear)];
            yearType++;
        }
        seedOffset++;
    }
    
    NSLog(@"Years: %@", testYears);
}


- (void)showDiagnosticData
{
    
    /* Prep a starting point, and a date starting on Rosh Hashana year of year one */
    
    NSInteger baseHebrewYear = 5773;
    
    NSDate *workingDate = [NSDate dateWithDay:1 Month:1 Year:1 andCalendar:[self hebrewCalendar]];
    
    /* Prep some date formatters */
    
    NSDateFormatter *weekdayFormatter = [NSDateFormatter new];
    [weekdayFormatter setCalendar:[self hebrewCalendar]];
    [weekdayFormatter setDateFormat:@"EEEE"];
    
    NSDateFormatter *monthFormatter = [NSDateFormatter new];
    [monthFormatter setCalendar:[self hebrewCalendar]];
    [monthFormatter setDateFormat:@"MMMM"];
    
    NSDateFormatter *gregorianFormatter = [NSDateFormatter new];
    [gregorianFormatter setCalendar:[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar]];
    [gregorianFormatter setDateStyle:NSDateFormatterLongStyle];
    
    /* Iterate each year... */
    
    for (NSUInteger year = baseHebrewYear-1 ; year < baseHebrewYear + 2; year++) {
        
        /* Print year information... */
        
        NSInteger workingHebrewYear = [[self hebrewCalendar] yearsInDate:workingDate];
        
        NSDate *roshHashana = [NSDate dateWithDay:1 Month:1 Year:workingHebrewYear andCalendar:[self hebrewCalendar]];
        NSDate *nextRoshHashana = [NSDate dateWithDay:1 Month:1 Year:workingHebrewYear+1 andCalendar:[self hebrewCalendar]];
        
        NSInteger daysPerYear = [[self hebrewCalendar] daysFromDate:roshHashana toDate:nextRoshHashana];
        
        BOOL isLeapYear = [[self hebrewCalendar] monthsPerYearUsingReferenceDate:workingDate] == 13;
        
        NSString *leapYearString = isLeapYear ? @"is" : @"is not";
        
        NSDate *pesach = [NSDate dateWithDay:15 Month:7 Year:workingHebrewYear andCalendar:[self hebrewCalendar]];
        
        NSString *weekdayOfRoshHashana = [weekdayFormatter stringFromDate:roshHashana];
        NSString *weekdayOfPesach = [weekdayFormatter stringFromDate:pesach];
        
        NSLog(@"\n\n\nYear %i has %i days and %@ a leap year. Rosh Hashana begins on %@. Pesach falls on %@. ", year, daysPerYear, leapYearString, weekdayOfRoshHashana, weekdayOfPesach);
        
        /* Log out some month stuff */
        
        NSUInteger monthsPerYear = [[self hebrewCalendar] monthsPerYearUsingReferenceDate:workingDate];
        
        for (NSUInteger i = 0; i < monthsPerYear; i++) {
            
            NSString *nameOfMonth = [monthFormatter stringFromDate:workingDate];
            
            NSString *weekDayOfMonth = [weekdayFormatter stringFromDate:workingDate];
            
            NSInteger daysPerMonth = [[self hebrewCalendar] daysPerMonthUsingReferenceDate:workingDate];
            
            
            NSLog(@"%@ has %i days and begins on a %@", nameOfMonth, daysPerMonth, weekDayOfMonth);
            
            
            workingDate = [[self hebrewCalendar] dateByAddingMonths:1 toDate:workingDate];
            
            
        }
    }
}

/* Iterate the 14 types of test years, and show the parasha arrangements */

- (void)showParashaArrangementsForTestCases
{
    
    for (NSInteger i = 0; i < 14; i++) {
        
        NSInteger hebrewYear = [[self yearsToTest][i] integerValue];
        NSDate *workingDate = [NSDate dateWithDay:1 Month:1 Year:hebrewYear andCalendar:[self hebrewCalendar]];
        kHebrewYearType type = [NSCalendar typeOfHebrewYearContainingDate:workingDate];
        
        KCParashatHashavuaCalculator *parasha = [KCParashatHashavuaCalculator new];
        NSArray *parshiot = [parasha parshiotInDiasporaDuringYearType:type];
        
        NSLog(@"Parshiot for %i (Type: %i): %@", hebrewYear, i+1, parshiot);
    }
    
}


@end
