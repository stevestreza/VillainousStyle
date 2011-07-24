//
//  VSContentStyle.m
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

#import "VSContentStyle.h"


@implementation VSContentStyle

///////////////////////////////////////////////////////////////////////////////////////////////////
// class public

+ (VSContentStyle*)styleWithNext:(VSStyle*)next {
	return [[[self alloc] initWithNext:next] autorelease];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// TTStyle

- (void)draw:(VSStyleContext*)context {
	if ([context.delegate respondsToSelector:@selector(drawLayer:withStyle:)]) {
		[context.delegate drawLayer:context withStyle:self];
		context.didDrawContent = YES;
	}
	
	[self.next draw:context];
}

@end
