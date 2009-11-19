//
//  DarkStyleSheet.m
//  VSStyleMac
//
//  Created by Steve Streza on 11/6/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "DarkStyleSheet.h"
#import <VillainousStyle/VSStyles.h>
#import <VillainousStyle/VSShapes.h>

@implementation DarkStyleSheet

#define kBlackColor     NSColorRGBA( 58/256.,  63/256.,  72/256., 1.0)
#define kBlueColor      NSColorRGBA(121/256., 127/256., 128/256., 1.0)
#define kDarkBlueColor  NSColorRGBA( 89/256., 102/256., 122/256., 0.5)
#define kDoomIconImage  (NSImage *)([NSImage imageNamed:@"doom-icon"])

-(VSStyle *)backgroundStyle{
	return [VSLinearGradientFillStyle styleWithColor1:NSColorRGBA(0.05, 0.05, 0.05, 1.0)
											   color2:NSColorRGBA(0.35, 0.35, 0.40, 1.0)
												 next:nil];
}

-(VSStyle *)upperLeftStyle{
	return 
	[VSInsetStyle styleWithInset:UIEdgeInsetsMake(10., 10., 10., 10.) next:
	 [VSShapeStyle styleWithShape:[VSRoundedRectangleShape shapeWithRadius:10] next:
	  [VSShadowStyle styleWithColor:NSColorRGBA(1.0,1.0,1.0,0.5) blur:1 offset:CGSizeMake(0, 1) next:
	   [VSLinearGradientFillStyle styleWithColor1:NSColorRGBA(0.5, 0.5, 0.5, 1.0)
										   color2:NSColorRGBA(0.345, 0.36, 0.4, 1.0) next:
		[VSSolidBorderStyle styleWithColor:NSColorRGBA(0.5,0.5,0.5,0.75) width:1 next:
		 [VSImageStyle styleWithImage:kDoomIconImage
						 defaultImage:nil
						  contentMode:UIViewContentModeScaleAspectFit
								 size:NSSizeToCGSize([kDoomIconImage size])
								 next:
		  nil
		  ]
		 ]
		]
	   ]
	  ]
	 ];
}

-(VSStyle *)upperRightStyle{
	return 
	[VSInsetStyle styleWithInset:UIEdgeInsetsMake(10., 10., 10., 10.) next:
	 [VSShapeStyle styleWithShape:[VSRoundedRectangleShape shapeWithRadius:9] next:
	  [VSShadowStyle styleWithColor:NSColorRGB(255/256.,255/256.,255/256.) blur:1 offset:CGSizeMake(0, 1) next:
	   [VSReflectiveFillStyle styleWithColor:kDarkBlueColor next:
		[VSInnerShadowStyle styleWithColor:NSColorRGBA(0., 0., 0., 0.85) blur:12.0 offset:CGSizeZero next:
		 [VSInsetStyle styleWithInset:UIEdgeInsetsMake(0, -1, 0, -1) next:
		  [VSBevelBorderStyle styleWithHighlight:nil shadow:NSColorRGBA(0,0,0,0.15)
										   width:1 lightSource:270 next:
		   nil
		   ]
		  ]
		 ]
		]
	   ]
	  ]
	 ];
}

-(VSStyle *)lowerLeftStyle{
	return 
	[VSShadowStyle styleWithColor:[NSColor colorWithCalibratedWhite:0.0 alpha:0.5]
							 blur:5.0 
						   offset:CGSizeMake(0.,2.) next:
	 [VSInsetStyle styleWithInset:UIEdgeInsetsMake(10., 10., 10., 10.) next:
	  [VSShapeStyle styleWithShape:[VSRoundedRightArrowShape shapeWithRadius:10.0] next:
	   [VSSolidBorderStyle styleWithColor:NSColorRGBA(1.,0.,0.,0.5) width:5. next:
		[VSLinearGradientFillStyle styleWithColor1:NSColorRGBA(0.4, 0.1, 0.2, 1.0)
											color2:NSColorRGBA(0.6, 0.2, 0.3, 1.0)
											  next:
		 nil
		 ]
		]
	   ]
	  ]
	 ];
}

-(VSStyle *)lowerRightStyle{
	return
	[VSShadowStyle styleWithColor:[NSColor colorWithCalibratedWhite:0.0 alpha:0.5]
							 blur:5.0 
						   offset:CGSizeMake(0.,2.) next:
	 [VSInsetStyle styleWithInset:UIEdgeInsetsMake(20., 10., 30., 10.) next:
	  [VSShapeStyle styleWithShape:[VSRoundedLeftArrowShape shapeWithRadius:10.0] next:
	   [VSSolidBorderStyle styleWithColor:NSColorRGBA(1.,0.,0.,1.) width:5. next:
		[VSLinearGradientFillStyle styleWithColor1:NSColorRGBA(0.2, 0.2, 0.3, 1.0)
											color2:NSColorRGBA(0.3, 0.3, 0.4, 1.0)
											  next:
		 [VSTextStyle styleWithFont:[NSFont fontWithName:@"Helvetica" size:14.] 
							  color:[NSColor colorWithCalibratedWhite:1.0 alpha:1.0] 
							   next:
		  nil
		  ]
		 ]
		]
	   ]
	  ]
	 ];
}

@end