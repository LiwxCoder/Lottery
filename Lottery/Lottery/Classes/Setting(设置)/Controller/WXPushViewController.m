//
//  WXPushViewController.m
//  Lottery
//
//  Created by 李伟雄 on 15/12/20.
//  Copyright © 2015年 Liwx. All rights reserved.
//

#import "WXPushViewController.h"
#import "WXSwitchSettingItem.h"
#import "WXAwardViewController.h"

@implementation WXPushViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"推送和提醒";
    
    [self setUpGroup0];
}


- (void)setUpGroup0
{
    // 创建行模型
    WXArrowSettingItem *item0 = [WXArrowSettingItem settingItemWithTitle:@"开奖推送" ];
    item0.operationBlock = ^(NSIndexPath *indexPath){
        WXAwardViewController *awardVc = [[WXAwardViewController alloc] init];
        awardVc.title = @"开奖推送";
        [self.navigationController pushViewController:awardVc animated:YES];
    };
    WXArrowSettingItem *item1 = [WXArrowSettingItem settingItemWithTitle:@"比分直播推送"];
    WXArrowSettingItem *item2 = [WXArrowSettingItem settingItemWithTitle:@"中奖动画" ];
    WXArrowSettingItem *item3 = [WXArrowSettingItem settingItemWithTitle:@"购彩提醒" ];
    // 添加行模型到数组
    NSArray *items = @[item0, item1, item2, item3];
    // 添加行模型到组模型
    WXGroupItem *group = [WXGroupItem groupItemWith:items];
    // 添加到组模型数组
    [self.groups addObject:group];
}

@end
