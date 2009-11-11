//
//  TTShapeStyle.m
//  TTStyleMacTest
//
//  Created by Steve Streza on 7/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TTShapeStyle.h"


@implementation TTShapeStyle

@synthesize shape = _shape;

///////////////////////////////////////////////////////////////////////////////////////////////////
// NSObject

+ (TTShapeStyle*)styleWithShape:(TTShape*)shape next:(TTStyle*)next {
	TTShapeStyle* style = [[[self alloc] initWithNext:next] autorelease];
	style.shape = shape;
	return style;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// NSObject

- (id)initWithNext:(TTStyle*)next {  
	if (self = [super initWithNext:next]) {
		_shape = nil;
	}
	return self;
}

- (void)dealloc {
	[_shape release];
	[super dealloc];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// TTStyle

- (void)draw:(TTStyleContext*)context {
	UIEdgeInsets shapeInsets = [_shape insetsForSize:context.frame.size];
	context.contentFrame = TTRectInset(context.contentFrame, shapeInsets);
	context.shape = _shape;
	[self.next draw:context];
}

- (UIEdgeInsets)addToInsets:(UIEdgeInsets)insets forSize:(CGSize)size {
	UIEdgeInsets shapeInsets = [_shape insetsForSize:size];
	insets.top += shapeInsets.top;
	insets.right += shapeInsets.right;
	insets.bottom += shapeInsets.bottom;
	insets.left += shapeInsets.left;
	
	if (self.next) {
		return [self.next addToInsets:insets forSize:size];
	} else {
		return insets;
	}
}

- (CGSize)addToSize:(CGSize)size context:(TTStyleContext*)context {
	CGSize innerSize = [self.next addToSize:size context:context];
	UIEdgeInsets shapeInsets = [_shape insetsForSize:innerSize];
	innerSize.width += shapeInsets.left + shapeInsets.right;
	innerSize.height += shapeInsets.top + shapeInsets.bottom;
	
	return innerSize;
}

@end
