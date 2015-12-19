//
//  WXSettingViewController.m
//  Lottery
//
//  Created by 李伟雄 on 15/12/19.
//  Copyright © 2015年 Liwx. All rights reserved.
//

#import "WXSettingViewController.h"
#import "WXSwitchSettingItem.h"
#import "WXPushViewController.h"

// 继承第三方框架,用于更新版本弹出蒙版
#import "WXBlurView.h"
#import "MBProgressHUD+WX.h"

@interface WXSettingViewController ()

@end

@implementation WXSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置标题
    self.title = @"设置";
    
    // 设置第0组数据
    [self setUpGroup0];
    
    // 设置第1组数据
    [self setUpGroup1];
    
    // 设置第2组数据
    [self setUpGroup2];
    
}

#pragma mark - 添加cell组模型
- (void)setUpGroup0
{
    // 创建行模型
    WXSettingItem *item0 = [WXArrowSettingItem settingItemWithIcon:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码"];
    
    // block里面self不能用self强引用,用弱引用
//    __weak WXSettingViewController *weakSelf = self;
    __weak typeof(self) weakSelf = self;
    item0.operationBlock = ^(NSIndexPath *indexPath){
        UITableViewController *tableViewController = [[UITableViewController alloc] init];
        tableViewController.title = @"使用兑换码";
        [weakSelf.navigationController pushViewController:tableViewController animated:YES];
    };
    // 添加行模型到数组
    NSArray *items = @[item0];
    // 添加行模型到组模型
    WXGroupItem *group = [WXGroupItem groupItemWith:items];
    group.headerTitle = @"第0组头部标题";
    group.footerTitle = @"第0组尾部标题";
    // 添加到组模型数组
    [weakSelf.groups addObject:group];
    
}

- (void)setUpGroup1
{
    // 创建行模型
    WXArrowSettingItem *item0 = [WXArrowSettingItem settingItemWithIcon:[UIImage imageNamed:@"MorePush"] title:@"推送和提醒" ];
    item0.operationBlock = ^(NSIndexPath *indexPath){
        WXPushViewController *pushViewController = [[WXPushViewController alloc] init];
        pushViewController.title = @"推送和提醒";
        [self.navigationController pushViewController:pushViewController animated:YES];
    };
    
    WXSwitchSettingItem *item1 = [WXSwitchSettingItem settingItemWithIcon:[UIImage imageNamed:@"more_homeshake"] title:@"使用摇一摇机选" ];
    item1.on = YES;
    WXSwitchSettingItem *item2 = [WXSwitchSettingItem settingItemWithIcon:[UIImage imageNamed:@"sound_Effect"] title:@"声音效果" ];
    WXSwitchSettingItem *item3 = [WXSwitchSettingItem settingItemWithIcon:[UIImage imageNamed:@"More_LotteryRecommend"] title:@"购彩小助手" ];
    // 添加行模型到数组
    NSArray *items = @[item0, item1, item2, item3];
    // 添加行模型到组模型
    WXGroupItem *group = [WXGroupItem groupItemWith:items];
    group.headerTitle = @"第1组头部标题";
    group.footerTitle = @"第1组尾部标题";
    // 添加到组模型数组
    [self.groups addObject:group];
}

- (void)setUpGroup2
{
    // 创建行模型
    WXArrowSettingItem *item0 = [WXArrowSettingItem settingItemWithIcon:[UIImage imageNamed:@"MoreUpdate"] title:@"检查新版本" ];
    item0.operationBlock = ^(NSIndexPath *indexPath){
        // 添加蒙版到keyWindow,设置frame为self.view.frame,导航条不遮盖
        WXBlurView *blurView = [[WXBlurView alloc] initWithFrame:self.view.frame];
        [WXKeyWindow addSubview:blurView];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [blurView removeFromSuperview];
        });
        
        [MBProgressHUD showSuccess:@"已是最新版本"];
    };
    WXSettingItem *item1 = [WXArrowSettingItem settingItemWithIcon:[UIImage imageNamed:@"MoreShare"] title:@"分享" ];
    WXSettingItem *item2 = [WXArrowSettingItem settingItemWithIcon:[UIImage imageNamed:@"MoreNetease"] title:@"产品推荐" ];
    WXSettingItem *item3 = [WXArrowSettingItem settingItemWithIcon:[UIImage imageNamed:@"MoreAbout"] title:@"关于" ];
    // 添加行模型到数组
    NSArray *items = @[item0, item1, item2, item3];
    // 添加行模型到组模型
    WXGroupItem *group = [WXGroupItem groupItemWith:items];
    group.headerTitle = @"第2组头部标题";
    group.footerTitle = @"第2组尾部标题";
    // 添加到组模型数组
    [self.groups addObject:group];
}

@end
