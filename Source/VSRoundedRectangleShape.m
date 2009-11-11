//
//  VSRoundedRectangleShape.m
//  VillainousStyle
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import "VSRoundedRectangleShape.h"


@implementation VSRoundedRectangleShape

@synthesize topLeftRadius = _topLeftRadius, topRightRadius = _topRightRadius,
bottomRightRadius = _bottomRightRadius, bottomLeftRadius = _bottomLeftRadius;

///////////////////////////////////////////////////////////////////////////////////////////////////
// class public

+ (VSRoundedRectangleShape*)shapeWithRadius:(CGFloat)radius {
	VSRoundedRectangleShape* shape = [[[VSRoundedRectangleShape alloc] init] autorelease];
	shape.topLeftRadius = shape.topRightRadius = shape.bottomRightRadius = shape.bottomLeftRadius
    = radius;
	return shape;
}

+ (VSRoundedRectangleShape*)shapeWithTopLeft:(CGFloat)topLeft topRight:(CGFloat)topRight
								 bottomRight:(CGFloat)bottomRight bottomLeft:(CGFloat)bottomLeft {
	VSRoundedRectangleShape* shape = [[[VSRoundedRectangleShape alloc] init] autorelease];
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
	CGContextAddArcToPoint(context, fw, fh, floor(fw/2), fh, VSRadius(_bottomRightRadius));
	CGContextAddArcToPoint(context, 0, fh, 0, floor(fh/2), VSRadius(_bottomLeftRadius));
	CGContextAddArcToPoint(context, 0, 0, floor(fw/2), 0, VSRadius(_topLeftRadius));
	CGContextAddArcToPoint(context, fw, 0, fw, floor(fh/2), VSRadius(_topRightRadius));
	
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
	CGPathAddArcToPoint(path, nil, fw, fh, floor(fw/2), fh, VSRadius(_bottomRightRadius));
	CGPathAddArcToPoint(path, nil, 0, fh, 0, floor(fh/2), VSRadius(_bottomLeftRadius));
	CGPathAddArcToPoint(path, nil, 0, 0, floor(fw/2), 0, VSRadius(_topLeftRadius));
	CGPathAddArcToPoint(path, nil, fw, 0, fw, floor(fh/2), VSRadius(_topRightRadius));
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
		CGContextMoveToPoint(context, VSRadius(_topLeftRadius), 0);
	} else {
		CGContextMoveToPoint(context, 0, VSRadius(_topLeftRadius));
		CGContextAddArcToPoint(context, 0, 0, VSRadius(_topLeftRadius), 0, VSRadius(_topLeftRadius));
	}
	CGContextAddArcToPoint(context, fw, 0, fw, VSRadius(_topRightRadius), VSRadius(_topRightRadius));
	CGContextAddLineToPoint(context, fw, VSRadius(_topRightRadius));
}

- (void)addRightEdgeToPath:(CGRect)rect lightSource:(NSInteger)lightSource {
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGFloat fw = rect.size.width;
	CGFloat fh = rect.size.height;
	
	CGContextMoveToPoint(context, fw, VSRadius(_topRightRadius));
	CGContextAddArcToPoint(context, fw, fh, fw-VSRadius(_bottomRightRadius), fh, VSRadius(_bottomRightRadius));
	CGContextAddLineToPoint(context, fw-VSRadius(_bottomRightRadius), fh);
}

- (void)addBottomEdgeToPath:(CGRect)rect lightSource:(NSInteger)lightSource {
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGFloat fw = rect.size.width;
	CGFloat fh = rect.size.height;
	
	CGContextMoveToPoint(context, fw-VSRadius(_bottomRightRadius), fh);
	CGContextAddLineToPoint(context, VSRadius(_bottomLeftRadius), fh);
	CGContextAddArcToPoint(context, 0, fh, 0, fh-VSRadius(_bottomLeftRadius), VSRadius(_bottomLeftRadius));
}

- (void)addLeftEdgeToPath:(CGRect)rect lightSource:(NSInteger)lightSource {
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGFloat fh = rect.size.height;
	
	CGContextMoveToPoint(context, 0, fh-VSRadius(_bottomLeftRadius));
	CGContextAddLineToPoint(context, 0, VSRadius(_topLeftRadius));
	
	if (lightSource >= 0 && lightSource <= 90) {
		CGContextAddArcToPoint(context, 0, 0, VSRadius(_topLeftRadius), 0, VSRadius(_topLeftRadius));
	}
}

//- (UIEdgeInsets)insetsForSize:(CGSize)size {
//  CGFloat fh = size.height/3;
//  return UIEdgeInsetsMake(floor(MAX(VSRadius(_topLeftRadius), VSRadius(_topRightRadius))),
//                          floor(MAX(VSRadius(_topLeftRadius), VSRadius(_bottomLeftRadius))),
//                          floor(MAX(VSRadius(_bottomLeftRadius), VSRadius(_bottomRightRadius))),
//                          floor(MAX(VSRadius(_topRightRadius), VSRadius(_bottomRightRadius))));
//}

@end
