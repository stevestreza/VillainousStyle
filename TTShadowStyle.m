//
//  TTShadowStyle.m
//  TTStyleMacTest
//
//  Created by Steve Streza on 7/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TTShadowStyle.h"
#import "NSColor+CGColor.h"

@implementation TTShadowStyle

@synthesize color = _color, blur = _blur, offset = _offset;

///////////////////////////////////////////////////////////////////////////////////////////////////
// class public

+ (TTShadowStyle*)styleWithColor:(NSColor*)color blur:(CGFloat)blur offset:(CGSize)offset
							next:(TTStyle*)next {
	TTShadowStyle* style = [[[self alloc] initWithNext:next] autorelease];
	style.color = color;
	style.blur = blur;
	style.offset = offset;
	return style;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// NSObject

- (id)initWithNext:(TTStyle*)next {  
	if (self = [super initWithNext:next]) {
		_color = nil;
		_blur = 0;
		_offset = CGSizeZero;
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
	CGFloat blurSize = round(_blur / 2);
	UIEdgeInsets inset = UIEdgeInsetsMake(blurSize, blurSize, blurSize, blurSize);
	if (_offset.width < 0) {
		inset.left += fabs(_offset.width) + blurSize*2;
		inset.right -= blurSize;
	} else if (_offset.width > 0) {
		inset.right += fabs(_offset.width) + blurSize*2;
		inset.left -= blurSize;
	}
	if (_offset.height < 0) {
		inset.top += fabs(_offset.height) + blurSize*2;
		inset.bottom -= blurSize;
	} else if (_offset.height > 0) {
		inset.bottom += fabs(_offset.height) + blurSize*2;
		inset.top -= blurSize;
	}
	
	context.frame = TTRectInset(context.frame, inset);
	context.contentFrame = TTRectInset(context.contentFrame, inset);
	
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	CGContextSaveGState(ctx);
	
	[context.shape addToPath:context.frame];
	CGContextSetShadowWithColor(ctx, CGSizeMake(_offset.width, -_offset.height), _blur,
								_color.CGColor);
	CGContextBeginTransparencyLayer(ctx, nil);
	[self.next draw:context];
	CGContextEndTransparencyLayer(ctx);
	
	CGContextRestoreGState(ctx);
}

- (CGSize)addToSize:(CGSize)size context:(TTStyleContext*)context {
	CGFloat blurSize = round(_blur / 2);
	size.width += _offset.width + (_offset.width ? blurSize : 0) + blurSize*2;
	size.height += _offset.height + (_offset.height ? blurSize : 0) + blurSize*2;
	
	if (_next) {
		return [self.next addToSize:size context:context];
	} else {
		return size;
	}
}

@end
