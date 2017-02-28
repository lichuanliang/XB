//
//  CutPIDCollectionView.h
//  whqFor
//
//  Created by 王帅 on 2017/2/27.
//  Copyright © 2017年 Mr.wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CutPhotoPIDCustomCell.h"

@interface CutPIDCollectionView : UICollectionView

@property (nonatomic, strong) UICollectionView *cutPIDCollectionView;
/** 取消按钮*/
@property (nonatomic, strong) UIButton *cancelBtn;
/** 完成按钮*/
@property (nonatomic, strong) UIButton *doneBtn;
/** 取消的block*/
@property (nonatomic, copy) void(^cancelBlock)();
/** 确定的block*/
@property (nonatomic, copy) void(^doneBlock)();

@end
