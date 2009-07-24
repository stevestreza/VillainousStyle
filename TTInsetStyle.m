//
//  TTInsetStyle.m
//  TTStyleMacTest
//
//  Created by Steve Streza on 7/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TTInsetStyle.h"


@implementation TTInsetStyle

@synthesize inset = _inset;

///////////////////////////////////////////////////////////////////////////////////////////////////
// NSObject

+ (TTInsetStyle*)styleWithInset:(UIEdgeInsets)inset next:(TTStyle*)next {
	TTInsetStyle* style = [[[self alloc] initWithNext:next] autorelease];
	style.inset = inset;
	return style;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// NSObject

- (id)initWithNext:(TTStyle*)next {  
	if (self = [super initWithNext:next]) {
		_inset = UIEdgeInsetsZero;
	}
	return self;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// TTStyle

- (void)draw:(TTStyleContext*)context {
	CGRect rect = context.frame;
	context.frame = CGRectMake(rect.origin.x+_inset.left, rect.origin.y+_inset.top,
							   rect.size.width - (_inset.left + _inset.right),
							   rect.size.height - (_inset.top + _inset.bottom));
	[self.next draw:context];
}

- (UIEdgeInsets)addToInsets:(UIEdgeInsets)insets forSize:(CGSize)size {
	insets.top += _inset.top;
	insets.right += _inset.right;
	insets.bottom += _inset.bottom;
	insets.left += _inset.left;
	if (self.next) {
		return [self.next addToInsets:insets forSize:size];
	} else {
		return insets;
	}
}

@end
