//
//  iPhoneDemoAppDelegate.h
//  iPhoneDemo
//
//  Created by Steve Streza on 11/13/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class iPhoneDemoViewController;

@interface iPhoneDemoAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    iPhoneDemoViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet iPhoneDemoViewController *viewController;

@end

