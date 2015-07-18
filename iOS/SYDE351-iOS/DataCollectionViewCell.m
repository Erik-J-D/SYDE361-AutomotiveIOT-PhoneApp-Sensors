//
//  DataCollectionViewCell.m
//  
//
//  Created by Karan Thukral on 2015-07-08.
//
//

#import "DataCollectionViewCell.h"
#import "FuelEconomy.h"

@implementation DataCollectionViewCell {
    LineChartView *lineChartView;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setUpForFuelEconomies:(NSArray *)fuelEconomies
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
    leftAxis.customAxisMax = 20;
    leftAxis.customAxisMin = 0;
    leftAxis.startAtZeroEnabled = NO;
    leftAxis.drawLimitLinesBehindDataEnabled = NO;
    [leftAxis setDrawGridLinesEnabled:NO];
    
    ChartXAxis *xAxis = lineChartView.xAxis;
    [xAxis setDrawGridLinesEnabled:NO];
    xAxis.labelPosition = XAxisLabelPositionBottom;
    
    
    lineChartView.rightAxis.enabled = NO;
    
    lineChartView.legend.form = ChartLegendFormLine;
    
    [self setFuelEconomyData:fuelEconomies];
    
    [lineChartView animateWithXAxisDuration:0.75 easingOption:ChartEasingOptionLinear];
    
    [_chartView addSubview:lineChartView];

}

- (void)setFuelEconomyData:(NSArray *)fuelEconomies
{
    NSMutableArray *xValues = [[NSMutableArray alloc] init];
    NSMutableArray *yValues = [[NSMutableArray alloc] init];
    int index = 0;
    for (FuelEconomy *economy in fuelEconomies) {
        NSDate *date = economy.date;
        NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:date];
        [xValues addObject:[@([components day]) stringValue]];
        
        [yValues addObject:[[ChartDataEntry alloc] initWithValue:[economy.value floatValue] xIndex:index]];
        index ++;
    }
    
    LineChartDataSet *set1 = [[LineChartDataSet alloc] initWithYVals:yValues];
    
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
    
    LineChartData *data = [[LineChartData alloc] initWithXVals:xValues dataSets:dataSets];
    
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
