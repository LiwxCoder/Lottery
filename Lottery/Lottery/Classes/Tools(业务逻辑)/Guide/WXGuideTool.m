//
//  WXGuideTool.m
//  Lottery
//
//  Created by 李伟雄 on 15/12/19.
//  Copyright © 2015年 Liwx. All rights reserved.
//

#import "WXGuideTool.h"
#import "WXSaveTool.h"
#import "WXTabBarController.h"
#import "WXNewFeatureViewController.h"

// 偏好设置中存放上一次版本的key
#define WXVersion @"lastVersion"

@implementation WXGuideTool

+ (UIViewController *)chooseRootViewController
{
    // 获取Info.plist里面的Bundle versions string, short对应版本号
    NSString *curVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    
    // 获取上一次版本号
    NSString *lastVersion = [WXSaveTool objectForKey:WXVersion];
    
    // 创建UIViewController,用来存放跳转的控制器
    UIViewController *rootViewController = nil;
    
    if ([curVersion isEqualToString:lastVersion]) {
        // 版本号相同,进入主框架界面
        rootViewController = [[WXTabBarController alloc] init];
    }else {
        // 版本号不同,进入新特性界面,并保存
        rootViewController = [[WXNewFeatureViewController alloc] init];
        
        // 立即同步存储上一次版本号
        [WXSaveTool setObject:curVersion forKey:WXVersion];
    }
    return rootViewController;
}

@end
