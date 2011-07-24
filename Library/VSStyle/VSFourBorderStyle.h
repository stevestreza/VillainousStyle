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

#import "VSGlobal.h"
#import "VSStyle.h"

@interface VSFourBorderStyle : VSStyle {
	VSColor* _top;
	VSColor* _right;
	VSColor* _bottom;
	VSColor* _left;
	CGFloat _width;
}

@property(nonatomic,retain) VSColor* top;
@property(nonatomic,retain) VSColor* right;
@property(nonatomic,retain) VSColor* bottom;
@property(nonatomic,retain) VSColor* left;
@property(nonatomic) CGFloat width;

+ (VSFourBorderStyle*)styleWithTop:(VSColor*)top right:(VSColor*)right
							bottom:(VSColor*)bottom left:(VSColor*)left width:(CGFloat)width
							  next:(VSStyle*)next;

@end
