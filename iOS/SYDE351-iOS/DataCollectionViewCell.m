//
//  DataCollectionViewCell.m
//  
//
//  Created by Karan Thukral on 2015-07-08.
//
//

#import "DataCollectionViewCell.h"

@implementation DataCollectionViewCell {
    LineChartView *lineChartView;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setUpForFuelEconomy
{
    lineChartView = [[LineChartView alloc] initWithFrame:_chartView.bounds];
    lineChartView.backgroundColor = [UIColor redColor];
    lineChartView.gridBackgroundColor = [UIColor clearColor];
    
    lineChartView.delegate = self;
    
    lineChartView.descriptionText = @"";
    lineChartView.noDataTextDescription = @"You need to provide data for the chart.";
    
    lineChartView.highlightEnabled = NO;
    lineChartView.dragEnabled = YES;
    [lineChartView setScaleEnabled:YES];
    lineChartView.pinchZoomEnabled = YES;
    lineChartView.drawGridBackgroundEnabled = NO;
    lineChartView.drawBordersEnabled = NO;
    [lineChartView.legend setEnabled:NO];
    
    ChartYAxis *leftAxis = lineChartView.leftAxis;
    [leftAxis removeAllLimitLines];
    leftAxis.customAxisMax = 30;
    leftAxis.customAxisMin = 0;
    leftAxis.startAtZeroEnabled = NO;
    leftAxis.drawLimitLinesBehindDataEnabled = NO;
    [leftAxis setDrawGridLinesEnabled:NO];
    
    ChartXAxis *xAxis = lineChartView.xAxis;
    [xAxis setDrawGridLinesEnabled:NO];
    xAxis.labelPosition = XAxisLabelPositionBottom;
    
    
    lineChartView.rightAxis.enabled = NO;
    
    lineChartView.legend.form = ChartLegendFormLine;
    
    [self setDummyData:10 range:20.0];
    
    [lineChartView animateWithXAxisDuration:2.5 easingOption:ChartEasingOptionLinear];
    
    [_chartView addSubview:lineChartView];

}


- (void)setDummyData:(int)count range:(double)range
{
    NSMutableArray *xVals = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < count; i++)
    {
        [xVals addObject:[@(i) stringValue]];
    }
    
    NSMutableArray *yVals = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < count; i++)
    {
        double mult = (range + 1);
        double val = (double) (arc4random_uniform(mult)) + 3;
        [yVals addObject:[[ChartDataEntry alloc] initWithValue:val xIndex:i]];
    }
    
    LineChartDataSet *set1 = [[LineChartDataSet alloc] initWithYVals:yVals label:@"DataSet 1"];
    
    [set1 setColor:[UIColor whiteColor]];
    [set1 setCircleColor:[UIColor whiteColor]];
    set1.lineWidth = 1.5;
    set1.circleRadius = 3.0;
    set1.drawCircleHoleEnabled = NO;
    set1.valueFont = [UIFont systemFontOfSize:9.f];
    set1.fillAlpha = 65/255.0;
    set1.fillColor = [UIColor whiteColor];
    set1.drawCubicEnabled = YES;
    set1.drawValuesEnabled = NO;
    set1.lineDashPhase = 0;
    
    NSMutableArray *dataSets = [[NSMutableArray alloc] init];
    [dataSets addObject:set1];
    
    LineChartData *data = [[LineChartData alloc] initWithXVals:xVals dataSets:dataSets];
    
    lineChartView.data = data;
}

#pragma mark - ChartViewDelegate

- (void)chartValueSelected:(ChartViewBase * __nonnull)chartView entry:(ChartDataEntry * __nonnull)entry dataSetIndex:(NSInteger)dataSetIndex highlight:(ChartHighlight * __nonnull)highlight
{
    NSLog(@"chartValueSelected");
}

- (void)chartValueNothingSelected:(ChartViewBase * __nonnull)chartView
{
    NSLog(@"chartValueNothingSelected");
}



@end
