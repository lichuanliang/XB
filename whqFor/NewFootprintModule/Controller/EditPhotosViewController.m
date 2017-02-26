//
//  EditPhotosViewController.m
//  whqFor
//
//  Created by Mr.Wang on 2017/2/26.
//  Copyright © 2017年 Mr.wang. All rights reserved.
//

#import "EditPhotosViewController.h"

@interface EditPhotosViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

/** 图片*/
@property (nonatomic, strong) UIImageView *imageView;
/** contentScrollView*/
@property (nonatomic, strong) UIScrollView *contentScrollView;

@end

@implementation EditPhotosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.topView];
    [self.topView addSubview:self.backBtn];
    [self.topView addSubview:self.continueBtn];
    [self.topView addSubview:self.titleLabel];
   // [self.view addSubview:self.contentScrollView];
    NSLog(@"=====将要编辑的图片数据为：%@", self.assets);
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
     flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 200) collectionViewLayout:flowLayout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    flowLayout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"photoCell"];
    collectionView.pagingEnabled = YES;
    [self.view addSubview:collectionView];
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = YES;
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = YES;
}

//返回按钮的触发事件
- (void)backBtnOnClick {
    [self.navigationController popViewControllerAnimated:YES];
}

//继续按钮的触发事件
- (void)continueBtnOnClick {
    
}


#pragma mark - lazyLoading
- (UIView *)topView {
    if (!_topView) {
        _topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 60)];
        _topView.backgroundColor = [UIColor whiteColor];
    }
    return _topView;
}

- (UIButton *)backBtn {
    if (!_backBtn) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _backBtn.frame = CGRectMake(10, 25, 40, 30);
        [_backBtn setTitle:@"返回" forState:UIControlStateNormal];
        [_backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_backBtn addTarget:self action:@selector(backBtnOnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backBtn;
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

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 50, 15, 100, 50)];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.font = [UIFont systemFontOfSize:18];
        _titleLabel.text = @"编辑图片";
    }
    return _titleLabel;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.assets.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *Cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"photoCell" forIndexPath:indexPath];
    Cell.backgroundColor = [UIColor yellowColor];
    return Cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
