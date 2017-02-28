//
//  FilterCustomCollectionCell.m
//  whqFor
//
//  Created by 王帅 on 2017/2/27.
//  Copyright © 2017年 Mr.wang. All rights reserved.
//

#import "FilterCustomCollectionCell.h"

@implementation FilterCustomCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected {
    if (selected) {
        self.filterTypeImageView.layer.borderWidth = 2;
        self.filterTypeImageView.layer.borderColor = [UIColor redColor].CGColor;
    }else {
        self.filterTypeImageView.layer.borderWidth = 0;
    }
    
}

@end
