//
//  VideoProgressView.h
//  whqFor
//
//  Created by Mr.Wang on 2017/3/1.
//  Copyright © 2017年 Mr.wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoProgressView : UIView

/** 时间*/
@property (nonatomic, assign) NSTimeInterval duration;

- (void)startCompletion:(void (^ __nullable)(BOOL finished))completion;
//重置
- (void)resume;


@end
