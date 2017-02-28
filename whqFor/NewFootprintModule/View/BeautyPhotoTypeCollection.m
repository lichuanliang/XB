//
//  BeautyPhotoTypeCollection.m
//  whqFor
//
//  Created by 王帅 on 2017/2/27.
//  Copyright © 2017年 Mr.wang. All rights reserved.
//

#import "BeautyPhotoTypeCollection.h"

static NSString *const customCellID = @"BeautyPhotoCustomCell";

@interface BeautyPhotoTypeCollection()<UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@end

@implementation BeautyPhotoTypeCollection
- (instancetype)initWithFrame:(CGRect)frame {
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        [self addSubview:self.beautyPhotoCollectionView];
        [self.beautyPhotoCollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([BeautyPhotoCustomCell class]) bundle:nil] forCellWithReuseIdentifier:customCellID];
    }
    return self;
}

- (void)layoutSubviews {
    
    self.beautyPhotoCollectionView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 120);
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
    
    BeautyPhotoCustomCell *cell = [self.beautyPhotoCollectionView dequeueReusableCellWithReuseIdentifier:customCellID forIndexPath:indexPath];
    NSArray *typeName = @[@"裁剪",@"亮度",@"对比度",@"色温",@"饱和度"];
    cell.beautyPhotoTypeLabel.text = typeName[indexPath.row];
    cell.beautyPhotoTypeBtn.tag = indexPath.row;
    
    __weak typeof(self) weakSelf = self;
    //裁剪
    cell.cutBtnOnClickBlock = ^(){
        if (weakSelf.cutSetupViewBlock) {
            weakSelf.cutSetupViewBlock();
        }
    };
    
    //亮度
    cell.variabilityBlock = ^(){
        if (weakSelf.variabilityViewBlock) {
            weakSelf.variabilityViewBlock();
        }
    };
    
    //对比度
    cell.contrastBlock = ^(){
        if (weakSelf.contrastViewBlock) {
            weakSelf.contrastViewBlock();
        }
    };
    
    //色温
    cell.colorTemBlock = ^(){
        if (weakSelf.colorTemViewBlock) {
            weakSelf.colorTemViewBlock();
        }
    };
    
    //饱和度
    cell.saturableBlock = ^(){
        if (weakSelf.saturableViewBlock) {
            weakSelf.saturableViewBlock();
        }
    };
    
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

- (UICollectionView *)beautyPhotoCollectionView {
    
    if (!_beautyPhotoCollectionView) {
        UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc] init];
        flowlayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowlayout.minimumInteritemSpacing = 0;
        flowlayout.minimumLineSpacing = 0;
        _beautyPhotoCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowlayout];
        _beautyPhotoCollectionView.backgroundColor = [UIColor whiteColor];
        _beautyPhotoCollectionView.delegate = self;
        _beautyPhotoCollectionView.dataSource = self;
        _beautyPhotoCollectionView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        _beautyPhotoCollectionView.showsHorizontalScrollIndicator = NO;
        _beautyPhotoCollectionView.showsVerticalScrollIndicator = NO;
    }
    return _beautyPhotoCollectionView;
}



@end
