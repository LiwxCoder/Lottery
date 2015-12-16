//
//  WXArenaNavigationController.m
//  35-我的彩票
//
//  Created by 李伟雄 on 15/12/15.
//  Copyright © 2015年 小码哥. All rights reserved.
//

#import "WXArenaNavigationController.h"

@interface WXArenaNavigationController ()

@end

@implementation WXArenaNavigationController

+ (void)initialize
{
    if (self == [WXArenaNavigationController class]) {
        
        UINavigationBar *nav = [UINavigationBar appearanceWhenContainedIn:self, nil];
        
        // 生成一张可拉伸图片,因为该图片的宽度太小
        UIImage *image = [UIImage imageNamed:@"NLArenaNavBar64"];
        image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
        
        // 设置竞技场的导航条背景图片
        [nav setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
