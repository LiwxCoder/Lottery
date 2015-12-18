//
//  WXNewFeatureViewController.m
//  Lottery
//
//  Created by 李伟雄 on 15/12/19.
//  Copyright © 2015年 Liwx. All rights reserved.
//

#import "WXNewFeatureViewController.h"

@interface WXNewFeatureViewController ()

@end

@implementation WXNewFeatureViewController

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

    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor redColor];
    
    return cell;
}


@end
