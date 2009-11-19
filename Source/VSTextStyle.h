//
//  VSTextStyle.h
//  VSStyleMac
//
//  Created by Steve Streza on 7/25/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VSstyle.h"

#if !TARGET_OS_IPHONE
typedef enum {		
    UILineBreakModeWordWrap = 0,            // Wrap at word boundaries
    UILineBreakModeCharacterWrap,           // Wrap at character boundaries
    UILineBreakModeClip,                    // Simply clip when it hits the end of the rect
    UILineBreakModeHeadTruncation,          // Truncate at head of line: "...wxyz". Will truncate multiline text on first line
    UILineBreakModeTailTruncation,          // Truncate at tail of line: "abcd...". Will truncate multiline text on last line
    UILineBreakModeMiddleTruncation,        // Truncate middle of line:  "ab...yz". Will truncate multiline text in the middle
} UILineBreakMode;

typedef enum {
    UITextAlignmentLeft = 0,
    UITextAlignmentCenter,
    UITextAlignmentRight,                   // could add justified in future
} UITextAlignment;

typedef enum {
    UIBaselineAdjustmentAlignBaselines = 0, // default. used when shrinking text to position based on the original baseline
    UIBaselineAdjustmentAlignCenters,
    UIBaselineAdjustmentNone,
} UIBaselineAdjustment;

typedef enum {
    UIControlContentVerticalAlignmentCenter  = 0,
    UIControlContentVerticalAlignmentTop     = 1,
    UIControlContentVerticalAlignmentBottom  = 2,
    UIControlContentVerticalAlignmentFill    = 3,
} UIControlContentVerticalAlignment;
#endif

@interface VSTextStyle : VSStyle {
	VSFont* _font;
	VSColor* _color;
	VSColor* _shadowColor;
	CGSize _shadowOffset;
	CGFloat _minimumFontSize;
	UITextAlignment _textAlignment;
	UIControlContentVerticalAlignment _verticalAlignment;
	UILineBreakMode _lineBreakMode;
}

@property(nonatomic,retain) VSFont* font;
@property(nonatomic,retain) VSColor* color;
@property(nonatomic,retain) VSColor* shadowColor;
@property(nonatomic) CGFloat minimumFontSize;
@property(nonatomic) CGSize shadowOffset;
@property(nonatomic) UITextAlignment textAlignment;
@property(nonatomic) UIControlContentVerticalAlignment verticalAlignment;
@property(nonatomic) UILineBreakMode lineBreakMode;

+ (VSTextStyle*)styleWithFont:(VSFont*)font next:(VSStyle*)next;
+ (VSTextStyle*)styleWithColor:(VSColor*)color next:(VSStyle*)next;
+ (VSTextStyle*)styleWithFont:(VSFont*)font color:(VSColor*)color next:(VSStyle*)next;
+ (VSTextStyle*)styleWithFont:(VSFont*)font color:(VSColor*)color
                textAlignment:(UITextAlignment)textAlignment next:(VSStyle*)next;
+ (VSTextStyle*)styleWithFont:(VSFont*)font color:(VSColor*)color
				  shadowColor:(VSColor*)shadowColor shadowOffset:(CGSize)shadowOffset
						 next:(VSStyle*)next;
+ (VSTextStyle*)styleWithFont:(VSFont*)font color:(VSColor*)color
			  minimumFontSize:(CGFloat)minimumFontSize
				  shadowColor:(VSColor*)shadowColor shadowOffset:(CGSize)shadowOffset
						 next:(VSStyle*)next;
@end
