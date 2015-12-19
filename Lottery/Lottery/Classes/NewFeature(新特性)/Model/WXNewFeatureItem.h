//
//  WXNewFeatureItem.h
//  Lottery
//
//  Created by 李伟雄 on 15/12/19.
//  Copyright © 2015年 Liwx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WXNewFeatureItem : NSObject

@property (nonatomic, strong) UIImage *image;


- (instancetype)initWithImageName:(NSString *)imageName;
+ (instancetype)newFeatureItemWithImageName:(NSString *)imageName;


@end
