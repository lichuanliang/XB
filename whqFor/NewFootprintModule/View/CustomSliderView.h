//
//  CustomSliderView.h
//  whqFor
//
//  Created by 王帅 on 2017/2/27.
//  Copyright © 2017年 Mr.wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomSliderView : UIView

/** 滑条*/
@property (weak, nonatomic) IBOutlet UISlider *sliderView;
/** 取消按钮*/
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
/** 确定按钮*/
@property (weak, nonatomic) IBOutlet UIButton *donBtn;
/** 取消事件的block*/
@property (nonatomic, copy) void(^cancelBlock)();
/** 确认事件的block*/
@property (nonatomic, copy) void(^doneBlock)();
/** 滑条的类型*/
@property (nonatomic, assign) BeautyImageType beautyImageType;

@end
