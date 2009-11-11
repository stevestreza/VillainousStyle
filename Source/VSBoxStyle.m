//
//  VSBoxStyle.m
//  VillainousStyle
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import "VSBoxStyle.h"


@implementation VSBoxStyle

@synthesize margin = _margin, padding = _padding, minSize = _minSize, position = _position;

///////////////////////////////////////////////////////////////////////////////////////////////////
// NSObject

+ (VSBoxStyle*)styleWithMargin:(UIEdgeInsets)margin next:(VSStyle*)next {
	VSBoxStyle* style = [[[self alloc] initWithNext:next] autorelease];
	style.margin = margin;
	return style;
}

+ (VSBoxStyle*)styleWithPadding:(UIEdgeInsets)padding next:(VSStyle*)next {
	VSBoxStyle* style = [[[self alloc] initWithNext:next] autorelease];
	style.padding = padding;
	return style;
}

+ (VSBoxStyle*)styleWithFloats:(VSPosition)position next:(VSStyle*)next {
	VSBoxStyle* style = [[[self alloc] initWithNext:next] autorelease];
	style.position = position;
	return style;
}

+ (VSBoxStyle*)styleWithMargin:(UIEdgeInsets)margin padding:(UIEdgeInsets)padding
						  next:(VSStyle*)next {
	VSBoxStyle* style = [[[self alloc] initWithNext:next] autorelease];
	style.margin = margin;
	style.padding = padding;
	return style;
}

+ (VSBoxStyle*)styleWithMargin:(UIEdgeInsets)margin padding:(UIEdgeInsets)padding
					   minSize:(CGSize)minSize position:(VSPosition)position next:(VSStyle*)next {
	VSBoxStyle* style = [[[self alloc] initWithNext:next] autorelease];
	style.margin = margin;
	style.padding = padding;
	style.minSize = minSize;
	style.position = position;
	return style;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// NSObject

- (id)initWithNext:(VSStyle*)next {  
	if (self = [super initWithNext:next]) {
		_margin = UIEdgeInsetsZero;
		_padding = UIEdgeInsetsZero;
		_minSize = CGSizeZero;
		_position = VSPositionStatic;
	}
	return self;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// VSStyle

- (void)draw:(VSStyleContext*)context {
	context.contentFrame = VSRectInset(context.contentFrame, _padding);
	[self.next draw:context];
}

- (CGSize)addToSize:(CGSize)size context:(VSStyleContext*)context {
	size.width += _padding.left + _padding.right;
	size.height += _padding.top + _padding.bottom;
	
	if (_next) {
		return [self.next addToSize:size context:context];
	} else {
		return size;
	}
}

@end
