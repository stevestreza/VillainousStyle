//
//  TTPartStyle.m
//  TTStyleMacTest
//
//  Created by Steve Streza on 7/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TTPartStyle.h"


@implementation TTPartStyle

@synthesize name = _name, style = _style;

///////////////////////////////////////////////////////////////////////////////////////////////////
// class public

+ (TTPartStyle*)styleWithName:(NSString*)name style:(TTStyle*)stylez next:(TTStyle*)next {
	TTPartStyle* style = [[[self alloc] initWithNext:next] autorelease];
	style.name = name;
	style.style = stylez;
	return style;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// TTStyle

- (void)draw:(TTStyleContext*)context {
	[self.next draw:context];
}


///////////////////////////////////////////////////////////////////////////////////////////////////

- (void)drawPart:(TTStyleContext*)context {
	[_style draw:context];
}

@end
