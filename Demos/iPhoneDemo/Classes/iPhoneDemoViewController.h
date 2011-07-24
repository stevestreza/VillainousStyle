//
//  iPhoneDemoViewController.h
//  iPhoneDemo
//
//  Created by Steve Streza on 11/13/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <VillainousStyle/VSStyleView.h>

@interface iPhoneDemoViewController : UIViewController {
	IBOutlet VSStyleView *backgroundView;
	IBOutlet VSStyleView *topLeftView;
	IBOutlet VSStyleView *topRightView;
	IBOutlet VSStyleView *bottomLeftView;
	IBOutlet VSStyleView *bottomRightView;
}

@end

