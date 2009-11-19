//
//  NSImageStyle.m
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

#import "VSMaskStyle.h"


@implementation VSMaskStyle

@synthesize mask = _mask;

///////////////////////////////////////////////////////////////////////////////////////////////////
// class public

+ (VSMaskStyle*)styleWithMask:(VSImage*)mask next:(VSStyle*)next {
	VSMaskStyle* style = [[[self alloc] initWithNext:next] autorelease];
	style.mask = mask;
	return style;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
// NSObject

- (id)initWithNext:(VSStyle*)next {  
	if (self = [super initWithNext:next]) {
		_mask = nil;
	}
	return self;
}

- (void)dealloc {
	[_mask release];
	[super dealloc];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// VSStyle

- (void)draw:(VSStyleContext*)context {
	if (_mask) {
		CGContextRef ctx = UIGraphicsGetCurrentContext();
		CGContextSaveGState(ctx);
		
		// Translate context upside-down to invert the clip-to-mask, which turns the mask upside down
		CGContextTranslateCTM(ctx, 0, context.frame.size.height);
		CGContextScaleCTM(ctx, 1.0, -1.0);
		
		CGRect maskRect = CGRectMake(0, 0, _mask.size.width, _mask.size.height);
		CGContextClipToMask(ctx, maskRect, _mask.CGImage);
		
		[self.next draw:context];
		CGContextRestoreGState(ctx);
	} else {
		return [self.next draw:context];
	}
}

@end
