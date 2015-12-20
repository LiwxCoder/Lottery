//
//  WXDiscoverViewController.m
//  35-我的彩票
//
//  Created by 李伟雄 on 15/12/15.
//  Copyright © 2015年 小码哥. All rights reserved.
//

#import "WXDiscoverViewController.h"

@implementation WXDiscoverViewController

+ (instancetype)discoverViewController
{
    // 通过UIStoryboard创建对象
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:NSStringFromClass([self class]) bundle:nil];
    return [storyBoard instantiateInitialViewController];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // 即将显示时刷新列表
    [self.tableView reloadData];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 先移除屏幕左侧
    cell.transform = CGAffineTransformTranslate(cell.transform, screenW, 0);
    
    // 动画移动回来
    [UIView animateWithDuration:0.5 animations:^{
        cell.transform = CGAffineTransformIdentity;
    }];
    
    
}

@end
