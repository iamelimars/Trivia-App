//
//  QuizParamaters.m
//  Trivia-App
//
//  Created by iMac on 11/15/16.
//  Copyright © 2016 Marshall. All rights reserved.
//

#import "QuizParamaters.h"

@implementation QuizParamaters

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _numberOfQuestions = @"10";
        _category = @"";
        _difficulty = @"";
        _quizType = @"";
        
    }
    return self;
}

//Custom Initializer
-(instancetype)initWithNumberOfQuestions:(NSString *)numOfQuestions category:(NSString *)category difficulty:(NSString *)difficulty quizType:(NSString *)quizType
{
    self = [super init];
    if (self) {
        
        _numberOfQuestions = numOfQuestions;
        _category = category;
        _difficulty = difficulty;
        _quizType = quizType;
        
    }
    
    return self;
}

@end
