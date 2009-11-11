//
//  NSView+TTStyle.m
//  TTStyleMacTest
//
//  Created by Steve Streza on 7/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "NSView+TTStyle.h"
#import "TTStyleContext.h"

@implementation NSView (TTStyleAdditions)

//STUB add your category method implementations here
-(void)drawStyle:(TTStyle *)style inRect:(NSRect)rect{
	if (style) {
		TTStyleContext* context = [[[TTStyleContext alloc] init] autorelease];
		context.delegate = self;
		context.frame = NSRectToCGRect(rect);
		context.contentFrame = context.frame;
		
		[style draw:context];
		if (!context.didDrawContent) {
//			[self drawContent:self.bounds];
		}
	}
}

@end
