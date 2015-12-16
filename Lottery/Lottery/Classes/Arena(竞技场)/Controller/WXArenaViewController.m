//
//  WXArenaViewController.m
//  35-我的彩票
//
//  Created by 李伟雄 on 15/12/15.
//  Copyright © 2015年 小码哥. All rights reserved.
//

#import "WXArenaViewController.h"
#import "WXArenaView.h"

@implementation WXArenaViewController

// 自定义控制器的view
- (void)loadView
{
    self.view = [[WXArenaView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 设置导航条标题titleView
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"足球", @"篮球"]];
    
    // 设置正常和选中状态下标题UISegmentedControl的文字样式
    NSDictionary *normalAttr = @{NSForegroundColorAttributeName : WXColor(0, 142, 143)};
    NSDictionary *selectedAttr = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    // 设置正常和选中状态下标题segmentedControl显示的颜色
    [segmentedControl setTitleTextAttributes:normalAttr forState:UIControlStateNormal];
    [segmentedControl setTitleTextAttributes:selectedAttr forState:UIControlStateSelected];
    
    // 可以去除掉segmentedControl中间蓝色分割线
    segmentedControl.tintColor = WXColor(0, 142, 143);
    
    // 设置正常和选中状态下segmentedControl显示的图片
    [segmentedControl setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentBG"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [segmentedControl setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentSelectedBG"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    
    // 监听segmentedControl的值改变
    [segmentedControl addTarget:self action:@selector(segmentedControlValueChange:) forControlEvents:UIControlEventValueChanged];
    
    // 默认选中第0个
    segmentedControl.selectedSegmentIndex = 0;
    
    // 设置标题为UISegmentedControl
    self.navigationItem.titleView = segmentedControl;
}

- (void)segmentedControlValueChange:(UISegmentedControl *)segmentedControl
{
    NSLog(@"点击选中了第%ld个按钮", segmentedControl.selectedSegmentIndex);
}



@end
