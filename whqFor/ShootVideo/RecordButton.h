//
//  RecordButton.h
//  whqFor
//
//  Created by Mr.Wang on 2017/3/1.
//  Copyright © 2017年 Mr.wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RecordButtonDelegate <NSObject>

//did touch delegateAction
-(void)recordButtonDidTouchDown;
//did move delegateAction
-(void)recordButtonDidMove:(CGPoint)point;
//did ended delegateAction
-(void)recordButtonDidEnded:(CGPoint)point;

@end

@interface RecordButton : UIButton

/** delegate*/
@property (nonatomic,weak) id<RecordButtonDelegate> delegate;
//开始动画
- (void)startAnimation:(BOOL)top;

@end
