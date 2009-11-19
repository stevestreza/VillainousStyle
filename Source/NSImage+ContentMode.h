//
//  NSImage+ContentMode.h
//  VSStyleMac
//
//  Created by Steve Streza on 7/25/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VSGlobal.h"

#if !TARGET_OS_IPHONE
typedef enum {
    UIViewContentModeScaleToFill,
    UIViewContentModeScaleAspectFit,      // contents scaled to fit with fixed aspect. remainder is transparent
    UIViewContentModeScaleAspectFill,     // contents scaled to fill with fixed aspect. some portion of content may be clipped.
    UIViewContentModeRedraw,              // redraw on bounds change (calls -setNeedsDisplay)
    UIViewContentModeCenter,              // contents remain same size. positioned adjusted.
    UIViewContentModeTop,
    UIViewContentModeBottom,
    UIViewContentModeLeft,
    UIViewContentModeRight,
    UIViewContentModeTopLeft,
    UIViewContentModeTopRight,
    UIViewContentModeBottomLeft,
    UIViewContentModeBottomRight,
} UIViewContentMode;

@interface NSImage (ContentMode)

/**
 * Draws the image using content mode rules.
 */
- (void)drawInRect:(CGRect)rect contentMode:(UIViewContentMode)contentMode;

/**
 * Draws the image as a rounded rectangle.
 */
- (void)drawInRect:(CGRect)rect radius:(CGFloat)radius;
- (void)drawInRect:(CGRect)rect radius:(CGFloat)radius contentMode:(UIViewContentMode)contentMode;


@end

#endif