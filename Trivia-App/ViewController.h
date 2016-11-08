//
//  ViewController.h
//  Trivia-App
//
//  Created by iMac on 11/7/16.
//  Copyright © 2016 Marshall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Questions.h"
#import "fetchQuiz.h"
#import "Constants.h"

@interface ViewController : UIViewController

@property (nonatomic, retain) NSArray *questionsArray;
@property (nonatomic) NSURLSession *session;
@property (nonatomic, weak) NSDictionary *jsonDictionary;

@property (nonatomic) FetchQuiz *fetchQuiz;

@end

