//
//  VSStyleView.m
//  iPhoneDemo
//
//  Created by Steve Streza on 11/19/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <VillainousStyle/VSStyleView.h>
#import "NSView+VSStyle.h"			
#import <VillainousStyle/VSStyleSheet.h>

#import <VillainousStyle/VSStyles.h>
#import <VillainousStyle/VSShapes.h>

@implementation VSStyleView

@synthesize style, styleName;

-(id)initWithFrame:(CGRect)frameRect{
	if(self = [super initWithFrame:frameRect]){
		[self addObservers];
		self.opaque = NO;
	}
	return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder{
	if(self = [super initWithCoder:aDecoder]){
		[self addObservers];
		self.opaque = NO;
	}
	return self;
}

-(id)init{
	if(self = [super init]){
		[self addObservers];
		self.opaque = NO;
	}
	return self;
}

-(void)addObservers{
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(setNeedsStyleReload) 
												 name:VSStyleSheetChangedNotification 
											   object:nil];	
}

-(void)removeObservers{
	[[NSNotificationCenter defaultCenter] removeObserver:self
													name:VSStyleSheetChangedNotification 
												  object:nil];
}

-(void)setFrame:(CGRect)newFrame{
	[super setFrame:newFrame];
	[self setNeedsDisplay];
}

-(void)setNeedsStyleReload{
	if(styleName){
		VSStyle *newStyle = VSStyleNamed(styleName);
		//	NSLog(@"Updating style named %@",styleName);
		if(newStyle){
			[self setStyle:newStyle];
			[self setNeedsDisplay];
		}
	}
}

-(void)setStyleName:(NSString *)aStyleName{
	if([styleName isEqualToString:aStyleName]) return;
	
	[styleName autorelease];
	styleName = [aStyleName copy];
	
	[self setNeedsStyleReload];
}

-(void)setStyle:(VSStyle *)aStyle{
	[style autorelease];
	style = [aStyle retain];
	
	[self setNeedsDisplay];
}

-(void)drawRect:(CGRect)aRect{
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
