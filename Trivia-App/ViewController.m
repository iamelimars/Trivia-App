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
    
    self.questionsArray = [[NSArray alloc]init];
    
    self.fetchQuiz = [[FetchQuiz alloc]init];
    
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    self.session = [NSURLSession sessionWithConfiguration:config delegate:nil delegateQueue:nil];
    
    [self.fetchQuiz fetchFeedwithAmount:12 category:9 difficulty:DIFFICULTY_MEDIUM questionType:QUIZ_TYPE_MULTIPLE session:self.session completion:^(NSDictionary *responseDict) {
        
        self.questionsArray = [self.fetchQuiz parseJsonWithDictionary:responseDict];
        Questions *question = [[Questions alloc]init];
        question = self.questionsArray[0];
        NSLog(@"%@", question.category);
    }];
    
    
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
    [self.defaultDropDownMenu setFrame:CGRectMake(60, 140, 200, 45)];
    self.defaultDropDownMenu.delegate = self;
    
    [self.view addSubview:self.defaultDropDownMenu];
    
    [self.defaultDropDownMenu reloadView];
    
}

#pragma mark - IGLDropDownMenuDelegate

- (void)dropDownMenu:(IGLDropDownMenu *)dropDownMenu selectedItemAtIndex:(NSInteger)index
{
    if (self.defaultDropDownMenu) {
        IGLDropDownItem *item = dropDownMenu.dropDownItems[index];
        NSLog(@"Selected: %@", item.text);
    } else {
        NSLog(@"Selected: ");
    }
}


@end
