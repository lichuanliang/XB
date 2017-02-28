//
//  FilterCustomCollectionCell.h
//  whqFor
//
//  Created by 王帅 on 2017/2/27.
//  Copyright © 2017年 Mr.wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FilterCustomCollectionCell : UICollectionViewCell

/** 滤镜类型示例图*/
@property (weak, nonatomic) IBOutlet UIImageView *filterTypeImageView;
/** 滤镜类型label*/
@property (weak, nonatomic) IBOutlet UILabel *filterTypeLabel;

@end
