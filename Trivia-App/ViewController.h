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
#import "DGActivityIndicatorView.h"
#import "QuizParamaters.h"
#import "quizCategoryGlobal.h"

@interface ViewController : UIViewController<IGLDropDownMenuDelegate>

@property (nonatomic, retain) NSArray *questionsArray;
@property (nonatomic) NSURLSession *session;
@property (nonatomic, weak) NSDictionary *jsonDictionary;

//Custom Classes
@property (nonatomic) FetchQuiz *fetchQuiz;
@property (nonatomic, strong) QuizParamaters *quizParams;

@property (nonatomic, copy) NSArray *difficultyArray;
@property (nonatomic, copy) NSArray *categoriesArray;

@property (nonatomic, strong) IGLDropDownMenu *categoriesDropDownMenu;
@property (nonatomic, strong) IGLDropDownMenu *dropDownMenu;
@property (nonatomic, strong) IGLDropDownMenu *defaultDropDownMenu;

@property (nonatomic, strong) DGActivityIndicatorView *activityIndicatorView;

@property (weak, nonatomic) IBOutlet UIButton *startQuizButton;
- (IBAction)startQuizButtonPressed:(id)sender;

@end

