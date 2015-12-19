//
//  WXAwardViewController.m
//  Lottery
//
//  Created by 李伟雄 on 15/12/20.
//  Copyright © 2015年 Liwx. All rights reserved.
//

#import "WXAwardViewController.h"
#import "WXSwitchSettingItem.h"

// TODO: 开奖推送修改cell子标题文字大小

@implementation WXAwardViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setUpGroup0];
}

// 设置第0组数据
- (void)setUpGroup0
{
    WXSwitchSettingItem *item = [WXSwitchSettingItem settingItemWithTitle:@"双色球"];
    item.subTitle = @"每周二、四、日开奖";
    WXSwitchSettingItem *item1 = [WXSwitchSettingItem settingItemWithTitle:@"大乐透"];
    item1.subTitle = @"每周一、三、六开奖";
    WXSwitchSettingItem *item2 = [WXSwitchSettingItem settingItemWithTitle:@"3D"];
    item2.subTitle = @"每天开奖、包括试机号提醒";
    WXSwitchSettingItem *item3 = [WXSwitchSettingItem settingItemWithTitle:@"七乐彩"];
    item3.subTitle = @"每周一、三、五开奖";
    WXSwitchSettingItem *item4 = [WXSwitchSettingItem settingItemWithTitle:@"七星彩"];
    item4.subTitle = @"每周二、五、日开奖";
    WXSwitchSettingItem *item5 = [WXSwitchSettingItem settingItemWithTitle:@"排列3"];
    item5.subTitle = @"每天开奖";
    WXSwitchSettingItem *item6 = [WXSwitchSettingItem settingItemWithTitle:@"排列5"];
    item6.subTitle = @"每天开奖";
    
    WXGroupItem *group = [[WXGroupItem alloc] init];
    group.items = @[item,item1,item2,item3,item4,item5,item6];
    
    
    [self.groups addObject:group];
}

/**
 *  重写该方法目的是为了修改tableView的样式为UITableViewCellStyleSubtitle
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WXSettingCell *cell = [WXSettingCell settingCellWithTableView:tableView style:UITableViewCellStyleSubtitle];
    
    // 获取数据
    WXGroupItem *group = self.groups[indexPath.section];
    WXSettingItem *item  = group.items[indexPath.row];
    
    // 设置cell数据
    cell.item = item;
    
    return cell;
}

@end
