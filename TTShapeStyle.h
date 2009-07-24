//
//  TTShapeStyle.h
//  TTStyleMacTest
//
//  Created by Steve Streza on 7/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTstyle.h"
#import "TTShape.h"

@interface TTShapeStyle : TTStyle {
	TTShape* _shape;
}

@property(nonatomic,retain) TTShape* shape;

+ (TTShapeStyle*)styleWithShape:(TTShape*)shape next:(TTStyle*)next;

@end
