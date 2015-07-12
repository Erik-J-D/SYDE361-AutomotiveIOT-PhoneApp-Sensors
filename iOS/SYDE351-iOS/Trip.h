//
//  Trip.h
//  SYDE351-iOS
//
//  Created by Karan Thukral on 2015-07-08.
//  Copyright (c) 2015 karanthukral. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class FuckUp;

@interface Trip : NSManagedObject

@property (nonatomic, retain) NSDate * when;
@property (nonatomic, retain) NSMutableArray * fuelEconomies;
@property (nonatomic, retain) NSNumber * isCurrent;
@property (nonatomic, retain) FuckUp *fuckUps;

@end
