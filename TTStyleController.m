//
//  TTStyleController.m
//  TTStyleMacTest
//
//  Created by Steve Streza on 7/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TTStyleController.h"

#import "TTStyles.h"
#import "TTShapes.h"

@implementation TTStyleController

-(id)init{
    if(self = [super init]){
        //STUB initialize your object here
    }
	return self;
}

-(void)awakeFromNib{
#define RGBCOLOR(__r,__g,__b) NSColorRGBA((__r)/256., (__g)/256., (__b)/256., 1.0)
	NSColor* black = RGBCOLOR(158, 163, 172);
	NSColor* blue = RGBCOLOR(191, 197, 208);
	NSColor* darkBlue = RGBCOLOR(109, 132, 162);
	
	styleView1.style = 
	[TTInsetStyle styleWithInset:UIEdgeInsetsMake(10., 10., 10., 10.) next:
	 [TTShapeStyle styleWithShape:[TTRoundedRectangleShape shapeWithRadius:10] next:
	  [TTShadowStyle styleWithColor:NSColorRGBA(1.0,1.0,1.0,0.9) blur:1 offset:CGSizeMake(0, 1) next:
	   [TTLinearGradientFillStyle styleWithColor1:NSColorRGBA(1.0, 1.0, 1.0, 1.0)
										   color2:NSColorRGBA(0.845, 0.86, 0.9, 1.0) next:
		[TTSolidBorderStyle styleWithColor:blue width:1 next:nil]]]]
	 ];
	
	styleView2.style = 
	[TTInsetStyle styleWithInset:UIEdgeInsetsMake(10., 10., 10., 10.) next:
	 [TTShapeStyle styleWithShape:[TTRoundedRectangleShape shapeWithRadius:9] next:
	  [TTShadowStyle styleWithColor:RGBCOLOR(255,255,255) blur:1 offset:CGSizeMake(0, 1) next:
	   [TTReflectiveFillStyle styleWithColor:darkBlue next:
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
	
	styleView3.style =
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

	styleView4.style =
	[TTShadowStyle styleWithColor:[NSColor colorWithCalibratedWhite:0.0 alpha:0.5]
							 blur:5.0 
						   offset:CGSizeMake(0.,2.) next:
	 [TTInsetStyle styleWithInset:UIEdgeInsetsMake(20., 10., 30., 10.) next:
	  [TTShapeStyle styleWithShape:[TTRoundedRightArrowShape shapeWithRadius:10.0] next:
	   [TTSolidBorderStyle styleWithColor:NSColorRGBA(0.,1.,1.,1.) width:5. next:
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
	
	-(void)dealloc{
		//STUB release your objects here
		
		[super dealloc];
	}
	
	@end
