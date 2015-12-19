//
//  WXSettingCell.h
//  Lottery
//
//  Created by 李伟雄 on 15/12/20.
//  Copyright © 2015年 Liwx. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WXSettingItem;

@interface WXSettingCell : UITableViewCell

/** 行模型 */
@property (strong, nonatomic) WXSettingItem *item;

+ (instancetype)settingCellWithTableView:(UITableView *)tableView style:(UITableViewCellStyle)style;
+ (instancetype)settingCellWithTableView:(UITableView *)tableView;

@end
