//
//  InterfaceController.m
//  SYDE351-iOS WatchKit Extension
//
//  Created by Karan Thukral on 2015-07-18.
//  Copyright (c) 2015 karanthukral. All rights reserved.
//

#import "InterfaceController.h"
#import "TTWKPieChart.h"


@interface InterfaceController()

@end


@implementation InterfaceController
{
    UIImage *_image;
}

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    // Create and configure the chart generator
    TTWKPieChart *pieChart = [[TTWKPieChart alloc] init];
    pieChart.radius = floorf([WKInterfaceDevice currentDevice].screenBounds.size.width * 0.45);
    pieChart.bandWidth = 10;
    
    TTWKPieChartBand *band1 = [[TTWKPieChartBand alloc] init];
    band1.icon = [UIImage imageNamed:@"test-icon-1"];
    band1.startColor = [UIColor colorWithHue:0.4 saturation:0.72 brightness:0.85 alpha:1];
    band1.endColor = [UIColor colorWithHue:0.4 saturation:0.72 brightness:0.70 alpha:1];
    band1.backgroundColor = [UIColor colorWithRed:0.1608 green:0.0314 blue:0.0667 alpha:1.0];
    band1.value = 0.86;
    
    pieChart.bands = @[band1];
    
    // Configure the text to display
    pieChart.largeText = [[NSAttributedString alloc]  initWithString:@"Driving Score" attributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    pieChart.smallText = [[NSAttributedString alloc] initWithString:@"86" attributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
                          
  // Generate the animated image at 15 FPS, send it off to the device and begin animation
  _image = [pieChart animatedImageWithFrameRate:15];
                    
  [_imageView setImage:_image];
  [_imageView startAnimatingWithImagesInRange:NSMakeRange(0, _image.images.count) duration:_image.duration repeatCount:1];
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



