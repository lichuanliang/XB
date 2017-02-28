//
//  BeautyPhotoCustomCell.h
//  whqFor
//
//  Created by 王帅 on 2017/2/27.
//  Copyright © 2017年 Mr.wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BeautyPhotoCustomCell : UICollectionViewCell

/** 美化图片的type -- btn*/
@property (weak, nonatomic) IBOutlet UIButton *beautyPhotoTypeBtn;
/** 梅花图片的type -- label-名字*/
@property (weak, nonatomic) IBOutlet UILabel *beautyPhotoTypeLabel;
/** 点击裁剪按钮的block*/
@property (nonatomic, copy) void(^cutBtnOnClickBlock)();
/** 点击亮度按钮的block*/
@property (nonatomic, copy) void(^variabilityBlock)();
/** 点击对比度按钮的block*/
@property (nonatomic, copy) void(^contrastBlock)();
/** 点击色温按钮的block*/
@property (nonatomic, copy) void(^colorTemBlock)();
/** 点击饱和度按钮的block*/
@property (nonatomic, copy) void(^saturableBlock)();

@end
