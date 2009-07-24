//
//  TTStyleView.m
//  TTStyleMacTest
//
//  Created by Steve Streza on 7/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TTStyleView.h"
#import "NSView+TTStyle.h"

@implementation TTStyleView

@synthesize style;

-(void)drawRect:(NSRect)aRect{
	[self drawStyle:style inRect:[self bounds]];
}

-(void)dealloc{
    //STUB release your objects here
	self.style = nil;
    
    [super dealloc];
}

@end
