//
//  VSGlobal.h
//  VillainousStyle
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import <Foundation/Foundation.h>
#import "NSColor+CGColor.h"
#import "NSImage+CGImage.h"

typedef struct UIEdgeInsets {
    CGFloat top, left, bottom, right;  // specify amount to inset (positive) for each of the edges. values can be negative to 'outset'
} UIEdgeInsets;

#define UIEdgeInsetsZero (UIEdgeInsets){ 0.0, 0.0, 0.0, 0.0 }

#define VS_RELEASE_SAFELY(__POINTER) { [__POINTER release]; __POINTER = nil; }

#define UIGraphicsGetCurrentContext() ((CGContextRef)[[NSGraphicsContext currentContext] graphicsPort])

static inline UIEdgeInsets UIEdgeInsetsMake(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right) {
    UIEdgeInsets insets = {top, left, bottom, right};
    return insets;
}

#define NSColorRGB(__r, __g, __b)        ([NSColor colorWithCalibratedRed:(__r) green:(__g) blue:(__b) alpha:1.0 ])
#define NSColorRGBA(__r, __g, __b, __a) ([NSColor colorWithCalibratedRed:(__r) green:(__g) blue:(__b) alpha:(__a)])

static inline CGRect VSRectInset(CGRect rect, UIEdgeInsets insets) {
	return CGRectMake(rect.origin.x + insets.left, rect.origin.y + insets.top,
					  rect.size.width - (insets.left + insets.right),
					  rect.size.height - (insets.top + insets.bottom));
	
}

#define VS_ROUNDED -1
#define VSRadius(_RADIUS) (_RADIUS == VS_ROUNDED ? round(fh/2) : _RADIUS)

typedef enum {
	VSPositionStatic,
	VSPositionAbsolute,
	VSPositionFloatLeft,
	VSPositionFloatRight,
} VSPosition;

static const CGFloat kArrowPointWidth = 2.8;
static const CGFloat kArrowRadius = 2;
static CGFloat kInsetWidth = 5;
