//
//  WXGroupItem.h
//  Lottery
//
//  Created by 李伟雄 on 15/12/19.
//  Copyright © 2015年 Liwx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WXGroupItem : NSObject

/** 头部标题 */
@property (strong, nonatomic) NSString *headerTitle;
/** 尾部标题 */
@property (strong, nonatomic) NSString *footerTitle;
/** 行模型数组 */
@property (strong, nonatomic) NSArray *items;

/**
 *  提供类方法,用来创建组模型,必须传入行模型数组
 */
+ (instancetype)groupItemWith:(NSArray *)items;

@end
