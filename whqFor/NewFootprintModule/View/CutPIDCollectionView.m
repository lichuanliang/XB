//
//  CutPIDCollectionView.m
//  whqFor
//
//  Created by 王帅 on 2017/2/27.
//  Copyright © 2017年 Mr.wang. All rights reserved.
//

#import "CutPIDCollectionView.h"

static NSString *const customCellID = @"CutPhotoPIDCustomCell";

@interface CutPIDCollectionView()<UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>


@end

@implementation CutPIDCollectionView

- (instancetype)initWithFrame:(CGRect)frame {
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        [self addSubview:self.cutPIDCollectionView];
        [self addSubview:self.cancelBtn];
        [self addSubview:self.doneBtn];
        [self.cutPIDCollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([CutPhotoPIDCustomCell class]) bundle:nil] forCellWithReuseIdentifier:customCellID];
    }
    return self;
}

- (void)layoutSubviews {
    
    self.cutPIDCollectionView.frame = CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, 80);
    self.cancelBtn.frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width/2, 40);
    self.doneBtn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2, 100, [UIScreen mainScreen].bounds.size.width/2, 40);
    [super layoutSubviews];
    
}

#pragma mark - collection delegate
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(85,120);
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 5;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CutPhotoPIDCustomCell *cell = [self.cutPIDCollectionView dequeueReusableCellWithReuseIdentifier:customCellID forIndexPath:indexPath];
    NSArray *typeName = @[@"4:3",@"5:4",@"1:1",@"4:5",@"3:4"];
    cell.PIDLabel.text = typeName[indexPath.row];
    
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

//设置cell与边缘的间隔
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    UIEdgeInsets inset = UIEdgeInsetsMake(0, 0, 0, 0);
    return inset;
}

//最小行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

//最小列间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

//取消
- (void)cancelBtnOnClick {
    
    if (self.cancelBlock) {
        self.cancelBlock();
    }
}

//确定
- (void)doneBtnOnClick {
    if (self.doneBlock) {
        self.doneBlock();
    }
}

#pragma mark - lazyLoading
- (UICollectionView *)cutPIDCollectionView {
    
    if (!_cutPIDCollectionView) {
        UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc] init];
        flowlayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowlayout.minimumInteritemSpacing = 0;
        flowlayout.minimumLineSpacing = 0;
        _cutPIDCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowlayout];
        _cutPIDCollectionView.backgroundColor = [UIColor whiteColor];
        _cutPIDCollectionView.delegate = self;
        _cutPIDCollectionView.dataSource = self;
        _cutPIDCollectionView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        _cutPIDCollectionView.showsHorizontalScrollIndicator = NO;
        _cutPIDCollectionView.showsVerticalScrollIndicator = NO;
    }
    return _cutPIDCollectionView;
}

- (UIButton *)cancelBtn {
    if (!_cancelBtn) {
        _cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        _cancelBtn.backgroundColor = [UIColor whiteColor];
        [_cancelBtn addTarget:self action:@selector(cancelBtnOnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelBtn;
}

- (UIButton *)doneBtn {
    if (!_doneBtn) {
        _doneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_doneBtn setTitle:@"确定" forState:UIControlStateNormal];
        [_doneBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        _doneBtn.backgroundColor = [UIColor whiteColor];
        [_doneBtn addTarget:self action:@selector(doneBtnOnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _doneBtn;
}


@end
