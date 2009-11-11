//
//  TTShadowStyle.h
//  TTStyleMacTest
//
//  Created by Steve Streza on 7/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTStyle.h"

@interface TTShadowStyle : TTStyle {
	NSColor* _color;
	CGFloat _blur;
	CGSize _offset;
}

@property(nonatomic,retain) NSColor* color;
@property(nonatomic) CGFloat blur;
@property(nonatomic) CGSize offset;

+ (TTShadowStyle*)styleWithColor:(NSColor*)color blur:(CGFloat)blur offset:(CGSize)offset
							next:(TTStyle*)next;
@end
