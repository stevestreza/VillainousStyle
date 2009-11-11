//
//  TTRoundedRightArrowShape.m
//  TTStyleMacTest
//
//  Created by Steve Streza on 7/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TTRoundedRightArrowShape.h"


@implementation TTRoundedRightArrowShape

@synthesize radius = _radius;

///////////////////////////////////////////////////////////////////////////////////////////////////
// class public

+ (TTRoundedRightArrowShape*)shapeWithRadius:(CGFloat)radius {
	TTRoundedRightArrowShape* shape = [[[TTRoundedRightArrowShape alloc] init] autorelease];
	shape.radius = radius;
	return shape;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// public

- (void)addToPath:(CGRect)rect {
	[self openPath:rect];
	
	CGFloat fw = rect.size.width;
	CGFloat fh = rect.size.height;
	CGFloat point = floor(fh/kArrowPointWidth);
	CGFloat radius = TTRadius(_radius);
	CGFloat radius2 = radius*kArrowRadius;
	
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextMoveToPoint(context, fw, floor(fh/2));
	CGContextAddArcToPoint(context, fw-point, fh, 0, fh, radius2);
	CGContextAddArcToPoint(context, 0, fh, 0, 0, radius);
	CGContextAddArcToPoint(context, 0, 0, fw-point, 0, radius);
	CGContextAddArcToPoint(context, fw-point, 0, fw, floor(fh/2), radius2);
	CGContextAddLineToPoint(context, fw, floor(fh/2));
	
	[self closePath:rect];
}

- (void)addTopEdgeToPath:(CGRect)rect lightSource:(NSInteger)lightSource {
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGFloat fw = rect.size.width;
	CGFloat fh = rect.size.height;
	CGFloat point = floor(fh/kArrowPointWidth);
	CGFloat radius = TTRadius(_radius);
	CGFloat radius2 = radius*kArrowRadius;
	
	if (lightSource >= 0 && lightSource <= 90) {
		CGContextMoveToPoint(context, radius, 0);
	} else {
		CGContextMoveToPoint(context, 0, radius);
		CGContextAddArcToPoint(context, 0, 0, radius, 0, radius);
	}
	CGContextAddLineToPoint(context, fw-(point+radius2), 0);
	CGContextAddArcToPoint(context, fw-point, 0, fw, floor(fh/2), radius2);
	CGContextAddLineToPoint(context, fw, floor(fh/2));
}

- (void)addRightEdgeToPath:(CGRect)rect lightSource:(NSInteger)lightSource {
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGFloat fw = rect.size.width;
	CGFloat fh = rect.size.height;
	CGFloat point = floor(fh/kArrowPointWidth);
	CGFloat radius = TTRadius(_radius);
	CGFloat radius2 = radius*kArrowRadius;
	
	CGContextMoveToPoint(context, fw, floor(fh/2));
	CGContextAddArcToPoint(context, fw-point, fh, fw-(point+radius2), fh, radius2);
	CGContextAddLineToPoint(context, fw-(point+radius2), fh);
}

- (void)addBottomEdgeToPath:(CGRect)rect lightSource:(NSInteger)lightSource {
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGFloat fw = rect.size.width;
	CGFloat fh = rect.size.height;
	CGFloat point = floor(fh/kArrowPointWidth);
	CGFloat radius = TTRadius(_radius);
	CGFloat radius2 = radius*kArrowRadius;
	
	CGContextMoveToPoint(context, floor(fw-(point+radius2)), fh);
	CGContextAddArcToPoint(context, 0, fh, 0, floor(fh-radius), radius);
}

- (void)addLeftEdgeToPath:(CGRect)rect lightSource:(NSInteger)lightSource {
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGFloat fh = rect.size.height;
	CGFloat radius = TTRadius(_radius);
	
	CGContextMoveToPoint(context, 0, floor(fh-radius));
	CGContextAddLineToPoint(context, 0, floor(radius));
	
	if (lightSource >= 0 && lightSource <= 90) {
		CGContextAddArcToPoint(context, 0, 0, floor(radius), 0, radius);
	}
}

- (UIEdgeInsets)insetsForSize:(CGSize)size {
	CGFloat fh = size.height/3;
	return UIEdgeInsetsMake(0, 0, 0, floor(TTRadius(_radius)));
	//  CGFloat fh = size.height/3;
	//  return UIEdgeInsetsMake(floor(TTRadius(_radius)), floor(TTRadius(_radius)),
	//                          floor(TTRadius(_radius)), floor(TTRadius(_radius))*2);
}

@end
