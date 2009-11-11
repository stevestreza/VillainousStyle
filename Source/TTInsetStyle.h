//
//  TTInsetStyle.h
//  TTStyleMacTest
//
//  Created by Steve Streza on 7/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTGlobal.h"
#import "TTStyle.h";

@interface TTInsetStyle : TTStyle {
	UIEdgeInsets _inset;
}

@property(nonatomic) UIEdgeInsets inset;

+ (TTInsetStyle*)styleWithInset:(UIEdgeInsets)inset next:(TTStyle*)next;

@end
