//
//  VSStyleView.m
//  VSStyleMacTest
//
//  Created by Steve Streza on 7/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "VSStyleView.h"
#import <VillainousStyle/NSView+VSStyle.h>
#import <VillainousStyle/VSStyleSheet.h>

#import <VillainousStyle/VSStyles.h>
#import <VillainousStyle/VSShapes.h>

@implementation VSStyleView

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
												 name:VSStyleSheetChangedNotification 
											   object:nil];	
}

-(void)removeObservers{
	[[NSNotificationCenter defaultCenter] removeObserver:self
													name:VSStyleSheetChangedNotification 
												  object:nil];
}

-(void)setNeedsDisplay{
//	NSLog(@"Updating style named %@",styleName);
	[self setStyle:VSStyleNamed(styleName)];
	[self setNeedsDisplay:YES];
}

-(void)setStyleName:(NSString *)aStyleName{
	if([styleName isEqualToString:aStyleName]) return;
	
	[styleName autorelease];
	styleName = [aStyleName copy];
	
	[self setNeedsDisplay];
}

-(void)setStyle:(VSStyle *)aStyle{
	[style autorelease];
	style = [aStyle retain];
	
	[self setNeedsDisplay:YES];
}

-(void)drawRect:(NSRect)aRect{
//	NSLog(@"Drawing style in rect - %@", [[VSStyleSheet globalStyleSheet] className]);
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
