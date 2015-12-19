//
//  WXSaveTool.m
//  Lottery
//
//  Created by 李伟雄 on 15/12/19.
//  Copyright © 2015年 Liwx. All rights reserved.
//

#import "WXSaveTool.h"

@implementation WXSaveTool

/**
 *  保存数据
 */
+ (void)setObject:(id)value forKey:(NSString *)defaultName
{
    // 判断接收数据是否为空,一定要屏蔽空值,value不能为空,不然程序会崩溃.
    if (value) {
        // 保存到偏好设置
        [[NSUserDefaults standardUserDefaults] setObject:value forKey:defaultName];
        
        // 立即同步
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

/**
 *  读取数据
 */
+ (id)objectForKey:(NSString *)defaultName
{
    // 读取数据
    return [[NSUserDefaults standardUserDefaults] objectForKey:defaultName];
}

@end
