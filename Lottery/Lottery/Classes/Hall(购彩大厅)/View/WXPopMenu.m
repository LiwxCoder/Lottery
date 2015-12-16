//
//  WXPopMenu.m
//  35-我的彩票
//
//  Created by 李伟雄 on 15/12/15.
//  Copyright © 2015年 小码哥. All rights reserved.
//

#import "WXPopMenu.h"

#define WXKeyWindow [UIApplication sharedApplication].keyWindow

@implementation WXPopMenu


- (IBAction)closeButtonClick {
    // 通知代理对象
    if ([self.delegate respondsToSelector:@selector(popMenuDidClickClose:)]) {
        [self.delegate popMenuDidClickClose:self];
    }
}

// 类方法从xib创建对象
+ (instancetype)popMenu
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

// 显示图片遮盖
+ (instancetype)showInPoint:(CGPoint)point
{
    WXPopMenu *popMenu = [self popMenu];
    popMenu.center = point;
    
    [WXKeyWindow addSubview:popMenu];
    return popMenu;
}

// 动画显示遮盖
+ (instancetype)showAnimationAtFromPoint:(CGPoint)fromPoint ToPoint:(CGPoint)toPoint
{
    WXPopMenu *popMenu = [self popMenu];
    popMenu.center = fromPoint;
    popMenu.transform = CGAffineTransformMakeScale(0.01, 0.01);
    
    // 动画显示
    [UIView animateWithDuration:0.5 animations:^{
        popMenu.center = toPoint;
        popMenu.transform = CGAffineTransformMakeScale(1, 1);
    }];
    
    [WXKeyWindow addSubview:popMenu];
    
    return popMenu;
}


// 隐藏图片遮盖
- (void)hideInPoint:(CGPoint)point completion:(void(^)())completionBlock
{
    [UIView animateWithDuration:0.5 animations:^{
        // 移除动画
        self.center = point;
        self.transform = CGAffineTransformMakeScale(0.01, 0.01);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        
        // 执行block
        if (completionBlock) {
            completionBlock();
        }
        
    }];
}


@end
