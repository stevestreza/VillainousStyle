//
//  TTSpeechBubbleShape.h
//  TTStyleMacTest
//
//  Created by Steve Streza on 7/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTShape.h"

@interface TTSpeechBubbleShape : TTShape {
	CGFloat _radius;
	CGFloat _pointLocation;
	CGFloat _pointAngle;
	CGSize _pointSize;
}

@property(nonatomic) CGFloat radius;
@property(nonatomic) CGFloat pointLocation;
@property(nonatomic) CGFloat pointAngle;
@property(nonatomic) CGSize pointSize;

+ (TTSpeechBubbleShape*)shapeWithRadius:(CGFloat)radius pointLocation:(CGFloat)pointLocation
							 pointAngle:(CGFloat)pointAngle pointSize:(CGSize)pointSize;

@end
