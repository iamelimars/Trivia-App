//
//  fetchQuiz.h
//  Trivia-App
//
//  Created by iMac on 11/8/16.
//  Copyright © 2016 Marshall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Questions.h"



@interface FetchQuiz : NSObject {
    
    NSMutableArray *questionsArray;
    
}

-(void)fetchFeedwithAmount:(int)amount category:(int)category difficulty:(NSString *)difficulty questionType:(NSString *)type session:(NSURLSession *)session completion:(void (^)(NSDictionary *))completion;

-(NSArray *)parseJsonWithDictionary:(NSDictionary *)json;

@end
