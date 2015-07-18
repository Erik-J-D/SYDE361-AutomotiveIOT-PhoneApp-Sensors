//
//  FeedbackManager.h
//  SYDE351-iOS
//
//  Created by Karan Thukral on 2015-07-18.
//  Copyright (c) 2015 karanthukral. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FeedbackManager : NSObject

+ (FeedbackManager *)feedbackManager;
- (void)giveFeedbackForFuckUp:(NSString *)fuckUp;

@end
