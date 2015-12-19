//
//  WXGroupItem.m
//  Lottery
//
//  Created by 李伟雄 on 15/12/19.
//  Copyright © 2015年 Liwx. All rights reserved.
//

#import "WXGroupItem.h"

@implementation WXGroupItem

+ (instancetype)groupItemWith:(NSArray *)items
{
    WXGroupItem *groupItem = [[WXGroupItem alloc] init];
    groupItem.items = items;
    
    return groupItem;
}

@end
