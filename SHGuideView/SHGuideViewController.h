//
//  SHGuideViewController.h
//  SHGuideView
//
//  Created by shuu on 7/2/16.
//  Copyright (c) 2016 @harushuu. All rights reserved.
//
// The MIT License (MIT)
//
// Copyright (c) 2016 @harushuu
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of
// this software and associated documentation files (the "Software"), to deal in
// the Software without restriction, including without limitation the rights to
// use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
// the Software, and to permit persons to whom the Software is furnished to do so,
// subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
// FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
// COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
// IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


#import <UIKit/UIKit.h>

typedef void(^GuideViewCompleteHandle)();

@interface SHGuideViewController : UIViewController

// default color is lightGrayColor
@property (nonatomic, strong) UIColor *pageIndicatorTintColor;

// default color is darkGrayColor
@property (nonatomic, strong) UIColor *currentPageIndicatorTintColor;

// default color is lightGrayColor
@property (nonatomic, strong) UIColor *comfirmButtonTintColor;

// default color is whiteColor
@property (nonatomic, strong) UIColor *comfirmButtonTitleColor;

// default title is @"Start"
@property (nonatomic, strong) NSString *comfirmButtonTitle;

// default cornerRadius is 3.f;
@property (nonatomic, assign) CGFloat comfirmButtonCornerRadius;

// default is 70.f; distacen screen bottom from confirmButtonBottom;
@property (nonatomic, assign) CGFloat confirmButtonBottom;

// default is 30.f; distance screen bottom from pageIndicatorBottom;
@property (nonatomic, assign) CGFloat pageIndicatorBottom;

//
// if above property can not satisfies you, please complete custom comfirm button;
//
@property (nonatomic, strong) UIButton *userComfirmButton;

- (instancetype)initWithImageName:(NSString *)imageName guidePage:(NSInteger)page completeHandle:(GuideViewCompleteHandle)completeHandle;

+ (BOOL)needShowGuidePage;

@end



/*--------------------------
 
 A simple guide viewController.
 
 Just need set imageName and page count, then implement block functionality using your code please.
 
 Please rename your guide image with format:
 
 e.g.
 yourImageName == 'Guide'
 yourImageTotalCount == 3
 
 your guide image with IPhone4S resolution:
 Please rename your image with  :   'Guide_iPhone4S_1'
 Please rename your image with  :   'Guide_iPhone4S_2'
 Please rename your image with  :   'Guide_iPhone4S_3'
 
 your guide image with IPhone5 resolution
 Please rename your image with  :   'Guide_iPhone5_1'
 Please rename your image with  :   'Guide_iPhone5_2'
 Please rename your image with  :   'Guide_iPhone5_3'
 
 your guide image with IPhone6 resolution
 Please rename your image with  :   'Guide_iPhone6_1'
 Please rename your image with  :   'Guide_iPhone6_2'
 Please rename your image with  :   'Guide_iPhone6_3'
 
 your guide image with IPhone6P resolution
 Please rename your image with  :   'Guide_iPhone6P_1'
 Please rename your image with  :   'Guide_iPhone6P_2'
 Please rename your image with  :   'Guide_iPhone6P_3'
 
 ----------------------------*/



