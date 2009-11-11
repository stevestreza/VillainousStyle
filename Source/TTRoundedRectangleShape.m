//
//  TTRoundedRectangleShape.m
//  TTStyleMacTest
//
//  Created by Steve Streza on 7/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TTRoundedRectangleShape.h"


@implementation TTRoundedRectangleShape

@synthesize topLeftRadius = _topLeftRadius, topRightRadius = _topRightRadius,
bottomRightRadius = _bottomRightRadius, bottomLeftRadius = _bottomLeftRadius;

///////////////////////////////////////////////////////////////////////////////////////////////////
// class public

+ (TTRoundedRectangleShape*)shapeWithRadius:(CGFloat)radius {
	TTRoundedRectangleShape* shape = [[[TTRoundedRectangleShape alloc] init] autorelease];
	shape.topLeftRadius = shape.topRightRadius = shape.bottomRightRadius = shape.bottomLeftRadius
    = radius;
	return shape;
}

+ (TTRoundedRectangleShape*)shapeWithTopLeft:(CGFloat)topLeft topRight:(CGFloat)topRight
								 bottomRight:(CGFloat)bottomRight bottomLeft:(CGFloat)bottomLeft {
	TTRoundedRectangleShape* shape = [[[TTRoundedRectangleShape alloc] init] autorelease];
	shape.topLeftRadius = topLeft;
	shape.topRightRadius = topRight;
	shape.bottomRightRadius = bottomRight;
	shape.bottomLeftRadius = bottomLeft;
	return shape;
}      

///////////////////////////////////////////////////////////////////////////////////////////////////
// public

- (void)addToPath:(CGRect)rect {
	[self openPath:rect];
	
	CGFloat fw = rect.size.width;
	CGFloat fh = rect.size.height;
	
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextMoveToPoint(context, fw, floor(fh/2));
	CGContextAddArcToPoint(context, fw, fh, floor(fw/2), fh, TTRadius(_bottomRightRadius));
	CGContextAddArcToPoint(context, 0, fh, 0, floor(fh/2), TTRadius(_bottomLeftRadius));
	CGContextAddArcToPoint(context, 0, 0, floor(fw/2), 0, TTRadius(_topLeftRadius));
	CGContextAddArcToPoint(context, fw, 0, fw, floor(fh/2), TTRadius(_topRightRadius));
	
	[self closePath:rect];
}

- (void)addInverseToPath:(CGRect)rect {
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	CGFloat fw = rect.size.width;
	CGFloat fh = rect.size.height;
	
	CGFloat width = 5;
	CGRect shadowRect = CGRectMake(-width, -width, fw+width*2, fh+width*2);
	CGMutablePathRef path = CGPathCreateMutable();
	CGPathAddRect(path, nil, shadowRect);
	CGPathCloseSubpath(path);
	
	CGPathMoveToPoint(path, nil, fw, floor(fh/2));
	CGPathAddArcToPoint(path, nil, fw, fh, floor(fw/2), fh, TTRadius(_bottomRightRadius));
	CGPathAddArcToPoint(path, nil, 0, fh, 0, floor(fh/2), TTRadius(_bottomLeftRadius));
	CGPathAddArcToPoint(path, nil, 0, 0, floor(fw/2), 0, TTRadius(_topLeftRadius));
	CGPathAddArcToPoint(path, nil, fw, 0, fw, floor(fh/2), TTRadius(_topRightRadius));
	CGPathCloseSubpath(path);
	
	[self openPath:rect];
	CGContextAddPath(context, path);
	[self closePath:rect];
	
	CGPathRelease(path);
}

- (void)addTopEdgeToPath:(CGRect)rect lightSource:(NSInteger)lightSource {
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGFloat fw = rect.size.width;
	CGFloat fh = rect.size.height;
	
	if (lightSource >= 0 && lightSource <= 90) {
		CGContextMoveToPoint(context, TTRadius(_topLeftRadius), 0);
	} else {
		CGContextMoveToPoint(context, 0, TTRadius(_topLeftRadius));
		CGContextAddArcToPoint(context, 0, 0, TTRadius(_topLeftRadius), 0, TTRadius(_topLeftRadius));
	}
	CGContextAddArcToPoint(context, fw, 0, fw, TTRadius(_topRightRadius), TTRadius(_topRightRadius));
	CGContextAddLineToPoint(context, fw, TTRadius(_topRightRadius));
}

- (void)addRightEdgeToPath:(CGRect)rect lightSource:(NSInteger)lightSource {
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGFloat fw = rect.size.width;
	CGFloat fh = rect.size.height;
	
	CGContextMoveToPoint(context, fw, TTRadius(_topRightRadius));
	CGContextAddArcToPoint(context, fw, fh, fw-TTRadius(_bottomRightRadius), fh, TTRadius(_bottomRightRadius));
	CGContextAddLineToPoint(context, fw-TTRadius(_bottomRightRadius), fh);
}

- (void)addBottomEdgeToPath:(CGRect)rect lightSource:(NSInteger)lightSource {
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGFloat fw = rect.size.width;
	CGFloat fh = rect.size.height;
	
	CGContextMoveToPoint(context, fw-TTRadius(_bottomRightRadius), fh);
	CGContextAddLineToPoint(context, TTRadius(_bottomLeftRadius), fh);
	CGContextAddArcToPoint(context, 0, fh, 0, fh-TTRadius(_bottomLeftRadius), TTRadius(_bottomLeftRadius));
}

- (void)addLeftEdgeToPath:(CGRect)rect lightSource:(NSInteger)lightSource {
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGFloat fh = rect.size.height;
	
	CGContextMoveToPoint(context, 0, fh-TTRadius(_bottomLeftRadius));
	CGContextAddLineToPoint(context, 0, TTRadius(_topLeftRadius));
	
	if (lightSource >= 0 && lightSource <= 90) {
		CGContextAddArcToPoint(context, 0, 0, TTRadius(_topLeftRadius), 0, TTRadius(_topLeftRadius));
	}
}

//- (UIEdgeInsets)insetsForSize:(CGSize)size {
//  CGFloat fh = size.height/3;
//  return UIEdgeInsetsMake(floor(MAX(TTRadius(_topLeftRadius), TTRadius(_topRightRadius))),
//                          floor(MAX(TTRadius(_topLeftRadius), TTRadius(_bottomLeftRadius))),
//                          floor(MAX(TTRadius(_bottomLeftRadius), TTRadius(_bottomRightRadius))),
//                          floor(MAX(TTRadius(_topRightRadius), TTRadius(_bottomRightRadius))));
//}

@end
