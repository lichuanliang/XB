//
//  ShowImageView.h
//  whqFor
//
//  Created by 王帅 on 2017/3/4.
//  Copyright © 2017年 Mr.wang. All rights reserved.
//

//用来处理图片点击后放大的效果
#import <UIKit/UIKit.h>
typedef void(^didRemoveImage)();
@interface ShowImageView : UIView
@property (nonatomic,copy)didRemoveImage removeImg;

-(id)initWithFrame:(CGRect)frame byClickTag:(NSInteger)clickTag appendArray:(NSArray *)appendArray;
@end

