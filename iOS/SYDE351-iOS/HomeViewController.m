//
//  HomeViewController.m
//  SYDE351-iOS
//
//  Created by Karan Thukral on 2015-07-08.
//  Copyright (c) 2015 karanthukral. All rights reserved.
//

#import "HomeViewController.h"
#import "DataCollectionViewCell.h"

@implementation HomeViewController
{
    UICollectionView *_collectionView;
    UICollectionViewFlowLayout *_layout;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _layout = [[UICollectionViewFlowLayout alloc] init];
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)- 50) collectionViewLayout:_layout];
    [_collectionView registerNib:[UINib nibWithNibName:@"DataCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"cell"];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _layout.itemSize = CGSizeMake(375, 280);
    _layout.sectionInset = UIEdgeInsetsMake(10, 0, 0, 0);
    _layout.minimumInteritemSpacing = 0;
    _layout.minimumLineSpacing = 50;
    _collectionView.backgroundColor = [UIColor colorWithHue:0 saturation:0 brightness:0.98 alpha:1];
    [self.view addSubview:_collectionView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DataCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    [cell setUpForFuelEconomy];
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}



@end
