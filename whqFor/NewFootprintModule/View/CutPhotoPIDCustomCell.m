//
//  CutPhotoPIDCustomCell.m
//  whqFor
//
//  Created by 王帅 on 2017/2/27.
//  Copyright © 2017年 Mr.wang. All rights reserved.
//

#import "CutPhotoPIDCustomCell.h"

@implementation CutPhotoPIDCustomCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected {
    if (selected) {
        self.PIDImageView.layer.borderWidth = 2;
        self.PIDImageView.layer.borderColor = [UIColor redColor].CGColor;
        self.PIDLabel.textColor = [UIColor redColor];
    }else {
        self.PIDImageView.layer.borderWidth = 0;
        self.PIDLabel.textColor = [UIColor blackColor];
    }
}

@end
