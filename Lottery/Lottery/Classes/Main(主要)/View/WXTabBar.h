//
//  WXTabBar.h
//  35-我的彩票
//
//  Created by 李伟雄 on 15/12/15.
//  Copyright © 2015年 小码哥. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WXTabBar, WXTabBarButton;

// 定义代理协议
@protocol WXTabBarDelegate <NSObject>
@optional
// 按钮点击时调用
- (void)tabBar:(WXTabBar *)tabBar didClickTabBarButton:(WXTabBarButton *)tabBarButton;
@end

@interface WXTabBar : UIView

/** TabBar数据 */
@property (strong, nonatomic) NSArray<UITabBarItem *> *items;

/** 代理属性 */
@property (weak, nonatomic) id<WXTabBarDelegate> delegate;

@end
