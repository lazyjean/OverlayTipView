//
//  UIView+StaticWidthTips.m
//  
//
//  Created by liuzhen on 1/10/13.
//  Copyright (c) . All rights reserved.
//

#import "UIView+StaticWidthTips.h"
#import "UIView+Tips.h"

@import ObjectiveC.runtime;

@interface UIView ()
@property (nonatomic, strong) UIView *originalFooter;
@end

@implementation UIView (StaticWidthTips)

static char OriginalFooterKey;

static char kAssociatedObjectKey_footerView;

#pragma mark - getter and setter
- (void)setOriginalFooter:(UIView *)originalFooter {
    objc_setAssociatedObject(self, &OriginalFooterKey, originalFooter, OBJC_ASSOCIATION_RETAIN);
}

- (UIView *)originalFooter {
    return objc_getAssociatedObject(self, &OriginalFooterKey);
}

- (void)setFooterView:(UIView *)footerView {
    objc_setAssociatedObject(self, &kAssociatedObjectKey_footerView, footerView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)footerView {
    return (UIView *)objc_getAssociatedObject(self, &kAssociatedObjectKey_footerView);
}

#pragma mark - interface
- (void)showTip:(NSString *)tip imageName:(NSString *)imageName
{
    [self dismissTip];
    UIImage *image = nil;
    if(imageName)
    {
       image = [UIImage imageNamed:imageName];
    }
    [self showOverlayTip:tip image:image];
    
    self.tipView.frame = self.bounds;

    //针对表格优化tip的位置 
    if ([self isKindOfClass:[UITableView class]]) {
        UITableView *table = (UITableView *)self;
        CGFloat headerHeight =table.tableHeaderView ? table.tableHeaderView.frame.size.height : 0;
        CGRect frame = CGRectMake(0, table.contentSize.height, table.frame.size.width, table.frame.size.height - table.contentSize.height);
        if (frame.size.height < 200) {
            self.originalFooter = [(UITableView *)self tableFooterView];
            self.footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 200 - table.contentSize.height + headerHeight)];
            [(UITableView *)self setTableFooterView:self.footerView];
            frame.size.height = 200;
            [self bringSubviewToFront:self.tipView];
        }
        self.tipView.frame = frame;
    }
    
    self.tipView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.tipView.backgroundColor = self.backgroundColor;
    [self bringSubviewToFront:self.tipView];
}

- (void)showTip:(NSString *)tip imageName:(NSString *)imageName withFrame:(CGRect)frame {
    
    UIImage *image = nil;
    if(imageName)
    {
        image = [UIImage imageNamed:imageName];
    }
    [self showOverlayTip:tip image:image];

    self.tipView.frame = frame;

    //针对表格优化tip的位置
    if ([self isKindOfClass:[UITableView class]]) {
        UITableView *table = (UITableView *)self;
        CGFloat headerHeight =table.tableHeaderView ? table.tableHeaderView.frame.size.height : 0;
        CGRect frame = CGRectMake(0, headerHeight, table.frame.size.width, table.frame.size.height - headerHeight);
        self.tipView.frame = frame;
    }

    self.tipView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
}

- (void)showLoading:(NSString *)loadingText {
    [self showOverlayLoading:loadingText];
    self.tipView.frame = self.bounds;
    self.tipView.backgroundColor = self.backgroundColor;
    
    //针对表格优化tip的位置
    if ([self isKindOfClass:[UITableView class]]) {
        UITableView *table = (UITableView *)self;
        CGFloat headerHeight = table.tableHeaderView ? table.tableHeaderView.frame.size.height : 0;
        CGRect frame = CGRectMake(0, headerHeight, table.frame.size.width, table.frame.size.height - headerHeight);
        self.tipView.frame = frame;
    }
    
    self.tipView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
}

- (void)showFullScreenLoading:(NSString *)loadingText {
    [self showOverlayLoading:loadingText];
    self.tipView.frame = self.bounds;
    self.tipView.backgroundColor = self.backgroundColor;    
    self.tipView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
}

- (void)setActionTitle:(NSString *)title handler:(void (^)(void))handler {
    if (self.tipView) {
        [self.tipView setActionTitle:title handler:handler];
    }
}

- (void)setSubTitle:(NSString *)subTitle {
    if (self.tipView) {
        self.tipView.subTip = subTitle;
    }
}

- (void)showTipLoading {
    [self showLoading:@"加载中..."];
}

- (void)dismissTip {
    if ([self isKindOfClass:[UITableView class]]) {
        if (self.footerView) {
            [(UITableView *)self setTableFooterView:nil];
            self.footerView = nil;
        }
        
        if(self.originalFooter) {
            [(UITableView *)self setTableFooterView:self.originalFooter];
            self.originalFooter = nil;
        }
    }
    [self dismissOverylayTip];
}

@end
