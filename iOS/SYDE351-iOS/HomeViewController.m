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
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:_layout];
    [_collectionView registerNib:[UINib nibWithNibName:@"DataCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"cell"];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _layout.itemSize = CGSizeMake(375, 250);
    _layout.sectionInset = UIEdgeInsetsMake(10, 0, 0, 0);
    _layout.minimumInteritemSpacing = 0;
    _layout.minimumLineSpacing = 0;
    [self.view addSubview:_collectionView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DataCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
}



@end
