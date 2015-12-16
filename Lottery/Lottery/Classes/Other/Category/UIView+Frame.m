//
//  UIView+Frame.m
//  35-我的彩票
//
//  Created by 李伟雄 on 15/12/15.
//  Copyright © 2015年 小码哥. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

/**
 *  获取view的x值
 */
- (CGFloat)x
{
    return self.frame.origin.x;
}

/**
 *  设置view的x值
 */
- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    
    frame.origin.x = x;
    
    self.frame = frame;
}

/**
 *  获取view的y值
 */
- (CGFloat)y
{
    return self.frame.origin.y;
}

/**
 *  设置view的y值
 */
- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    
    frame.origin.y = y;
    
    self.frame = frame;
}

/**
 *  获取view的宽度
 */
- (CGFloat)width
{
    return  self.bounds.size.width;
}

/**
 *  设置view的宽度
 */
- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    
    frame.size.width = width;
    
    self.frame = frame;
}

/**
 *  获取view的高度
 */
- (CGFloat)height
{
    return  self.bounds.size.height;
}

/**
 *  设置view的高度
 */
- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    
    frame.size.height = height;
    
    self.frame = frame;
    
}
@end
