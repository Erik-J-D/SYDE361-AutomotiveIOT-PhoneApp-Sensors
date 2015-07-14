//
//  Trip.h
//  SYDE351-iOS
//
//  Created by Karan Thukral on 2015-07-12.
//  Copyright (c) 2015 karanthukral. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class FuckUp, FuelEconomy;

@interface Trip : NSManagedObject

@property (nonatomic, retain) NSNumber * isCurrent;
@property (nonatomic, retain) NSDate * when;
@property (nonatomic, retain) NSSet *fuckUps;
@property (nonatomic, retain) NSSet *fuelEconomies;
@end

@interface Trip (CoreDataGeneratedAccessors)

- (void)addFuckUpsObject:(FuckUp *)value;
- (void)removeFuckUpsObject:(FuckUp *)value;
- (void)addFuckUps:(NSSet *)values;
- (void)removeFuckUps:(NSSet *)values;

- (void)addFuelEconomiesObject:(FuelEconomy *)value;
- (void)removeFuelEconomiesObject:(FuelEconomy *)value;
- (void)addFuelEconomies:(NSSet *)values;
- (void)removeFuelEconomies:(NSSet *)values;

@end
