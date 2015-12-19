//
//  WXSettingItem.m
//  Lottery
//
//  Created by 李伟雄 on 15/12/19.
//  Copyright © 2015年 Liwx. All rights reserved.
//

#import "WXSettingItem.h"

@implementation WXSettingItem

+ (instancetype)settingItemWithIcon:(UIImage *)icon title:(NSString *)title
{
    WXSettingItem *item = [[self alloc] init];
    
    // 存储数据到模型
    item.icon = icon;
    item.title = title;
    
    return item;
}


+ (instancetype)settingItemWithTitle:(NSString *)title
{
    return [self settingItemWithIcon:nil title:title];
}


@end
