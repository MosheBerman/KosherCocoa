//
//  DynamicTestCase.h
//  DynamicTests
//
//  Created by Moshe Berman on 12/31/23.
//

#ifndef DynamicTestCase_h
#define DynamicTestCase_h

#import <XCTest/XCTest.h>

/// A typedef for a block that neither accepts nor returns arguments.
typedef void(^TestBodyBlock)(void);


/// A class that can generate test cases at runtime.
@interface DynamicTestCase : XCTestCase

/// Override the implementation of this class method to define your custom tests.
/// Return a dictionary with the tests represented as blocks.
/// The name of each test is the dictionary key for the block.
+ (NSDictionary <NSString *, TestBodyBlock> *) dynamicTests;

@end

#endif /* DynamicTestCase_h */
