//
//  TTBevelBorderStyle.m
//  TTStyleMacTest
//
//  Created by Steve Streza on 7/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TTBevelBorderStyle.h"


@implementation TTBevelBorderStyle

@synthesize highlight = _highlight, shadow = _shadow, width = _width, lightSource = _lightSource;

///////////////////////////////////////////////////////////////////////////////////////////////////
// NSObject

+ (TTBevelBorderStyle*)styleWithColor:(NSColor*)color width:(CGFloat)width next:(TTStyle*)next {
	return [self styleWithHighlight:[color highlight] shadow:[color shadow] width:width
						lightSource:kDefaultLightSource next:next];
}

+ (TTBevelBorderStyle*)styleWithHighlight:(NSColor*)highlight shadow:(NSColor*)shadow
									width:(CGFloat)width lightSource:(NSInteger)lightSource next:(TTStyle*)next {
	TTBevelBorderStyle* style = [[[TTBevelBorderStyle alloc] initWithNext:next] autorelease];
	style.highlight = highlight;
	style.shadow = shadow;
	style.width = width;
	style.lightSource = lightSource;
	return style;  
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// NSObject

- (id)initWithNext:(TTStyle*)next {  
	if (self = [super initWithNext:next]) {
		_highlight = nil;
		_shadow = nil;
		_width = 1;
		_lightSource = kDefaultLightSource;
	}
	return self;
}

- (void)dealloc {
	[_highlight release];
	[_shadow release];
	[super dealloc];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// TTStyle

- (void)draw:(TTStyleContext*)context {
	CGRect strokeRect = CGRectInset(context.frame, _width/2, _width/2);
	[context.shape openPath:strokeRect];
	
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	CGContextSetLineWidth(ctx, _width);
	
	NSColor* topColor = _lightSource >= 0 && _lightSource <= 180 ? _highlight : _shadow;
	NSColor* leftColor = _lightSource >= 90 && _lightSource <= 270
	? _highlight : _shadow;
	NSColor* bottomColor = _lightSource >= 180 && _lightSource <= 360 || _lightSource == 0
	? _highlight : _shadow;
	NSColor* rightColor = (_lightSource >= 270 && _lightSource <= 360)
	|| (_lightSource >= 0 && _lightSource <= 90)
	? _highlight : _shadow;
	
	CGRect rect = context.frame;
	
	[context.shape addTopEdgeToPath:strokeRect lightSource:_lightSource];
	if (topColor) {
		[topColor setStroke];
		
		rect.origin.y += _width;
		rect.size.height -= _width;
	} else {
		[[NSColor clearColor] setStroke];
	}
	CGContextStrokePath(ctx);
	
	[context.shape addRightEdgeToPath:strokeRect lightSource:_lightSource];
	if (rightColor) {
		[rightColor setStroke];
		
		rect.size.width -= _width;
	} else {
		[[NSColor clearColor] setStroke];
	}
	CGContextStrokePath(ctx);
	
	[context.shape addBottomEdgeToPath:strokeRect lightSource:_lightSource];
	if (bottomColor) {
		[bottomColor setStroke];
		
		rect.size.height -= _width;
	} else {
		[[NSColor clearColor] setStroke];
	}
	CGContextStrokePath(ctx);
	
	[context.shape addLeftEdgeToPath:strokeRect lightSource:_lightSource];
	if (leftColor) {
		[leftColor setStroke];
		
		rect.origin.x += _width;
		rect.size.width -= _width;
	} else {
		[[NSColor clearColor] setStroke];
	}
	CGContextStrokePath(ctx);
	
	CGContextRestoreGState(ctx);
	
	context.frame = rect;
	return [self.next draw:context];
}

@end
