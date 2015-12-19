//
//  WXNewFeatureCollectionViewCell.m
//  Lottery
//
//  Created by 李伟雄 on 15/12/19.
//  Copyright © 2015年 Liwx. All rights reserved.
//

#import "WXNewFeatureCollectionViewCell.h"
#import "WXNewFeatureItem.h"

@interface WXNewFeatureCollectionViewCell ()

/** 图片ImageView */
@property (nonatomic, weak) UIImageView *imageView;
/** 立即体验按钮 */
@property (nonatomic, weak) UIButton *startButton;

@end

@implementation WXNewFeatureCollectionViewCell

- (void)setIndexPath:(NSIndexPath *)indexPath count:(NSInteger)count
{
    if (indexPath.item == count -1) {
        self.startButton.hidden = NO;
    }else {
        self.startButton.hidden = YES;
    }
}

- (void)setItem:(WXNewFeatureItem *)item
{
    _item = item;
    
    self.imageView.image = item.image;
}

/** 图片ImageView懒加载 */
- (UIImageView *)imageView
{
    if (_imageView == nil) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.userInteractionEnabled = YES;
        _imageView = imageView;
        
        [self.contentView addSubview:imageView];
    }
    
    return _imageView;
}

/** 立即体验按钮懒加载 */
- (UIButton *)startButton
{
    if (_startButton == nil) {
        UIButton *startButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [startButton setBackgroundImage:[UIImage imageNamed:@"guideStart"] forState:UIControlStateNormal];
        startButton.showsTouchWhenHighlighted = YES;
        [startButton sizeToFit];
        [startButton addTarget:self action:@selector(startButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        // 添加到self.imageView之上
        [self.contentView insertSubview:startButton aboveSubview:self.imageView];
        
        self.startButton = startButton;
        
    }
    return _startButton;
}

- (void)startButtonClick:(UIButton *)startButton
{
    if ([self.delegate respondsToSelector:@selector(newFeatureCollectionViewCellDidClickStartButton:)]) {
        [self.delegate newFeatureCollectionViewCellDidClickStartButton:self];
    }
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

/** 布局子控件 */
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageView.frame = self.contentView.bounds;
    
    self.startButton.center = CGPointMake(screenW * 0.5, screenH * 0.9);
}




@end
