//
//  ImagePickerChooseView.m
//  whqFor
//
//  Created by Mr.Wang on 2017/2/26.
//  Copyright © 2017年 Mr.wang. All rights reserved.
//

#define textViewHeight 100
#define pictureHW (screenWidth - 5*padding)/4
#define MaxImageCount 9
#define deleImageWH 25 // 删除按钮的宽高
#define padding 10

#define imageTag 2000

#import "ImagePickerChooseView.h"
#import "ImagePickerChooseCell.h"
@interface ImagePickerChooseView()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,weak)UIView *tapView;
@property (nonatomic,weak)UITableView *chooseTableView;
@property (nonatomic,strong)ImagePickerBlock ImagePickerblock;
@end
@implementation ImagePickerChooseView

-(id)initWithFrame:(CGRect)frame andAboveView:(UIView *)bgView
{
    self = [super initWithFrame:frame];
    if (self) {
        //初始化背景
        UIView *tapView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,screenWidth, screenHeight)];
        tapView.backgroundColor = [UIColor blackColor];
        tapView.alpha = 0.4;
        tapView.userInteractionEnabled = YES;
        [bgView addSubview:tapView];
        self.tapView = tapView;
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(disappear)];
        [self.tapView addGestureRecognizer:tapGesture];
    }
    return self;
}

-(void)addImagePickerChooseView
{
    UITableView *chooseTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    chooseTableView.delegate = self;
    chooseTableView.dataSource = self;
    [self addSubview:chooseTableView];
    self.chooseTableView = chooseTableView;
}

#define IPCViewHeight 120
-(void)disappear
{
    //((UITableView *)self.superview).scrollEnabled = YES;
    [self.tapView removeFromSuperview];
    self.tapView = nil;
    [UIView animateWithDuration:0.25f animations:^{
        self.frame = CGRectMake(0, screenHeight - 64, screenWidth, IPCViewHeight);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

#pragma mark - tableview delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ImagePickerChooseCell *cell = [ImagePickerChooseCell cellWithTableView:tableView];
    if (indexPath.row == 0) {
        cell.imagePickerName.text =@"小视频";
    }
    else if (indexPath.row == 1)
    {
        cell.imagePickerName.text =@"照片";
    }
    else
    {
        cell.imagePickerName.text = @"取消";
    }
    return cell;
}

-(void)setImagePickerBlock:(ImagePickerBlock)block
{
    self.ImagePickerblock = block;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //拍照
    if (indexPath.row == 0) {
        if (self.smallVideoBlock) {
            self.smallVideoBlock();
        }
    }
    //从手机相册选择
    else if (indexPath.row == 1)
    {
        self.ImagePickerblock();
    }
    else
    {
        [self disappear];
    }
}



@end

