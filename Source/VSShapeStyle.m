//
//  VSShapeStyle.m
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

#import "VSShapeStyle.h"


@implementation VSShapeStyle

@synthesize shape = _shape;

///////////////////////////////////////////////////////////////////////////////////////////////////
// NSObject

+ (VSShapeStyle*)styleWithShape:(VSShape*)shape next:(VSStyle*)next {
	VSShapeStyle* style = [[[self alloc] initWithNext:next] autorelease];
	style.shape = shape;
	return style;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// NSObject

- (id)initWithNext:(VSStyle*)next {  
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
// VSStyle

- (void)draw:(VSStyleContext*)context {
	UIEdgeInsets shapeInsets = [_shape insetsForSize:context.frame.size];
	context.contentFrame = VSRectInset(context.contentFrame, shapeInsets);
	context.shape = _shape;
	
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	CGContextSaveGState(ctx);
	
	CGContextBeginPath(ctx);
	
	[_shape addToPath:context.contentFrame];
	CGContextClip(ctx);
	
	[self.next draw:context];
	
	CGContextRestoreGState(ctx);
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

- (CGSize)addToSize:(CGSize)size context:(VSStyleContext*)context {
	CGSize innerSize = [self.next addToSize:size context:context];
	UIEdgeInsets shapeInsets = [_shape insetsForSize:innerSize];
	innerSize.width += shapeInsets.left + shapeInsets.right;
	innerSize.height += shapeInsets.top + shapeInsets.bottom;
	
	return innerSize;
}

@end
