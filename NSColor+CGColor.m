//
//  NSColor+CGColor.m
//  TTStyleMacTest
//
//  Created by Steve Streza on 7/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "NSColor+CGColor.h"

@implementation NSColor (CGColorRef)
@dynamic CGColor;

- (CGColorRef)CGColor {
	CGColorRef color = nil;
	
	@try {
		NSInteger componentCount = [self numberOfComponents];    
		CGColorSpaceRef cgColorSpace = [[self colorSpace] CGColorSpace];
		CGFloat *components = (CGFloat *)calloc(componentCount, sizeof(CGFloat));
		if (!components) {
			NSException *exception = [NSException exceptionWithName:NSMallocException 
															 reason:@"Unable to malloc color components" 
														   userInfo:nil];
			@throw exception;
		}
		
		[self getComponents:components];
		color = CGColorCreate(cgColorSpace, components);
		free(components);
	} @catch (NSException *e) {
		// We were probably passed a pattern, which isn't going to work. Return clear color constant.
		return CGColorGetConstantColor(kCGColorClear);
	}
	
	return (CGColorRef)[(id)color autorelease];
}

@end