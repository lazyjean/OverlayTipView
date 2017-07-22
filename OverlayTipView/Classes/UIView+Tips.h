//
//  UIView+Tips.h
//  
//
//  Created by liuzhen on 1/10/13.
//  Copyright (c) . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OTTipView.h"

@interface UIView (Tips)

@property (nonatomic, readonly) OTTipView *tipView;

- (void)showOverlayTip:(NSString *)tip;
- (void)showOverlayLoading:(NSString *)tip;
- (void)showOverlayTip:(NSString *)tip image:(UIImage *)image;
- (void)showOverlayImageTip:(UIImage *)image;
- (void)dismissOverylayTip;

@end
