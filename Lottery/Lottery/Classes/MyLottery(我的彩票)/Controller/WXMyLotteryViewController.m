//
//  WXMyLotteryViewController.m
//  35-我的彩票
//
//  Created by 李伟雄 on 15/12/15.
//  Copyright © 2015年 小码哥. All rights reserved.
//

#import "WXMyLotteryViewController.h"

@interface WXMyLotteryViewController ()


@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end

@implementation WXMyLotteryViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 设置登陆界面
    [self setLoginView];
    
    // 设置左边客服按钮
    [self setLeftButton];
    
    // 设置右边设置按钮
    [self setRightButton];
    
}

- (void)setRightButton
{
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [rightButton setImage:[UIImage imageNamed:@"Mylottery_config"] forState:UIControlStateNormal];
    [rightButton sizeToFit];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
}

- (void)setLeftButton
{
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [leftButton setTitle:@"客服" forState:UIControlStateNormal];
    [leftButton setImage:[UIImage imageNamed:@"FBMM_Barbutton"] forState:UIControlStateNormal];
    [leftButton sizeToFit];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
}

- (void)setLoginView
{
    // 取出登陆按钮的背景图片
    UIImage *image = self.loginButton.currentBackgroundImage;
    
    // 生成一张新的可拉伸图片
    image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    
    // 重新设置按钮的背景图片
    [self.loginButton setBackgroundImage:image forState:UIControlStateNormal];
}

@end
