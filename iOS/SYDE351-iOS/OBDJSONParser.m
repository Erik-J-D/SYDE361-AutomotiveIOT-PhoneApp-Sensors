//
//  OBDJSONParser.m
//  SYDE351-iOS
//
//  Created by Karan Thukral on 2015-07-12.
//  Copyright (c) 2015 karanthukral. All rights reserved.
//

#import "OBDJSONParser.h"

@implementation OBDJSONParser

-(instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

+ (OBDJSONParser *)OBDJSONParser
{
    static OBDJSONParser * OBDJSONParser = nil;
    if (!OBDJSONParser) {
        OBDJSONParser = [[super allocWithZone:nil] init];
    }
    return OBDJSONParser;
}

- (NSDictionary *)parseOBDData:(NSData *)data
{
    NSError *jsonError;
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&jsonError];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        [self checkIfNewFuckUp:dictionary];
    });
    return dictionary;
}

- (void)checkIfNewFuckUp:(NSDictionary *)dictionary
{
    
}

@end
