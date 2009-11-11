//
//  TTBevelBorderStyle.h
//  TTStyleMacTest
//
//  Created by Steve Streza on 7/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTStyle.h"

@interface TTBevelBorderStyle : TTStyle {
	NSColor* _highlight;
	NSColor* _shadow;
	CGFloat _width;
	NSInteger _lightSource;
}

@property(nonatomic,retain) NSColor* highlight;
@property(nonatomic,retain) NSColor* shadow;
@property(nonatomic) CGFloat width;
@property(nonatomic) NSInteger lightSource;

+ (TTBevelBorderStyle*)styleWithColor:(NSColor*)color width:(CGFloat)width next:(TTStyle*)next;

+ (TTBevelBorderStyle*)styleWithHighlight:(NSColor*)highlight shadow:(NSColor*)shadow
									width:(CGFloat)width lightSource:(NSInteger)lightSource next:(TTStyle*)next;

@end
