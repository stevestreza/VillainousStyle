//
//  TTBoxStyle.h
//  TTStyleMacTest
//
//  Created by Steve Streza on 7/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTStyle.h"

@interface TTBoxStyle : TTStyle {
	UIEdgeInsets _margin;
	UIEdgeInsets _padding;
	CGSize _minSize;
	TTPosition _position;
}

@property(nonatomic) UIEdgeInsets margin;
@property(nonatomic) UIEdgeInsets padding;
@property(nonatomic) CGSize minSize;
@property(nonatomic) TTPosition position;

+ (TTBoxStyle*)styleWithMargin:(UIEdgeInsets)margin next:(TTStyle*)next;
+ (TTBoxStyle*)styleWithPadding:(UIEdgeInsets)padding next:(TTStyle*)next;
+ (TTBoxStyle*)styleWithFloats:(TTPosition)position next:(TTStyle*)next;
+ (TTBoxStyle*)styleWithMargin:(UIEdgeInsets)margin padding:(UIEdgeInsets)padding
						  next:(TTStyle*)next;
+ (TTBoxStyle*)styleWithMargin:(UIEdgeInsets)margin padding:(UIEdgeInsets)padding
					   minSize:(CGSize)minSize position:(TTPosition)position next:(TTStyle*)next;

@end
