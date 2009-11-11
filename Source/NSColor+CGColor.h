//
//  NSColor+CGColor.h
//  TTStyleMacTest
//
//  Created by Steve Streza on 7/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSColor (CGColorRef)
@property (readonly) CGColorRef CGColor;
@end