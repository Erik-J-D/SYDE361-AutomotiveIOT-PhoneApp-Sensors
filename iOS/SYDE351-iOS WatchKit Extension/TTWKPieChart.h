//
// TTWKPieChart
// Copyright (c) 2015, TouchTribe B.V. All rights reserved.
//
// This source code is available under the MIT license. See the LICENSE file for more info.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class TTWKPieChartBand;
@class TTWKPieChartGuideline;

/** 
 * Renders those Apple Watch pie charts (like the ones found in the Activity app) as images.
 * Initialize, setup all the properties, then call one of image* or animatedImage* methods.
 */
@interface TTWKPieChart : NSObject

/** 
 * Designated initializer setting up reasonable defaults for the visual properties.
 */
- (id)init;

/** 
 * @{
 * Visual settings
 */

/** The total radius of the chart. (75pt by default.) */
@property (nonatomic) CGFloat radius;

/** Width of a single circular band not taking its borders into account. (16pt by default.) */
@property (nonatomic) CGFloat bandWidth;

/** Extra space between borders of the two neighbour bands. (1pt by default.) */
@property (nonatomic) CGFloat bandSpacing;

/** The font to use for band captions. */
@property (nonatomic) UIFont *captionFont;

/** Extra padding between the end of a caption and the start of a band. */
@property (nonatomic) CGFloat captionPadding;

/** Extra points added to the vertical position of the caption's baseline. (0pt by default.) */
@property (nonatomic) CGFloat captionBaselineAdjustment;

/** 
 * YES, if the captions should be hidden at the end of the animation.
 * This makes sense when you have clear icons or only a single band.
 * (This property is YES by default.)
 */
@property (nonatomic) BOOL autoHideCaptions;

/** Large text in the center of the chart (just a number usually). It's nil by default, meaning that nothing is displayed. */
@property (nonatomic) NSAttributedString *largeText;

/** Small text under the large one in the center of the chart. Again, this is nil by default, not displayed. */
@property (nonatomic) NSAttributedString *smallText;

/** Padding between the large and the small text strings. Can be negative to draw them closer together. (0pt by default.) */
@property (nonatomic) CGFloat largeSmallTextPadding;

/** @} */

/** 
 * An array of TTWKPieChartBand defining how many bands should be displayed, how each of them looks 
 * and how big part of the full circle it spans.
 */
@property (nonatomic) NSArray *bands;

/** 
 * Optional line marking a specific position on the chart. It's not something found in standard apps, 
 * but something that was needed for us.
 * Drawn as a radius-line from the center of the chart on top of all the existing bands.
 * It is set to nil by default, which means no guideline is drawn.
 * TODO: perhaps it can be an array here to allow more than one marker?
 */
@property (nonatomic) TTWKPieChartGuideline *guideline;

/** 
 * The total duration of the animation. 
 * (2 seconds by default.) 
 */
@property (nonatomic) NSTimeInterval animationDuration;

/** 
 * The size of the image that can safely contain the chart along with the captions. 
 * This is the size of images returned by image* and animatedImage* methods.
 */
- (CGSize)size;

/** 
 * A static image of the final state of the chart. 
 */
- (UIImage *)image;

/** 
 * Renders the whole chart animation sequence as an animated image at 30 FPS.
 */
- (UIImage *)animatedImage;

/** 
 * Renders the whole chart animation sequence as an animated image with custom frame rate.
 */
- (UIImage *)animatedImageWithFrameRate:(CGFloat)frameRate;

/** A single frame of the chart animation for a specific moment of time. This is used by animatedImage above. */
- (UIImage *)imageForTime:(NSTimeInterval)time;

@end

/** 
 * A dictionary-like object describing the look of a single band of a pie chart.
 */
@interface TTWKPieChartBand : NSObject

- (id)init;

/** 
 * The main color of the band, the one that is used for the initial part of it and as a default caption color.
 */
@property (nonatomic) UIColor *startColor;

/** 
 * The color of the highlighted part of the band.
 * (We fully highlight the second half of the full circle and using a gradient from the startColor before it.)
 */
@property (nonatomic) UIColor *endColor;

/** 
 * Color of the full disc displayed underneath the band. Can be nil (default). 
 * TODO: support linear gradient for the background as well
 */
@property (nonatomic) UIColor *backgroundColor;

/** 
 * The icon to display in the beginning of the band. Can be nil (default).
 * Note that Apple Watch is using sort of vector icons for more fancy animations which we don't want to do here.
 * Also note that we are not using the bouncing animation, but a simple fade in.
 */
@property (nonatomic) UIImage *icon;

/** 
 * The text to be displayed at the left side of the beginning of the band.
 *
 * Note that the captions are never truncated, we simply expand the image so they all fit well,
 * so be careful when setting something dynamic here.
 */
@property (nonatomic) NSString *caption;

/** 
 * A color of the band caption text.
 * If nil (default), then the main color of the band will be used. 
 */
@property (nonatomic) UIColor *captionColor;

/** 
 * A number between 0 and 1 corresponding to the value this band represents.
 *
 * Note that we don't officially support values greater than 1 yet, they'll be rendered and animated,
 * but not as nice as it should be. 
 */
@property (nonatomic) CGFloat value;

@end

/** 
 * Describes how a marker / guideline should look and where it should appear on the chart.
 */
@interface TTWKPieChartGuideline : NSObject

/** A value from [0, 1] range describing the position of the guideline on the circle. */
@property (nonatomic) CGFloat position;

/** The color of the guideline. */
@property (nonatomic) UIColor *color;

/** Extra length of the marker line before it crosses the innermost band. (2pt by default.) */
@property (nonatomic) CGFloat extraBefore;

/** Extra length of the marker line after it crosses the outermost band. (2pt by default.) */
@property (nonatomic) CGFloat extraAfter;

/** The width of the guideline. (1pt by default.) */
@property (nonatomic) CGFloat lineWidth;

/** How line ends should be capped, see CGLineCap. (kCGLineCapButt by default.)*/
@property (nonatomic) CGLineCap lineCap;

/** 
 * Array of numbers describing a dashed line (how many points to draw, then how many to skip, etc).
 * (It is set to @[ @(1), @(1) ] by default, i.e. the line will be frequently dashed.
 */
@property (nonatomic) NSArray *lineDash;

@end
