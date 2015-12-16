//
//  WXTabBarController.m
//  35-我的彩票
//
//  Created by 李伟雄 on 15/12/15.
//  Copyright © 2015年 小码哥. All rights reserved.
//

#import "WXTabBarController.h"

#import "WXHallViewController.h"
#import "WXArenaViewController.h"
#import "WXDiscoverViewController.h"
#import "WXHistoryViewController.h"
#import "WXMyLotteryViewController.h"

#import "WXTabBar.h"
#import "WXTabBarButton.h"
#import "WXNavigationController.h"
#import "WXArenaNavigationController.h"

@interface WXTabBarController () <WXTabBarDelegate>

// 存放WXTabBar的模型数组
@property (nonatomic, strong) NSMutableArray *items;

@end

@implementation WXTabBarController

- (NSMutableArray *)items
{
    if (_items == nil) {
        _items = [NSMutableArray array];
    }
    return _items;
}

- (void)viewDidLoad
{
    // 添加所有子控制器
    [self setUpAllChildViewController];
    
    // 设置子控制器的的TabBar
    [self setUpTabBar];
    
}

// 在viewWillAppear方法中移除系统的UITabBarButton,只留下自定义的TabBar
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    for (UIView *view in self.tabBar.subviews) {
        
        // 移除系统的UITabBarButton
        if (![view isKindOfClass:[WXTabBar class]]) {
            [view removeFromSuperview];
        }
    }
}

- (void)setUpTabBar
{
    // 移除系统的TabBar
//    [self.tabBar removeFromSuperview];
    
    // 创建自定义tabBar
    WXTabBar *tabBar = [[WXTabBar alloc] init];
    tabBar.frame = self.tabBar.bounds;
    tabBar.backgroundColor = [UIColor redColor];
    tabBar.items = self.items;
    
    // 设置代理
    tabBar.delegate = self;
    
    // 添加到控制器的view
    [self.tabBar addSubview:tabBar];
    
}

- (void)tabBar:(WXTabBar *)tabBar didClickTabBarButton:(WXTabBarButton *)tabBarButton
{
    // 切换TabBar选中项
    self.selectedIndex = tabBarButton.tag;
}

- (void)setUpAllChildViewController
{
    // 购彩大厅
    WXHallViewController *hall = [[WXHallViewController alloc] init];
    [self setUpOneChildViewController:hall image:[UIImage imageNamed:@"TabBar_LotteryHall_new"] selectedImage:[UIImage imageNamed:@"TabBar_LotteryHall_selected_new"] title:@"购彩大厅"];
    
    // 竞技场
    WXArenaViewController *arena = [[WXArenaViewController alloc] init];
    [self setUpOneChildViewController:arena image:[UIImage imageNamed:@"TabBar_Arena_new"] selectedImage:[UIImage imageNamed:@"TabBar_Arena_selected_new"] title:@"竞技场"];
    
    // 发现
//    WXDiscoverViewController *discover = [[WXDiscoverViewController alloc] init];
    WXDiscoverViewController *discover = [WXDiscoverViewController discoverViewController];
    [self setUpOneChildViewController:discover image:[UIImage imageNamed:@"TabBar_Discovery_new"] selectedImage:[UIImage imageNamed:@"TabBar_Discovery_selected_new"] title:@"发现"];
    
    // 开奖信息
    WXHistoryViewController *history = [[WXHistoryViewController alloc] init];
    [self setUpOneChildViewController:history image:[UIImage imageNamed:@"TabBar_History_new"] selectedImage:[UIImage imageNamed:@"TabBar_History_selected_new"] title:@"开奖信息"];
    
    // 我的彩票
    WXMyLotteryViewController *myLottery = [[WXMyLotteryViewController alloc] init];
    [self setUpOneChildViewController:myLottery image:[UIImage imageNamed:@"TabBar_MyLottery_new"] selectedImage:[UIImage imageNamed:@"TabBar_MyLottery_selected_new"] title:@"我的彩票"];
}

- (void)setUpOneChildViewController:(UIViewController *)viewController image:(UIImage *)image selectedImage:(UIImage *)selectedImage title:(NSString *)title
{
    // UINavigationController父类 WXNavigationController子类(多态)
    UINavigationController *nav = [[WXNavigationController alloc] initWithRootViewController:viewController];
    
    // 自定义竞技场控制器
    if ([viewController isKindOfClass:[WXArenaViewController class]]) {
        nav = [[WXArenaNavigationController alloc] initWithRootViewController:viewController];
    }
    
    // 设置底部tabBarItem正常和选中状态的图片
    nav.tabBarItem.image = image;
    nav.tabBarItem.selectedImage = selectedImage;
    
    // 设置导航控制器下的rootViewController控制器的标题
    viewController.title = title;
    
    // 底部tabBarItem添加到数据,用于传递给自定义的tabBar
    [self.items addObject:nav.tabBarItem];
    
    // 添加导航控制器到tabBarController
    [self addChildViewController:nav];
}

@end
