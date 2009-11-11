//
//  VSStyleLabel.m
//  VSStyleMac
//
//  Created by Steve Streza on 7/25/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "VSStyleLabel.h"


@implementation VSStyleLabel

@synthesize stringValue;

- (NSString*)textForLayerWithStyle:(VSStyle*)style{
	return self.stringValue;
}

-(void)dealloc{
    //STUB release your objects here
	[stringValue release];
    
    [super dealloc];
}

@end
