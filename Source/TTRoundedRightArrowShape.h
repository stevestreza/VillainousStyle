//
//  TTRoundedRightArrowShape.h
//  TTStyleMacTest
//
//  Created by Steve Streza on 7/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTShape.h"

@interface TTRoundedRightArrowShape : TTShape {
	CGFloat _radius;
}

@property(nonatomic) CGFloat radius;

+ (TTRoundedRightArrowShape*)shapeWithRadius:(CGFloat)radius;
@end
