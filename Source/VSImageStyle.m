//
//  VSImageStyle.m
//  VSStyleMac
//
//  Created by Steve Streza on 7/25/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "VSImageStyle.h"


@implementation VSImageStyle

@synthesize imageURL = _imageURL, image = _image, defaultImage = _defaultImage,
contentMode = _contentMode, size = _size;

///////////////////////////////////////////////////////////////////////////////////////////////////
// class public

+ (VSImageStyle*)styleWithImageURL:(NSString*)imageURL next:(VSStyle*)next {
	VSImageStyle* style = [[[self alloc] initWithNext:next] autorelease];
	style.imageURL = imageURL;
	return style;
}

+ (VSImageStyle*)styleWithImageURL:(NSString*)imageURL defaultImage:(NSImage*)defaultImage
							  next:(VSStyle*)next {
	VSImageStyle* style = [[[self alloc] initWithNext:next] autorelease];
	style.imageURL = imageURL;
	style.defaultImage = defaultImage;
	return style;
}

+ (VSImageStyle*)styleWithImageURL:(NSString*)imageURL defaultImage:(NSImage*)defaultImage
					   contentMode:(UIViewContentMode)contentMode size:(CGSize)size next:(VSStyle*)next {
	VSImageStyle* style = [[[self alloc] initWithNext:next] autorelease];
	style.imageURL = imageURL;
	style.defaultImage = defaultImage;
	style.contentMode = contentMode;
	style.size = size;
	return style;
}

+ (VSImageStyle*)styleWithImage:(NSImage*)image next:(VSStyle*)next {
	VSImageStyle* style = [[[self alloc] initWithNext:next] autorelease];
	style.image = image;
	return style;
}

+ (VSImageStyle*)styleWithImage:(NSImage*)image defaultImage:(NSImage*)defaultImage
						   next:(VSStyle*)next {
	VSImageStyle* style = [[[self alloc] initWithNext:next] autorelease];
	style.image = image;
	style.defaultImage = defaultImage;
	return style;
}

+ (VSImageStyle*)styleWithImage:(NSImage*)image defaultImage:(NSImage*)defaultImage
					contentMode:(UIViewContentMode)contentMode size:(CGSize)size next:(VSStyle*)next {
	VSImageStyle* style = [[[self alloc] initWithNext:next] autorelease];
	style.image = image;
	style.defaultImage = defaultImage;
	style.contentMode = contentMode;
	style.size = size;
	return style;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// private

- (NSImage*)imageForContext:(VSStyleContext*)context {
	NSImage* image = self.image;
	if (!image && [context.delegate respondsToSelector:@selector(imageForLayerWithStyle:)]) {
		image = [context.delegate imageForLayerWithStyle:self];
	}
	return image;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// NSObject

- (id)initWithNext:(VSStyle*)next {  
	if (self = [super initWithNext:next]) {
		_imageURL = nil;
		_image = nil;
		_defaultImage = nil;
		_contentMode = UIViewContentModeScaleToFill;
		_size = CGSizeZero;
	}
	return self;
}

- (void)dealloc {
	[_imageURL release];
	[_image release];
	[_defaultImage release];
	[super dealloc];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// VSStyle

- (void)draw:(VSStyleContext*)context {
	NSImage* image = [self imageForContext:context];
	if (image) {
		[image drawInRect:context.contentFrame contentMode:_contentMode];
	}
	return [self.next draw:context];
}

- (CGSize)addToSize:(CGSize)size context:(VSStyleContext*)context {
	if (_size.width || _size.height) {
		size.width += _size.width;
		size.height += _size.height;
	} else if (_contentMode == UIViewContentModeScaleToFill) {
		NSImage* image = [self imageForContext:context];
		if (image) {
			size.width += image.size.width;
			size.height += image.size.height;
		}
	}
	
	if (_next) {
		return [self.next addToSize:size context:context];
	} else {
		return size;
	}
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// public

- (NSImage*)image {
	if (!_image && _imageURL) {
//		_image = [[[VSURLCache sharedCache] imageForURL:_imageURL] retain];
		_image = [[[NSImage alloc] initWithContentsOfURL:_imageURL] retain];
	}
	return _image;
}

@end
