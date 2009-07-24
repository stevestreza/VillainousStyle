//
//  TTReflectiveFillStyle.m
//  TTStyleMacTest
//
//  Created by Steve Streza on 7/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TTReflectiveFillStyle.h"

#define RGBCOLOR(r,g,b) [NSColor colorWithRed:r/256.0 green:g/256.0 blue:b/256.0 alpha:1]
#define RGBACOLOR(r,g,b,a) [NSColor colorWithRed:r/256.0 green:g/256.0 blue:b/256.0 alpha:a]

#define HSVCOLOR(h,s,v) [NSColor colorWithHue:h saturation:s value:v alpha:1]
#define HSVACOLOR(h,s,v,a) [NSColor colorWithHue:h saturation:s value:v alpha:a]

#define RGBA(r,g,b,a) r/256.0, g/256.0, b/256.0, a

#define ZEROLIMIT(_VALUE) (_VALUE < 0 ? 0 : (_VALUE > 1 ? 1 : _VALUE))

#import "NSColorAdditions.h"

@implementation TTReflectiveFillStyle

@synthesize color = _color;

///////////////////////////////////////////////////////////////////////////////////////////////////
// class public

+ (TTReflectiveFillStyle*)styleWithColor:(NSColor*)color next:(TTStyle*)next {
	TTReflectiveFillStyle* style = [[[self alloc] initWithNext:next] autorelease];
	style.color = color;
	return style;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// NSObject

- (id)initWithNext:(TTStyle*)next {  
	if (self = [super initWithNext:next]) {
		_color = nil;
	}
	return self;
}

- (void)dealloc {
	[_color release];
	[super dealloc];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// TTStyle

- (void)draw:(TTStyleContext*)context {
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	CGRect rect = context.frame;
	
	CGContextSaveGState(ctx);
	[context.shape addToPath:rect];
	CGContextClip(ctx);
	
	[_color setFill];
	CGContextFillRect(ctx, rect);
	
	// XXjoe These numbers are totally biased towards the colors I tested with.  I need to figure out
	// a formula that works well for all colors
	NSColor* lighter = nil, *darker = nil;
	if (_color.value < 0.5) {
		lighter = HSVCOLOR(_color.hue, ZEROLIMIT(_color.saturation-0.5), ZEROLIMIT(_color.value+0.25));
		darker = HSVCOLOR(_color.hue, ZEROLIMIT(_color.saturation-0.1), ZEROLIMIT(_color.value+0.1));
	} else if (_color.saturation > 0.6) {
		lighter = HSVCOLOR(_color.hue, _color.saturation*0.3, _color.value*1);
		darker = HSVCOLOR(_color.hue, _color.saturation*0.9, _color.value+0.05);
	} else {
		lighter = HSVCOLOR(_color.hue, _color.saturation*0.4, _color.value*1.2);
		darker = HSVCOLOR(_color.hue, _color.saturation*0.9, _color.value+0.05);
	}
	//  //NSColor* lighter = [_color multiplyHue:1 saturation:0.5 value:1.35];
	//  //NSColor* darker = [_color multiplyHue:1 saturation:0.88 value:1.05];
	NSColor* colors[] = {darker, lighter};
	
	CGGradientRef gradient = [self newGradientWithColors:colors count:2];
	CGContextDrawLinearGradient(ctx, gradient, CGPointMake(rect.origin.x, rect.origin.y+(rect.size.height * 0.5)),
								CGPointMake(rect.origin.x, rect.origin.y+rect.size.height),
								kCGGradientDrawsAfterEndLocation );
	CGGradientRelease(gradient);
	
	CGContextRestoreGState(ctx);
	
	return [self.next draw:context];
}

@end
