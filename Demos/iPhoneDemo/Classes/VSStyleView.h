//
//  VSStyleView.h
//  iPhoneDemo
//
//  Created by Steve Streza on 11/19/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VSStyles.h"

@interface VSStyleView : UIView {
	VSStyle *style;
	NSString *styleName;
	
	BOOL displayLock;
}

//STUB add your method declarations here
@property (nonatomic,retain) VSStyle *style;
@property (nonatomic,copy)   NSString *styleName;

@end
