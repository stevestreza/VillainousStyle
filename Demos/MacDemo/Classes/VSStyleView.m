//
//  VSStyleView.m
//  VSStyleMacTest
//
//  Created by Steve Streza on 7/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "VSStyleView.h"
#import "NSView+VSStyle.h"
#import "VSStyleSheet.h"

#import "VSStyles.h"
#import "VSShapes.h"

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
	[self drawStyle:[self style] inRect:[self bounds]];
}

-(VSStyle *)style{
	if(styleName){
		return [[VSStyleSheet globalStyleSheet] styleWithSelector:styleName];
	}else{
		return style;
	}
}

-(void)dealloc{
    //STUB release your objects here
	self.style = nil;
	self.styleName = nil;

	[self removeObservers];    
    [super dealloc];
}

@end
