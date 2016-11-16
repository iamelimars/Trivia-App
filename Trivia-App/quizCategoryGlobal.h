//
//  quizCategoryGlobal.h
//  Trivia-App
//
//  Created by iMac on 11/15/16.
//  Copyright © 2016 Marshall. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface quizCategoryGlobal : NSObject
@property (nonatomic, strong) NSMutableArray *categories;
+(quizCategoryGlobal*)singleton;
@end
