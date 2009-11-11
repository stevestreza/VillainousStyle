//
//  TTFourBorderStyle.m
//  TTStyleMacTest
//
//  Created by Steve Streza on 7/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TTFourBorderStyle.h"


@implementation TTFourBorderStyle

@synthesize top = _top, right = _right, bottom = _bottom, left = _left, width = _width;

///////////////////////////////////////////////////////////////////////////////////////////////////
// NSObject

+ (TTFourBorderStyle*)styleWithTop:(NSColor*)top right:(NSColor*)right bottom:(NSColor*)bottom
							  left:(NSColor*)left width:(CGFloat)width next:(TTStyle*)next {
	TTFourBorderStyle* style = [[[self alloc] initWithNext:next] autorelease];
	style.top = top;
	style.right = right;
	style.bottom = bottom;
	style.left = left;
	style.width = width;
	return style;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// NSObject

- (id)initWithNext:(TTStyle*)next {  
	if (self = [super initWithNext:next]) {
		_top = nil;
		_right = nil;
		_bottom = nil;
		_left = nil;
		_width = 1;
	}
	return self;
}

- (void)dealloc {
	[_top release];
	[_right release];
	[_bottom release];
	[_left release];
	[super dealloc];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// TTStyle

- (void)draw:(TTStyleContext*)context {
	CGRect rect = context.frame;
	CGRect strokeRect = CGRectInset(rect, _width/2, _width/2);
	[context.shape openPath:strokeRect];
	
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	CGContextSetLineWidth(ctx, _width);
	
	[context.shape addTopEdgeToPath:strokeRect lightSource:kDefaultLightSource];
	if (_top) {
		[_top setStroke];
	} else {
		[[NSColor clearColor] setStroke];
	}
	CGContextStrokePath(ctx);
	
	[context.shape addRightEdgeToPath:strokeRect lightSource:kDefaultLightSource];
	if (_right) {
		[_right setStroke];
	} else {
		[[NSColor clearColor] setStroke];
	}
	CGContextStrokePath(ctx);
	
	[context.shape addBottomEdgeToPath:strokeRect lightSource:kDefaultLightSource];
	if (_bottom) {
		[_bottom setStroke];
	} else {
		[[NSColor clearColor] setStroke];
	}
	CGContextStrokePath(ctx);
	
	[context.shape addLeftEdgeToPath:strokeRect lightSource:kDefaultLightSource];
	if (_left) {
		[_left setStroke];
	} else {
		[[NSColor clearColor] setStroke];
	}
	CGContextStrokePath(ctx);
	
	CGContextRestoreGState(ctx);
	
	context.frame = CGRectMake(rect.origin.x + (_left ? _width : 0),
							   rect.origin.y + (_top ? _width : 0),
							   rect.size.width - ((_left ? _width : 0) + (_right ? _width : 0)),
							   rect.size.height - ((_top ? _width : 0) + (_bottom ? _width : 0)));
	return [self.next draw:context];
}

@end
