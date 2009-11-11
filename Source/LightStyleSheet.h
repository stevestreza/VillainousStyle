//
//  LightStyleSheet.h
//  TTStyleMac
//
//  Created by Steve Streza on 11/5/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "TTStyleSheet.h"

@interface LightStyleSheet : TTStyleSheet {

}

-(TTStyle *)backgroundStyle;

-(TTStyle *)upperLeftStyle;
-(TTStyle *)upperRightStyle;
-(TTStyle *)lowerLeftStyle;
-(TTStyle *)lowerRightStyle;

@end
