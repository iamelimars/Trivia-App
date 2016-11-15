//
//  QuizParamaters.h
//  Trivia-App
//
//  Created by iMac on 11/15/16.
//  Copyright © 2016 Marshall. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuizParamaters : NSObject

@property (nonatomic) NSString *numberOfQuestions;
@property (nonatomic) NSString *category;
@property (nonatomic) NSString *difficulty;
@property (nonatomic) NSString *quizType; //Multiple Choice or True/False

@end
