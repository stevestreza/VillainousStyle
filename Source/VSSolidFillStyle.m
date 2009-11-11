//
//  VSSolidFillStyle.m
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

#import "VSSolidFillStyle.h"


@implementation VSSolidFillStyle

@synthesize color = _color;

///////////////////////////////////////////////////////////////////////////////////////////////////
// class public

+ (VSSolidFillStyle*)styleWithColor:(NSColor*)color next:(VSStyle*)next {
	VSSolidFillStyle* style = [[[self alloc] initWithNext:next] autorelease];
	style.color = color;
	return style;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// NSObject

- (id)initWithNext:(VSStyle*)next {  
	if (self = [super initWithNext:next]) {
		_color = nil;
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
	CGContextRef ctx = (CGContextRef)[[NSGraphicsContext currentContext] graphicsPort];
	
	CGContextSaveGState(ctx);
	[context.shape addToPath:context.frame];
	
	[_color setFill];
	CGContextFillPath(ctx);
	CGContextRestoreGState(ctx);
	
	return [self.next draw:context];
}

@end
