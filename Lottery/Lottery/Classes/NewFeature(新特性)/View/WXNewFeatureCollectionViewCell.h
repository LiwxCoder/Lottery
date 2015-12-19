//
//  WXNewFeatureCollectionViewCell.h
//  Lottery
//
//  Created by 李伟雄 on 15/12/19.
//  Copyright © 2015年 Liwx. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WXNewFeatureItem, WXNewFeatureCollectionViewCell;

@protocol WXNewFeatureCollectionViewCellDelegate <NSObject>

@optional
/**
 *  开始按钮点击调用
 */
- (void)newFeatureCollectionViewCellDidClickStartButton:(WXNewFeatureCollectionViewCell *)cell;

@end

@interface WXNewFeatureCollectionViewCell : UICollectionViewCell
/** 模型数据 */
@property (strong, nonatomic) WXNewFeatureItem *item;
/** 代理属性 */
@property (weak, nonatomic) id delegate;

/**
 *  用来判断是否要显示跳转到主框架的按钮
 */
- (void)setIndexPath:(NSIndexPath *)indexPath count:(NSInteger)count;
@end
