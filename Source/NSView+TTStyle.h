//
//  NSView+TTStyle.h
//  TTStyleMacTest
//
//  Created by Steve Streza on 7/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TTStyle;
@interface NSView (TTStyleAdditions)

-(void)drawStyle:(TTStyle *)style inRect:(NSRect)rect;

@end
