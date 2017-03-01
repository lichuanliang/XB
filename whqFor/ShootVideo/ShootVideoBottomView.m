//
//  ShootVideoBottomView.m
//  whqFor
//
//  Created by Mr.Wang on 2017/3/1.
//  Copyright © 2017年 Mr.wang. All rights reserved.
//

#import "ShootVideoBottomView.h"
#import "RecordButton.h"
#import "VideoProgressView.h"

@interface ShootVideoBottomView()<RecordButtonDelegate>

/** 录制视频按钮*/
@property (nonatomic,weak) RecordButton *videoButton;
/** 取消的提示*/
@property (nonatomic,strong) UILabel *upCancelAlertLabel;
/** 底部左边的btn*/
@property (nonatomic, strong) UIButton *bottomLeftBtn;
/** 底部右边的btn*/
@property (nonatomic, strong) UIButton *bottomRightBtn;

@end

@implementation ShootVideoBottomView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupButtons];
        [self addSubview:self.progressView];
    }
    return self;
}

- (void)setupButtons {
    
    CGFloat baseWidth = screenWidth/8;
    RecordButton *videoButton = [[RecordButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    videoButton.delegate = self;
    videoButton.center = CGPointMake(baseWidth*4, self.frame.size.height/2);
    self.videoButton = videoButton;
    
    [self addSubview:videoButton];
    [self addSubview:self.bottomLeftBtn];
    [self addSubview:self.bottomRightBtn];
}

#pragma mark - self Delegate

-(void)recordButtonDidTouchDown {
    //进度条
    [self progressStart];
    [self showAlertLabel];
    if ([self.delegate respondsToSelector:@selector(tabbarDidRecord)]) {
        
        [self.delegate tabbarDidRecord];
    }
    
}
-(void)recordButtonDidEnded:(CGPoint)point {
    if (point.y >= 0) {//非取消状态
        if ([self.delegate respondsToSelector:@selector(tabbarDidRecordComplete)]) {
            [self.delegate tabbarDidRecordComplete];
        }
    }else{//取消状态
        if ([self.delegate respondsToSelector:@selector(tabbarDidCancelRecord)]) {
            [self.delegate tabbarDidCancelRecord];
        }
    }
    [self dismissAlertLabel];
    [self progressResume];
}
-(void)recordButtonDidMove:(CGPoint)point {
    //检测是否在按钮外
    if (point.y < 0) {
        if ([self.upCancelAlertLabel.text isEqualToString:@"↑上移取消"]) {
            [self changeAlertLabel];
        }
        self.upCancelAlertLabel.layer.position = CGPointMake(self.center.x, self.frame.origin.y + point.y-40);
    }else{
        if ([self.upCancelAlertLabel.text isEqualToString:@"松手取消"]) {
            [self showAlertLabel];
        }
    }
    
}

#pragma mark - 上移取消提示Label

- (void)showAlertLabel {
    self.upCancelAlertLabel.textColor = [UIColor greenColor];
    self.upCancelAlertLabel.backgroundColor = [UIColor clearColor];
    self.upCancelAlertLabel.text = @"↑上移取消";
    self.upCancelAlertLabel.center = CGPointMake(self.center.x, CGRectGetMinY(self.frame)-self.frame.size.height/2);
    [self.superview addSubview:self.upCancelAlertLabel];
    [UIView animateWithDuration:0.2 animations:^{
        self.upCancelAlertLabel.alpha = 1;
    }];
    
}
- (void)dismissAlertLabel {
    self.upCancelAlertLabel.alpha = 0;
    [self.upCancelAlertLabel removeFromSuperview];
}
- (void)changeAlertLabel {
    self.upCancelAlertLabel.alpha = 0;
    [UIView animateWithDuration:0.2 animations:^{
        self.upCancelAlertLabel.textColor = [UIColor whiteColor];
        self.upCancelAlertLabel.backgroundColor = [UIColor redColor];
        self.upCancelAlertLabel.alpha = 1;
        self.upCancelAlertLabel.text = @"松手取消";
    }];
}
#pragma mark - 进度条
- (void)progressStart {
    if (self.progressDuration == 0) {
        return;
    }
    self.progressView.duration = self.progressDuration;
    [self.progressView startCompletion:^(BOOL finished) {
        if (finished){
            [self.videoButton setSelected:NO];
        }
    }];
}

#pragma mark - lazyLoading

-(VideoProgressView *)progressView{
    if( _progressView == nil) {
        _progressView = [[VideoProgressView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 3)];
        _progressView.backgroundColor = [UIColor greenColor];
        
    }
    return _progressView;
    
}
-(UILabel *)upCancelAlertLabel{
    if (_upCancelAlertLabel == nil) {
        UILabel *upCancelAlertLabel = [[UILabel alloc] init];
        upCancelAlertLabel.frame = CGRectMake(0, 0, 60,20);
        upCancelAlertLabel.textAlignment = NSTextAlignmentCenter;
        upCancelAlertLabel.font = [UIFont systemFontOfSize:12];
        _upCancelAlertLabel = upCancelAlertLabel;
    }
    return _upCancelAlertLabel;
}

- (UIButton *)bottomLeftBtn {
    if (!_bottomLeftBtn) {
        _bottomLeftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _bottomLeftBtn.frame = CGRectMake(10, 30, 50, 30);
        _bottomLeftBtn.backgroundColor = [UIColor redColor];
    }
    return _bottomLeftBtn;
}

- (UIButton *)bottomRightBtn {
    if (!_bottomRightBtn) {
        _bottomRightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _bottomRightBtn.frame = CGRectMake(screenWidth - 60, 30, 50, 30);
        _bottomRightBtn.backgroundColor = [UIColor redColor];
    }
    return _bottomRightBtn;
}

- (void)progressResume {
    if (self.progressDuration == 0) {
        return;
    }
    [self.progressView resume];
}


@end
