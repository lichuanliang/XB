//
//  WhqForConst.h
//  whqFor
//
//  Created by 王帅 on 2017/2/28.
//  Copyright © 2017年 Mr.wang. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 视频拍摄时长*/
extern CGFloat const smallVideoTime;



//美化照片的类型
typedef NS_ENUM(NSInteger,BeautyImageType) {
    BeautyImageTypeVariable = 0,    // 亮度
    BeautyImageTypevContrast,       //  对比度
    BeautyImageTypeColourTmp,       // 色温
    BeautyImageTypeSaturability     //饱和度
};
