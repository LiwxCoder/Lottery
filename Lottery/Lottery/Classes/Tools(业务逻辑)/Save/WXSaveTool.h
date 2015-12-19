//
//  WXSaveTool.h
//  Lottery
//
//  Created by 李伟雄 on 15/12/19.
//  Copyright © 2015年 Liwx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WXSaveTool : NSObject

// 模仿NSUserDefaults的以下两个方法
//    [NSUserDefaults standardUserDefaults] setObject:<#(nullable id)#> forKey:<#(nonnull NSString *)#>
//    - (nullable id)objectForKey:(NSString *)defaultName;
/**
 *  保存数据
 */
+ (void)setObject:(nullable id)value forKey:(NSString *)defaultName;

/**
 *  读取数据
 */
+ (nullable id)objectForKey:(NSString *)defaultName;

@end
