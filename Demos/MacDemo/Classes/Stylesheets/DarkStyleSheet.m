//
//  DarkStyleSheet.m
//  TTStyleMac
//
//  Created by Steve Streza on 11/6/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "DarkStyleSheet.h"
#import <TTStyle/TTStyles.h>
#import <TTStyle/TTShapes.h>

@implementation DarkStyleSheet

#define kBlackColor     NSColorRGBA( 58/256.,  63/256.,  72/256., 1.0)
#define kBlueColor      NSColorRGBA(121/256., 127/256., 128/256., 1.0)
#define kDarkBlueColor  NSColorRGBA( 89/256., 102/256., 122/256., 0.5)
#define kDoomIconImage  (NSImage *)([NSImage imageNamed:@"doom-icon"])

-(TTStyle *)backgroundStyle{
	return [TTLinearGradientFillStyle styleWithColor1:NSColorRGBA(0.05, 0.05, 0.05, 1.0)
											   color2:NSColorRGBA(0.35, 0.35, 0.40, 1.0)
												 next:nil];
}

-(TTStyle *)upperLeftStyle{
	return 
	[TTInsetStyle styleWithInset:UIEdgeInsetsMake(10., 10., 10., 10.) next:
	 [TTShapeStyle styleWithShape:[TTRoundedRectangleShape shapeWithRadius:10] next:
	  [TTShadowStyle styleWithColor:NSColorRGBA(1.0,1.0,1.0,0.5) blur:1 offset:CGSizeMake(0, 1) next:
	   [TTLinearGradientFillStyle styleWithColor1:NSColorRGBA(0.5, 0.5, 0.5, 1.0)
										   color2:NSColorRGBA(0.345, 0.36, 0.4, 1.0) next:
		[TTSolidBorderStyle styleWithColor:NSColorRGBA(0.5,0.5,0.5,0.75) width:1 next:
		 [TTImageStyle styleWithImage:kDoomIconImage
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

-(TTStyle *)upperRightStyle{
	return 
	[TTInsetStyle styleWithInset:UIEdgeInsetsMake(10., 10., 10., 10.) next:
	 [TTShapeStyle styleWithShape:[TTRoundedRectangleShape shapeWithRadius:9] next:
	  [TTShadowStyle styleWithColor:NSColorRGB(255/256.,255/256.,255/256.) blur:1 offset:CGSizeMake(0, 1) next:
	   [TTReflectiveFillStyle styleWithColor:kDarkBlueColor next:
		[TTInnerShadowStyle styleWithColor:NSColorRGBA(0., 0., 0., 0.85) blur:12.0 offset:CGSizeZero next:
		 [TTInsetStyle styleWithInset:UIEdgeInsetsMake(0, -1, 0, -1) next:
		  [TTBevelBorderStyle styleWithHighlight:nil shadow:NSColorRGBA(0,0,0,0.15)
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

-(TTStyle *)lowerLeftStyle{
	return 
	[TTShadowStyle styleWithColor:[NSColor colorWithCalibratedWhite:0.0 alpha:0.5]
							 blur:5.0 
						   offset:CGSizeMake(0.,2.) next:
	 [TTInsetStyle styleWithInset:UIEdgeInsetsMake(10., 10., 10., 10.) next:
	  [TTShapeStyle styleWithShape:[TTRoundedRightArrowShape shapeWithRadius:10.0] next:
	   [TTSolidBorderStyle styleWithColor:NSColorRGBA(1.,0.,0.,0.5) width:5. next:
		[TTLinearGradientFillStyle styleWithColor1:NSColorRGBA(0.4, 0.1, 0.2, 1.0)
											color2:NSColorRGBA(0.6, 0.2, 0.3, 1.0)
											  next:
		 nil
		 ]
		]
	   ]
	  ]
	 ];
}

-(TTStyle *)lowerRightStyle{
	return
	[TTShadowStyle styleWithColor:[NSColor colorWithCalibratedWhite:0.0 alpha:0.5]
							 blur:5.0 
						   offset:CGSizeMake(0.,2.) next:
	 [TTInsetStyle styleWithInset:UIEdgeInsetsMake(20., 10., 30., 10.) next:
	  [TTShapeStyle styleWithShape:[TTRoundedLeftArrowShape shapeWithRadius:10.0] next:
	   [TTSolidBorderStyle styleWithColor:NSColorRGBA(1.,0.,0.,1.) width:5. next:
		[TTLinearGradientFillStyle styleWithColor1:NSColorRGBA(0.2, 0.2, 0.3, 1.0)
											color2:NSColorRGBA(0.3, 0.3, 0.4, 1.0)
											  next:
		 [TTTextStyle styleWithFont:[NSFont fontWithName:@"Helvetica" size:14.] 
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
