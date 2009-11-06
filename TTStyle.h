//
//  TTStyle.h
//  TTStyleMacTest
//
//  Created by Steve Streza on 7/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTGlobal.h"
#import "TTShape.h"
#import "TTStyleContext.h"

#define RGBCOLOR(r,g,b) [NSColor colorWithRed:r/256.0 green:g/256.0 blue:b/256.0 alpha:1]
#define RGBACOLOR(r,g,b,a) [NSColor colorWithRed:r/256.0 green:g/256.0 blue:b/256.0 alpha:a]

#define HSVCOLOR(h,s,v) [NSColor colorWithHue:h saturation:s value:v alpha:1]
#define HSVACOLOR(h,s,v,a) [NSColor colorWithHue:h saturation:s value:v alpha:a]

#define RGBA(r,g,b,a) r/256.0, g/256.0, b/256.0, a

#define ZEROLIMIT(_VALUE) (_VALUE < 0 ? 0 : (_VALUE > 1 ? 1 : _VALUE))

static const NSInteger kDefaultLightSource = 125;

@interface TTStyle : NSObject {
	TTStyle* _next;
}

@property(nonatomic,retain) TTStyle* next;

- (id)initWithNext:(TTStyle*)next;

- (void)draw:(TTStyleContext*)context;

- (UIEdgeInsets)addToInsets:(UIEdgeInsets)insets forSize:(CGSize)size;
- (CGSize)addToSize:(CGSize)size context:(TTStyleContext*)context;

- (void)addStyle:(TTStyle*)style;

- (id)firstStyleOfClass:(Class)cls;
- (id)styleForPart:(NSString*)name;


- (CGGradientRef)newGradientWithColors:(NSColor**)colors count:(int)count ;

@end
