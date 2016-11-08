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
    
    //[self fetchFeedwithAmount:10 category:9 difficulty:@"medium" questionType:@"multiple"];
    
    //NSDictionary *jsonData = [[NSDictionary alloc]init];
    [self.fetchQuiz fetchFeedwithAmount:12 category:9 difficulty:@"medium" questionType:@"multiple" session:self.session completion:^(NSDictionary *responseDict) {
        
        self.questionsArray = [self.fetchQuiz parseJsonWithDictionary:responseDict];
        
    }];
    
    //NSLog(@"%lu", (unsigned long)self.questionsArray.count);
    //[self.fetchQuiz fetchFeedwithAmount:12 category:9 difficulty:@"medium" questionType:@"multiple" session:self.session];
}

//-(void)fetchFeedwithAmount:(int)amount category:(int)category difficulty:(NSString *)difficulty questionType:(NSString *)type {
//    
//    NSString *requestString = @"https://opentdb.com/api.php?amount=10&category=9&difficulty=medium&type=multiple";
//    NSURL *url = [NSURL URLWithString:requestString];
//    NSURLRequest *req = [NSURLRequest requestWithURL:url];
//    NSURLSessionDataTask *dataTask = [self.session dataTaskWithRequest:req completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//        
//        if (error) {
//            
//            NSLog(@"Error loading Json");
//            return;
//        }
//        
//        NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
//        if (jsonObject) {
//        
//            [self parseJsonWithDictionary:jsonObject];
//            
//        }
//        
//    }];
//    
//    [dataTask resume];
//}
//
//-(void)parseJsonWithDictionary:(NSDictionary *)json {
//    
//    
//    NSArray *results = [json objectForKey:@"results"];
//
//    for (NSDictionary *questionItems in results) {
//        
//        Questions *question = [[Questions alloc]init];
//        question.category = [questionItems objectForKey:@"category"];
//        question.type = [questionItems objectForKey:@"type"];
//        question.difficulty = [questionItems objectForKey:@"difficulty"];
//        question.question = [questionItems objectForKey:@"question"];
//        question.correctAnswer = [questionItems objectForKey:@"correct_answer"];
//        
//        NSArray *incorrectAns = [questionItems objectForKey:@"incorrect_answers"];
//        question.incorrectAnswers1 = incorrectAns[0];
//        question.incorrectAnswers2 = incorrectAns[1];
//        question.incorrectAnswers3 = incorrectAns[2];
//        
//        [self.questionsArray addObject:question];
//        
//        NSLog(@"%lu", (unsigned long)self.questionsArray.count);
//
//    }
//    
//    
//    //        NSLog(@"%@", question.category);
//    //        NSLog(@"%@", question.type);
//    //        NSLog(@"%@", question.difficulty);
//    //        NSLog(@"%@", question.question);
//    //        NSLog(@"%@", question.correctAnswer);
////    NSLog(@"%@", question.incorrectAnswers[0]);
////    NSLog(@"%@", question.incorrectAnswers[1]);
////    NSLog(@"%@", question.incorrectAnswers[2]);
//    
//}


@end
