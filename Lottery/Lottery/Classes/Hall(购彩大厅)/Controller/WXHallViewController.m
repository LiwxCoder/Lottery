//
//  WXHallViewController.m
//  35-我的彩票
//
//  Created by 李伟雄 on 15/12/15.
//  Copyright © 2015年 小码哥. All rights reserved.
//

#import "WXHallViewController.h"
#import "UIImage+Image.h"
#import "WXCover.h"
#import "WXPopMenu.h"

@interface WXHallViewController () <WXPopMenuDelegate>

@end

@implementation WXHallViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:nil style:UIBarButtonItemStyleDone target:self action:@selector(activity)];
    // 设置导航条左边的按钮
    [self.navigationItem.leftBarButtonItem setImage:[UIImage imageWithOriginalImageName:@"CS50_activity_image"]];
}

// 点击活动调用
- (void)activity
{
    [WXCover show];
    
//    WXPopMenu * popMenu = [WXPopMenu showInPoint:CGPointMake(screenW * 0.5, screenH * 0.5)];
    WXPopMenu *popMenu = [WXPopMenu showAnimationAtFromPoint:CGPointMake(44, 44) ToPoint:CGPointMake(screenW * 0.5, screenH * 0.5)];
    popMenu.delegate = self;
}

// WXPopMenu的代理方法,点击弹出图片右上角的关闭按钮调用
- (void)popMenuDidClickClose:(WXPopMenu *)popMenu
{
    // 点击弹出图片右上角的关闭按钮,popMenu动态消失,消失完成隐藏灰色遮盖
    [popMenu hideInPoint:CGPointMake(44, 44) completion:^{
        [WXCover hide];
    }];
}

@end
