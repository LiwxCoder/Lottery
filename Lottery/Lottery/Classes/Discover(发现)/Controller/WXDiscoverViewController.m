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

@end
