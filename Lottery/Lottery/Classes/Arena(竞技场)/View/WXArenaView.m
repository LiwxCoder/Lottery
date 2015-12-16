//
//  WXArenaView.m
//  35-我的彩票
//
//  Created by 李伟雄 on 15/12/15.
//  Copyright © 2015年 小码哥. All rights reserved.
//

#import "WXArenaView.h"

@implementation WXArenaView

- (void)drawRect:(CGRect)rect
{
    UIImage *image = [UIImage imageNamed:@"NLArenaBackground"];
    [image drawInRect:rect];
}

@end
