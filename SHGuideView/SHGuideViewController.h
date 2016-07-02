//
//  SHGuideViewController.h
//  SHGuideView
//
//  Created by shuu on 7/2/16.
//  Copyright (c) 2016 @harushuu. All rights reserved.
//

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
 Please rename your image with  :   'Guide_IPhone4S_1'
 Please rename your image with  :   'Guide_IPhone4S_2'
 Please rename your image with  :   'Guide_IPhone4S_3'
 
 your guide image with IPhone5 resolution
 Please rename your image with  :   'Guide_IPhone5_1'
 Please rename your image with  :   'Guide_IPhone5_2'
 Please rename your image with  :   'Guide_IPhone5_3'
 
 your guide image with IPhone6 resolution
 Please rename your image with  :   'Guide_IPhone6_1'
 Please rename your image with  :   'Guide_IPhone6_2'
 Please rename your image with  :   'Guide_IPhone6_3'
 
 your guide image with IPhone6P resolution
 Please rename your image with  :   'Guide_IPhone6P_1'
 Please rename your image with  :   'Guide_IPhone6P_2'
 Please rename your image with  :   'Guide_IPhone6P_3'
 
 ----------------------------*/



