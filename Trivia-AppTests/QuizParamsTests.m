//
//  QuizParamsTests.m
//  Trivia-App
//
//  Created by iMac on 11/16/16.
//  Copyright © 2016 Marshall. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "QuizParamaters.h"
#import "Constants.h"
#import "quizCategoryGlobal.h"

@interface QuizParamsTests : XCTestCase

@property QuizParamaters *quizParams;
@property QuizParamaters *customQuizParams;
@property QuizParamaters *constantsQuizParams;

@end

@implementation QuizParamsTests
@synthesize quizParams, customQuizParams, constantsQuizParams;

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    quizParams = [[QuizParamaters alloc] init];
    
    customQuizParams = [[QuizParamaters alloc]initWithNumberOfQuestions:@"20" category:@"Books" difficulty:@"easy" quizType:@"multiple"];
    
    constantsQuizParams = [[QuizParamaters alloc]initWithNumberOfQuestions:@"20" category:[quizCategoryGlobal singleton].categories[0] difficulty:DIFFICULTY_HARD quizType:QUIZ_TYPE_MULTIPLE];
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testQuizParamsInit {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSString *expectedString = @"10";

    
    XCTAssertEqualObjects(expectedString, quizParams.numberOfQuestions, @"Quiz params should equal 10");
    
}

- (void)testQuizParamsInitWithNumberOfQuestions {
    
    NSString *expectedNumberOfQuestions = @"20";
    NSString *expectedCategory = @"Books";
    NSString *expectedDifficulty = @"easy";
    NSString *expectedQuizType = @"multiple";
    
    XCTAssertEqualObjects(customQuizParams.numberOfQuestions, expectedNumberOfQuestions, @"Number of questons not equal to expected");
    XCTAssertEqualObjects(customQuizParams.category, expectedCategory, @"Category not equal to expected category");
    XCTAssertEqualObjects(customQuizParams.difficulty, expectedDifficulty, @"Difficulty not equal to expected difficulty");
    XCTAssertEqualObjects(customQuizParams.quizType, expectedQuizType, @"Quiz Type not equal to expected quiz type");
    
}

- (void)testQuizParamsInitWithNumberOfQuestionsUsingConstants {
    
    NSString *expectedNumberOfQuestions = @"20";
    NSString *expectedCategory = [quizCategoryGlobal singleton].categories[0];
    NSString *expectedDifficulty = DIFFICULTY_HARD;
    NSString *expectedQuizType = QUIZ_TYPE_MULTIPLE;
    
    XCTAssertEqualObjects(constantsQuizParams.numberOfQuestions, expectedNumberOfQuestions, @"Number of questons not equal to expected");
    XCTAssertEqualObjects(constantsQuizParams.category, expectedCategory, @"Category not equal to expected category");
    XCTAssertEqualObjects(constantsQuizParams.difficulty, expectedDifficulty, @"Difficulty not equal to expected difficulty");
    XCTAssertEqualObjects(constantsQuizParams.quizType, expectedQuizType, @"Quiz Type not equal to expected quiz type");
    
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
