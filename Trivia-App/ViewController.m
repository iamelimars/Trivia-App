//
//  ViewController.m
//  Trivia-App
//
//  Created by iMac on 11/7/16.
//  Copyright © 2016 Marshall. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.questionsArray = [[NSArray alloc]init];
    
    self.fetchQuiz = [[FetchQuiz alloc]init];
    
    //Questions *question = [[Questions alloc]init];
    //question.category = @"General Knowledge";
    //[_questionsArray addObject:question];

    
    //Questions *myQuestion = [[Questions alloc]init];
    //myQuestion = _questionsArray[0];
    //NSLog(@"Array Category  %@", myQuestion.category);
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    self.session = [NSURLSession sessionWithConfiguration:config delegate:nil delegateQueue:nil];
    
    [self.fetchQuiz fetchFeedwithAmount:12 category:9 difficulty:DIFFICULTY_MEDIUM questionType:QUIZ_TYPE_MULTIPLE session:self.session completion:^(NSDictionary *responseDict) {
        
        self.questionsArray = [self.fetchQuiz parseJsonWithDictionary:responseDict];
        
    }];
    
}


@end
