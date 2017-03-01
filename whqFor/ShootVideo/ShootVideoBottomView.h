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

- (void)tabbarDidRecord;
- (void)tabbarDidRecordComplete;
- (void)tabbarDidCancelRecord;

@end

@interface ShootVideoBottomView : UIView

@property (nonatomic,strong) VideoProgressView *progressView;
@property (nonatomic,assign) NSTimeInterval progressDuration;
@property (nonatomic,weak)id<ShootVideoBottomViewDelegate> delegate;
- (void)progressResume;
- (void)progressStart;

@end
