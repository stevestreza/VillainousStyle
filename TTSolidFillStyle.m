//
//  TTSolidFillStyle.m
//  TTStyleMacTest
//
//  Created by Steve Streza on 7/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TTSolidFillStyle.h"


@implementation TTSolidFillStyle

@synthesize color = _color;

///////////////////////////////////////////////////////////////////////////////////////////////////
// class public

+ (TTSolidFillStyle*)styleWithColor:(NSColor*)color next:(TTStyle*)next {
	TTSolidFillStyle* style = [[[self alloc] initWithNext:next] autorelease];
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
	CGContextRef ctx = (CGContextRef)[[NSGraphicsContext currentContext] graphicsPort];
	
	CGContextSaveGState(ctx);
	[context.shape addToPath:context.frame];
	
	[_color setFill];
	CGContextFillPath(ctx);
	CGContextRestoreGState(ctx);
	
	return [self.next draw:context];
}

@end
