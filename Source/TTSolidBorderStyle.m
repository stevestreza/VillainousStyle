//
//  TTSolidBorderStyle.m
//  TTStyleMacTest
//
//  Created by Steve Streza on 7/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TTSolidBorderStyle.h"
#import "NSColor+CGColor.h"


@implementation TTSolidBorderStyle

@synthesize color = _color, width = _width;

///////////////////////////////////////////////////////////////////////////////////////////////////
// NSObject

+ (TTSolidBorderStyle*)styleWithColor:(NSColor*)color width:(CGFloat)width next:(TTStyle*)next {
	TTSolidBorderStyle* style = [[[self alloc] initWithNext:next] autorelease];
	style.color = color;
	style.width = width;
	return style;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// NSObject

- (id)initWithNext:(TTStyle*)next {  
	if (self = [super initWithNext:next]) {
		_color = nil;
		_width = 1;
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
	CGContextSaveGState(ctx);
	
	CGRect strokeRect = CGRectInset(context.frame, _width/2, _width/2);
	[context.shape addToPath:strokeRect];
	
	[_color setStroke];
	CGContextSetLineWidth(ctx, _width);
	CGContextStrokePath(ctx);
	
	CGContextRestoreGState(ctx);
	
	context.frame = CGRectInset(context.frame, _width, _width);
	return [self.next draw:context];
}

@end
