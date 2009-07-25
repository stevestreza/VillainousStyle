//
//  TTImageStyle.h
//  TTStyleMac
//
//  Created by Steve Streza on 7/25/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTStyle.h"
#import "NSImage+ContentMode.h"

@interface TTImageStyle : TTStyle {
	NSString* _imageURL;
	NSImage* _image;
	NSImage* _defaultImage;
	UIViewContentMode _contentMode;
	CGSize _size;
}

@property(nonatomic,copy) NSString* imageURL;
@property(nonatomic,retain) NSImage* image;
@property(nonatomic,retain) NSImage* defaultImage;
@property(nonatomic) CGSize size;
@property(nonatomic) UIViewContentMode contentMode;

+ (TTImageStyle*)styleWithImageURL:(NSString*)imageURL next:(TTStyle*)next;
+ (TTImageStyle*)styleWithImageURL:(NSString*)imageURL defaultImage:(NSImage*)defaultImage
							  next:(TTStyle*)next;
+ (TTImageStyle*)styleWithImageURL:(NSString*)imageURL defaultImage:(NSImage*)defaultImage
					   contentMode:(UIViewContentMode)contentMode
							  size:(CGSize)size next:(TTStyle*)next;
+ (TTImageStyle*)styleWithImage:(NSImage*)image next:(TTStyle*)next;
+ (TTImageStyle*)styleWithImage:(NSImage*)image defaultImage:(NSImage*)defaultImage
						   next:(TTStyle*)next;
+ (TTImageStyle*)styleWithImage:(NSImage*)image defaultImage:(NSImage*)defaultImage
					contentMode:(UIViewContentMode)contentMode
						   size:(CGSize)size next:(TTStyle*)next;

@end
