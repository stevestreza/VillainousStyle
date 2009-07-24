//
//  TTMaskStyle.h
//  TTStyleMacTest
//
//  Created by Steve Streza on 7/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTStyle.h"

@interface TTMaskStyle : TTStyle {
	NSImage* _mask;
}

@property(nonatomic,retain) NSImage* mask;

+ (TTMaskStyle*)styleWithMask:(NSImage*)mask next:(TTStyle*)next;

@end
