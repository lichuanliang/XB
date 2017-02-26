//
//  ImagePickerChooseView.h
//  whqFor
//
//  Created by Mr.Wang on 2017/2/26.
//  Copyright © 2017年 Mr.wang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ImagePickerBlock)();
@interface ImagePickerChooseView : UIView
-(id)initWithFrame:(CGRect)frame andAboveView:(UIView *)bgView;
-(void)addImagePickerChooseView;
-(void)setImagePickerBlock:(ImagePickerBlock)block;
-(void)disappear;
@end
