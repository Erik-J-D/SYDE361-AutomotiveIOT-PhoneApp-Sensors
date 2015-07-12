//
//  FeedbackViewController.h
//  SYDE351-iOS
//
//  Created by Karan Thukral on 2015-07-08.
//  Copyright (c) 2015 karanthukral. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DFBlunoManager.h"

@interface FeedbackViewController : UIViewController <DFBlunoDelegate>

@property(strong, nonatomic) DFBlunoManager* blunoManager;
@property(strong, nonatomic) DFBlunoDevice* blunoDev;
@property(strong, nonatomic) NSMutableArray* aryDevices;
@property (weak, nonatomic) IBOutlet UILabel *speedLabel;
@property (weak, nonatomic) IBOutlet UILabel *d2fLabel;
@property (weak, nonatomic) IBOutlet UILabel *instantFuelEconomyLabel;
@property (weak, nonatomic) IBOutlet UILabel *tripDistanceLabel;

@end
