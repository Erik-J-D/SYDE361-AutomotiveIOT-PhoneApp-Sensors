//
//  MainNavViewController.m
//  SYDE351-iOS
//
//  Created by Karan Thukral on 2015-07-08.
//  Copyright (c) 2015 karanthukral. All rights reserved.
//

#import "MainNavViewController.h"
#import "HomeViewController.h"

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
    HomeViewController *home = [[HomeViewController alloc] init];
    home.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Home" image:nil selectedImage:nil];
    self.viewControllers = @[home];
}

@end
