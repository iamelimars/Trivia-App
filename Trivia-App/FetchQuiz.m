//
//  fetchQuiz.m
//  Trivia-App
//
//  Created by iMac on 11/8/16.
//  Copyright © 2016 Marshall. All rights reserved.
//

#import "FetchQuiz.h"

@implementation FetchQuiz

-(void)fetchFeedwithAmount:(int)amount category:(int)category difficulty:(NSString *)difficulty questionType:(NSString *)type session:(NSURLSession *)session completion:(void (^)(NSDictionary *))completion{
    NSString *requestString = [NSString stringWithFormat:@"https://opentdb.com/api.php?amount=%d&category=%d&difficulty=%@&type=%@", amount, category, difficulty, type];
    
    //NSString *requestString = @"https://opentdb.com/api.php?amount=10&category=9&difficulty=medium&type=multiple";
    NSURL *url = [NSURL URLWithString:requestString];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:req completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (error) {
            
            NSLog(@"Error loading Json: %@", error.localizedDescription);
            return;
        }
        
        NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        if (jsonObject) {
            
            completion(jsonObject);
            NSLog(@"json serialized");
            
        } else {
            
            NSLog(@"error serializing json");
            
        }
    }];
    
    [dataTask resume];
}

-(NSArray *)parseJsonWithDictionary:(NSDictionary *)json {
    questionsArray = [[NSMutableArray alloc]init];
    
    if (json == nil) {
        NSLog(@"no Json passed");
    }
    
    NSArray *results = [json objectForKey:@"results"];
    
    for (NSDictionary *questionItems in results) {
        
        Questions *question = [[Questions alloc]init];
        question.category = [questionItems objectForKey:@"category"];
        question.type = [questionItems objectForKey:@"type"];
        question.difficulty = [questionItems objectForKey:@"difficulty"];
        question.question = [questionItems objectForKey:@"question"];
        question.correctAnswer = [questionItems objectForKey:@"correct_answer"];
        
        NSArray *incorrectAns = [questionItems objectForKey:@"incorrect_answers"];
        question.incorrectAnswers1 = incorrectAns[0];
        question.incorrectAnswers2 = incorrectAns[1];
        question.incorrectAnswers3 = incorrectAns[2];
        
        [questionsArray addObject:question];
        
        
    }
    
    NSLog(@"%lu", (unsigned long)questionsArray.count);
    return questionsArray;
}

@end
