//
//  TTStyleView.m
//  TTStyleMacTest
//
//  Created by Steve Streza on 7/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TTStyleView.h"
#import <TTStyle/NSView+TTStyle.h>
#import <TTStyle/TTStyleSheet.h>

#import <TTStyle/TTStyles.h>
#import <TTStyle/TTShapes.h>

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
//	NSLog(@"Updating style named %@",styleName);
	[self setStyle:TTStyleNamed(styleName)];
	[self setNeedsDisplay:YES];
}

-(void)setStyleName:(NSString *)aStyleName{
	if([styleName isEqualToString:aStyleName]) return;
	
	[styleName autorelease];
	styleName = [aStyleName copy];
	
	[self setNeedsDisplay];
}

-(void)setStyle:(TTStyle *)aStyle{
	[style autorelease];
	style = [aStyle retain];
	
	[self setNeedsDisplay:YES];
}

-(void)drawRect:(NSRect)aRect{
//	NSLog(@"Drawing style in rect - %@", [[TTStyleSheet globalStyleSheet] className]);
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
