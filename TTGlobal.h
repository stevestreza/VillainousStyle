//
//  TTGlobal.h
//  TTStyleMacTest
//
//  Created by Steve Streza on 7/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSColor+CGColor.h"
#import "NSImage+CGImage.h"

typedef struct UIEdgeInsets {
    CGFloat top, left, bottom, right;  // specify amount to inset (positive) for each of the edges. values can be negative to 'outset'
} UIEdgeInsets;

#define UIEdgeInsetsZero (UIEdgeInsets){ 0.0, 0.0, 0.0, 0.0 }

#define TT_RELEASE_SAFELY(__POINTER) { [__POINTER release]; __POINTER = nil; }

#define UIGraphicsGetCurrentContext() ((CGContextRef)[[NSGraphicsContext currentContext] graphicsPort])

static inline UIEdgeInsets UIEdgeInsetsMake(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right) {
    UIEdgeInsets insets = {top, left, bottom, right};
    return insets;
}

#define NSColorRGBA(__r, __g, __b, __a) ([NSColor colorWithCalibratedRed:(__r) green:(__g) blue:(__b) alpha:(__a)])

static inline CGRect TTRectInset(CGRect rect, UIEdgeInsets insets) {
	return CGRectMake(rect.origin.x + insets.left, rect.origin.y + insets.top,
					  rect.size.width - (insets.left + insets.right),
					  rect.size.height - (insets.top + insets.bottom));
	
}

#define TT_ROUNDED -1
#define TTRadius(_RADIUS) (_RADIUS == TT_ROUNDED ? round(fh/2) : _RADIUS)

typedef enum {
	TTPositionStatic,
	TTPositionAbsolute,
	TTPositionFloatLeft,
	TTPositionFloatRight,
} TTPosition;

static const CGFloat kArrowPointWidth = 2.8;
static const CGFloat kArrowRadius = 2;
static CGFloat kInsetWidth = 5;
