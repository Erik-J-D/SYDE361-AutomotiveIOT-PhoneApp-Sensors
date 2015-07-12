//
//  FuckUp.h
//  SYDE351-iOS
//
//  Created by Karan Thukral on 2015-07-08.
//  Copyright (c) 2015 karanthukral. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Trip;

@interface FuckUp : NSManagedObject

@property (nonatomic, retain) NSString * what;
@property (nonatomic, retain) NSDate * when;
@property (nonatomic, retain) NSNumber * lat;
@property (nonatomic, retain) NSNumber * longitude;
@property (nonatomic, retain) Trip *trip;

@end
