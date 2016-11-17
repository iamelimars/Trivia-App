//
//  FetchQuizTests.m
//  Trivia-App
//
//  Created by iMac on 11/16/16.
//  Copyright © 2016 Marshall. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FetchQuiz.h"
#import "Questions.h"
//#import "Constants.h"

@interface FetchQuizTests : XCTestCase

@property NSArray *questionsArray;
@property FetchQuiz *fetchQuiz;
@property NSURLSession *session;

@end

@implementation FetchQuizTests

@synthesize questionsArray, fetchQuiz, session;

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    questionsArray = [[NSArray alloc]init];
    fetchQuiz = [[FetchQuiz alloc]init];
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    session = [NSURLSession sessionWithConfiguration:config delegate:nil delegateQueue:nil];

}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testFetchQuiz {
    
    
    
    [self.fetchQuiz fetchFeedwithAmount:15 category:9 difficulty:@"hard" questionType:@"multiple" session:session completion:^(NSDictionary *responseDictionary) {
        
        questionsArray = [self.fetchQuiz parseJsonWithDictionary:responseDictionary];
        Questions *question = [[Questions alloc]init];
        question = questionsArray[0];
        XCTAssertNotNil(questionsArray);
        
    }];
    
    
    
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
