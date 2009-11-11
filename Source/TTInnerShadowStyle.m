//
//  TTInnerShadowStyle.m
//  TTStyleMacTest
//
//  Created by Steve Streza on 7/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TTInnerShadowStyle.h"


@implementation TTInnerShadowStyle

///////////////////////////////////////////////////////////////////////////////////////////////////
// TTStyle

- (void)draw:(TTStyleContext*)context {
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	CGContextSaveGState(ctx);
	
	[context.shape addToPath:context.frame];
	CGContextClip(ctx);
	
	[context.shape addInverseToPath:context.frame];
	[[NSColor whiteColor] setFill];
	CGContextSetShadowWithColor(ctx, CGSizeMake(_offset.width, -_offset.height), _blur,
								_color.CGColor);
	CGContextEOFillPath(ctx);
	CGContextRestoreGState(ctx);
	
	return [self.next draw:context];
}

- (CGSize)addToSize:(CGSize)size context:(TTStyleContext*)context {
	if (_next) {
		return [self.next addToSize:size context:context];
	} else {
		return size;
	}
}

@end
