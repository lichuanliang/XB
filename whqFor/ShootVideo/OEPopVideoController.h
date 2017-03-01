//
//  OEPopVideoController.h
//  whqFor
//
//  Created by Mr.Wang on 2017/3/1.
//  Copyright © 2017年 Mr.wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@protocol OEPopVideoControllerDelegate <NSObject>
- (void)popVideoControllerWillOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer;
- (void)popVideoControllerDidSave:(NSString *)url;
@end

@interface OEPopVideoController : NSObject

- (void)presentPopupControllerAnimated:(BOOL)flag;
- (void)dismissPopupControllerAnimated:(BOOL)flag;

@property (nonatomic,assign) NSTimeInterval videoMaxTime;
@property (nonatomic,weak) id<OEPopVideoControllerDelegate> delegate;

@end
