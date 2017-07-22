//
//  GRLabel.m
//  Group
//
//  Created by Leeszi on 2/28/14.
//  Copyright (c) liuzhen All rights reserved.
//

#import "OTSizeFitLabel.h"

@implementation OTSizeFitLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.constrainedToSize = CGSizeMake(INFINITY, INFINITY);
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.constrainedToSize = CGSizeMake(INFINITY, INFINITY);
    }
    return self;
}

- (CGSize)sizeThatFits:(CGSize)size
{
    CGSize newSize = [super sizeThatFits:CGSizeMake(self.constrainedToSize.width, size.height)];
    return newSize;
}

- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines
{
    CGRect newRect = [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
    newRect.size.width = MIN(self.constrainedToSize.width, newRect.size.width);
    newRect.size.height = MIN(self.constrainedToSize.height, newRect.size.height);
    return newRect;
}

@end
