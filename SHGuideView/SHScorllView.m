//
//  SHScorllView.m
//  SHGuideView
//
//  Created by shuu on 7/2/16.
//  Copyright (c) 2016 @harushuu. All rights reserved.
//

#import "SHScorllView.h"

@implementation SHScorllView

- (instancetype)init {
    if (self = [super init]) {
        self.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
        self.delaysContentTouches = NO;
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
    }
    return self;
}

- (BOOL)touchesShouldCancelInContentView:(UIView *)view {
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [[self nextResponder] touchesBegan:touches withEvent:event];
    [super touchesBegan:touches withEvent:event];
    [self endEditing:YES];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    [[self nextResponder] touchesMoved:touches withEvent:event];
    [super touchesMoved:touches withEvent:event];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [[self nextResponder] touchesEnded:touches withEvent:event];
    [super touchesEnded:touches withEvent:event];
}


@end
