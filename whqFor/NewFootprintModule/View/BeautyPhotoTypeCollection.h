//
//  BeautyPhotoTypeCollection.h
//  whqFor
//
//  Created by 王帅 on 2017/2/27.
//  Copyright © 2017年 Mr.wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BeautyPhotoCustomCell.h"

@interface BeautyPhotoTypeCollection : UICollectionView

@property (nonatomic, strong) UICollectionView *beautyPhotoCollectionView;

/** 设置裁剪视图的block*/
@property (nonatomic, copy) void(^cutSetupViewBlock)();
/** 设置亮度调节视图的block*/
@property (nonatomic, copy) void(^variabilityViewBlock)();
/** 设置对比度调节视图的block*/
@property (nonatomic, copy) void(^contrastViewBlock)();
/** 设置色温调节视图的block*/
@property (nonatomic, copy) void(^colorTemViewBlock)();
/** 设置饱和度调节视图的block*/
@property (nonatomic, copy) void(^saturableViewBlock)();

@end
