//
//  WXTitleView.m
//  Lottery
//
//  Created by 李伟雄 on 15/12/19.
//  Copyright © 2015年 Liwx. All rights reserved.
//

#import "WXTitleView.h"
#import "UIView+Frame.h"

@implementation WXTitleView

/**
 *  重写setTitle:forState:方法,目的是为了让用户更新标题时无需再设置自动计算尺寸
 */
- (void)setTitle:(NSString *)title forState:(UIControlState)state
{
    [super setTitle:title forState:state];
    
    // 设置自动计算尺寸,必须在[super setTitle:title forState:state]之后调用,对最新的title进行计算尺寸
    [self sizeToFit];
}

/**
 *  重写setImage:forState:方法,目的是为了让用户更新图片时无需再设置自动计算尺寸
 */
- (void)setImage:(UIImage *)image forState:(UIControlState)state
{
    [super setImage:image forState:state];
    
    // 设置自动计算尺寸,必须在[super setImage:image forState:state]之后调用,对最新的image进行计算尺寸
    [self sizeToFit];
}

/**
 *  重新布局子控件位置
 */
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 交换位置,只需交换一次,如果多次交换会出现一只向右边偏移,并且超出按钮原始尺寸的区域无法点击
    if (self.titleLabel.x > self.imageView.x) {
        self.titleLabel.x = self.imageView.x;
        self.imageView.x = CGRectGetMaxX(self.titleLabel.frame);
    }
}

@end
