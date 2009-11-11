//
//  TTBoxStyle.m
//  TTStyleMacTest
//
//  Created by Steve Streza on 7/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TTBoxStyle.h"


@implementation TTBoxStyle

@synthesize margin = _margin, padding = _padding, minSize = _minSize, position = _position;

///////////////////////////////////////////////////////////////////////////////////////////////////
// NSObject

+ (TTBoxStyle*)styleWithMargin:(UIEdgeInsets)margin next:(TTStyle*)next {
	TTBoxStyle* style = [[[self alloc] initWithNext:next] autorelease];
	style.margin = margin;
	return style;
}

+ (TTBoxStyle*)styleWithPadding:(UIEdgeInsets)padding next:(TTStyle*)next {
	TTBoxStyle* style = [[[self alloc] initWithNext:next] autorelease];
	style.padding = padding;
	return style;
}

+ (TTBoxStyle*)styleWithFloats:(TTPosition)position next:(TTStyle*)next {
	TTBoxStyle* style = [[[self alloc] initWithNext:next] autorelease];
	style.position = position;
	return style;
}

+ (TTBoxStyle*)styleWithMargin:(UIEdgeInsets)margin padding:(UIEdgeInsets)padding
						  next:(TTStyle*)next {
	TTBoxStyle* style = [[[self alloc] initWithNext:next] autorelease];
	style.margin = margin;
	style.padding = padding;
	return style;
}

+ (TTBoxStyle*)styleWithMargin:(UIEdgeInsets)margin padding:(UIEdgeInsets)padding
					   minSize:(CGSize)minSize position:(TTPosition)position next:(TTStyle*)next {
	TTBoxStyle* style = [[[self alloc] initWithNext:next] autorelease];
	style.margin = margin;
	style.padding = padding;
	style.minSize = minSize;
	style.position = position;
	return style;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// NSObject

- (id)initWithNext:(TTStyle*)next {  
	if (self = [super initWithNext:next]) {
		_margin = UIEdgeInsetsZero;
		_padding = UIEdgeInsetsZero;
		_minSize = CGSizeZero;
		_position = TTPositionStatic;
	}
	return self;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// TTStyle

- (void)draw:(TTStyleContext*)context {
	context.contentFrame = TTRectInset(context.contentFrame, _padding);
	[self.next draw:context];
}

- (CGSize)addToSize:(CGSize)size context:(TTStyleContext*)context {
	size.width += _padding.left + _padding.right;
	size.height += _padding.top + _padding.bottom;
	
	if (_next) {
		return [self.next addToSize:size context:context];
	} else {
		return size;
	}
}

@end
