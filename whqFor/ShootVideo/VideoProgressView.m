//
//  VideoProgressView.m
//  whqFor
//
//  Created by Mr.Wang on 2017/3/1.
//  Copyright © 2017年 Mr.wang. All rights reserved.
//

#import "VideoProgressView.h"

@implementation VideoProgressView

- (void)startCompletion:(void (^ __nullable)(BOOL finished))completion {
    
    //动画有显示 视觉不同步
    [UIView animateWithDuration:self.duration-0.5 animations:^{
        self.bounds = CGRectMake(0, 0, 0, self.frame.size.height);
    } completion:^(BOOL finished) {
        completion(finished);
        self.bounds = CGRectMake(0, 0, screenWidth, self.frame.size.height);
        
    }];
    
}
- (void)resume {
    self.bounds = CGRectMake(0, 0, screenWidth, self.frame.size.height);
}

@end
