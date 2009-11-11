//
//  VSStyleController.m
//  VSStyleMacTest
//
//  Created by Steve Streza on 7/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "VSStyleController.h"

#import <VillainousStyle/VSStyles.h>
#import <VillainousStyle/VSShapes.h>

#import "LightStyleSheet.h"
#import "DarkStyleSheet.h"

@implementation VSStyleController

-(id)init{
    if(self = [super init]){
        //STUB initialize your object here
		styleSheets = [[NSArray arrayWithObjects:
						[LightStyleSheet styleSheet],
						[ DarkStyleSheet styleSheet],
					   nil] retain];
		
		[self selectStyleSheetAtIndex:0];

	}
	return self;
}

-(void)selectStyleSheetAtIndex:(NSUInteger)index{
	[VSStyleSheet setGlobalStyleSheet:[styleSheets objectAtIndex:index]];	
}

-(IBAction)changeStyleSheet:sender{
	NSUInteger index = [(NSPopUpButton *)sender selectedTag];
	NSLog(@"Selecting stylesheet %i",index);
	[self selectStyleSheetAtIndex:index];
}

-(void)awakeFromNib{
	styleView4.stringValue = @"Hello world!";
	
	backgroundView.styleName = @"backgroundStyle";
	styleView1.styleName = @"upperLeftStyle";
	styleView2.styleName = @"upperRightStyle";
	styleView3.styleName = @"lowerLeftStyle";
	styleView4.styleName = @"lowerRightStyle";
}

-(void)dealloc{
	//STUB release your objects here
	[styleSheets autorelease];
	
	[super dealloc];
}

@end
