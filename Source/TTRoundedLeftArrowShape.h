//
//  TTRoundedLeftArrowShape.h
//  TTStyleMacTest
//
//  Created by Steve Streza on 7/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTShape.h"

@interface TTRoundedLeftArrowShape : TTShape {
	CGFloat _radius;
}

@property(nonatomic) CGFloat radius;

+ (TTRoundedLeftArrowShape*)shapeWithRadius:(CGFloat)radius;

@end
