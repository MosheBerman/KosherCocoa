//
//  DynamicTestCase.m
//  DynamicTestCase
//
//  Created by Moshe Berman on 12/29/23.
//  Copyright © 2023 Moshe Berman. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <objc/runtime.h>

#import "DynamicTestCase.h"

@implementation DynamicTestCase


/// Registers a block as a method for the supplied name.
/// - Parameters:
///   - name: The name of the new method.
///   - block: The block that represents the body of the method.
+ (void)addMethodNamed:(NSString *)name usingBlock:(void(^)(void))block {
    SEL selForTestCase = NSSelectorFromString(name);
    IMP implementation = imp_implementationWithBlock(^(id tc) {
        block();
    });

    class_addMethod(self, selForTestCase, implementation, "v:@");
}


/// Converts a string into an invocation that points to a method.
/// - Parameter selectorString: The string representation of the selector.
+ (NSInvocation *)invocationFromSelectorNamed:(NSString *)selectorString {
    SEL selector = NSSelectorFromString(selectorString);
    NSMethodSignature *signature = [self instanceMethodSignatureForSelector:selector];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    invocation.selector = selector;
    return invocation;
}


/// Overrides XCTestCase's class method.
/// This implementation iterates a dictionary produced by`dynamicTests`and transforms it into test
/// invocations.
+ (NSArray<NSInvocation *> *)testInvocations {
    NSMutableArray<NSInvocation *> *invocations = [NSMutableArray array];
    for (NSString *key in self.dynamicTests) {
        [self addMethodNamed:key usingBlock:self.dynamicTests[key]];
        [invocations addObject:[self invocationFromSelectorNamed:key]];
    }

    return [invocations arrayByAddingObjectsFromArray:super.testInvocations];
}

/// Provides a hook for generating tests at runtime.
/// - Returns `NSDictionary<NSString *, void(^)(void)> *` a dictionary where the keys are selector names and the values are blocks.
/// Each block is a test case.
+ (NSDictionary <NSString *, TestBodyBlock> *) dynamicTests {
    return @{
        @"testThatDefaultTestFailsUnlessOverridden":^{
            NSString *reason = [NSString stringWithFormat:@"You must override `%@` in a subclass.", NSStringFromSelector(_cmd)];
            XCTExpectFailure(reason);
            XCTFail(@"%@", reason);
        },
        @"passingTest": ^{
            XCTAssertTrue(YES);
        }
    };
}

@end
