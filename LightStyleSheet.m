//
//  LightStyleSheet.m
//  TTStyleMac
//
//  Created by Steve Streza on 11/5/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "LightStyleSheet.h"
#import "TTStyles.h"
#import "TTShapes.h"

@implementation LightStyleSheet

#define kBlackColor     NSColorRGB(158/256., 163/256., 172/256.)
#define kBlueColor      NSColorRGB(191/256., 197/256., 208/256.)
#define kDarkBlueColor  NSColorRGB(109/256., 132/256., 162/256.)
#define kDoomIconImage  (NSImage *)([NSImage imageNamed:@"doom-icon"])

-(TTStyle *)backgroundStyle{
	return [TTSolidFillStyle styleWithColor: NSColorRGBA(0.929, 0.929, 0.929, 1.0) 
									   next: nil ];
}

-(TTStyle *)upperLeftStyle{
	return 
	[TTInsetStyle styleWithInset:UIEdgeInsetsMake(10., 10., 10., 10.) next:
	 [TTShapeStyle styleWithShape:[TTRoundedRectangleShape shapeWithRadius:10] next:
	  [TTShadowStyle styleWithColor:NSColorRGBA(1.0,1.0,1.0,0.9) blur:1 offset:CGSizeMake(0, 1) next:
	   [TTLinearGradientFillStyle styleWithColor1:NSColorRGBA(1.0, 1.0, 1.0, 1.0)
										   color2:NSColorRGBA(0.845, 0.86, 0.9, 1.0) next:
		[TTSolidBorderStyle styleWithColor:kBlueColor width:1 next:
		 [TTImageStyle styleWithImage:kDoomIconImage
						 defaultImage:nil
						  contentMode: UIViewContentModeScaleAspectFit
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
		[TTInnerShadowStyle styleWithColor:[NSColor blackColor] blur:1.0 offset:CGSizeZero next:
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
	  [TTShapeStyle styleWithShape:[TTRoundedLeftArrowShape shapeWithRadius:10.0] next:
	   [TTSolidBorderStyle styleWithColor:NSColorRGBA(0.,1.,0.,1.) width:5. next:
		[TTLinearGradientFillStyle styleWithColor1:NSColorRGBA(0.3, 0.3, 0.5, 1.0)
											color2:NSColorRGBA(0.4, 0.4, 0.6, 1.0)
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
	  [TTShapeStyle styleWithShape:[TTRoundedRightArrowShape shapeWithRadius:10.0] next:
	   [TTSolidBorderStyle styleWithColor:NSColorRGBA(0.,1.,1.,1.) width:5. next:
		[TTLinearGradientFillStyle styleWithColor1:NSColorRGBA(0.3, 0.3, 0.5, 1.0)
											color2:NSColorRGBA(0.4, 0.4, 0.6, 1.0)
											  next:
		 [TTTextStyle styleWithFont:[NSFont fontWithName:@"Helvetica" size:14.] 
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
