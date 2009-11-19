//
//  VSTextStyle.m
//  VSStyleMac
//
//  Created by Steve Streza on 7/25/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "VSTextStyle.h"
#import "NSColor+CGColor.h"

#if TARGET_OS_IPHONE
#define VSStringSize() [text sizeWithFont:font constrainedToSize:size];
#else
#define VSStringSize() NSSizeToCGSize( [text sizeWithAttributes:[self textAttributes]] )
#endif

@implementation VSTextStyle

@synthesize font = _font, color = _color, shadowColor = _shadowColor, shadowOffset = _shadowOffset,
minimumFontSize = _minimumFontSize, textAlignment = _textAlignment,
verticalAlignment = _verticalAlignment, lineBreakMode = _lineBreakMode;

///////////////////////////////////////////////////////////////////////////////////////////////////
// class public

+ (VSTextStyle*)styleWithFont:(VSFont*)font next:(VSStyle*)next {
	VSTextStyle* style = [[[self alloc] initWithNext:next] autorelease];
	style.font = font;
	return style;
}

+ (VSTextStyle*)styleWithColor:(VSColor*)color next:(VSStyle*)next {
	VSTextStyle* style = [[[self alloc] initWithNext:next] autorelease];
	style.color = color;
	return style;
}

+ (VSTextStyle*)styleWithFont:(VSFont*)font color:(VSColor*)color next:(VSStyle*)next {
	VSTextStyle* style = [[[self alloc] initWithNext:next] autorelease];
	style.font = font;
	style.color = color;
	return style;
}

+ (VSTextStyle*)styleWithFont:(VSFont*)font color:(VSColor*)color
                textAlignment:(UITextAlignment)textAlignment next:(VSStyle*)next {
	VSTextStyle* style = [[[self alloc] initWithNext:next] autorelease];
	style.font = font;
	style.color = color;
	style.textAlignment = textAlignment;
	return style;
}

+ (VSTextStyle*)styleWithFont:(VSFont*)font color:(VSColor*)color
				  shadowColor:(VSColor*)shadowColor shadowOffset:(CGSize)shadowOffset
						 next:(VSStyle*)next {
	VSTextStyle* style = [[[self alloc] initWithNext:next] autorelease];
	style.font = font;
	style.color = color;
	style.shadowColor = shadowColor;
	style.shadowOffset = shadowOffset;
	return style;
}

+ (VSTextStyle*)styleWithFont:(VSFont*)font color:(VSColor*)color
			  minimumFontSize:(CGFloat)minimumFontSize
				  shadowColor:(VSColor*)shadowColor shadowOffset:(CGSize)shadowOffset
						 next:(VSStyle*)next {
	VSTextStyle* style = [[[self alloc] initWithNext:next] autorelease];
	style.font = font;
	style.color = color;
	style.minimumFontSize = minimumFontSize;
	style.shadowColor = shadowColor;
	style.shadowOffset = shadowOffset;
	return style;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// private

#if !TARGET_OS_IPHONE
-(NSDictionary *)textAttributes{
	return [NSDictionary dictionaryWithObjectsAndKeys:
	 _font, NSFontAttributeName,
	 nil];
}
#endif

- (CGRect)rectForText:(NSString*)text forSize:(CGSize)size withFont:(VSFont*)font {
	CGRect rect = CGRectZero;
	if (_textAlignment == UITextAlignmentLeft
		&& _verticalAlignment == UIControlContentVerticalAlignmentTop) {
		rect.size = size;
	} else {
		CGSize textSize = VSStringSize();
		
		if (size.width < textSize.width) {
			size.width = textSize.width;
		}
		
		rect.size = textSize;
		
		if (_textAlignment == UITextAlignmentCenter) {
			rect.origin.x = round(size.width/2 - textSize.width/2);
		} else if (_textAlignment == UITextAlignmentRight) {
			rect.origin.x = size.width - textSize.width;
		}
		
		if (_verticalAlignment == UIControlContentVerticalAlignmentCenter) {
			rect.origin.y = round(size.height/2 - textSize.height/2);
		} else if (_verticalAlignment == UIControlContentVerticalAlignmentBottom) {
			rect.origin.y = size.height - textSize.height;
		}
	}
	return rect;
}

- (void)drawText:(NSString*)text context:(VSStyleContext*)context {
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	CGContextSaveGState(ctx);
	
	VSFont* font = _font ? _font : context.font;
	
	if (_shadowColor) {
		CGSize offset = CGSizeMake(_shadowOffset.width, -_shadowOffset.height);
		CGContextSetShadowWithColor(ctx, offset, 0, _shadowColor.CGColor);
	}
	
	if (_color) {
		[_color setFill];
	}
	
	CGRect rect = context.contentFrame;
	CGRect titleRect = [self rectForText:text forSize:rect.size withFont:font];
//	NSRect textRect = NSMakeRect(titleRect.origin.x+rect.origin.x, titleRect.origin.y+rect.origin.y,rect.size.width,rect.size.height);
	CGSize size = rect.size;
	titleRect.size = VSStringSize();
	
#if TARGET_OS_IPHONE
	[text drawInRect:titleRect
			forWidth:rect.size.width withFont:font
		 minFontSize:_minimumFontSize ? _minimumFontSize : font.pointSize
	  actualFontSize:nil lineBreakMode:_lineBreakMode
  baselineAdjustment:UIBaselineAdjustmentAlignCenters];
#else
	NSDictionary *attributes = [self textAttributes];

	[text drawInRect:NSRectFromCGRect(titleRect)
	  withAttributes:attributes];	
#endif
	
	context.contentFrame = titleRect;
	
	CGContextRestoreGState(ctx);
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// NSObject

- (id)initWithNext:(VSStyle*)next {  
	if (self = [super initWithNext:next]) {
		_font = nil;
		_color = nil;
		_minimumFontSize = 0;
		_shadowColor = nil;
		_shadowOffset = CGSizeZero;
		_textAlignment = UITextAlignmentCenter;
		_verticalAlignment = UIControlContentVerticalAlignmentCenter;
		_lineBreakMode = UILineBreakModeTailTruncation;
	}
	return self;
}

- (void)dealloc {
	[_font release];
	[_color release];
	[_shadowColor release];
	[super dealloc];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// VSStyle

- (void)draw:(VSStyleContext*)context {
	if ([context.delegate respondsToSelector:@selector(textForLayerWithStyle:)]) {
		NSString* text = [context.delegate textForLayerWithStyle:self];
		if (text) {
			context.didDrawContent = YES;
			[self drawText:text context:context];
		}
	}
	
	if (!context.didDrawContent
		&& [context.delegate respondsToSelector:@selector(drawLayer:withStyle:)]) {
		[context.delegate drawLayer:context withStyle:self];
		context.didDrawContent = YES;
	}
	
	[self.next draw:context];
}

- (CGSize)addToSize:(CGSize)size context:(VSStyleContext*)context {
	if ([context.delegate respondsToSelector:@selector(textForLayerWithStyle:)]) {
		NSString* text = [context.delegate textForLayerWithStyle:self];
		VSFont* font = _font ? _font : context.font;
		
		CGSize textSize = VSStringSize();				
		
		CGFloat maxWidth = context.contentFrame.size.width;
		if (maxWidth && textSize.width > maxWidth) {
			textSize.width = maxWidth;
		}
		
		size.width += textSize.width;
		size.height += textSize.height;
	}
	
	if (_next) {
		return [self.next addToSize:size context:context];
	} else {
		return size;
	}
}

@end
