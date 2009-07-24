//
//  TTSolidFillStyle.h
//  TTStyleMacTest
//
//  Created by Steve Streza on 7/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTStyle.h"

@interface TTSolidFillStyle : TTStyle {
	NSColor* _color;
}

@property(nonatomic,retain) NSColor* color;

+ (TTSolidFillStyle*)styleWithColor:(NSColor*)color next:(TTStyle*)next;

@end
