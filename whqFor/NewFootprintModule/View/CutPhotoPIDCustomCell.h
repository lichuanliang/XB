//
//  CutPhotoPIDCustomCell.h
//  whqFor
//
//  Created by 王帅 on 2017/2/27.
//  Copyright © 2017年 Mr.wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CutPhotoPIDCustomCell : UICollectionViewCell

/** 比例图片*/
@property (weak, nonatomic) IBOutlet UIImageView *PIDImageView;
/** 比例数据-labe*/
@property (weak, nonatomic) IBOutlet UILabel *PIDLabel;
/** 裁剪图片--用于回调选中的item下标*/
@property (nonatomic, copy) void(^cutImageBlock)(NSInteger);

@end
