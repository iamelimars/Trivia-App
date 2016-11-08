//
//  Questions.h
//  Trivia-App
//
//  Created by iMac on 11/7/16.
//  Copyright © 2016 Marshall. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Questions : NSObject

@property NSString *category;
@property NSString *type;
@property NSString *difficulty;
@property NSString *question;
@property NSString *correctAnswer;
@property NSString *incorrectAnswers1;
@property NSString *incorrectAnswers2;
@property NSString *incorrectAnswers3;

@end
