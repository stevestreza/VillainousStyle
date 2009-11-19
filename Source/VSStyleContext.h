//
//  VSStyleContext.h
//  VillainousStyle
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import <Foundation/Foundation.h>
//#import <CoreGraphics/CoreGraphics.h>

#if TARGET_OS_IPHONE
#import <UIKit/UIKit.h>
#else
#import <AppKit/AppKit.h>
#endif

#import "VSGlobal.h"

@class VSShape, VSStyleContext;
@interface VSStyleContext : NSObject {
    //STUB add your instance variables here
	id _delegate;
	CGRect _frame;
	CGRect _contentFrame;
	VSShape* _shape;
	VSFont* _font;
	BOOL _didDrawContent;
}

//STUB add your method declarations here
@property(nonatomic,assign) id delegate;
@property(nonatomic) CGRect frame;
@property(nonatomic) CGRect contentFrame;
@property(nonatomic,retain) VSShape* shape;
@property(nonatomic,retain) VSFont* font;
@property(nonatomic) BOOL didDrawContent;

@end
