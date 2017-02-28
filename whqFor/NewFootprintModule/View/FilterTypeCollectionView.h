//
//  FilterTypeCollectionView.h
//  whqFor
//
//  Created by 王帅 on 2017/2/27.
//  Copyright © 2017年 Mr.wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FilterTypeCollectionView : UICollectionView

/** 滤镜type的collection*/
@property (nonatomic, strong) UICollectionView *filterTypeCollectionView;
/** 选取滤镜方式的type*/
@property (nonatomic, copy) void(^chooseFilterBlock)(NSInteger );

@end
