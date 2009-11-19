//
//  VSReflectiveFillStyle.m
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

#import "VSReflectiveFillStyle.h"
#import "NSColorAdditions.h"

@implementation VSReflectiveFillStyle

@synthesize color = _color;

///////////////////////////////////////////////////////////////////////////////////////////////////
// class public

+ (VSReflectiveFillStyle*)styleWithColor:(VSColor*)color next:(VSStyle*)next {
	VSReflectiveFillStyle* style = [[[self alloc] initWithNext:next] autorelease];
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
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	CGRect rect = context.frame;
	
	CGContextSaveGState(ctx);
	[context.shape addToPath:rect];
	CGContextClip(ctx);
	
	[_color setFill];
	CGContextFillRect(ctx, rect);
	
	// XXjoe These numbers are totally biased towards the colors I tested with.  I need to figure out
	// a formula that works well for all colors
	VSColor* lighter = nil, *darker = nil;
	if (_color.value < 0.5) {
		lighter = HSVCOLOR(_color.hue, ZEROLIMIT(_color.saturation-0.5), ZEROLIMIT(_color.value+0.25));
		darker = HSVCOLOR(_color.hue, ZEROLIMIT(_color.saturation-0.1), ZEROLIMIT(_color.value+0.1));
	} else if (_color.saturation > 0.6) {
		lighter = HSVCOLOR(_color.hue, _color.saturation*0.3, _color.value*1);
		darker = HSVCOLOR(_color.hue, _color.saturation*0.9, _color.value+0.05);
	} else {
		lighter = HSVCOLOR(_color.hue, _color.saturation*0.4, _color.value*1.2);
		darker = HSVCOLOR(_color.hue, _color.saturation*0.9, _color.value+0.05);
	}
	//  //VSColor* lighter = [_color multiplyHue:1 saturation:0.5 value:1.35];
	//  //VSColor* darker = [_color multiplyHue:1 saturation:0.88 value:1.05];
	VSColor* colors[] = {darker, lighter};
	
	CGGradientRef gradient = [self newGradientWithColors:colors count:2];
	CGContextDrawLinearGradient(ctx, gradient, CGPointMake(rect.origin.x, rect.origin.y+(rect.size.height * 0.5)),
								CGPointMake(rect.origin.x, rect.origin.y+rect.size.height),
								kCGGradientDrawsAfterEndLocation );
	CGGradientRelease(gradient);
	
	CGContextRestoreGState(ctx);
	
	return [self.next draw:context];
}

@end
