//
//  VSLinearGradientStyle.m
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

#import "VSLinearGradientFillStyle.h"
#import "NSColor+CGColor.h"

@implementation VSLinearGradientFillStyle

@synthesize color1 = _color1, color2 = _color2;

///////////////////////////////////////////////////////////////////////////////////////////////////
// class public

+ (VSLinearGradientFillStyle*)styleWithColor1:(VSColor*)color1 color2:(VSColor*)color2
										 next:(VSStyle*)next {
	VSLinearGradientFillStyle* style = [[[self alloc] initWithNext:next] autorelease];
	style.color1 = color1;
	style.color2 = color2;
	return style;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// NSObject

- (id)initWithNext:(VSStyle*)next {  
	if (self = [super initWithNext:next]) {
		_color1 = nil;
		_color2 = nil;
	}
	return self;
}

- (void)dealloc {
	[_color1 release];
	[_color2 release];
	[super dealloc];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// VSStyle

- (void)draw:(VSStyleContext*)context {
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	CGRect rect = context.frame;
	
	CGContextSaveGState(ctx);
	[context.shape addToPath:rect];
	CGContextClip(ctx);
	
	VSColor* colors[] = {_color1, _color2};
	CGGradientRef gradient = [self newGradientWithColors:colors count:2];
	CGContextDrawLinearGradient(ctx, gradient, CGPointMake(rect.origin.x, rect.origin.y),
								CGPointMake(rect.origin.x, rect.origin.y+rect.size.height), kCGGradientDrawsAfterEndLocation);
	CGGradientRelease(gradient);
	
	CGContextRestoreGState(ctx);
	
	return [self.next draw:context];
}

@end
