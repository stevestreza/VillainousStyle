//
//  TTRoundedRectangleShape.h
//  TTStyleMacTest
//
//  Created by Steve Streza on 7/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTShape.h"

@interface TTRoundedRectangleShape : TTShape {
	CGFloat _topLeftRadius;
	CGFloat _topRightRadius;
	CGFloat _bottomRightRadius;
	CGFloat _bottomLeftRadius;
}

@property(nonatomic) CGFloat topLeftRadius;
@property(nonatomic) CGFloat topRightRadius;
@property(nonatomic) CGFloat bottomRightRadius;
@property(nonatomic) CGFloat bottomLeftRadius;

+ (TTRoundedRectangleShape*)shapeWithRadius:(CGFloat)radius;

+ (TTRoundedRectangleShape*)shapeWithTopLeft:(CGFloat)topLeft topRight:(CGFloat)topRight
								 bottomRight:(CGFloat)bottomRight bottomLeft:(CGFloat)bottomLeft;

@end
