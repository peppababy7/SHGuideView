# SHGuideView

[![CI Status](http://img.shields.io/travis/@harushuu/SHGuideView.svg?style=flat)](https://travis-ci.org/@harushuu/SHGuideView)
[![Version](https://img.shields.io/cocoapods/v/SHGuideView.svg?style=flat)](http://cocoapods.org/pods/SHGuideView)
[![License](https://img.shields.io/cocoapods/l/SHGuideView.svg?style=flat)](http://cocoapods.org/pods/SHGuideView)
[![Platform](https://img.shields.io/cocoapods/p/SHGuideView.svg?style=flat)](http://cocoapods.org/pods/SHGuideView)

## Screenshots
![image](https://github.com/harushuu/SHGuideView/raw/master/Screenshots.gif)

## Installation

With [CocoaPods](http://cocoapods.org/), add this line to your `Podfile`.

```
pod 'SHGuideView', '~> 0.1.1'
```

and run `pod install`, then you're all done!

## How to use

```objc
    if ([SHGuideViewController needShowGuidePage]) {
            SHGuideViewController *guideViewController = [[SHGuideViewController alloc] initWithImageName:@"Guide" guidePage:3 completeHandle:^{
            //code... push your view controller;
        }];
        self.window.rootViewController = guideViewController;
    } else {
        //code... push your view controller;
    }
```

## Summary

A simple guide viewController.

Just need set imageName and page count, then implement block functionality using your code please.

Please rename your guide image with format:

###e.g.
yourImageName == 'Guide'
yourImageTotalCount == 3

your guide image with iPhone4S resolution:
Please rename your image with  :   'Guide_iPhone4S_1'
Please rename your image with  :   'Guide_iPhone4S_2'
Please rename your image with  :   'Guide_iPhone4S_3'

your guide image with iPhone5 resolution
Please rename your image with  :   'Guide_iPhone5_1'
Please rename your image with  :   'Guide_iPhone5_2'
Please rename your image with  :   'Guide_iPhone5_3'

your guide image with iPhone6 resolution
Please rename your image with  :   'Guide_iPhone6_1'
Please rename your image with  :   'Guide_iPhone6_2'
Please rename your image with  :   'Guide_iPhone6_3'

your guide image with iPhone6P resolution
Please rename your image with  :   'Guide_iPhone6P_1'
Please rename your image with  :   'Guide_iPhone6P_2'
Please rename your image with  :   'Guide_iPhone6P_3'
```

###custom

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
```

## Requirements

* iOS 8.0+ 
* ARC

## Author

@harushuu, hunter4n@gmail.com

## License

English: SHGuideView is available under the MIT license, see the LICENSE file for more information.     

