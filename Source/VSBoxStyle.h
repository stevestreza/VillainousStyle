//
//  VSBoxStyle.h
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

#import "VSGlobal.h"
#import "VSStyle.h"

@interface VSBoxStyle : VSStyle {
	UIEdgeInsets _margin;
	UIEdgeInsets _padding;
	CGSize _minSize;
	VSPosition _position;
}

@property(nonatomic) UIEdgeInsets margin;
@property(nonatomic) UIEdgeInsets padding;
@property(nonatomic) CGSize minSize;
@property(nonatomic) VSPosition position;

+ (VSBoxStyle*)styleWithMargin:(UIEdgeInsets)margin next:(VSStyle*)next;
+ (VSBoxStyle*)styleWithPadding:(UIEdgeInsets)padding next:(VSStyle*)next;
+ (VSBoxStyle*)styleWithFloats:(VSPosition)position next:(VSStyle*)next;
+ (VSBoxStyle*)styleWithMargin:(UIEdgeInsets)margin padding:(UIEdgeInsets)padding
						  next:(VSStyle*)next;
+ (VSBoxStyle*)styleWithMargin:(UIEdgeInsets)margin padding:(UIEdgeInsets)padding
					   minSize:(CGSize)minSize position:(VSPosition)position next:(VSStyle*)next;

@end
