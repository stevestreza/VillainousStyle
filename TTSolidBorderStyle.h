//
//  TTSolidBorderStyle.h
//  TTStyleMacTest
//
//  Created by Steve Streza on 7/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTStyle.h"

@interface TTSolidBorderStyle : TTStyle {
    //STUB add your instance variables here
	NSColor *_color;
	CGFloat _width;
}

//STUB add your method declarations here
@property (nonatomic, retain) NSColor *color;
@property (nonatomic, assign) CGFloat width;

+ (TTSolidBorderStyle*)styleWithColor:(NSColor*)color width:(CGFloat)width next:(TTStyle*)next;

@end
