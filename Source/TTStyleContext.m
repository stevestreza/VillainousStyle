//
//  TTStyleContext.m
//  TTStyleMacTest
//
//  Created by Steve Streza on 7/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TTStyleContext.h"
#import "TTRectangleShape.h"

@implementation TTStyleContext
@synthesize delegate = _delegate, frame = _frame, contentFrame = _contentFrame, shape = _shape,
font = _font, didDrawContent = _didDrawContent;

///////////////////////////////////////////////////////////////////////////////////////////////////
// NSObject

- (id)init {
	if (self = [super init]) {
		_delegate = nil;
		_frame = CGRectZero;
		_contentFrame = CGRectZero;
		_shape = nil;
		_font = nil;
		_didDrawContent = NO;
	}
	return self;
}

- (void)dealloc {
	TT_RELEASE_SAFELY(_shape);
	TT_RELEASE_SAFELY(_font);
	[super dealloc];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// public

- (TTShape*)shape {
	if (!_shape) {
		_shape = [[TTRectangleShape shape] retain];
	}
	return _shape;
}

@end
