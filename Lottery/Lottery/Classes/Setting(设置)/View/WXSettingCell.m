//
//  WXSettingCell.m
//  Lottery
//
//  Created by 李伟雄 on 15/12/20.
//  Copyright © 2015年 Liwx. All rights reserved.
//

#import "WXSettingCell.h"
#import "WXArrowSettingItem.h"
#import "WXSwitchSettingItem.h"

@interface WXSettingCell ()

@property (nonatomic, weak) UISwitch *switchView;
@property (nonatomic, weak) UIImageView *arrowView;

@end

@implementation WXSettingCell

- (UISwitch *)switchView
{
    if (_switchView == nil) {
        // 懒加载添加到contentView上
        UISwitch *switchView = [[UISwitch alloc] init];
        [self.contentView addSubview:switchView];
        _switchView = switchView;
    }
    return _switchView;
}

- (UIImageView *)arrowView
{
    if (_arrowView == nil) {
        // 懒加载添加到contentView上
        UIImageView *arrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow_right"]];
        [self.contentView addSubview:arrowView];
        _arrowView = arrowView;
    }
    return _arrowView;
}

/**
 *  创建cell的类方法
 */
+ (instancetype)settingCellWithTableView:(UITableView *)tableView style:(UITableViewCellStyle)style
{
    // 封装cell循环引用代码
    static NSString *ID = @"cell";
    WXSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[WXSettingCell alloc] initWithStyle:style reuseIdentifier:ID];
    }
    
    return cell;
}

/**
 *  创建cell的类方法,cell样式为UITableViewCellStyleValue1
 */
+ (instancetype)settingCellWithTableView:(UITableView *)tableView
{
    return [self settingCellWithTableView:tableView style:UITableViewCellStyleValue1];
}

- (void)setItem:(WXSettingItem *)item
{
    _item = item;
    
    // 设置标题和图标
    [self setUpData];
    // 设置辅助视图
    [self setUpAccessoryView];
}

- (void)setUpData
{
    // 设置标题和图标
    self.textLabel.text = self.item.title;
    self.imageView.image = self.item.icon;
    self.detailTextLabel.text = self.item.subTitle;
}

// 设置辅助视图
- (void)setUpAccessoryView
{
    // 判断是否是有带箭头的item
    if ([self.item isKindOfClass:[WXArrowSettingItem class]]) {
        // 设置辅助视图为箭头
        self.accessoryView = self.arrowView;
        // 设置cell点击闪动
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
    }else if ([self.item isKindOfClass:[WXSwitchSettingItem class]]) {
        WXSwitchSettingItem *switchItem = (WXSwitchSettingItem *)self.item;
        self.switchView.on = switchItem.isOn;
        self.accessoryView = self.switchView;
        // 设置cell点击无反应
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }else {
        self.accessoryView = nil;
        // 设置cell点击闪动
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
    }
}

@end
