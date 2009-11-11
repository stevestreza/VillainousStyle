//
//  VSShadowStyle.m
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

#import "VSShadowStyle.h"
#import "NSColor+CGColor.h"

@implementation VSShadowStyle

@synthesize color = _color, blur = _blur, offset = _offset;

///////////////////////////////////////////////////////////////////////////////////////////////////
// class public

+ (VSShadowStyle*)styleWithColor:(NSColor*)color blur:(CGFloat)blur offset:(CGSize)offset
							next:(VSStyle*)next {
	VSShadowStyle* style = [[[self alloc] initWithNext:next] autorelease];
	style.color = color;
	style.blur = blur;
	style.offset = offset;
	return style;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// NSObject

- (id)initWithNext:(VSStyle*)next {  
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
// VSStyle

- (void)draw:(VSStyleContext*)context {
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
	
	context.frame = VSRectInset(context.frame, inset);
	context.contentFrame = VSRectInset(context.contentFrame, inset);
	
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

- (CGSize)addToSize:(CGSize)size context:(VSStyleContext*)context {
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
