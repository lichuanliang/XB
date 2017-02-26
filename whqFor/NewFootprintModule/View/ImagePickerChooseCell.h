//
//  ImagePickerChooseCell.h
//  whqFor
//
//  Created by Mr.Wang on 2017/2/26.
//  Copyright © 2017年 Mr.wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImagePickerChooseCell : UITableViewCell
@property (nonatomic,weak)UILabel *imagePickerName;
+(instancetype)cellWithTableView:(UITableView *)tableView;
@end
