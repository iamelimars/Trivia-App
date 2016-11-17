//
//  QuizCategoryGlobalTests.m
//  Trivia-App
//
//  Created by iMac on 11/16/16.
//  Copyright © 2016 Marshall. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "quizCategoryGlobal.h"

@interface QuizCategoryGlobalTests : XCTestCase

@end

@implementation QuizCategoryGlobalTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testQuizCategorySingleton {
    
    NSString *expectedSingletonObject = @"Television";
    NSString *singletonObject = [quizCategoryGlobal singleton].categories[5];
    
    XCTAssertEqualObjects(expectedSingletonObject, singletonObject);
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
