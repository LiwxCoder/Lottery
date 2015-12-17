//
//  WXNavigationController.m
//  35-我的彩票
//
//  Created by 李伟雄 on 15/12/15.
//  Copyright © 2015年 小码哥. All rights reserved.
//

#import "WXNavigationController.h"
#import "UIImage+Image.h"

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
        
        // 方式一
        // 一次性设置导航条的样式
        // 设置程序所有导航条样式,应用程序所有导航条都会改变
        // UINavigationBar *navBar = [UINavigationBar appearance];

        // 取出当前导航控制器的导航条appearanceWhenContainedIn:方法已过期
        UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedIn:self, nil];
        
        // 设置导航条的背景图片
        [navBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
        
        // 设置导航控制器的导航条的标题样式
        NSDictionary *attrDict = @{
                                   NSFontAttributeName : [UIFont boldSystemFontOfSize:20],
                                   NSForegroundColorAttributeName : [UIColor whiteColor]
                                   };
        [navBar setTitleTextAttributes:attrDict];
        
        // 方式二 iOS9新增appearanceWhenContainedInInstancesOfClasses方法
        // 一次性设置导航条的样式
//        [[UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[WXNavigationController class]]] setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
//        
//        // 设置导航控制器的导航条的标题样式
//        NSDictionary *attrDict = @{
//                                   NSFontAttributeName : [UIFont boldSystemFontOfSize:20],
//                                   NSForegroundColorAttributeName : [UIColor whiteColor]
//                                   };
//        [[UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[WXNavigationController class]]] setTitleTextAttributes:attrDict];
        
        // 使用投机小技巧,将导航条的主题改成白色的,并把文字移除屏幕
        [navBar setTintColor:[UIColor whiteColor]];
        
        // 导航条的内容由UIBarButtonItem决定
        // ???: 不明白以下方法如何获取所有UIBarButtonItem
        // 获取当前类所有的UIBarButtonItem, 将返回按钮的标题移除显示区域
        UIBarButtonItem *barButtonItem = [UIBarButtonItem appearanceWhenContainedIn:self, nil];
        [barButtonItem setBackButtonTitlePositionAdjustment:UIOffsetMake(-1000, 0) forBarMetrics:UIBarMetricsDefault];
        
    
    }
  
}

// 重写pushViewController方法,通过该方法实现统一修改导航栏左边的返回按钮
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    // 判断是否是导航控制器的根控制器,如果是根控制器,则不添加导航条左边返回按钮
    if (self.childViewControllers.count != 0) {
        // 设置跳转的目标控制器的返回按钮为白色箭头的图片
        // 以下操作覆盖了导航条系统自带的返回按钮,系统的边缘滑动功能失效,此方法不可行
//        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithOriginalImageName:@"NavBack"] style:UIBarButtonItemStyleDone target:self action:@selector(leftBarButtonClick)];
    }
    
    // 执行跳转操作
    [super pushViewController:viewController animated:animated];
}

// 点击左边的按钮,执行popViewControllerAnimated操作
- (void)leftBarButtonClick
{
    // 点击左边返回按钮,执行pop操作
    [self popViewControllerAnimated:YES];
}





@end
