//
//  CALayer+VSStyle.h
//  VillainousStyle
//
//  Created by Steve Streza on 12/5/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "VSGlobal.h"
#import <QuartzCore/QuartzCore.h>

@class VSStyle;

@interface CALayer (VSStyle)

-(void)drawStyle:(VSStyle *)style inRect:(CGRect)rect;

@end
