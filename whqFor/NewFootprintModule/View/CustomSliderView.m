//
//  CustomSliderView.m
//  whqFor
//
//  Created by 王帅 on 2017/2/27.
//  Copyright © 2017年 Mr.wang. All rights reserved.
//

#import "CustomSliderView.h"

@implementation CustomSliderView

//滑条滑动
- (IBAction)sliderAction:(id)sender {
    
}
//取消
- (IBAction)cancelBtnOnClick:(id)sender {
    if (self.cancelBlock) {
        self.cancelBlock();
    }
}
//确定
- (IBAction)doneBtnOnClick:(id)sender {
    if (self.doneBlock) {
        self.doneBlock();
    }
}

@end
