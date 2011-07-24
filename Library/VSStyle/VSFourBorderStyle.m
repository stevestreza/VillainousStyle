//
//  VSFourBorderStyle.m
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

#import "VSFourBorderStyle.h"


@implementation VSFourBorderStyle

@synthesize top = _top, right = _right, bottom = _bottom, left = _left, width = _width;

///////////////////////////////////////////////////////////////////////////////////////////////////
// NSObject

+ (VSFourBorderStyle*)styleWithTop:(VSColor*)top right:(VSColor*)right bottom:(VSColor*)bottom
							  left:(VSColor*)left width:(CGFloat)width next:(VSStyle*)next {
	VSFourBorderStyle* style = [[[self alloc] initWithNext:next] autorelease];
	style.top = top;
	style.right = right;
	style.bottom = bottom;
	style.left = left;
	style.width = width;
	return style;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// NSObject

- (id)initWithNext:(VSStyle*)next {  
	if (self = [super initWithNext:next]) {
		_top = nil;
		_right = nil;
		_bottom = nil;
		_left = nil;
		_width = 1;
	}
	return self;
}

- (void)dealloc {
	[_top release];
	[_right release];
	[_bottom release];
	[_left release];
	[super dealloc];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// VSStyle

- (void)draw:(VSStyleContext*)context {
	CGRect rect = context.frame;
	CGRect strokeRect = CGRectInset(rect, _width/2, _width/2);
	[context.shape openPath:strokeRect];
	
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	CGContextSetLineWidth(ctx, _width);
	
	[context.shape addTopEdgeToPath:strokeRect lightSource:kDefaultLightSource];
	if (_top) {
		[_top setStroke];
	} else {
		[[VSColor clearColor] setStroke];
	}
	CGContextStrokePath(ctx);
	
	[context.shape addRightEdgeToPath:strokeRect lightSource:kDefaultLightSource];
	if (_right) {
		[_right setStroke];
	} else {
		[[VSColor clearColor] setStroke];
	}
	CGContextStrokePath(ctx);
	
	[context.shape addBottomEdgeToPath:strokeRect lightSource:kDefaultLightSource];
	if (_bottom) {
		[_bottom setStroke];
	} else {
		[[VSColor clearColor] setStroke];
	}
	CGContextStrokePath(ctx);
	
	[context.shape addLeftEdgeToPath:strokeRect lightSource:kDefaultLightSource];
	if (_left) {
		[_left setStroke];
	} else {
		[[VSColor clearColor] setStroke];
	}
	CGContextStrokePath(ctx);
	
	CGContextRestoreGState(ctx);
	
	context.frame = CGRectMake(rect.origin.x + (_left ? _width : 0),
							   rect.origin.y + (_top ? _width : 0),
							   rect.size.width - ((_left ? _width : 0) + (_right ? _width : 0)),
							   rect.size.height - ((_top ? _width : 0) + (_bottom ? _width : 0)));
	return [self.next draw:context];
}

@end
