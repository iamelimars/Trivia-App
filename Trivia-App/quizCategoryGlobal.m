//
//  quizCategoryGlobal.m
//  Trivia-App
//
//  Created by iMac on 11/15/16.
//  Copyright © 2016 Marshall. All rights reserved.
//

#import "quizCategoryGlobal.h"

@implementation quizCategoryGlobal
@synthesize categories;

+(quizCategoryGlobal *)singleton {
    static quizCategoryGlobal *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[quizCategoryGlobal alloc]init];
        shared.categories = [[NSMutableArray alloc]initWithObjects:
                             @"General Knowledge",
                             @"Books",
                             @"Films",
                             @"Music",
                             @"Musicals & Theaters",
                             @"Television",
                             @"Video Games",
                             @"Board Games",
                             @"Science & Nature",
                             @"Science & Computers",
                             @"Science & Mathematics",
                             @"Mythology",
                             @"Sports",
                             @"Geography",
                             @"History",
                             @"Politics",
                             @"Art",
                             @"Celebrities",
                             @"Animals",
                             @"Vehicles",
                             @"Comics",
                             @"Gadgets",
                             @"Japanese Anime",
                             @"Cartoon & Animations",
                             nil];
    });
    
    return shared;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        
    }
    return self;
}
@end
