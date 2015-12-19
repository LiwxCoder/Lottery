//
//  WXTabBar.m
//  35-我的彩票
//
//  Created by 李伟雄 on 15/12/15.
//  Copyright © 2015年 小码哥. All rights reserved.
//

#import "WXTabBar.h"
#import "WXTabBarButton.h"

@interface WXTabBar ()

@property (nonatomic, weak) WXTabBarButton *selectedTabBarButton;

@end

@implementation WXTabBar

- (void)setItems:(NSArray *)items
{
    _items = items;
    
    // 遍历子控件,移除所有的WXTabBarButton
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:[WXTabBarButton class]]) {
            [view removeFromSuperview];
        }
    }
    
    // 添加子控件WXTabBarButton
    for (NSInteger i = 0; i < items.count; i++) {
        UITabBarItem *item = items[i];
        WXTabBarButton *tabBarButton = [[WXTabBarButton alloc] init];
        tabBarButton.tag = i;
        
        // 设置按钮的背景图片
        [tabBarButton setBackgroundImage:item.image forState:UIControlStateNormal];
        [tabBarButton setBackgroundImage:item.selectedImage forState:UIControlStateSelected];
        
        // 监听按钮点击事件
        [tabBarButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        
        // 默认选中第0项
        if(i == 0) {
            [self btnClick:tabBarButton];
        }
        
        [self addSubview:tabBarButton];
    }
    
}

- (void)btnClick:(WXTabBarButton *)tabBarButton
{
    // 切换按钮状态
    self.selectedTabBarButton.selected = NO;
    tabBarButton.selected = YES;
    self.selectedTabBarButton = tabBarButton;
    
    // 调用代理方法,传递数据给外部代理对象
    if ([self.delegate respondsToSelector:@selector(tabBar:didClickTabBarButton:)]) {
        [self.delegate tabBar:self didClickTabBarButton:tabBarButton];
    }
}

- (void)layoutSubviews
{
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    CGFloat btnW = self.bounds.size.width / self.items.count;
    CGFloat btnH = self.bounds.size.height;
    
    // 布局按钮
    for (NSInteger i = 0; i < self.items.count; i++) {
        WXTabBarButton *tabBarButton = self.subviews[i];
        
        // 计算x值
        btnX = i * btnW;
        
        tabBarButton.frame = CGRectMake(btnX, btnY, btnW, btnH);
        
    }
    
}

@end
