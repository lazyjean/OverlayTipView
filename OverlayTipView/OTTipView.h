//
//  TWTipView.h
//  
//
//  Created by liuzhen on 1/10/13.
//  Copyright (c) . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OTSizeFitLabel.h"

@interface OTTipView : UIView

@property (nonatomic, strong) NSString *tip;
@property (nonatomic, strong) NSString *subTip;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSString *loadingText;
@property (nonatomic, assign) BOOL loading;

- (void)setActionTitle:(NSString *)title handler:(void (^)(void))handler;

- (void)prepareForReuse;

@end
