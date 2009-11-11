//
//  VSImageStyle.h
//  VSStyleMac
//
//  Created by Steve Streza on 7/25/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VSStyle.h"
#import "NSImage+ContentMode.h"

@interface VSImageStyle : VSStyle {
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

+ (VSImageStyle*)styleWithImageURL:(NSString*)imageURL next:(VSStyle*)next;
+ (VSImageStyle*)styleWithImageURL:(NSString*)imageURL defaultImage:(NSImage*)defaultImage
							  next:(VSStyle*)next;
+ (VSImageStyle*)styleWithImageURL:(NSString*)imageURL defaultImage:(NSImage*)defaultImage
					   contentMode:(UIViewContentMode)contentMode
							  size:(CGSize)size next:(VSStyle*)next;
+ (VSImageStyle*)styleWithImage:(NSImage*)image next:(VSStyle*)next;
+ (VSImageStyle*)styleWithImage:(NSImage*)image defaultImage:(NSImage*)defaultImage
						   next:(VSStyle*)next;
+ (VSImageStyle*)styleWithImage:(NSImage*)image defaultImage:(NSImage*)defaultImage
					contentMode:(UIViewContentMode)contentMode
						   size:(CGSize)size next:(VSStyle*)next;

@end
