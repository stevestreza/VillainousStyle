//
//  DarkStyleSheet.h
//  VSStyleMac
//
//  Created by Steve Streza on 11/6/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VillainousStyle/VSStyleSheet.h"

@interface DarkStyleSheet : VSStyleSheet {
	
}

-(VSStyle *)backgroundStyle;

-(VSStyle *)upperLeftStyle;
-(VSStyle *)upperRightStyle;
-(VSStyle *)lowerLeftStyle;
-(VSStyle *)lowerRightStyle;

@end
