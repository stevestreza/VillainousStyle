//
//  TTStyleLabel.m
//  TTStyleMac
//
//  Created by Steve Streza on 7/25/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TTStyleLabel.h"


@implementation TTStyleLabel

@synthesize stringValue;

- (NSString*)textForLayerWithStyle:(TTStyle*)style{
	return self.stringValue;
}

-(void)dealloc{
    //STUB release your objects here
	[stringValue release];
    
    [super dealloc];
}

@end
