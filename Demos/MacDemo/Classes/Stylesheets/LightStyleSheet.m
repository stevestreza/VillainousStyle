//
//  LightStyleSheet.m
//  VSStyleMac
//
//  Created by Steve Streza on 11/5/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "LightStyleSheet.h"
#import <VillainousStyle/VSStyles.h>
#import <VillainousStyle/VSShapes.h>

@implementation LightStyleSheet

#define kBlackColor     NSColorRGBA(158/256., 163/256., 172/256., 1.0)
#define kBlueColor      NSColorRGBA(221/256., 227/256., 228/256., 1.0)
#define kDarkBlueColor  NSColorRGBA(189/256., 202/256., 222/256., 0.5)
#define kDoomIconImage  (NSImage *)([NSImage imageNamed:@"doom-icon"])

-(VSStyle *)backgroundStyle{
	return [VSSolidFillStyle styleWithColor: NSColorRGBA(0.929, 0.929, 0.929, 1.0) 
									   next: nil ];
}

-(VSStyle *)upperLeftStyle{
	return 
	[VSInsetStyle styleWithInset:UIEdgeInsetsMake(10., 10., 10., 10.) next:
	 [VSShapeStyle styleWithShape:[VSRoundedRectangleShape shapeWithRadius:10] next:
	  [VSShadowStyle styleWithColor:NSColorRGBA(1.0,1.0,1.0,0.9) blur:1 offset:CGSizeMake(0, 1) next:
	   [VSLinearGradientFillStyle styleWithColor1:NSColorRGBA(1.0, 1.0, 1.0, 1.0)
										   color2:NSColorRGBA(0.845, 0.86, 0.9, 1.0) next:
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
	  [VSShapeStyle styleWithShape:[VSRoundedLeftArrowShape shapeWithRadius:10.0] next:
	   [VSSolidBorderStyle styleWithColor:NSColorRGBA(0.,1.,0.,1.) width:5. next:
		[VSLinearGradientFillStyle styleWithColor1:NSColorRGBA(0.3, 0.8, 0.5, 1.0)
											color2:NSColorRGBA(0.4, 1.0, 0.6, 1.0)
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
	  [VSShapeStyle styleWithShape:[VSRoundedRightArrowShape shapeWithRadius:10.0] next:
	   [VSSolidBorderStyle styleWithColor:NSColorRGBA(0.,1.,1.,1.) width:5. next:
		[VSLinearGradientFillStyle styleWithColor1:NSColorRGBA(0.7, 0.7, 0.8, 1.0)
											color2:NSColorRGBA(0.8, 0.8, 0.9, 1.0)
											  next:
		 [VSTextStyle styleWithFont:[NSFont fontWithName:@"Helvetica" size:14.] 
							  color:[NSColor colorWithCalibratedWhite:0.9 alpha:1.0] 
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
