//
//  OBDJSONParser.h
//  SYDE351-iOS
//
//  Created by Karan Thukral on 2015-07-12.
//  Copyright (c) 2015 karanthukral. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OBDJSONParser : NSObject

+ (OBDJSONParser *)OBDJSONParser;
- (NSDictionary *)parseOBDData:(NSData *)data;

@end
