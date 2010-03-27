//
//  VSStyleView.h
//  VSStyleMacTest
//
//  Created by Steve Streza on 7/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VSStyles.h"

@interface VSStyleView : NSView {
    //STUB add your instance variables here
	VSStyle *style;
	NSString *styleName;
}

//STUB add your method declarations here
@property (nonatomic,retain) VSStyle *style;
@property (nonatomic,copy)   NSString *styleName;

@end
