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
#import "MZFormSheetPresentationViewController.h"
#import "MZFormSheetPresentationViewControllerSegue.h"
#import "SettingsViewController.h"


@interface ViewController : UIViewController<IGLDropDownMenuDelegate, UIPickerViewDelegate, UIPickerViewDataSource>

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

@property (nonatomic, strong) UIView *customPickerView;
@property (nonatomic, strong) UIPickerView *pickerView;
//StartQuizButton
@property (weak, nonatomic) IBOutlet UIButton *startQuizButton;
- (IBAction)startQuizButtonPressed:(id)sender;

//CategoriesButton
@property (weak, nonatomic) IBOutlet UIButton *categoriesButton;
- (IBAction)categoriesButtonPressed:(id)sender;

//NumberOfQuestionsButton
@property (weak, nonatomic) IBOutlet UIView *numberOfQuestionsView;
@property (weak, nonatomic) IBOutlet UILabel *numberOfQuestionsLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberOfQuestionsNumberLabel;
@property (weak, nonatomic) IBOutlet UIButton *numbersAddButton;
- (IBAction)numbersAddButtonPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *numbersSubtractButton;
- (IBAction)numbersSubtractButtonPressed:(id)sender;
@property (nonatomic) int number;


//DifficultyButton
@property (weak, nonatomic) IBOutlet UIButton *difficultyButton;
- (IBAction)difficultyButtonPressed:(id)sender;

//QuizTypeButton
@property (weak, nonatomic) IBOutlet UIButton *quizTypeButton;
- (IBAction)quizTypeButtonPressed:(id)sender;



@end

