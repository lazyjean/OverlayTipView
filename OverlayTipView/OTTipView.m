//
//  TWTipView.m
//  
//
//  Created by liuzhen on 1/10/13.
//  Copyright (c) . All rights reserved.
//

#import "OTTipView.h"
#import "OTLoadingLabel.h"
#import "UIImage+Sugar.h"

@interface OTTipView ()
@property (nonatomic, strong) OTSizeFitLabel *tipLabel;
@property (nonatomic, strong) OTSizeFitLabel *subLabel;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) OTLoadingLabel *loadingLabel;
@property (nonatomic, strong) UIButton *actionButton;
@property (nonatomic, copy) void (^actionHandler)(void);
@end

@implementation OTTipView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

#pragma mark - getter and setter
- (void)setActionTitle:(NSString *)title handler:(void (^)(void))handler {

    if (title && handler) {
        
        self.actionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.actionButton addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
        self.actionHandler = handler;
        
        //设置按钮信息
        self.actionButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [self.actionButton setTitle:title forState:UIControlStateNormal];
        [self.actionButton setBackgroundImage:[UIImage imageNamed:@"btn_bg"] forState:UIControlStateNormal];
        [self.actionButton setTitleColor:[UIColor colorWithRed:1.000 green:1.000 blue:1.000 alpha:1.000] forState:UIControlStateNormal];
        [self.actionButton setContentEdgeInsets:UIEdgeInsetsMake(10, 15, 10, 15)];
        [self.actionButton sizeToFit];
        [self addSubview:self.actionButton];
    }
    else {
        self.actionButton ? [self.actionButton removeFromSuperview] : 0;
        self.actionButton = nil;
    }
}

- (void)action:(id)sender {
    if (self.actionHandler) {
        self.actionHandler();
    }
}

- (OTSizeFitLabel *)tipLabel
{
    if (!_tipLabel)
    {
        //添加提示标签
        _tipLabel = [[OTSizeFitLabel alloc] init];
        _tipLabel.backgroundColor = [UIColor clearColor];
        _tipLabel.font = [UIFont systemFontOfSize:14];
        _tipLabel.textAlignment= NSTextAlignmentCenter;
        _tipLabel.textColor = [UIColor grayColor];
        _tipLabel.numberOfLines = 2;
        [self addSubview:_tipLabel];
    }
    
    return _tipLabel;
}

- (OTSizeFitLabel *)subLabel
{
    if (!_subLabel)
    {
        //添加提示标签
        _subLabel = [[OTSizeFitLabel alloc] init];
        _subLabel.backgroundColor = [UIColor clearColor];
        _subLabel.font = [UIFont systemFontOfSize:13];
        _subLabel.textAlignment= NSTextAlignmentCenter;
        _subLabel.numberOfLines = 4;
        [self addSubview:_subLabel];
    }
    return _subLabel;
}

- (OTLoadingLabel *)loadingLabel
{
    if (!_loadingLabel)
    {
        //添加提示标签
        _loadingLabel = [[OTLoadingLabel alloc] init];
        _loadingLabel.backgroundColor = [UIColor clearColor];
        _loadingLabel.font = [UIFont systemFontOfSize:13];
        _loadingLabel.textColor = [UIColor blackColor];
        [self addSubview:_loadingLabel];
    }
    return _loadingLabel;
}

- (UIImageView *)imageView
{
    if (!_imageView)
    {
        //添加图片标签
        _imageView = [[UIImageView alloc] init];
        [self addSubview:_imageView];
    }
    return _imageView;
}

#pragma mark - layout

//用于指定提示部分的起始位置(总高度的比率)
#define kOriginYRatio    0.20
- (void)prepareForReuse
{
    [_loadingLabel removeFromSuperview];
    _loadingLabel = nil;
    
    [_tipLabel removeFromSuperview];
    _tipLabel = nil;
    
    [_subLabel removeFromSuperview];
    _subLabel = nil;
    
    [_imageView removeFromSuperview];
    _imageView = nil;
    
    [_actionButton removeFromSuperview];
    _actionButton = nil;
}

- (NSArray *)layoutViews
{
    NSMutableArray *layoutViews = [NSMutableArray array];
    
    if (self.image)
    {
        self.imageView.image = self.image;
        self.imageView.bounds = CGRectMake(0, 0, self.image.size.width, self.image.size.height);
        [layoutViews addObject:self.imageView];
    }

    if (self.tip)
    {
        self.tipLabel.text = self.tip;
        self.tipLabel.constrainedToSize = CGSizeMake(self.frame.size.width - 110, INFINITY);
        [self.tipLabel sizeToFit];
        [layoutViews addObject:self.tipLabel];
    }
    
    if (self.subTip)
    {
        self.subLabel.text = self.subTip;
        self.subLabel.constrainedToSize = CGSizeMake(self.frame.size.width - 110, INFINITY);
        [self.subLabel sizeToFit];
        [layoutViews addObject:self.subLabel];
    }
    
    if (self.loading)
    {
        self.loadingLabel.text = self.loadingText;
        self.loadingLabel.constrainedToSize = CGSizeMake(self.frame.size.width - 110, INFINITY);
        [self.loadingLabel sizeToFit];
        [layoutViews addObject:self.loadingLabel];
    }
    
    if (self.actionButton)
    {
        [layoutViews addObject:self.actionButton];
    }
    
    return layoutViews;
}

- (void)layoutSubviews
{
    NSArray *layoutViews = [self layoutViews];
    CGFloat count = [layoutViews count];

    CGFloat totalHeight = 0;
    for (UIView *view in layoutViews)
    {
        totalHeight += view.frame.size.height;
    }
    
    //
    CGFloat padding = 3;
    CGFloat y = (self.frame.size.height - totalHeight - (padding+15)*(count - 1)) / 2.0f;
    y = MIN(y, 90);
    CGFloat x = self.frame.size.width/2.0f;

    //layout
    for (UIView *view in [self layoutViews])
    {
        if (view == self.actionButton)
        {
            y+= 5;
        }
        view.center = CGPointMake(x, y + view.frame.size.height/2.0f);
        y+= padding + view.frame.size.height;
    }
}

@end
