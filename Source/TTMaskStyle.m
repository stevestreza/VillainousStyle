//
//  NSImageStyle.m
//  TTStyleMacTest
//
//  Created by Steve Streza on 7/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TTMaskStyle.h"


@implementation TTMaskStyle

@synthesize mask = _mask;

///////////////////////////////////////////////////////////////////////////////////////////////////
// class public

+ (TTMaskStyle*)styleWithMask:(NSImage*)mask next:(TTStyle*)next {
	TTMaskStyle* style = [[[self alloc] initWithNext:next] autorelease];
	style.mask = mask;
	return style;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
// NSObject

- (id)initWithNext:(TTStyle*)next {  
	if (self = [super initWithNext:next]) {
		_mask = nil;
	}
	return self;
}

- (void)dealloc {
	[_mask release];
	[super dealloc];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// TTStyle

- (void)draw:(TTStyleContext*)context {
	if (_mask) {
		CGContextRef ctx = UIGraphicsGetCurrentContext();
		CGContextSaveGState(ctx);
		
		// Translate context upside-down to invert the clip-to-mask, which turns the mask upside down
		CGContextTranslateCTM(ctx, 0, context.frame.size.height);
		CGContextScaleCTM(ctx, 1.0, -1.0);
		
		CGRect maskRect = CGRectMake(0, 0, _mask.size.width, _mask.size.height);
		CGContextClipToMask(ctx, maskRect, _mask.CGImage);
		
		[self.next draw:context];
		CGContextRestoreGState(ctx);
	} else {
		return [self.next draw:context];
	}
}

@end
