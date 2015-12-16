//
//  WXCover.m
//  35-我的彩票
//
//  Created by 李伟雄 on 15/12/15.
//  Copyright © 2015年 小码哥. All rights reserved.
//

#import "WXCover.h"

@implementation WXCover

/**
 *  显示遮盖
 */
+ (void)show
{
    // 创建蒙版(遮盖view)
    WXCover *cover = [[WXCover alloc] initWithFrame:[UIScreen mainScreen].bounds];
    cover.backgroundColor = [UIColor blackColor];
    cover.alpha = 0.6;
    
    // 添加到window
    [WXKeyWindow addSubview:cover];
}

/**
 *  隐藏遮盖(移除遮盖)
 */
+ (void)hide
{
    // 遍历keyWindow的子控件
    for (UIView *view in WXKeyWindow.subviews) {
        if ([view isKindOfClass:[self class]]) {
            // 移除遮盖
            [view removeFromSuperview];
        }
    }
}

@end
