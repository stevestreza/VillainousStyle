//
//  VSPartStyle.m
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

#import "VSPartStyle.h"


@implementation VSPartStyle

@synthesize name = _name, style = _style;

///////////////////////////////////////////////////////////////////////////////////////////////////
// class public

+ (VSPartStyle*)styleWithName:(NSString*)name style:(VSStyle*)stylez next:(VSStyle*)next {
	VSPartStyle* style = [[[self alloc] initWithNext:next] autorelease];
	style.name = name;
	style.style = stylez;
	return style;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// VSStyle

- (void)draw:(VSStyleContext*)context {
	[self.next draw:context];
}


///////////////////////////////////////////////////////////////////////////////////////////////////

- (void)drawPart:(VSStyleContext*)context {
	[_style draw:context];
}

@end
