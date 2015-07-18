//
//  FeedbackManager.m
//  SYDE351-iOS
//
//  Created by Karan Thukral on 2015-07-18.
//  Copyright (c) 2015 karanthukral. All rights reserved.
//

#import "FeedbackManager.h"
#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>

@implementation FeedbackManager

-(instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

+ (FeedbackManager *)feedbackManager
{
    static FeedbackManager * feedbackManager = nil;
    if (!feedbackManager) {
        feedbackManager = [[super allocWithZone:nil] init];
    }
    return feedbackManager;
}

- (void)giveFeedbackForFuckUp:(NSString *)fuckUp
{
    AVSpeechSynthesizer *speechSynthesizer = [AVSpeechSynthesizer new];
    NSString *whatToSay = @"";
    if ([fuckUp isEqualToString:@"speeding"]) {
        whatToSay = @"You are over the speed limit. Please slow down.";
    } else if([fuckUp isEqualToString:@"tailgaiting"]) {
        whatToSay = @"You are following the car in front too closely. Please keep more distance to ensure your safety.";
    } else if([fuckUp isEqualToString:@"hardAccel"]) {
        whatToSay = @"You are accelerating too fast. This will increase fuel consumption.";
    } else if([fuckUp isEqualToString:@"hardBreak"]) {
        whatToSay = @"You are breaking too fast. This will increase fuel consumption and is unsafe.";
    }
    AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc] initWithString:whatToSay];
    [utterance setVoice:[AVSpeechSynthesisVoice voiceWithLanguage:@"en-CA"]];
    utterance.rate = 0.3;
    [speechSynthesizer speakUtterance:utterance];
    [self sendLocalNotification:whatToSay];
}

- (void)sendLocalNotification:(NSString *)notification
{
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    localNotification.alertBody = notification;
    [[UIApplication sharedApplication] presentLocalNotificationNow:localNotification];
}


@end
