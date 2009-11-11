//
//  VSStyleContext.m
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

#import "VSStyleContext.h"
#import "VSRectangleShape.h"

@implementation VSStyleContext
@synthesize delegate = _delegate, frame = _frame, contentFrame = _contentFrame, shape = _shape,
font = _font, didDrawContent = _didDrawContent;

///////////////////////////////////////////////////////////////////////////////////////////////////
// NSObject

- (id)init {
	if (self = [super init]) {
		_delegate = nil;
		_frame = CGRectZero;
		_contentFrame = CGRectZero;
		_shape = nil;
		_font = nil;
		_didDrawContent = NO;
	}
	return self;
}

- (void)dealloc {
	VS_RELEASE_SAFELY(_shape);
	VS_RELEASE_SAFELY(_font);
	[super dealloc];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// public

- (VSShape*)shape {
	if (!_shape) {
		_shape = [[VSRectangleShape shape] retain];
	}
	return _shape;
}

@end
