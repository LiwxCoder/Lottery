//
//  WXBaseSettingViewController.m
//  Lottery
//
//  Created by 李伟雄 on 15/12/20.
//  Copyright © 2015年 Liwx. All rights reserved.
//

#import "WXBaseSettingViewController.h"

@implementation WXBaseSettingViewController

/**
 *  重写init方法,目的是为了修改为分组样式
 */
- (instancetype)init
{
    return [super initWithStyle:UITableViewStyleGrouped];
}

/**
 *  groups数组懒加载
 */
- (NSMutableArray *)groups
{
    if (_groups == nil) {
        _groups = [NSMutableArray array];
    }
    return _groups;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // 总多少组
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // 第section组多少行
    WXGroupItem *group = self.groups[section];
    
    return group.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 创建cell
    WXSettingCell *cell = [WXSettingCell settingCellWithTableView:tableView];
    
    // 获取数据
    WXGroupItem *group = self.groups[indexPath.section];
    WXSettingItem *item  = group.items[indexPath.row];
    
    // 设置cell数据
    cell.item = item;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    WXGroupItem *group = self.groups[indexPath.section];
    WXSettingItem *item = group.items[indexPath.row];
    
    if ([item isKindOfClass:[WXArrowSettingItem class]]) {
        WXArrowSettingItem *arrowItem = (WXArrowSettingItem *)item;
        // 设置block优先级高于跳转控制器
        if (arrowItem.operationBlock) {
            // 执行block
            arrowItem.operationBlock(indexPath);
        }else if (arrowItem.descVcClass){
            // 若无设置block则执行跳转操作
            [self.navigationController pushViewController:[[arrowItem.descVcClass alloc] init] animated:YES];
        }
    }
}

/**
 *  设置头部标题
 */
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    WXGroupItem *group = self.groups[section];
    return group.headerTitle;
}

/**
 *  设置尾部标题
 */
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    WXGroupItem *group = self.groups[section];
    return group.footerTitle;
}




@end
