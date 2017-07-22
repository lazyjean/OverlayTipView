//
//  UIImage+Sugar.m
//  Group
//
//  Created by liuzhen on 14-1-13.
//  Copyright (c) liuzhen Inc. All rights reserved.
//

#import "UIImage+Sugar.h"

@implementation UIImage (Sugar)

+ (UIImage *)imageWithMask:(NSString *)maskName filledWithColor:(UIColor *)fillColor
{
    UIImage *maskImage = [UIImage imageNamed:maskName];
    UIGraphicsBeginImageContext(maskImage.size);
    [fillColor set];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect bounds = CGRectMake(0, 0, maskImage.size.width, maskImage.size.height);
    CGContextTranslateCTM(context, 0, bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextClipToMask(context, bounds, maskImage.CGImage);
    CGContextFillRect(context, bounds);
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return result;
}

+ (UIImage *)imageWithSize:(CGSize)size filledWithColor:(UIColor *)fillColor
{
    return [self imageWithSize:size filledWithColor:fillColor padding:UIEdgeInsetsZero];
}

+ (UIImage *)imageWithSize:(CGSize)size filledWithColor:(UIColor *)fillColor padding:(UIEdgeInsets)inset
{
    UIImage *image = nil;
    
    UIGraphicsBeginImageContext(size);
    [fillColor set];
    CGFloat width = size.width - inset.left - inset.right;
    CGFloat height = size.height - inset.top - inset.bottom;
    CGContextFillRect(UIGraphicsGetCurrentContext(), CGRectMake(inset.left, inset.top, width, height));
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)imageWithSize:(CGSize)size filledWithColor:(UIColor *)fillColor borderInsets:(UIEdgeInsets)borderInsets borderColor:(UIColor *)borderColor
{
    UIImage *image = nil;
    
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [fillColor set];
    CGContextFillRect(context, CGRectMake(0, 0, size.width, size.height));
    [borderColor set];
    CGContextSetLineWidth(context, 0.5);
    //CGFloat width = size.width - borderInsets.left - borderInsets.right;
    //CGFloat height = size.height - borderInsets.top - borderInsets.bottom;
    CGContextStrokeRect(UIGraphicsGetCurrentContext(), CGRectMake(0, 0, size.width, size.height));
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (UIImage *)centerResize
{
    CGFloat cw = self.size.width/2.0f;
    CGFloat ch = self.size.height/2.0f;
    return  [self resizableImageWithCapInsets:UIEdgeInsetsMake(ch, cw, ch, cw)];
}


+ (UIImage *)stretchableImageNamed:(NSString *)name
{
    if(!name)
        return nil;
    
    UIImage *image = [UIImage imageNamed:name];
    image = [image stretchableImageWithLeftCapWidth:image.size.width/2 topCapHeight:image.size.height/2];
    return image;
}

+ (UIImage *)imageWithRect:(CGRect)rect corner:(CGFloat)corner strokeColor:(UIColor *)color dash:(BOOL)dash {
    
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGFloat lineWidth = 1;
    
    //设置虚线样式
    if (dash) {
        CGFloat dashLength[] = {6, 3};
        CGContextSetLineDash(context, 0, dashLength, 2);
    }
    
    //设置画笔颜色
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    
    //设置填充色
    CGContextSetRGBFillColor(context, 1.0, 1.0, 1.0, 0.0);
    
    //设置线宽
    CGContextSetLineWidth(context, lineWidth);
    
    //
    CGContextSetLineCap(context, kCGLineCapButt);
    
    //设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRoundedRect(path, NULL, CGRectMake(lineWidth/2.0, lineWidth/2.0, rect.size.width - lineWidth, rect.size.height - lineWidth), corner, corner);
    CGContextAddPath(context, path);
    
    //绘制给路径
    CGContextStrokePath(context);
    
    //取出图图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    //清理
    CGPathRelease(path);
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)dashRectImageWithRect:(CGRect)rect corner:(CGFloat)corner strokeColor:(UIColor *)color {
    return [[self class] imageWithRect:rect corner:corner strokeColor:color dash:YES];
}

+ (UIImage *)borderRectImageWithRect:(CGRect)rect corner:(CGFloat)corner strokeColor:(UIColor *)color {
    return [[self class] imageWithRect:rect corner:corner strokeColor:color dash:NO];
}

+ (UIImage *)clearImageWithRect:(CGRect)rect {

    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0);
    CGContextRef context = UIGraphicsGetCurrentContext();

    //设置填充色
    CGContextSetRGBFillColor(context, 1.0, 1.0, 1.0, 0.0);
    CGContextFillRect(context, rect);

    //取出图图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    //清理
    UIGraphicsEndImageContext();
    
    return image;
}

@end
