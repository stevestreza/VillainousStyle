//
//  iPhoneDemoAppDelegate.m
//  iPhoneDemo
//
//  Created by Steve Streza on 11/13/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "iPhoneDemoAppDelegate.h"
#import "iPhoneDemoViewController.h"
#import "LightStyleSheet.h"
#import "DarkStyleSheet.h"

@implementation iPhoneDemoAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
	
	[VSStyleSheet setGlobalStyleSheet:[LightStyleSheet styleSheet]];
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
