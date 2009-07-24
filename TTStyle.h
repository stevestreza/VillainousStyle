//
//  TTStyle.h
//  TTStyleMacTest
//
//  Created by Steve Streza on 7/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTGlobal.h"
#import "TTShape.h"
#import "TTStyleContext.h"

static const NSInteger kDefaultLightSource = 125;

@interface TTStyle : NSObject {
	TTStyle* _next;
}

@property(nonatomic,retain) TTStyle* next;

- (id)initWithNext:(TTStyle*)next;

- (void)draw:(TTStyleContext*)context;

- (UIEdgeInsets)addToInsets:(UIEdgeInsets)insets forSize:(CGSize)size;
- (CGSize)addToSize:(CGSize)size context:(TTStyleContext*)context;

- (void)addStyle:(TTStyle*)style;

- (id)firstStyleOfClass:(Class)cls;
- (id)styleForPart:(NSString*)name;


- (CGGradientRef)newGradientWithColors:(NSColor**)colors count:(int)count ;

@end
