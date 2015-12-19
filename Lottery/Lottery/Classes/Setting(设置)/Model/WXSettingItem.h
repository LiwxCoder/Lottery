//
//  WXSettingItem.h
//  Lottery
//
//  Created by 李伟雄 on 15/12/19.
//  Copyright © 2015年 Liwx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WXSettingItem : NSObject

/** 标题 */
@property (strong, nonatomic) NSString *title;

/** 子标题 */
@property (strong, nonatomic) NSString *subTitle;

/** 图标 */
@property (strong, nonatomic) UIImage *icon;

/** 点击cell调用的block */
@property (strong, nonatomic) void(^operationBlock)(NSIndexPath *indexPath);

/**
 *  初始化类方法
 */
+ (instancetype)settingItemWithIcon:(UIImage *)icon title:(NSString *)title;

+ (instancetype)settingItemWithTitle:(NSString *)title;
@end
