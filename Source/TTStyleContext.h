//
//  TTStyleContext.h
//  TTStyleMacTest
//
//  Created by Steve Streza on 7/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TTShape, TTStyleContext;
@interface TTStyleContext : NSObject {
    //STUB add your instance variables here
	id _delegate;
	CGRect _frame;
	CGRect _contentFrame;
	TTShape* _shape;
	NSFont* _font;
	BOOL _didDrawContent;
}

//STUB add your method declarations here
@property(nonatomic,assign) id delegate;
@property(nonatomic) CGRect frame;
@property(nonatomic) CGRect contentFrame;
@property(nonatomic,retain) TTShape* shape;
@property(nonatomic,retain) NSFont* font;
@property(nonatomic) BOOL didDrawContent;

@end
