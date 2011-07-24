//
//  VSStyleDelegate.h
//  VillainousStyle
//
//  Created by Steve Streza on 1/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "VSGlobal.h"

@class VSStyle;
@class VSStyleContext;
@class VSImage;

@protocol VSStyleDelegate

@optional
- (void)drawLayer:(VSStyleContext*)context withStyle:(VSStyle*)style;
- (NSString*)textForLayerWithStyle:(VSStyle*)style;
- (VSImage*)imageForLayerWithStyle:(VSStyle*)style;
@end
