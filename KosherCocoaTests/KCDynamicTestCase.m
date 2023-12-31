//
//  KCDynamicTestCase.m
//  KosherCocoaTests
//
//  Created by Moshe Berman on 12/29/23.
//  Copyright © 2023 Moshe Berman. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <KosherCocoa/KosherCocoa.h>
#import <objc/runtime.h>
#import "KosherCocoaTests-Swift.h"

typedef void(^TestCaseBlock)(void);

@interface KCDynamicTestCase : XCTestCase

@end

@implementation KCDynamicTestCase

+ (void)setUp
{

}


+ (void)addTestNamed:(NSString *)name withBlock:(TestCaseBlock)block {
    SEL selForTestCase = NSSelectorFromString(name);
    IMP implementation = imp_implementationWithBlock(^(id tc) {
        block();
    });

    class_addMethod(self, selForTestCase, implementation, "v:@");
}

+ (NSArray<NSInvocation *> *)testInvocations {
    NSMutableArray<NSInvocation *> *invocations = [NSMutableArray array];

    NSError *err = nil;
    NSArray<NSArray<NSString *> *> *tests = [TestsFromCSV loadTestsFrom:@"SunriseSunsetLakewoodNOAA" error:&err];
    if (!tests || err != nil) {
        XCTFail(@"Could not read tests from CSV. %@", err.localizedDescription);
    }
    NSArray <NSString *> *methods = tests[0];

    for (NSInteger testIdx = 1; testIdx > 0 && testIdx < tests.count; testIdx++) {
        NSArray<NSString *> *testCase = tests[testIdx];

        for (NSInteger methodIdx = 1; methodIdx < methods.count; methodIdx++) {
            NSString *methodName = methods[methodIdx];
            NSString *dateFormattedForSelector = [[testCase.firstObject stringByReplacingOccurrencesOfString:@"," withString:@""] stringByReplacingOccurrencesOfString:@" " withString:@"_"];
            NSString *selectorString = [NSString stringWithFormat:@"test%@%@", [methodName capitalizedString] , dateFormattedForSelector];

            [self addTestNamed:selectorString withBlock:^{
                // TODO: Call KosherCocoa in here!
            }];

            SEL selector = NSSelectorFromString(selectorString);
            NSMethodSignature *signature = [self instanceMethodSignatureForSelector:selector];
            NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
            invocation.selector = selector;

            [invocations addObject:invocation];

        }
    }

    return invocations;
}


@end
