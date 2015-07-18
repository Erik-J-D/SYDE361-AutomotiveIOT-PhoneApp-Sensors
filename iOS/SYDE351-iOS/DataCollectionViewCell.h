//
//  DataCollectionViewCell.h
//  
//
//  Created by Karan Thukral on 2015-07-08.
//
//

#import <UIKit/UIKit.h>
#import <Charts/Charts-Swift.h>

@interface DataCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIView *chartView;
@property (weak, nonatomic) IBOutlet UILabel *chartTitle;
- (void)setUpForFuelEconomies:(NSArray *)fuelEconomies;
@end
