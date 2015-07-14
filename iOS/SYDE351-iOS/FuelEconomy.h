//
//  FuelEconomy.h
//  SYDE351-iOS
//
//  Created by Karan Thukral on 2015-07-12.
//  Copyright (c) 2015 karanthukral. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Trip;

@interface FuelEconomy : NSManagedObject

@property (nonatomic, retain) NSNumber * value;
@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) Trip *trip;

@end
