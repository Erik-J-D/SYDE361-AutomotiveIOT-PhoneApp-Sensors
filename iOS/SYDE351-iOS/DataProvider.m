//
//  DataProvider.m
//  SYDE351-iOS
//
//  Created by Karan Thukral on 2015-07-08.
//  Copyright (c) 2015 karanthukral. All rights reserved.
//

#import "DataProvider.h"
#import <AFNetworking/AFNetworking.h>

@implementation DataProvider
{
    AFHTTPRequestOperationManager *_manager;
}

-(instancetype)init
{
    self = [super init];
    if (self) {
        _manager = [AFHTTPRequestOperationManager manager];
    }
    return self;
}

+ (DataProvider *)dataProvider
{
    static DataProvider * dataProvider = nil;
    if (!dataProvider) {
        dataProvider = [[super allocWithZone:nil] init];
    }
    return dataProvider;
}


@end
