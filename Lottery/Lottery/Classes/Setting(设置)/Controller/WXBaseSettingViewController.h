//
//  WXBaseSettingViewController.h
//  Lottery
//
//  Created by 李伟雄 on 15/12/20.
//  Copyright © 2015年 Liwx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WXGroupItem.h"
#import "WXSettingItem.h"
#import "WXArrowSettingItem.h"
#import "WXSettingCell.h"

@interface WXBaseSettingViewController : UITableViewController
@property (nonatomic, strong) NSMutableArray *groups;

@end
