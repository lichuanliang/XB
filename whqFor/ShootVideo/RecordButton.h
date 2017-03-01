//
//  RecordButton.h
//  whqFor
//
//  Created by Mr.Wang on 2017/3/1.
//  Copyright © 2017年 Mr.wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RecordButtonDelegate <NSObject>

-(void)recordButtonDidTouchDown;
-(void)recordButtonDidMove:(CGPoint)point;
-(void)recordButtonDidEnded:(CGPoint)point;

@end

@interface RecordButton : UIButton

- (void)startAnimation:(BOOL)top;

@property (nonatomic,weak) id<RecordButtonDelegate> delegate;

@end
