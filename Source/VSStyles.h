//
//  VSStyles.h
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
#import "VSPartStyle.h"

#import "VSSolidFillStyle.h"
#import "VSLinearGradientFillStyle.h"
#import "VSReflectiveFillStyle.h"

#import "VSSolidBorderStyle.h"
#import "VSBevelBorderStyle.h"
#import "VSFourBorderStyle.h"

#import "VSShadowStyle.h"
#import "VSInnerShadowStyle.h"

#import "VSBoxStyle.h"
#import "VSInsetStyle.h"

#import "VSTextStyle.h"
#import "VSImageStyle.h"
#import "VSMaskStyle.h"
#import "VSShapeStyle.h"

#import "VSStyleSheet.h"

#define VSStyleNamed(_SELECTOR) (VSStyle *)([[VSStyleSheet globalStyleSheet] styleWithSelector: @#_SELECTOR ])