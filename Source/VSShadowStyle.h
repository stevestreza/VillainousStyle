//
//  VSShadowStyle.h
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
#import "NSColor+CGColor.h"

@interface VSShadowStyle : VSStyle {
	VSColor* _color;
	CGFloat _blur;
	CGSize _offset;
}

@property(nonatomic,retain) VSColor* color;
@property(nonatomic) CGFloat blur;
@property(nonatomic) CGSize offset;

+ (VSShadowStyle*)styleWithColor:(VSColor*)color blur:(CGFloat)blur offset:(CGSize)offset
							next:(VSStyle*)next;
@end
