//
//  UIImage+Sugar.h
//  Group
//
//  Created by liuzhen on 14-1-13.
//  Copyright (c) liuzhen Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Sugar)

+ (UIImage *)imageWithMask:(NSString *)maskName filledWithColor:(UIColor *)fillColor;
+ (UIImage *)imageWithSize:(CGSize)size filledWithColor:(UIColor *)fillColor;
+ (UIImage *)imageWithSize:(CGSize)size filledWithColor:(UIColor *)fillColor padding:(UIEdgeInsets)inset;
+ (UIImage *)imageWithSize:(CGSize)size filledWithColor:(UIColor *)fillColor borderInsets:(UIEdgeInsets)borderInsets borderColor:(UIColor *)borderColor;

//返回一个resizableImage,以中心点缩放
- (UIImage *)centerResize;

+ (UIImage *)stretchableImageNamed:(NSString *)name;

/**
 *  绘制一个虚线框
 *
 *  @param rect   虚线框的大小
 *  @param corner 圆角的大小
 *  @param color  线框线条的颜色
 *
 *  @return 虚线框图片
 */
+ (UIImage *)dashRectImageWithRect:(CGRect)rect corner:(CGFloat)corner strokeColor:(UIColor *)color;

/**
 *  绘制一个实线边框
 *
 *  @param rect   边框的大小
 *  @param corner 圆角的大小
 *  @param color  线条颜色
 *
 *  @return 实线边框
 */
+ (UIImage *)borderRectImageWithRect:(CGRect)rect corner:(CGFloat)corner strokeColor:(UIColor *)color;

/**
 *  生成一张透明的图片
 *
 *  @param rect 图片的大小
 *
 *  @return 图片
 */
+ (UIImage *)clearImageWithRect:(CGRect)rect;

@end
