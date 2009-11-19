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
	VSImage* _image;
	VSImage* _defaultImage;
	UIViewContentMode _contentMode;
	CGSize _size;
}

@property(nonatomic,copy) NSString* imageURL;
@property(nonatomic,retain) VSImage* image;
@property(nonatomic,retain) VSImage* defaultImage;
@property(nonatomic) CGSize size;
@property(nonatomic) UIViewContentMode contentMode;

+ (VSImageStyle*)styleWithImageURL:(NSString*)imageURL next:(VSStyle*)next;
+ (VSImageStyle*)styleWithImageURL:(NSString*)imageURL defaultImage:(VSImage*)defaultImage
							  next:(VSStyle*)next;
+ (VSImageStyle*)styleWithImageURL:(NSString*)imageURL defaultImage:(VSImage*)defaultImage
					   contentMode:(UIViewContentMode)contentMode
							  size:(CGSize)size next:(VSStyle*)next;
+ (VSImageStyle*)styleWithImage:(VSImage*)image next:(VSStyle*)next;
+ (VSImageStyle*)styleWithImage:(VSImage*)image defaultImage:(VSImage*)defaultImage
						   next:(VSStyle*)next;
+ (VSImageStyle*)styleWithImage:(VSImage*)image defaultImage:(VSImage*)defaultImage
					contentMode:(UIViewContentMode)contentMode
						   size:(CGSize)size next:(VSStyle*)next;

@end
