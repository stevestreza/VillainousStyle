//
//  VSStyleController.h
//  VSStyleMacTest
//
//  Created by Steve Streza on 7/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VSStyleView.h"
#import "VSStyleLabel.h"

@interface VSStyleController : NSWindowController {
	IBOutlet VSStyleView *backgroundView;
	
	IBOutlet VSStyleView *styleView1;
	IBOutlet VSStyleView *styleView2;
	IBOutlet VSStyleView *styleView3;
	IBOutlet VSStyleLabel *styleView4;
	
	NSArray *styleSheets;
}

-(void)selectStyleSheetAtIndex:(NSUInteger)index;
-(IBAction)changeStyleSheet:sender;
@end
