//
//  EditPhotosViewController.h
//  whqFor
//
//  Created by Mr.Wang on 2017/2/26.
//  Copyright © 2017年 Mr.wang. All rights reserved.
//
/** ----编辑图片界面--- */
#import <UIKit/UIKit.h>

@interface EditPhotosViewController : UIViewController

/** 顶部view*/
@property (nonatomic, strong) UIView *topView;
/** 返回按钮*/
@property (nonatomic, strong) UIButton *backBtn;
/** 继续按钮*/
@property (nonatomic, strong) UIButton *continueBtn;
/** 选择的图片数据*/
@property (nonatomic, copy) NSArray *assets;
/** 标题label*/
@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIImage *image;

- (instancetype)initWithImage:(UIImage *)image;


@end
