//
//  WXNewFeatureItem.m
//  Lottery
//
//  Created by 李伟雄 on 15/12/19.
//  Copyright © 2015年 Liwx. All rights reserved.
//

#import "WXNewFeatureItem.h"

@implementation WXNewFeatureItem

- (instancetype)initWithImageName:(NSString *)imageName
{
    if (self = [super init]) {
        self.image = [UIImage imageNamed:imageName];
    }
    return self;
}

+ (instancetype)newFeatureItemWithImageName:(NSString *)imageName
{
    return [[self alloc] initWithImageName:imageName];
}

@end
