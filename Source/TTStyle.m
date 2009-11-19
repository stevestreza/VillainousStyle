//
//  VSStyle.m
//  VSStyleMacTest
//
//  Created by Steve Streza on 7/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "VSStyle.h"
#import "VSPartStyle.h"
#import "NSColor+CGColor.h"
@implementation VSStyle

@synthesize next=_next;

- (id)initWithNext:(VSStyle*)next {
	if (self = [super init]) {
		_next = [next retain];
	}
	return self;
}

- (id)init {
	return [self initWithNext:nil];
}

- (void)dealloc {
	[_next release];
	[super dealloc];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// public

- (void)draw:(VSStyleContext*)context {
	[self.next draw:context];
}

- (UIEdgeInsets)addToInsets:(UIEdgeInsets)insets forSize:(CGSize)size {
	if (self.next) {
		return [self.next addToInsets:insets forSize:size];
	} else {
		return insets;
	}
}

- (CGSize)addToSize:(CGSize)size context:(VSStyleContext*)context {
	if (_next) {
		return [self.next addToSize:size context:context];
	} else {
		return size;
	}
}

- (void)addStyle:(VSStyle*)style {
	if (_next) {
		[_next addStyle:style];
	} else {
		_next = [style retain];
	}
}

- (id)firstStyleOfClass:(Class)cls {
	if ([self isKindOfClass:cls]) {
		return self;
	} else {
		return [self.next firstStyleOfClass:cls];
	}
}

- (id)styleForPart:(NSString*)name {
	VSStyle* style = self;
	while (style) {
		if ([style isKindOfClass:[VSPartStyle class]]) {
			VSPartStyle* partStyle = (VSPartStyle*)style;
			if ([partStyle.name isEqualToString:name]) {
				return partStyle;
			}
		}
		style = style.next;
	}
	return nil;
}

- (CGGradientRef)newGradientWithColors:(NSColor**)colors count:(int)count {
	CGFloat* components = malloc(sizeof(CGFloat)*4*count);
	int i = 0;
	for (i = 0; i < count; ++i) {
		NSColor* color = colors[count-i-1];
		size_t n = CGColorGetNumberOfComponents(color.CGColor);
		const CGFloat* rgba = CGColorGetComponents(color.CGColor);
		if (n == 2) {
			components[i*4] = rgba[0];
			components[i*4+1] = rgba[0];
			components[i*4+2] = rgba[0];
			components[i*4+3] = rgba[1];
		} else if (n == 4) {
			components[i*4] = rgba[0];
			components[i*4+1] = rgba[1];
			components[i*4+2] = rgba[2];
			components[i*4+3] = rgba[3];
		}
	}
	
	CGColorSpaceRef space = [[NSColorSpace deviceRGBColorSpace] CGColorSpace];
	CGGradientRef gradient = CGGradientCreateWithColorComponents(space, components, nil, count);
	free(components);
	return gradient;
}



@end
