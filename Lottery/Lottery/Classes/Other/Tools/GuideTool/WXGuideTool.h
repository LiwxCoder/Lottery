//
//  WXGuideTool.h
//  28-网易彩票
//
//  Created by 李伟雄 on 15/12/18.
//  Copyright © 2015年 Liwx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WXGuideTool : NSObject
/** 检查是否有新版本 */
+ (BOOL)isNewVersion;
/** 获取当前软件版本 */
+ (NSString *)getCurVersion;
@end
