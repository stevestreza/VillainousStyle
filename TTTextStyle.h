//
//  TTTextStyle.h
//  TTStyleMac
//
//  Created by Steve Streza on 7/25/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTstyle.h"

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

@interface TTTextStyle : TTStyle {
	NSFont* _font;
	NSColor* _color;
	NSColor* _shadowColor;
	CGSize _shadowOffset;
	CGFloat _minimumFontSize;
	UITextAlignment _textAlignment;
	UIControlContentVerticalAlignment _verticalAlignment;
	UILineBreakMode _lineBreakMode;
}

@property(nonatomic,retain) NSFont* font;
@property(nonatomic,retain) NSColor* color;
@property(nonatomic,retain) NSColor* shadowColor;
@property(nonatomic) CGFloat minimumFontSize;
@property(nonatomic) CGSize shadowOffset;
@property(nonatomic) UITextAlignment textAlignment;
@property(nonatomic) UIControlContentVerticalAlignment verticalAlignment;
@property(nonatomic) UILineBreakMode lineBreakMode;

+ (TTTextStyle*)styleWithFont:(NSFont*)font next:(TTStyle*)next;
+ (TTTextStyle*)styleWithColor:(NSColor*)color next:(TTStyle*)next;
+ (TTTextStyle*)styleWithFont:(NSFont*)font color:(NSColor*)color next:(TTStyle*)next;
+ (TTTextStyle*)styleWithFont:(NSFont*)font color:(NSColor*)color
                textAlignment:(UITextAlignment)textAlignment next:(TTStyle*)next;
+ (TTTextStyle*)styleWithFont:(NSFont*)font color:(NSColor*)color
				  shadowColor:(NSColor*)shadowColor shadowOffset:(CGSize)shadowOffset
						 next:(TTStyle*)next;
+ (TTTextStyle*)styleWithFont:(NSFont*)font color:(NSColor*)color
			  minimumFontSize:(CGFloat)minimumFontSize
				  shadowColor:(NSColor*)shadowColor shadowOffset:(CGSize)shadowOffset
						 next:(TTStyle*)next;
@end
