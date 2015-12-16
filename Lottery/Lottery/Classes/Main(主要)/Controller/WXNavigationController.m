//
//  WXNavigationController.m
//  35-我的彩票
//
//  Created by 李伟雄 on 15/12/15.
//  Copyright © 2015年 小码哥. All rights reserved.
//

#import "WXNavigationController.h"

@implementation WXNavigationController

// 当加载类的时候调用,把类加载到内存,存放在代码区
// 当程序启动的时候调用
//+ (void)load
//{
//
//}

// 第一次使用当前类或者它的子类的时候调用
+ (void)initialize
{
    if (self == [WXNavigationController class]) {
        
//        // 方式一
//        // 一次性设置导航条的样式
//        // 设置程序所有导航条样式,应用程序所有导航条都会改变
//        // UINavigationBar *navBar = [UINavigationBar appearance];
//
//        // 取出当前导航控制器的导航条appearanceWhenContainedIn:方法已过期
//        UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedIn:self, nil];
//        
//        // 设置导航条的背景图片
//        [navBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
//        
//        // 设置导航控制器的导航条的标题样式
//        NSDictionary *attrDict = @{
//                                   NSFontAttributeName : [UIFont boldSystemFontOfSize:20],
//                                   NSForegroundColorAttributeName : [UIColor whiteColor]
//                                   };
//        [navBar setTitleTextAttributes:attrDict];
        
        // 方式二 iOS9新增appearanceWhenContainedInInstancesOfClasses方法
        // 一次性设置导航条的样式
        [[UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[WXNavigationController class]]] setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
        
        // 设置导航控制器的导航条的标题样式
        NSDictionary *attrDict = @{
                                   NSFontAttributeName : [UIFont boldSystemFontOfSize:20],
                                   NSForegroundColorAttributeName : [UIColor whiteColor]
                                   };
        [[UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[WXNavigationController class]]] setTitleTextAttributes:attrDict];
    
    }
  
}

@end
