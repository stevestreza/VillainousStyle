//
//  VSBevelBorderStyle.h
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

@interface VSBevelBorderStyle : VSStyle {
	NSColor* _highlight;
	NSColor* _shadow;
	CGFloat _width;
	NSInteger _lightSource;
}

@property(nonatomic,retain) NSColor* highlight;
@property(nonatomic,retain) NSColor* shadow;
@property(nonatomic) CGFloat width;
@property(nonatomic) NSInteger lightSource;

+ (VSBevelBorderStyle*)styleWithColor:(NSColor*)color width:(CGFloat)width next:(VSStyle*)next;

+ (VSBevelBorderStyle*)styleWithHighlight:(NSColor*)highlight shadow:(NSColor*)shadow
									width:(CGFloat)width lightSource:(NSInteger)lightSource next:(VSStyle*)next;

@end
