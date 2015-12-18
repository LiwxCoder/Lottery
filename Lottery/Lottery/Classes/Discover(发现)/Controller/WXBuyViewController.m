//
//  WXBuyViewController.m
//  Lottery
//
//  Created by 李伟雄 on 15/12/17.
//  Copyright © 2015年 Liwx. All rights reserved.
//

#import "WXBuyViewController.h"
#import "WXTitleView.h"

@interface WXBuyViewController ()

@end

@implementation WXBuyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置标题
    WXTitleView *titleView = [[WXTitleView alloc] init];
    [titleView setTitle:@"全部采种" forState:UIControlStateNormal];
    [titleView setImage:[UIImage imageNamed:@"YellowDownArrow"] forState:UIControlStateNormal];
    [titleView sizeToFit];
    self.navigationItem.titleView = titleView;
    
    // 设置右边助手按钮
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setTitle:@"助手" forState:UIControlStateNormal];
    [rightButton sizeToFit];
    [rightButton addTarget:self action:@selector(rightButtonClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    
}

/**
 *  点击右边助手按钮触发
 */
- (void)rightButtonClick
{
    // 测试WXTitleView封装方便性
    WXTitleView *titleView = (WXTitleView *)self.navigationItem.titleView;
    [titleView setTitle:@"全部采种全部采种" forState:UIControlStateNormal];
    
}


@end
