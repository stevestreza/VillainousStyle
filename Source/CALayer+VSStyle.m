//
//  CALayer+VSStyle.m
//  VillainousStyle
//
//  Created by Steve Streza on 12/5/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "CALayer+VSStyle.h"
#import "VSStyleContext.h"

@implementation CALayer (VSStyle)

-(void)drawStyle:(VSStyle *)style inRect:(CGRect)rect{
	if (style) {
		VSStyleContext* context = [[[VSStyleContext alloc] init] autorelease];
		context.delegate = self;
		context.frame = rect;
		context.contentFrame = context.frame;
		
		[style draw:context];
		if (!context.didDrawContent) {
			[self drawContent:self.bounds];
		}
	}
}

@end