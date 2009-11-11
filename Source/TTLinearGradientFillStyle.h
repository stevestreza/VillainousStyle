//
//  TTLinearGradientStyle.h
//  TTStyleMacTest
//
//  Created by Steve Streza on 7/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTStyle.h"

@interface TTLinearGradientFillStyle : TTStyle {
	NSColor* _color1;
	NSColor* _color2;
}

@property(nonatomic,retain) NSColor* color1;
@property(nonatomic,retain) NSColor* color2;

+ (TTLinearGradientFillStyle*)styleWithColor1:(NSColor*)color1 color2:(NSColor*)color2
										 next:(TTStyle*)next;
@end
