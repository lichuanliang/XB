//
//  ShootVideoBottomView.h
//  whqFor
//
//  Created by Mr.Wang on 2017/3/1.
//  Copyright © 2017年 Mr.wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VideoProgressView;

@protocol ShootVideoBottomViewDelegate <NSObject>

//已经开始录制
- (void)tabbarDidRecord;
//已经录制完成
- (void)tabbarDidRecordComplete;
//已经关闭录制
- (void)tabbarDidCancelRecord;

@end

@interface ShootVideoBottomView : UIView

/** 进度条view*/
@property (nonatomic,strong) VideoProgressView *progressView;
/** 进度条的时间*/
@property (nonatomic,assign) NSTimeInterval progressDuration;
/** delegate*/
@property (nonatomic,weak)id<ShootVideoBottomViewDelegate> delegate;
//重置进度条
- (void)progressResume;
//进度开始
- (void)progressStart;

@end
