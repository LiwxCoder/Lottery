//
//  WXSwitchSettingItem.h
//  Lottery
//
//  Created by 李伟雄 on 15/12/19.
//  Copyright © 2015年 Liwx. All rights reserved.
//

#import "WXSettingItem.h"

@interface WXSwitchSettingItem : WXSettingItem

/** 开关状态 */
@property (assign, nonatomic, getter=isOn) BOOL on;

@end
