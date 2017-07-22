//
//  GRLoadingLabel.h
//  Group
//
//  Created by Leeszi on 4/29/14.
//  Copyright (c) liuzhen All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OTSizeFitLabel.h"

@interface OTLoadingLabel : UIView

@property (strong, nonatomic) UIFont *font;
@property (strong, nonatomic) UIColor *textColor;
@property (strong, nonatomic) NSString *text;
@property (assign, nonatomic) CGSize constrainedToSize;

@end
