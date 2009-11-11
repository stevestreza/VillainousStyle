//
//  VSFourBorderStyle.h
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
#import "VSStyle.h"

@interface VSFourBorderStyle : VSStyle {
	NSColor* _top;
	NSColor* _right;
	NSColor* _bottom;
	NSColor* _left;
	CGFloat _width;
}

@property(nonatomic,retain) NSColor* top;
@property(nonatomic,retain) NSColor* right;
@property(nonatomic,retain) NSColor* bottom;
@property(nonatomic,retain) NSColor* left;
@property(nonatomic) CGFloat width;

+ (VSFourBorderStyle*)styleWithTop:(NSColor*)top right:(NSColor*)right
							bottom:(NSColor*)bottom left:(NSColor*)left width:(CGFloat)width
							  next:(VSStyle*)next;

@end
