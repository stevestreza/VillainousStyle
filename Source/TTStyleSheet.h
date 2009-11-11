//
//  TTStyleSheet.h
//  TTStyleMac
//
//  Created by Steve Streza on 11/5/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

extern const NSString *TTStyleSheetChangedNotification;

@class TTStyle;

@interface TTStyleSheet : NSObject {
	NSMutableDictionary* _styles;
}

+ (id) styleSheet;

+ (TTStyleSheet*)globalStyleSheet;
+ (void)setGlobalStyleSheet:(TTStyleSheet*)styleSheet;

- (TTStyle*)styleWithSelector:(NSString*)selector;
@end
