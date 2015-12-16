//
//  WXPopMenu.h
//  35-我的彩票
//
//  Created by 李伟雄 on 15/12/15.
//  Copyright © 2015年 小码哥. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WXPopMenu;

@protocol WXPopMenuDelegate <NSObject>
@optional
/**
 *  图片右上角关闭按钮点击调用此方法
 */
- (void)popMenuDidClickClose:(WXPopMenu *)popMenu;
@end


@interface WXPopMenu : UIView

/** 代理属性 */
@property (weak, nonatomic) id<WXPopMenuDelegate> delegate;

/**
 *  显示到指定点
 */
+ (instancetype)showInPoint:(CGPoint)point;

/**
 *  动画显示遮盖
 */
+ (instancetype)showAnimationAtFromPoint:(CGPoint)fromPoint ToPoint:(CGPoint)toPoint;

/**
 *  动画隐藏到指定点
 */
- (void)hideInPoint:(CGPoint)point completion:(void(^)())completionBlock;


@end
