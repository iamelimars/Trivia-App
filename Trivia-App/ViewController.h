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
#import "IGLDropdownMenu.h"

@interface ViewController : UIViewController<IGLDropDownMenuDelegate>

@property (nonatomic, retain) NSArray *questionsArray;
@property (nonatomic) NSURLSession *session;
@property (nonatomic, weak) NSDictionary *jsonDictionary;

@property (nonatomic) FetchQuiz *fetchQuiz;

@property (nonatomic, copy) NSArray *difficultyArray;
@property (nonatomic, strong) IGLDropDownMenu *dropDownMenu;
@property (nonatomic, strong) IGLDropDownMenu *defaultDropDownMenu;

@end

