//
//  GRLoadingLabel.m
//  Group
//
//  Created by Leeszi on 4/29/14.
//  Copyright (c) liuzhen All rights reserved.
//

#import "OTLoadingLabel.h"

@interface OTLoadingLabel ()
@property (nonatomic, strong) OTSizeFitLabel *loadingLabel;
@property (nonatomic, strong) UIActivityIndicatorView *activity;
@end

@implementation OTLoadingLabel

- (UIActivityIndicatorView *)activity
{
    if (!_activity)
    {
        _activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        _activity.hidesWhenStopped = YES;
        [self addSubview:_activity];
        [_activity startAnimating];
    }
    return _activity;
}

- (OTSizeFitLabel *)loadingLabel
{
    if (!_loadingLabel)
    {
        //添加提示标签
        _loadingLabel = [[OTSizeFitLabel alloc] init];
        _loadingLabel.backgroundColor = [UIColor clearColor];
        _loadingLabel.font = [UIFont systemFontOfSize:14];
        _loadingLabel.textColor = [UIColor clearColor];
        [self addSubview:_loadingLabel];
    }
    return _loadingLabel;
}

- (void)setFont:(UIFont *)font
{
    self.loadingLabel.font = font;
}

- (UIFont *)font
{
    return self.loadingLabel.font;
}

- (void)setTextColor:(UIColor *)textColor
{
    self.loadingLabel.textColor = textColor;
}

- (UIColor *)textColor
{
    return self.loadingLabel.textColor;
}

- (void)setText:(NSString *)text
{
    self.loadingLabel.text = text;
}

- (NSString *)text
{
    return self.loadingLabel.text;
}

- (void)setConstrainedToSize:(CGSize)constrainedToSize
{
    self.loadingLabel.constrainedToSize = constrainedToSize;
}

- (CGSize)sizeThatFits:(CGSize)size
{
    CGSize newSize = [self.loadingLabel sizeThatFits:CGSizeMake(size.width - self.activity.frame.size.width, size.height)];
    newSize.width += self.activity.frame.size.width;
    return newSize;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.activity sizeToFit];
    [self.loadingLabel sizeToFit];
    
    //计算菊花和标签的总宽度，以及左边距
    CGFloat padding = 3;
    CGFloat totalWidth = self.loadingLabel.frame.size.width + self.activity.frame.size.width;
    CGFloat x = (self.frame.size.width - totalWidth - padding)/2.0f;
    CGFloat y = self.frame.size.height/2.0f;
    
    //开始布局
    x+= self.activity.frame.size.width/2.0f;
    self.activity.center = CGPointMake(x, y);
    
    x+= (self.activity.frame.size.width + self.loadingLabel.frame.size.width)/2.0f;
    x+= padding;
    self.loadingLabel.center = CGPointMake(x, y);
}

@end
