//
//  WXArrowSettingItem.h
//  Lottery
//
//  Created by 李伟雄 on 15/12/19.
//  Copyright © 2015年 Liwx. All rights reserved.
//

#import "WXSettingItem.h"

@interface WXArrowSettingItem : WXSettingItem

/** 保存跳转的控制器的类型, Class类型是assign */
@property (assign, nonatomic) Class descVcClass;

@end
