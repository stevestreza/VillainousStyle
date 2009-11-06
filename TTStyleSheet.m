//
//  TTStyleSheet.m
//  TTStyleMac
//
//  Created by Steve Streza on 11/5/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TTStyleSheet.h"

///////////////////////////////////////////////////////////////////////////////////////////////////
// global

static TTStyleSheet* gStyleSheet = nil;
const NSString *TTStyleSheetChangedNotification = @"TTStyleSheetChangedNotification";

///////////////////////////////////////////////////////////////////////////////////////////////////

@implementation TTStyleSheet

///////////////////////////////////////////////////////////////////////////////////////////////////
// class public

+ (TTStyleSheet*)globalStyleSheet {
/*
 TODO Implement a default style sheet for Aqua
 Perhaps make alternatives for other common UI styles
 
	if (!gStyleSheet) {
		gStyleSheet = [[TTDefaultStyleSheet alloc] init];
	}
 */
	return gStyleSheet;
}

+ (void)setGlobalStyleSheet:(TTStyleSheet*)styleSheet {
	[gStyleSheet autorelease];
	gStyleSheet = [styleSheet retain];
	
	[[NSNotificationCenter defaultCenter] postNotificationName: TTStyleSheetChangedNotification
														object: gStyleSheet ];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// NSObject

- (id)init {
	if (self = [super init]) {
		_styles = nil;
	}
	return self;
}

- (void)dealloc {
	[_styles release];
	_styles = nil;
	
	[super dealloc];
}

+ (id) styleSheet{
	return [[[self alloc] init] autorelease];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// public

- (TTStyle*)styleWithSelector:(NSString*)selector {
	TTStyle* style = [_styles objectForKey:selector];
	if (!style) {
		SEL sel = NSSelectorFromString(selector);
		if ([self respondsToSelector:sel]) {
			style = [self performSelector:sel withObject:nil];
			if (style) {
				if (!_styles) {
					_styles = [[NSMutableDictionary alloc] init];
				}
				[_styles setObject:style forKey:selector];
			}
		}
	}
	return style;
}

@end
