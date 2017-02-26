//
//  PhotosViewController.m
//  whqFor
//
//  Created by Mr.Wang on 2017/2/26.
//  Copyright © 2017年 Mr.wang. All rights reserved.
//

#import "PhotosViewController.h"
#import "EditPhotosViewController.h"
#import "TZImagePickerController.h"

@interface PhotosViewController ()<TZImagePickerControllerDelegate>

@end

@implementation PhotosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.topView];
    [self.topView addSubview:self.cancelBtn];
    [self.topView addSubview:self.continueBtn];
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:9 delegate:self];
    
    // You can get the photos by block, the same as by delegate.
    // 你可以通过block或者代理，来得到用户选择的照片.
    

    [self presentViewController:imagePickerVc animated:YES completion:nil];
}

- (void)viewWillAppear:(BOOL)animated {
     self.navigationController.navigationBarHidden = YES;
}

//取消按钮的触发事件
- (void)cancelBtnOnClick {
    [self dismissViewControllerAnimated:YES completion:nil];
}

//继续按钮触发事件
- (void)continueBtnOnClick {
    EditPhotosViewController *editPhotosVC = [[EditPhotosViewController alloc] init];
    [self.navigationController pushViewController:editPhotosVC animated:YES];

}


#pragma mark - lazyLoading
- (UIView *)topView {
    if (!_topView) {
        _topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 60)];
        _topView.backgroundColor = [UIColor whiteColor];
    }
    return _topView;
}

- (UIButton *)cancelBtn {
    if (!_cancelBtn) {
        _cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _cancelBtn.frame = CGRectMake(10, 25, 40, 30);
        [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_cancelBtn addTarget:self action:@selector(cancelBtnOnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelBtn;
}

- (UIButton *)continueBtn {
    if (!_continueBtn) {
        _continueBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _continueBtn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 50, 25, 40, 30);
        [_continueBtn setTitle:@"继续" forState:UIControlStateNormal];
        [_continueBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_continueBtn addTarget:self action:@selector(continueBtnOnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _continueBtn;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
