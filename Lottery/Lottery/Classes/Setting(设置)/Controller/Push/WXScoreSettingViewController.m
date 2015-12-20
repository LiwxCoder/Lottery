//
//  WXScoreSettingViewController.m
//  Lottery
//
//  Created by 李伟雄 on 15/12/20.
//  Copyright © 2015年 Liwx. All rights reserved.
//

#import "WXScoreSettingViewController.h"
#import "WXSwitchSettingItem.h"

@implementation WXScoreSettingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setUpGroup0];
    
    [self setUpGroup1];
    
    [self setUpGroup2];
    
    [self setUpGroup2];
    
    [self setUpGroup2];
    
    [self setUpGroup2];
    
    [self setUpGroup2];
    
}

// 设置第0组数据
- (void)setUpGroup0
{
    WXSwitchSettingItem *item0 = [WXSwitchSettingItem settingItemWithTitle:@"推送我关注的比赛"];
    
    WXGroupItem *group = [[WXGroupItem alloc] init];
    group.items = @[item0];
    group.footerTitle = @"开启后，当我投注或关注的比赛开始、进球和结束时，会自动发送推送消息提醒我";
    
    [self.groups addObject:group];
}

// 设置第1组数据
- (void)setUpGroup1
{
    WXSettingItem *item0 = [WXSettingItem settingItemWithTitle:@"起始时间"];
    item0.subTitle = @"00:00";
    
    WXGroupItem *group = [[WXGroupItem alloc] init];
    group.items = @[item0];
    group.headerTitle = @"只在以下时间段接收比分直播推送";
    
    [self.groups addObject:group];
}


// 设置第2组数据
- (void)setUpGroup2
{
    WXSettingItem *item0 = [WXSettingItem settingItemWithTitle:@"结束时间"];
    item0.subTitle = @"23:59";
    
    // iOS7之后只要将UITextField添加到cell上,系统会自动做好键盘处理
    __weak typeof(self) weakSelf = self;
    item0.operationBlock = ^(NSIndexPath *indexPath){
        UITextField *textField = [[UITextField alloc] init];
        // 让UITextField成为第一响应者,弹出键盘
        [textField becomeFirstResponder];
        // 取出cell
        WXSettingCell *cell = [weakSelf.tableView cellForRowAtIndexPath:indexPath];
        [cell.contentView addSubview:textField];
    };
    
    WXGroupItem *group = [[WXGroupItem alloc] init];
    group.items = @[item0];
    
    [self.groups addObject:group];
}

/**
 *  开始拖动,退出键盘
 */
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}

@end

