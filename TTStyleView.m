//
//  TTStyleView.m
//  TTStyleMacTest
//
//  Created by Steve Streza on 7/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TTStyleView.h"
#import "NSView+TTStyle.h"
#import "TTStyleSheet.h"

#import "TTStyles.h"
#import "TTShapes.h"

@implementation TTStyleView

@synthesize style, styleName;

-(id)initWithFrame:(NSRect)frameRect{
	if(self = [super initWithFrame:frameRect]){
		[self addObservers];
	}
	return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder{
	if(self = [super initWithCoder:aDecoder]){
		[self addObservers];
	}
	return self;
}

-(id)init{
	if(self = [super init]){
		[self addObservers];
	}
	return self;
}

-(void)addObservers{
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(setNeedsDisplay) 
												 name:TTStyleSheetChangedNotification 
											   object:nil];	
}

-(void)removeObservers{
	[[NSNotificationCenter defaultCenter] removeObserver:self
													name:TTStyleSheetChangedNotification 
												  object:nil];
}

-(void)setNeedsDisplay{
	[self setNeedsDisplay:YES];
}

-(void)setStyleName:(NSString *)aStyleName{
	[styleName autorelease];
	styleName = [aStyleName copy];
	
	[self setStyle:TTStyleNamed(styleName)];
}

-(void)setStyle:(TTStyle *)aStyle{
	[style autorelease];
	style = [aStyle retain];
	
	[self setNeedsDisplay:YES];
}

-(void)drawRect:(NSRect)aRect{
	[self drawStyle:style inRect:[self bounds]];
}

-(void)dealloc{
    //STUB release your objects here
	self.style = nil;
	self.styleName = nil;

	[self removeObservers];    
    [super dealloc];
}

@end
