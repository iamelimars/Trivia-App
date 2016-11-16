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
    
    NSLog(@"%@", [quizCategoryGlobal singleton].categories[0]);
    
    self.questionsArray = [[NSArray alloc]init];
    
    
    self.fetchQuiz = [[FetchQuiz alloc]init];
    self.quizParams = [[QuizParamaters alloc]init];
    NSLog(@"Number of questions:  %@", self.quizParams.numberOfQuestions);
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    self.session = [NSURLSession sessionWithConfiguration:config delegate:nil delegateQueue:nil];
    
    
    self.activityIndicatorView = [[DGActivityIndicatorView alloc]initWithType:DGActivityIndicatorAnimationTypeBallPulse tintColor:[UIColor whiteColor]];
    self.activityIndicatorView.frame = CGRectMake((self.view.frame.size.width / 2) - 25, (self.view.frame.size.height) * .75, 50.0, 50.0);
    
    [self difficultyDropDown];
    [self categoryDropDown];
    
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

-(void)categoryDropDown {
    NSArray *categoriesArr = [[NSMutableArray alloc]init];
    categoriesArr = [[quizCategoryGlobal singleton] categories];
    
    NSMutableArray *dropdownItems = [[NSMutableArray alloc] init];
    for (int i = 0; i < categoriesArr.count; i++) {
        
        IGLDropDownItem *item = [[IGLDropDownItem alloc] init];
        [item setText:categoriesArr[i]];
        [dropdownItems addObject:item];
        
    }
    
    self.categoriesDropDownMenu = [[IGLDropDownMenu alloc]init];
    self.categoriesDropDownMenu.menuText = @"Category";
    self.categoriesDropDownMenu.dropDownItems = dropdownItems;
    self.categoriesDropDownMenu.paddingLeft = 15;
    [self.categoriesDropDownMenu setFrame:CGRectMake(8, 200, self.view.frame.size.width - 16, 45)];
    self.categoriesDropDownMenu.delegate = self;
    
    [self.view addSubview:self.categoriesDropDownMenu];
    
    [self.categoriesDropDownMenu reloadView];
    
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
@end
