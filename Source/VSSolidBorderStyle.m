//
//  VSSolidBorderStyle.m
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

#import "VSSolidBorderStyle.h"
#import "NSColor+CGColor.h"


@implementation VSSolidBorderStyle

@synthesize color = _color, width = _width;

///////////////////////////////////////////////////////////////////////////////////////////////////
// NSObject

+ (VSSolidBorderStyle*)styleWithColor:(VSColor*)color width:(CGFloat)width next:(VSStyle*)next {
	VSSolidBorderStyle* style = [[[self alloc] initWithNext:next] autorelease];
	style.color = color;
	style.width = width;
	return style;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// NSObject

- (id)initWithNext:(VSStyle*)next {  
	if (self = [super initWithNext:next]) {
		_color = nil;
		_width = 1;
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
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	CGContextSaveGState(ctx);
	
	CGRect strokeRect = CGRectInset(context.frame, _width/2, _width/2);
	[context.shape addToPath:strokeRect];
	
	[_color setStroke];
	CGContextSetLineWidth(ctx, _width);
	CGContextStrokePath(ctx);
	
	CGContextRestoreGState(ctx);
	
	context.frame = CGRectInset(context.frame, _width, _width);
	return [self.next draw:context];
}

@end
