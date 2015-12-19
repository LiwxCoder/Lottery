//
//  WXGuideTool.h
//  Lottery
//
//  Created by 李伟雄 on 15/12/19.
//  Copyright © 2015年 Liwx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WXGuideTool : NSObject

/**
 *  判断程序启动时进入新特性界面还是主框架界面
 */
+ (UIViewController *)chooseRootViewController;

@end
