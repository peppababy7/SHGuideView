//
//  SHGuideViewController.m
//  SHGuideView
//
//  Created by shuu on 7/2/16.
//  Copyright (c) 2016 @harushuu. All rights reserved.
//

#import "SHGuideViewController.h"
#import "SHScorllView.h"
#import <Masonry/Masonry.h>
#import <BFPaperButton/BFPaperButton.h>

#define IPHONE5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define IPHONE6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size)) : NO)
#define IPHONE6P ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(1125, 2001), [[UIScreen mainScreen] currentMode].size)) : NO)

@interface SHGuideViewController () <UIScrollViewDelegate>
@property (nonatomic, assign) BOOL didSetupConstraint;
@property (nonatomic, strong) SHScorllView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) NSMutableArray *imageNameArray;
@property (nonatomic, copy) GuideViewCompleteHandle completeHandle;

@end

@implementation SHGuideViewController

#pragma mark - initialization

- (instancetype)initWithImageName:(NSString *)imageName guidePage:(NSInteger)page completeHandle:(GuideViewCompleteHandle)completeHandle {
    if (self = [super init]) {
        [self setupImageNameArrayWithImageName:imageName guidePage:page];
        if (completeHandle) {
            self.completeHandle = completeHandle;
        }
    }
    return self;
}

- (instancetype)init {
    if (self = [super init]) {
        // please implement another init method
        NSLog(@"please implement another init method");
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupViews];
    [self setupGuideImage];
    [self.view updateConstraintsIfNeeded];
    [self.view setNeedsUpdateConstraints];
}

- (void)setupViews {
    [self.view addSubview:self.scrollView];
    [self.view addSubview:self.pageControl];
}

- (void)updateViewConstraints {
    if (!self.didSetupConstraint) {
        self.didSetupConstraint = YES;
        UIView *superView = self.view;
        [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(superView);
        }];
        [self.pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(superView);
            make.bottom.equalTo(superView).with.offset(-30);
        }];
    }
    [super updateViewConstraints];
}

# pragma mark - private API

+ (BOOL)needShowGuidePage {
    NSString *key = @"CFBundleShortVersionString";
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *lastVersion = [defaults stringForKey:key];
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[key];
    if ([currentVersion isEqualToString:lastVersion]) {
        return NO;
    } else {
        [defaults setObject:currentVersion forKey:key];
        [defaults synchronize];
        return YES;
    }
}

- (void)setupImageNameArrayWithImageName:(NSString *)imageName guidePage:(NSInteger)page {
    for (int i = 1; i <= page; i++) {
        NSString *deviceModel;
        if (IPHONE5) {
            deviceModel = [NSString stringWithFormat:@"%@_IPhone5_", imageName];
        } else if (IPHONE6) {
            deviceModel = [NSString stringWithFormat:@"%@_IPhone6_", imageName];
        } else if (IPHONE6P) {
            deviceModel = [NSString stringWithFormat:@"%@_IPhone6P_", imageName];
        } else {
            deviceModel = [NSString stringWithFormat:@"%@_IPhone4S_", imageName];
        }
        deviceModel = [NSString stringWithFormat:@"%@%d", deviceModel, i];
        [self.imageNameArray addObject:deviceModel];
    }
}

- (void)setupGuideImage {
    UIImageView *lastImageView;
    for (int i = 1; i <= self.imageNameArray.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.imageNameArray[i - 1]]];
        [self.scrollView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(self.view);
            make.left.equalTo(i == 1 ? self.scrollView : lastImageView.mas_right);
            if (i == 3) make.right.equalTo(self.scrollView);
            make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
        }];
        lastImageView = imageView;
        if (i == self.imageNameArray.count) {
            BFPaperButton *startButton = [SHGuideViewController setBFPaperButtonWithTitle:self.comfirmButtonTitle titleColor:self.comfirmButtonTitleColor fontSize:15.f backgrondColor:self.comfirmButtonTintColor cornerRadius:3.f];
            [startButton addTarget:self action:@selector(startButtonPressed) forControlEvents:UIControlEventTouchUpInside];
            [self.scrollView addSubview:startButton];
            [startButton mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(imageView).with.offset(-70);
                make.left.equalTo(imageView).with.offset(50);
                make.right.equalTo(imageView).with.offset(-50);
                make.height.mas_equalTo(44);
            }];
        }
    }
}

+ (BFPaperButton *)setBFPaperButtonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor fontSize:(CGFloat)fontSize backgrondColor:(UIColor *)backgroundColor cornerRadius:(CGFloat)cornerRadius {
    BFPaperButton *button = [[BFPaperButton alloc] init];
    button.shadowColor = [UIColor clearColor];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    button.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    button.backgroundColor = backgroundColor;
    if (cornerRadius) {
        button.layer.cornerRadius = cornerRadius;
        button.layer.masksToBounds = YES;
    }
    return button;
}

- (void)startButtonPressed {
    if (self.completeHandle) self.completeHandle();
}

# pragma mark - default

- (UIColor *)pageIndicatorTintColor {
    if (!_pageIndicatorTintColor) {
        _pageIndicatorTintColor = [UIColor lightGrayColor];
    }
    return _pageIndicatorTintColor;
}

- (UIColor *)currentPageIndicatorTintColor {
    if (!_currentPageIndicatorTintColor) {
        _currentPageIndicatorTintColor = [UIColor darkGrayColor];
    }
    return _currentPageIndicatorTintColor;
}

- (UIColor *)comfirmButtonTintColor {
    if (!_comfirmButtonTintColor) {
        _comfirmButtonTintColor = [UIColor lightGrayColor];
    }
    return _comfirmButtonTintColor;
}

- (UIColor *)comfirmButtonTitleColor {
    if (!_comfirmButtonTitleColor) {
        _comfirmButtonTitleColor = [UIColor whiteColor];
    }
    return _comfirmButtonTitleColor;
}

- (NSString *)comfirmButtonTitle {
    if (!_comfirmButtonTitle) {
        _comfirmButtonTitle = @"Start";
    }
    return _comfirmButtonTitle;
}

# pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    self.pageControl.currentPage = (scrollView.contentOffset.x / scrollView.bounds.size.width);
}

# pragma mark - lazyload

- (SHScorllView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[SHScorllView alloc] init];
        _scrollView.pagingEnabled = YES;
        _scrollView.bounces = NO;
        _scrollView.delegate = self;
    }
    return _scrollView;
}

- (UIPageControl *)pageControl {
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] init];
        _pageControl.currentPageIndicatorTintColor = self.currentPageIndicatorTintColor;
        _pageControl.pageIndicatorTintColor = self.pageIndicatorTintColor;
        _pageControl.numberOfPages = 3;
        _pageControl.userInteractionEnabled = NO;
    }
    return _pageControl;
}

- (NSMutableArray *)imageNameArray {
    if (!_imageNameArray) {
        _imageNameArray = [NSMutableArray array];
    }
    return _imageNameArray;
}


@end
