//
//  BeautyPhotoCustomCell.m
//  whqFor
//
//  Created by 王帅 on 2017/2/27.
//  Copyright © 2017年 Mr.wang. All rights reserved.
//

#import "BeautyPhotoCustomCell.h"

@implementation BeautyPhotoCustomCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (IBAction)beautyTypeBtnOnClick:(UIButton *)sender {
    
    switch (sender.tag) {
        case 0:
            NSLog(@"点击裁剪图片按钮");
            if (self.cutBtnOnClickBlock) {
                self.cutBtnOnClickBlock();
            }
            break;
        case 1:
            NSLog(@"点击亮度按钮");
            if (self.variabilityBlock) {
                self.variabilityBlock();
            }
            break;
        case 2:
            NSLog(@"点击对比度按钮");
            if (self.contrastBlock) {
                self.contrastBlock();
            }
            break;
        case 3:
            NSLog(@"点击色温按钮");
            if (self.colorTemBlock) {
                self.colorTemBlock();
            }
            break;
        case 4:
            NSLog(@"点击饱和度按钮");
            if (self.saturableBlock) {
                self.saturableBlock();
            }
            break;
        default:
            break;
    }
}

@end
