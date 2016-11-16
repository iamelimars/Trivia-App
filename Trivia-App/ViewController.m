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
@synthesize customPickerView, pickerView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.categoriesArray = [[NSArray alloc]init];
    self.categoriesArray = [[quizCategoryGlobal singleton] categories];
    
    NSLog(@"%@", [quizCategoryGlobal singleton].categories[0]);
    
    self.questionsArray = [[NSArray alloc]init];
    
    
    self.fetchQuiz = [[FetchQuiz alloc]init];
    self.quizParams = [[QuizParamaters alloc]init];
    NSLog(@"Number of questions:  %@", self.quizParams.numberOfQuestions);
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    self.session = [NSURLSession sessionWithConfiguration:config delegate:nil delegateQueue:nil];
    
    
    self.activityIndicatorView = [[DGActivityIndicatorView alloc]initWithType:DGActivityIndicatorAnimationTypeBallPulse tintColor:[UIColor whiteColor]];
    self.activityIndicatorView.frame = CGRectMake((self.view.frame.size.width / 2) - 25, (self.view.frame.size.height) * .75, 50.0, 50.0);
    
    //[self difficultyDropDown];
    //[self categoryDropDown];
    //[self presentCustomPickerView];
}

#pragma mark - IGLDropDownMenuSetup

-(void)difficultyDropDown {
    
    //Drop down menu setup
    self.dropDownMenu = self.defaultDropDownMenu;
    self.difficultyArray = @[@{@"Difficulty": @"Any"},@{@"Difficulty": @"Easy"}, @{@"Difficulty": @"Medium"}, @{@"Difficulty": @"Hard"}];
    
    NSMutableArray *dropdownItems = [[NSMutableArray alloc] init];
    for (int i = 0; i < self.difficultyArray.count; i++) {
        NSDictionary *dict = self.difficultyArray[i];
        
        IGLDropDownItem *item = [[IGLDropDownItem alloc] init];
        [item setText:dict[@"Difficulty"]];
        [dropdownItems addObject:item];
    }
    
    self.defaultDropDownMenu = [[IGLDropDownMenu alloc] init];
    self.defaultDropDownMenu.menuText = @"Difficulty";
    self.defaultDropDownMenu.dropDownItems = dropdownItems;
    self.defaultDropDownMenu.paddingLeft = 15;
    [self.defaultDropDownMenu setFrame:CGRectMake(8, 140, self.view.frame.size.width - 16, 45)];
    self.defaultDropDownMenu.delegate = self;
    
    [self.view addSubview:self.defaultDropDownMenu];
    
    [self.defaultDropDownMenu reloadView];

}

-(void)presentCustomPickerView {
    
    UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    [toolBar setBarStyle:UIBarStyleBlack];
    toolBar.barTintColor = [UIColor colorWithRed:227/255.0 green:90/255.0 blue:102/255.0 alpha:1.0];
    UIBarButtonItem *barButtonDone = [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(hideCustomPickerView)];
    [barButtonDone setTitleTextAttributes:@{
                                         NSFontAttributeName: [UIFont fontWithName:@"Avenir-Light" size:16.0]                                         } forState:UIControlStateNormal];
    toolBar.items = @[barButtonDone];
    barButtonDone.tintColor = [UIColor whiteColor];
    
    
    customPickerView = [[UIView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, 0)];
    pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 0, customPickerView.frame.size.width, customPickerView.frame.size.height)];
    [pickerView setDelegate:self];
    [pickerView setDataSource:self];
    pickerView.showsSelectionIndicator = YES;
    [pickerView selectRow:2 inComponent:0 animated:YES];
    
    [customPickerView addSubview:toolBar];
    [customPickerView addSubview:pickerView];
    pickerView.tintColor = [UIColor whiteColor];
    
    
    customPickerView.backgroundColor = [UIColor colorWithRed:227/255.0 green:90/255.0 blue:102/255.0 alpha:1.0];
    [self.view addSubview:customPickerView];
    
    [UIView transitionWithView:customPickerView duration:1.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        customPickerView.frame = CGRectMake(0, self.view.frame.size.height * .60, self.view.frame.size.width, self.view.frame.size.height * .40);
        pickerView.frame = CGRectMake(0, 44, self.view.frame.size.width, (self.view.frame.size.height * .40)-44);
        
    } completion:^(BOOL finished) {
        
        
    }];
    
}

-(void)hideCustomPickerView {
    
    [UIView transitionWithView:customPickerView duration:1.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        customPickerView.frame = CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, 0);
        pickerView.frame = CGRectMake(0, 0, customPickerView.frame.size.width, customPickerView.frame.size.height);
        
    } completion:^(BOOL finished) {
        
        
    }];
    
}
#pragma mark - PickerViewDelegate/Datasource

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return 1;
    
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    return self.categoriesArray.count;
    
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel* tView = (UILabel*)view;
    if (!tView)
    {
        tView = [[UILabel alloc] init];
        [tView setFont:[UIFont fontWithName:@"Avenir-Light" size:20]];
        tView.textColor = [UIColor whiteColor];
        tView.textAlignment = NSTextAlignmentCenter;
        tView.numberOfLines=3;
    }
    // Fill the label text here
    tView.text=[self.categoriesArray objectAtIndex:row];
    return tView;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    NSLog(@"%@", self.categoriesArray[row]);
    
}


#pragma mark - IGLDropDownMenuDelegate

- (void)dropDownMenu:(IGLDropDownMenu *)dropDownMenu selectedItemAtIndex:(NSInteger)index
{
    if (self.defaultDropDownMenu) {
        //IGLDropDownItem *item = dropDownMenu.dropDownItems[index];
        switch (index) {
            case 0:
                self.quizParams.difficulty = @"";
                break;
            case 1:
                self.quizParams.difficulty = DIFFICULTY_EASY;
                break;
            case 2:
                self.quizParams.difficulty = DIFFICULTY_MEDIUM;
                break;
            case 3:
                self.quizParams.difficulty = DIFFICULTY_HARD;
                break;
            default:
                break;
        }
        
        NSLog(@"Selected: %@", self.quizParams.difficulty);
    } else {
        //NSLog(@"Selected: ");
    }
}


- (IBAction)startQuizButtonPressed:(id)sender {
    
    [self.view bringSubviewToFront:self.startQuizButton];
    
    //Start animation
    
    [self.startQuizButton addSubview:self.activityIndicatorView];
    
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    dispatch_queue_t jsonQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
        [UIView transitionWithView:self.startQuizButton duration:1 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
            
            [self.startQuizButton setTitle:@"Generating Quiz" forState:UIControlStateNormal];
            
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:1.0 animations:^{
                
                self.startQuizButton.frame = self.view.frame;
                
            } completion:^(BOOL finished) {
                
                [self.activityIndicatorView startAnimating];
                
                
                //Fetching Quiz
                dispatch_async(jsonQueue, ^{
                    
                    [self.fetchQuiz fetchFeedwithAmount:12 category:9 difficulty:DIFFICULTY_MEDIUM questionType:QUIZ_TYPE_MULTIPLE session:self.session completion:^(NSDictionary *responseDict) {
                        self.questionsArray = [self.fetchQuiz parseJsonWithDictionary:responseDict];
                        Questions *question = [[Questions alloc]init];
                        question = self.questionsArray[0];
                        NSLog(@"%@", question.category);
                        dispatch_async(mainQueue, ^{
                            [self.activityIndicatorView stopAnimating];
                        });
                    }];
                });
            }];
        }];
}
- (IBAction)categoriesButtonPressed:(id)sender {
    
    [self presentCustomPickerView];
    
}
@end
