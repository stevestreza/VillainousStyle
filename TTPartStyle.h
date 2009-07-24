//
//  TTPartStyle.h
//  TTStyleMacTest
//
//  Created by Steve Streza on 7/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTStyle.h"

@interface TTPartStyle : TTStyle {
	NSString* _name;
	TTStyle* _style;
}

@property(nonatomic,copy) NSString* name;
@property(nonatomic,retain) TTStyle* style;

+ (TTPartStyle*)styleWithName:(NSString*)name style:(TTStyle*)style next:(TTStyle*)next;

- (void)drawPart:(TTStyleContext*)context;
@end
