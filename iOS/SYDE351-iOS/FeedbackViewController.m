//
//  FeedbackViewController.m
//  SYDE351-iOS
//
//  Created by Karan Thukral on 2015-07-08.
//  Copyright (c) 2015 karanthukral. All rights reserved.
//

#import "FeedbackViewController.h"
#import "OBDJSONParser.h"
#import "Trip.h"
#import "AppDelegate.h"

@interface FeedbackViewController ()

@end

@implementation FeedbackViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationItem setTitle:@"Trip Stats"];
    [self addDummyDataToScreen];
    self.blunoManager = [DFBlunoManager sharedInstance];
    self.aryDevices = [[NSMutableArray alloc] init];
    self.blunoManager.delegate = self;
    [self createNewTrip];
}

- (void)createNewTrip
{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    Trip *newTrip = [[Trip alloc] initWithEntity:[NSEntityDescription entityForName:@"Trip" inManagedObjectContext:appDelegate.managedObjectContext] insertIntoManagedObjectContext:appDelegate.managedObjectContext];
    newTrip.when = [NSDate date];
    newTrip.isCurrent = @YES;
    [appDelegate saveContext];
}

#pragma mark - DFBlunoDelegate

- (void)bleDidUpdateState:(BOOL)bleSupported
{
    if(bleSupported)
    {
        [self.blunoManager scan];
    }
}

- (void)didDiscoverDevice:(DFBlunoDevice*)dev
{
    BOOL bRepeat = NO;
    for (DFBlunoDevice* bleDevice in self.aryDevices)
    {
        if ([bleDevice isEqual:dev])
        {
            bRepeat = YES;
            break;
        }
    }
    if (!bRepeat)
    {
        [self.aryDevices addObject:dev];
        [self.blunoManager connectToDevice:dev];
    }
}

- (void)readyToCommunicate:(DFBlunoDevice*)dev
{
    self.blunoDev = dev;
}

- (void)didDisconnectDevice:(DFBlunoDevice*)dev
{
    
}

- (void)didWriteData:(DFBlunoDevice*)dev
{
    
}

- (void)didReceiveData:(NSData*)data Device:(DFBlunoDevice*)dev
{
    [self updateUIForDictionary:[[OBDJSONParser OBDJSONParser] parseOBDData:data]];
}


#pragma mark - Helpers

- (void)updateUIForDictionary:(NSDictionary *)dictionary
{
    _speedLabel.text = [(NSNumber *)dictionary[@"Speed"] stringValue];
    _instantFuelEconomyLabel.text = [(NSNumber *)dictionary[@"InstantFuelEconomy"] stringValue];
    NSNumber *d2f = (NSNumber *)dictionary[@"DistanceInFront"];
    d2f = [NSNumber numberWithDouble:(d2f.doubleValue / 100.0)];
    _d2fLabel.text = [d2f stringValue];
    _tripDistanceLabel.text = [(NSNumber *)dictionary[@"TripDistance"] stringValue];
}

- (void)addDummyDataToScreen
{
    _speedLabel.text = @"100";
    _instantFuelEconomyLabel.text = @"12";
    _d2fLabel.text = @"5";
    _tripDistanceLabel.text = @"100";
}

- (IBAction)startScan:(id)sender {
    [self.blunoManager scan];
    self.blunoManager = [DFBlunoManager sharedInstance];
}
@end
