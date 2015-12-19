//
//  WXNewFeatureViewController.m
//  Lottery
//
//  Created by 李伟雄 on 15/12/19.
//  Copyright © 2015年 Liwx. All rights reserved.
//

#import "WXNewFeatureViewController.h"
#import "WXNewFeatureCollectionViewCell.h"
#import "WXNewFeatureItem.h"
#import "WXTabBarController.h"
#import "UIView+Frame.h"

#define NewFeatureImageCount    4

@interface WXNewFeatureViewController () <WXNewFeatureCollectionViewCellDelegate>

// cell模型数组
@property (nonatomic, strong) NSMutableArray *newFeatureItems;

// 添加到UICollectionView上的子控件
// 线
@property (nonatomic, weak) UIImageView *guideLine;
// 球
@property (nonatomic, weak) UIImageView *guide1;
// 大标题
@property (nonatomic, weak) UIImageView *guideLargeText1;
// 小标题
@property (nonatomic, weak) UIImageView *guideSmallText1;

// 存储上一次偏移位置
@property (nonatomic, assign) CGFloat lastOffsetX;

@end

@implementation WXNewFeatureViewController

- (UIImageView *)guide1
{
    if (_guide1 == nil) {
        UIImageView *guide1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guide1"]];
        _guide1 = guide1;
        
        [self.collectionView addSubview:guide1];
    }
    return _guide1;
}

- (UIImageView *)guideLine
{
    if (_guideLine == nil) {
        UIImageView *guideLine = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLine"]];
        _guideLine = guideLine;
        
        [self.collectionView addSubview:guideLine];
    }
    return _guideLine;
}

- (UIImageView *)guideLargeText1
{
    if (_guideLargeText1 == nil) {
        UIImageView *guideLargeText1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLargeText1"]];
        _guideLargeText1 = guideLargeText1;
        
        [self.collectionView addSubview:guideLargeText1];
    }
    return _guideLargeText1;
}

- (UIImageView *)guideSmallText1
{
    if (_guideSmallText1 == nil) {
        UIImageView *guideSmallText1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideSmallText1"]];
        _guideSmallText1 = guideSmallText1;
        
        [self.collectionView addSubview:guideSmallText1];
    }
    return _guideSmallText1;
}

/**
 *  新特性界面cell图片数组懒加载
 */
- (NSMutableArray *)newFeatureItems
{
    if (_newFeatureItems == nil) {
        _newFeatureItems = [NSMutableArray array];
        
        // 添加数据
        [self addNewFeatureImages];
    }
    return _newFeatureItems;
}

- (void)addNewFeatureImages
{
    // 将数据添加到模型数组
    for (NSInteger i = 0; i < NewFeatureImageCount; i++) {
        NSString *imageName = [NSString stringWithFormat:@"guide%ldBackground", i+1];
        WXNewFeatureItem *newFeatureItem = [WXNewFeatureItem newFeatureItemWithImageName:imageName];
        
        [_newFeatureItems addObject:newFeatureItem];
    }
}

/**
 *  重写init方法
 */
- (instancetype)init
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    // 设置尺寸cell
    flowLayout.itemSize = [UIScreen mainScreen].bounds.size;
    
    // ???: 为什么这边调用self.view.bounds.size程序奔溃
//    NSLog(@"%@", NSStringFromCGSize(self.view.bounds.size));
    // 设置行间距
    flowLayout.minimumLineSpacing = 0;
    
    // 设置滚动方法
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;

    return [[WXNewFeatureViewController alloc] initWithCollectionViewLayout:flowLayout];
}

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];

    // 初始化设置
    [self setUp];
    
    // 初始化设置子控件的位置
    [self setUpChildView];
}

// 初始化设置子控件的位置
- (void)setUpChildView
{
    self.guide1.x += 50;
    self.guideLine.x -= 150;
    self.guideLargeText1.center = CGPointMake(screenW * 0.5, screenH * 0.7);
    self.guideSmallText1.center = CGPointMake(screenW * 0.5, screenH * 0.8);
    
}

// 初始化设置
- (void)setUp
{
    // 注册cell
    [self.collectionView registerClass:[WXNewFeatureCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    // 开启分页功能
    self.collectionView.pagingEnabled = YES;
    // 取消弹簧效果
    self.collectionView.bounces = NO;
    // 隐藏水平滚动条
    self.collectionView.showsHorizontalScrollIndicator = NO;
}


#pragma mark <UIScrollViewDelegate>
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    // 当前偏移点位置
    CGFloat offsetX = scrollView.contentOffset.x;
    
    // 计算偏移量
    CGFloat delta = offsetX - self.lastOffsetX;
    
    // 拼接图片名称,更换下一页图片
    [self setImageNameWith:offsetX];
    
    // 执行动画
    [self startImageAnimation:delta];
    
    // 记录上一次偏移点的位置
    self.lastOffsetX = offsetX;
}

- (void)startImageAnimation:(CGFloat)delta
{
    // 执行动画
    self.guide1.x += 2 * delta;
    self.guideLargeText1.x += 2 * delta;
    self.guideSmallText1.x += 2 * delta;
    [UIView animateWithDuration:0.25 animations:^{
        self.guide1.x -= delta;
        self.guideLargeText1.x -= delta;
        self.guideSmallText1.x -= delta;
    }];
}

- (void)setImageNameWith:(CGFloat)offsetX
{
    // 拼接图片名称
    NSInteger imageNum = offsetX / self.view.width;
    NSString *guide1Name = [NSString stringWithFormat:@"guide%ld", imageNum + 1];
    NSString *guideLargeText1Name = [NSString stringWithFormat:@"guideLargeText%ld", imageNum + 1];
    NSString *guideSmallText1Name = [NSString stringWithFormat:@"guideSmallText%ld", imageNum + 1];
    // 重新设置图片
    self.guide1.image = [UIImage imageNamed:guide1Name];
    self.guideLargeText1.image = [UIImage imageNamed:guideLargeText1Name];
    self.guideSmallText1.image = [UIImage imageNamed:guideSmallText1Name];
}

#pragma mark <WXNewFeatureCollectionViewCellDelegate>
// 点击立即体验按钮会调用该代理方法
- (void)newFeatureCollectionViewCellDidClickStartButton:(WXNewFeatureCollectionViewCell *)cell
{
    // 添加转场动画
    CATransition *animation = [CATransition animation];
    
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.duration = 0.5;
    animation.repeatCount = 1;
    animation.type =  @"cube";
    animation.subtype = kCATransitionFromRight;
    // keyWindow切换到WXTabBarController主框架
    WXKeyWindow.rootViewController = [[WXTabBarController alloc] init];
    
    // 将转场动画添加到keyWindow的layer上,
    [WXKeyWindow.layer addAnimation:animation forKey:nil];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.newFeatureItems.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    WXNewFeatureCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // 取出模型
    WXNewFeatureItem *newFeatureItem = self.newFeatureItems[indexPath.item];
    // 设置最后新特性最后一个cell的按钮显示
    [cell setIndexPath:indexPath count:self.newFeatureItems.count];
    // 传递数据给cell
    cell.item = newFeatureItem;
    
    //设置代理,目的是监听立即体验按钮点击,执行控制器跳转
    cell.delegate = self;
    
    return cell;
}


@end
