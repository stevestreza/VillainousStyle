//
//  DarkStyleSheet.h
//  TTStyleMac
//
//  Created by Steve Streza on 11/6/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "TTStyleSheet.h"

@interface DarkStyleSheet : TTStyleSheet {
	
}

-(TTStyle *)backgroundStyle;

-(TTStyle *)upperLeftStyle;
-(TTStyle *)upperRightStyle;
-(TTStyle *)lowerLeftStyle;
-(TTStyle *)lowerRightStyle;

@end
