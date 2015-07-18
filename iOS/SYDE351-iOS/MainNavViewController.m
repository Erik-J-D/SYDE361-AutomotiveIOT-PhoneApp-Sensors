//
//  MainNavViewController.m
//  SYDE351-iOS
//
//  Created by Karan Thukral on 2015-07-08.
//  Copyright (c) 2015 karanthukral. All rights reserved.
//

#import "MainNavViewController.h"
#import "HomeViewController.h"
#import "FeedbackViewController.h"

@interface MainNavViewController ()

@end

@implementation MainNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViewControllers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupViewControllers {
    HomeViewController *home = [[HomeViewController alloc] init];\
    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:home];
    homeNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Home" image:nil selectedImage:nil];
    FeedbackViewController *feedback = [[FeedbackViewController alloc] initWithNibName:@"FeedbackViewController" bundle:[NSBundle mainBundle]];
     UINavigationController *feedbackNav = [[UINavigationController alloc] initWithRootViewController:feedback];
    feedbackNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Feedback" image:nil selectedImage:nil];
    self.viewControllers = @[homeNav, feedbackNav];
}

@end
