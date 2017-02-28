//
//  FilterTypeCollectionView.m
//  whqFor
//
//  Created by 王帅 on 2017/2/27.
//  Copyright © 2017年 Mr.wang. All rights reserved.
//

#import "FilterTypeCollectionView.h"
#import "FilterCustomCollectionCell.h"
#import "ColorMatrix.h"
#import "ImageUtil.h"

static NSString *const customCellID = @"FilterCustomCollectionCell";

@interface FilterTypeCollectionView()<UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@end

@implementation FilterTypeCollectionView

- (instancetype)initWithFrame:(CGRect)frame {
     UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        [self addSubview:self.filterTypeCollectionView];
        [self.filterTypeCollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([FilterCustomCollectionCell class]) bundle:nil] forCellWithReuseIdentifier:customCellID];
    }
    return self;
}

- (void)layoutSubviews {
    
    self.filterTypeCollectionView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 120);
    [super layoutSubviews];
    
}

#pragma mark - collection delegate
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(60,120);
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 14;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSArray *arr = @[@"原图",@"LOMO",@"黑白",@"复古",@"哥特",@"锐化",@"淡雅",@"酒红",@"清宁",@"浪漫",@"光晕",@"蓝调",@"梦幻",@"夜色"];
    
    FilterCustomCollectionCell *cell = [self.filterTypeCollectionView dequeueReusableCellWithReuseIdentifier:customCellID forIndexPath:indexPath];
    cell.filterTypeLabel.text = arr[indexPath.row];
    switch (indexPath.row)
    {
        case 0:
        {
            cell.filterTypeImageView.image = [UIImage imageNamed:@"test.png"];
        }
            break;
        case 1:
        {
            cell.filterTypeImageView.image = [ImageUtil imageWithImage:[UIImage imageNamed:@"test.png"] withColorMatrix:colormatrix_lomo];
        }
            break;
        case 2:
        {
            cell.filterTypeImageView.image = [ImageUtil imageWithImage:[UIImage imageNamed:@"test.png"]withColorMatrix:colormatrix_heibai];
        }
            break;
        case 3:
        {
            cell.filterTypeImageView.image = [ImageUtil imageWithImage:[UIImage imageNamed:@"test.png"] withColorMatrix:colormatrix_huajiu];
        }
            break;
        case 4:
        {
            cell.filterTypeImageView.image = [ImageUtil imageWithImage:[UIImage imageNamed:@"test.png"]withColorMatrix:colormatrix_gete];
        }
            break;
        case 5:
        {
            cell.filterTypeImageView.image = [ImageUtil imageWithImage:[UIImage imageNamed:@"test.png"] withColorMatrix:colormatrix_ruise];
        }
            break;
        case 6:
        {
            cell.filterTypeImageView.image = [ImageUtil imageWithImage:[UIImage imageNamed:@"test.png"] withColorMatrix:colormatrix_danya];
        }
            break;
        case 7:
        {
            cell.filterTypeImageView.image = [ImageUtil imageWithImage:[UIImage imageNamed:@"test.png"]withColorMatrix:colormatrix_jiuhong];
        }
            break;
        case 8:
        {
            cell.filterTypeImageView.image = [ImageUtil imageWithImage:[UIImage imageNamed:@"test.png"] withColorMatrix:colormatrix_qingning];
        }
            break;
        case 9:
        {
            cell.filterTypeImageView.image = [ImageUtil imageWithImage:[UIImage imageNamed:@"test.png"] withColorMatrix:colormatrix_langman];
        }
            break;
        case 10:
        {
            cell.filterTypeImageView.image = [ImageUtil imageWithImage:[UIImage imageNamed:@"test.png"]withColorMatrix:colormatrix_guangyun];
        }
            break;
        case 11:
        {
            cell.filterTypeImageView.image = [ImageUtil imageWithImage:[UIImage imageNamed:@"test.png"]withColorMatrix:colormatrix_landiao];
        }
            break;
        case 12:
        {
            cell.filterTypeImageView.image = [ImageUtil imageWithImage:[UIImage imageNamed:@"test.png"]withColorMatrix:colormatrix_menghuan];
        }
            break;
        case 13:
        {
            cell.filterTypeImageView.image = [ImageUtil imageWithImage:[UIImage imageNamed:@"test.png"]withColorMatrix:colormatrix_yese];
        }
            break;
            
        default:
            break;
    }

    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.chooseFilterBlock) {
        self.chooseFilterBlock(indexPath.row);
    }
}

//设置cell与边缘的间隔
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    UIEdgeInsets inset = UIEdgeInsetsMake(0, 0, 0, 0);
    return inset;
}

//最小行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 2;
}

//最小列间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 2;
}

- (UICollectionView *)filterTypeCollectionView {
    
    if (!_filterTypeCollectionView) { 
        UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc] init];
        flowlayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowlayout.minimumInteritemSpacing = 0;
        flowlayout.minimumLineSpacing = 0;
        _filterTypeCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowlayout];
        _filterTypeCollectionView.backgroundColor = [UIColor whiteColor];
        _filterTypeCollectionView.delegate = self;
        _filterTypeCollectionView.dataSource = self;
        _filterTypeCollectionView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        _filterTypeCollectionView.showsHorizontalScrollIndicator = NO;
        _filterTypeCollectionView.showsVerticalScrollIndicator = NO;
    }
    return _filterTypeCollectionView;
}

@end
