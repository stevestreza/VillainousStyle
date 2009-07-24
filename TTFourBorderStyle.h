//
//  TTFourBorderStyle.h
//  TTStyleMacTest
//
//  Created by Steve Streza on 7/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTStyle.h"

@interface TTFourBorderStyle : TTStyle {
	NSColor* _top;
	NSColor* _right;
	NSColor* _bottom;
	NSColor* _left;
	CGFloat _width;
}

@property(nonatomic,retain) NSColor* top;
@property(nonatomic,retain) NSColor* right;
@property(nonatomic,retain) NSColor* bottom;
@property(nonatomic,retain) NSColor* left;
@property(nonatomic) CGFloat width;

+ (TTFourBorderStyle*)styleWithTop:(NSColor*)top right:(NSColor*)right
							bottom:(NSColor*)bottom left:(NSColor*)left width:(CGFloat)width
							  next:(TTStyle*)next;

@end
