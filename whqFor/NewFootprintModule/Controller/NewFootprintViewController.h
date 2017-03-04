//
//  NewFootprintViewController.h
//  whqFor
//
//  Created by Mr.Wang on 2017/2/26.
//  Copyright © 2017年 Mr.wang. All rights reserved.
//
/** ---发布新脚印界面---- */
#import <UIKit/UIKit.h>

@interface NewFootprintViewController : UIViewController

/** tableView*/
@property (nonatomic, strong) UITableView *tableView;
/** 接收到的将要发布的image类型的图片数组*/
@property (nonatomic, strong) NSMutableArray *imagePickerArray;
/** 将要发布的PHAsset类型的图片数组*/
@property (nonatomic, strong) NSMutableArray *phAssetImageArr;

@end
