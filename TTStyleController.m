//
//  TTStyleController.m
//  TTStyleMacTest
//
//  Created by Steve Streza on 7/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TTStyleController.h"

#import "TTStyles.h"
#import "TTShapes.h"

#import "LightStyleSheet.h"

@implementation TTStyleController

-(id)init{
    if(self = [super init]){
        //STUB initialize your object here
    }
	return self;
}

-(void)awakeFromNib{
	[TTStyleSheet setGlobalStyleSheet:[LightStyleSheet styleSheet]];
	
	styleView4.stringValue = @"Hello world!";
	
	styleView1.styleName = @"upperLeftStyle";
	styleView2.styleName = @"upperRightStyle";
	styleView3.styleName = @"lowerLeftStyle";
	styleView4.styleName = @"lowerRightStyle";
}

-(void)dealloc{
	//STUB release your objects here
	
	[super dealloc];
}

@end
