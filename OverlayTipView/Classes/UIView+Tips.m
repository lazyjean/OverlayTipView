//
//  UIView+Tips.m
//  
//
//  Created by liuzhen on 1/10/13.
//  Copyright (c) . All rights reserved.
//

#import "UIView+Tips.h"
#import <objc/runtime.h>

static char TipViewKey;

@implementation UIView (Tips)

@dynamic tipView;

#pragma mark - getter and setter methods.
- (OTTipView *)tipView {
    return objc_getAssociatedObject(self, &TipViewKey);
}

- (void)setTipView:(OTTipView *)tipView {
    objc_setAssociatedObject(self, &TipViewKey, tipView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - interface.
- (void)showOverlayTip:(NSString *)tip {
    [self showOverlayTip:tip image:nil];
}

- (void)showOverlayImageTip:(UIImage *)image {
    [self showOverlayTip:nil image:image];
}

- (void)showOverlayLoading:(NSString *)tip
{
    if (self.tipView) {
        self.tipView.hidden = NO;
        [self.tipView prepareForReuse];
    }
    else {
        self.tipView = [[OTTipView alloc] initWithFrame:self.bounds];
        self.tipView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self addSubview:self.tipView];
    }
    
    self.tipView.loadingText = tip;
    self.tipView.loading = YES;
    self.tipView.tip = nil;
    self.tipView.subTip = nil;
    [self.tipView setNeedsLayout];
}

- (void)showOverlayTip:(NSString *)tip image:(UIImage *)image {
    if (self.tipView) {
        self.tipView.hidden = NO;
        [self.tipView prepareForReuse];
    }
    else {
        self.tipView = [[OTTipView alloc] initWithFrame:self.bounds];
        self.tipView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self addSubview:self.tipView];
    }

    self.tipView.tip = tip;
    self.tipView.image = image;
    self.tipView.loadingText = nil;
    self.tipView.loading = NO;
    [self.tipView setNeedsLayout];
}

- (void)dismissOverylayTip {
    if (self.tipView) {
        self.tipView.hidden = YES;
    }
}

@end
