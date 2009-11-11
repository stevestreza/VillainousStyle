//
//  TTShape.h
//  TTStyleMacTest
//
//  Created by Steve Streza on 7/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTGlobal.h"

@class TTRectangleShape;
static TTRectangleShape* sharedRectangleShape = nil;

@interface TTShape : NSObject {
    //STUB add your instance variables here
}
- (void)openPath:(CGRect)rect;
- (void)closePath:(CGRect)rect;

- (void)addTopEdgeToPath:(CGRect)rect lightSource:(NSInteger)lightSource;
- (void)addRightEdgeToPath:(CGRect)rect lightSource:(NSInteger)lightSource;
- (void)addBottomEdgeToPath:(CGRect)rect lightSource:(NSInteger)lightSource;
- (void)addLeftEdgeToPath:(CGRect)rect lightSource:(NSInteger)lightSource;

/**
 * Opens the path, adds all edges, and closes the path.
 */
- (void)addToPath:(CGRect)rect;

- (void)addInverseToPath:(CGRect)rect;

- (UIEdgeInsets)insetsForSize:(CGSize)size;

@end
