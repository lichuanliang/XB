//
//  PhotosViewController.h
//  whqFor
//
//  Created by Mr.Wang on 2017/2/26.
//  Copyright © 2017年 Mr.wang. All rights reserved.
//
/** ---从相册选择图片界面--- */
#import <UIKit/UIKit.h>
#import "AGImagePickerController.h"

@interface PhotosViewController : UIViewController

/** 顶部的view--包含（取消--相册--继续）*/
@property (nonatomic, strong) UIView *topView;
/** 取消按钮*/
@property (nonatomic, strong) UIButton *cancelBtn;
/** 继续按钮*/
@property (nonatomic, strong) UIButton *continueBtn;
/** 照片流*/
@property (nonatomic, strong) UICollectionView *collectionView;

@end
