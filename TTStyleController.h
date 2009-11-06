//
//  TTStyleController.h
//  TTStyleMacTest
//
//  Created by Steve Streza on 7/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTStyleView.h"
#import "TTStyleLabel.h"

@interface TTStyleController : NSWindowController {
	IBOutlet TTStyleView *backgroundView;
	
	IBOutlet TTStyleView *styleView1;
	IBOutlet TTStyleView *styleView2;
	IBOutlet TTStyleView *styleView3;
	IBOutlet TTStyleLabel *styleView4;
	
	NSArray *styleSheets;
}

-(void)selectStyleSheetAtIndex:(NSUInteger)index;
-(IBAction)changeStyleSheet:sender;
@end
