//
//  TTLinearGradientStyle.m
//  TTStyleMacTest
//
//  Created by Steve Streza on 7/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TTLinearGradientFillStyle.h"
#import "NSColor+CGColor.h"

@implementation TTLinearGradientFillStyle

@synthesize color1 = _color1, color2 = _color2;

///////////////////////////////////////////////////////////////////////////////////////////////////
// class public

+ (TTLinearGradientFillStyle*)styleWithColor1:(NSColor*)color1 color2:(NSColor*)color2
										 next:(TTStyle*)next {
	TTLinearGradientFillStyle* style = [[[self alloc] initWithNext:next] autorelease];
	style.color1 = color1;
	style.color2 = color2;
	return style;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// NSObject

- (id)initWithNext:(TTStyle*)next {  
	if (self = [super initWithNext:next]) {
		_color1 = nil;
		_color2 = nil;
	}
	return self;
}

- (void)dealloc {
	[_color1 release];
	[_color2 release];
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
	
	NSColor* colors[] = {_color1, _color2};
	CGGradientRef gradient = [self newGradientWithColors:colors count:2];
	CGContextDrawLinearGradient(ctx, gradient, CGPointMake(rect.origin.x, rect.origin.y),
								CGPointMake(rect.origin.x, rect.origin.y+rect.size.height), kCGGradientDrawsAfterEndLocation);
	CGGradientRelease(gradient);
	
	CGContextRestoreGState(ctx);
	
	return [self.next draw:context];
}

@end
