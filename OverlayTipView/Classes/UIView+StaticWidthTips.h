//
//  UIView+StaticWidthTips.h
//  
//
//  Created by Jean Liu on 1/10/13.
//  Copyright (c) . All rights reserved.
//

#import <UIKit/UIKit.h>


//对UIView+Tips分类的封装，这个和当前设计绑定

@interface UIView (StaticWidthTips)

- (void)showTip:(NSString *)tip imageName:(NSString *)imageName;
- (void)showTip:(NSString *)tip imageName:(NSString *)imageName withFrame:(CGRect)frame;
- (void)setSubTitle:(NSString *)subTitle;
- (void)setActionTitle:(NSString *)title handler:(void (^)(void))handler;

- (void)showTipLoading;
- (void)showLoading:(NSString *)loadingText;

/**
 *  与showLoading功能类似，showLoading对UITableView进行了优化，tableHeader部分不会被挡住，该接口会挡住整个视图
 *
 *  @param loadingText 提示文字
 */
- (void)showFullScreenLoading:(NSString *)loadingText;

- (void)dismissTip;

@end
