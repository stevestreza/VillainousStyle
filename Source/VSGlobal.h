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

#if TARGET_OS_IPHONE
#import <UIKit/UIKit.h>
#else
#import <AppKit/AppKit.h>
#endif

#if !TARGET_OS_IPHONE
typedef struct UIEdgeInsets {
    CGFloat top, left, bottom, right;  // specify amount to inset (positive) for each of the edges. values can be negative to 'outset'
} UIEdgeInsets;

static inline UIEdgeInsets UIEdgeInsetsMake(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right) {
    UIEdgeInsets insets = {top, left, bottom, right};
    return insets;
}
#endif

#pragma mark Color/Image/Font compatibility

#if TARGET_OS_IPHONE
#define VSColorRGB(__r, __g, __b)        ([UIColor colorWithRed:(__r) green:(__g) blue:(__b) alpha:1.0 ])
#define VSColorRGBA(__r, __g, __b, __a) ([UIColor colorWithRed:(__r) green:(__g) blue:(__b) alpha:(__a)])
@compatibility_alias VSColor UIColor;
@compatibility_alias VSImage UIImage;
@compatibility_alias VSFont  UIFont;
#elif TARGET_OS_MAC
#define VSColorRGB(__r, __g, __b)        ([NSColor colorWithCalibratedRed:(__r) green:(__g) blue:(__b) alpha:1.0 ])
#define VSColorRGBA(__r, __g, __b, __a) ([NSColor colorWithCalibratedRed:(__r) green:(__g) blue:(__b) alpha:(__a)])
#define UIGraphicsGetCurrentContext() ((CGContextRef)[[NSGraphicsContext currentContext] graphicsPort])
@compatibility_alias VSColor NSColor;
@compatibility_alias VSImage NSImage;
@compatibility_alias VSFont  NSFont;
#endif

#define VSColorRGB256(__r, __g, __b)        (VSColorRGB((__r)/256.,(__g)/256.,(__b)/256.))
#define VSColorRGBA256(__r, __g, __b, __a) (VSColorRGBA((__r)/256.,(__g)/256.,(__b)/256.,(__a)/256.))

#define UIEdgeInsetsZero (UIEdgeInsets){ 0.0, 0.0, 0.0, 0.0 }

#define VS_RELEASE_SAFELY(__POINTER) { [__POINTER release]; __POINTER = nil; }

#define VSRectInset(rect, insets) \
CGRectMake(rect.origin.x + insets.left, rect.origin.y + insets.top, \
rect.size.width - (insets.left + insets.right), \
rect.size.height - (insets.top + insets.bottom))
	
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
