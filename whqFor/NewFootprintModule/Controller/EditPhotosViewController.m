//
//  EditPhotosViewController.m
//  whqFor
//
//  Created by Mr.Wang on 2017/2/26.
//  Copyright © 2017年 Mr.wang. All rights reserved.
//

#import "EditPhotosViewController.h"
#import "EditPhotosCustomCell.h"
#import <AssetsLibrary/ALAsset.h>
#import <Photos/PHImageManager.h>
#import "FilterTypeCollectionView.h"
#import "BeautyPhotoTypeCollection.h"
#import "CutPIDCollectionView.h"
#import "CustomSliderView.h"
#import "ImageUtil.h"
#import "testColor.h"

#define kWidth 50
#define kHeight 70
#define kSpace 22

@interface EditPhotosViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

/** 图片*/
@property (nonatomic, strong) UIImageView *imageView;
/** 滤镜库按钮*/
@property (nonatomic, strong) UIButton *filterLibraryBtn;
/** 美化照片按钮*/
@property (nonatomic, strong) UIButton *beautyPhotoBtn;
/** 滤镜库collectionView*/
@property (nonatomic, strong) FilterTypeCollectionView *filterTypeCollectionView;
@property BOOL isBlurActivate;
@property BOOL isDarkCornerActivate;

@property (nonatomic, strong) UIImage *currentImage;
/** 美化图片的type-collcetion*/
@property (nonatomic, strong) BeautyPhotoTypeCollection *beautyPhotoTypeCollection;
/** 裁剪图片的比例-collection*/
@property (nonatomic, strong) CutPIDCollectionView *cutPIDCollectionView;
/** 滑条视图*/
@property (nonatomic, strong) CustomSliderView *customSliderView;
/** 当前图片的下标*/
@property (nonatomic, assign) NSInteger assetIndex;
/** PHAsset类型的图片转换为image类型的图片数组*/
@property (nonatomic, strong) NSMutableArray *imageArr;
@property (nonatomic, strong) UICollectionView *collectionView;
/** 最开始的老图--切换效果时要先重置再设置*/
@property (nonatomic, copy) NSMutableArray *oldImageArr;

@end

@implementation EditPhotosViewController

- (instancetype)initWithImage:(UIImage *)image
{
    if (self = [super init])
    {
        self.image = image;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.assetIndex = 0;
    self.filterLibraryBtn.selected = YES;
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.topView];
    [self.topView addSubview:self.backBtn];
    [self.topView addSubview:self.continueBtn];
    [self.topView addSubview:self.titleLabel];
    [self.view addSubview:self.filterLibraryBtn];
    [self.view addSubview:self.beautyPhotoBtn];
    [self.view addSubview:self.filterTypeCollectionView];
    [self.view addSubview:self.beautyPhotoTypeCollection];
    NSLog(@"=====将要编辑的图片数据为：%@", self.assets);
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 60, [UIScreen mainScreen].bounds.size.width, 436) collectionViewLayout:flowLayout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    flowLayout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 200);
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([EditPhotosCustomCell class]) bundle:nil] forCellWithReuseIdentifier:@"EditPhotosCustomCell"];
    collectionView.pagingEnabled = YES;
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = YES;
    
    [self setupBeautyPhotoBlock];
    [self chooseFilterBlock];
    
    for (int i = 0; i < self.assets.count; i++) {
        PHImageRequestOptions *options = [[PHImageRequestOptions alloc] init];
        options.deliveryMode = PHImageRequestOptionsDeliveryModeHighQualityFormat;
        [[PHImageManager defaultManager] requestImageForAsset:(PHAsset *)[self.assets objectAtIndex:i] targetSize:[UIScreen mainScreen].bounds.size contentMode:PHImageContentModeAspectFit options:options resultHandler:^(UIImage *result, NSDictionary *info) {
            //设置图片
            [self.imageArr addObject:result];
            [self.oldImageArr addObject:result];
            
        }];
        dispatch_async(dispatch_get_main_queue(), ^{
            [collectionView reloadData];
        });
    }
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = YES;
}


//点击滤镜类型的block回调
- (void)chooseFilterBlock {
    
    __weak typeof(self) weakSelf = self;
    self.filterTypeCollectionView.chooseFilterBlock = ^(NSInteger row){
        
        if (weakSelf.assetIndex == 0) { //当前为第0张图片
           
            [weakSelf setupImageFilterRow:row withImageIndex:weakSelf.assetIndex];
            [weakSelf.collectionView reloadData];
           
        }else if (weakSelf.assetIndex == 1) {//当前为第1张图片
            [weakSelf setupImageFilterRow:row withImageIndex:weakSelf.assetIndex];
            [weakSelf.collectionView reloadData];

        }else if (weakSelf.assetIndex == 2) {//当前为第2张图片
            [weakSelf setupImageFilterRow:row withImageIndex:weakSelf.assetIndex];
            [weakSelf.collectionView reloadData];

        }else if (weakSelf.assetIndex == 3) {//当前为第3张图片
            [weakSelf setupImageFilterRow:row withImageIndex:weakSelf.assetIndex];
            [weakSelf.collectionView reloadData];

        }else if (weakSelf.assetIndex == 4) {//当前为第4张图片
            [weakSelf setupImageFilterRow:row withImageIndex:weakSelf.assetIndex];
            [weakSelf.collectionView reloadData];

        }else if (weakSelf.assetIndex == 5) {//当前为第5张图片
            [weakSelf setupImageFilterRow:row withImageIndex:weakSelf.assetIndex];
            [weakSelf.collectionView reloadData];

        }else if (weakSelf.assetIndex == 6) {//当前为第6张图片
            [weakSelf setupImageFilterRow:row withImageIndex:weakSelf.assetIndex];
            [weakSelf.collectionView reloadData];

        }else if (weakSelf.assetIndex == 7) {//当前为第7张图片
            [weakSelf setupImageFilterRow:row withImageIndex:weakSelf.assetIndex];
            [weakSelf.collectionView reloadData];

        }else if (weakSelf.assetIndex == 8) {//当前为第8张图片
            [weakSelf setupImageFilterRow:row withImageIndex:weakSelf.assetIndex];
            [weakSelf.collectionView reloadData];

        }
    };
}

//取消
- (void)cancelBeautyImageIndex:(NSInteger)assetIndex {
    
    __weak typeof(self) weakSelf = self;
    if (weakSelf.assetIndex == assetIndex) { //图片下标0
        weakSelf.imageArr[assetIndex] = weakSelf.oldImageArr[assetIndex];
        [weakSelf.collectionView reloadData];
    }else if (weakSelf.assetIndex == assetIndex){//图片下标1
        weakSelf.imageArr[assetIndex] = weakSelf.oldImageArr[assetIndex];
        [weakSelf.collectionView reloadData];
    }else if (weakSelf.assetIndex == assetIndex){//图片下标2
        weakSelf.imageArr[assetIndex] = weakSelf.oldImageArr[assetIndex];
        [weakSelf.collectionView reloadData];
    }else if (weakSelf.assetIndex == assetIndex){//图片下标3
        weakSelf.imageArr[assetIndex] = weakSelf.oldImageArr[assetIndex];
        [weakSelf.collectionView reloadData];
    }else if (weakSelf.assetIndex == assetIndex){//图片下标4
        weakSelf.imageArr[assetIndex] = weakSelf.oldImageArr[assetIndex];
        [weakSelf.collectionView reloadData];
    }else if (weakSelf.assetIndex == assetIndex){//图片下标5
        weakSelf.imageArr[assetIndex] = weakSelf.oldImageArr[assetIndex];
        [weakSelf.collectionView reloadData];
    }else if (weakSelf.assetIndex == assetIndex){//图片下标6
        weakSelf.imageArr[assetIndex] = weakSelf.oldImageArr[assetIndex];
        [weakSelf.collectionView reloadData];
    }else if (weakSelf.assetIndex == assetIndex){//图片下标7
        weakSelf.imageArr[assetIndex] = weakSelf.oldImageArr[assetIndex];
        [weakSelf.collectionView reloadData];
    }else if (weakSelf.assetIndex == assetIndex){//图片下标8
        weakSelf.imageArr[assetIndex] = weakSelf.oldImageArr[assetIndex];
        [weakSelf.collectionView reloadData];
    }

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if ((scrollView.contentOffset.x) / screenWidth == 0) {
        self.assetIndex = 0;
    }else if ((scrollView.contentOffset.x) / screenWidth == 1) {
        self.assetIndex = 1;
    }else if ((scrollView.contentOffset.x) / screenWidth == 2) {
        self.assetIndex = 2;
    }else if ((scrollView.contentOffset.x) / screenWidth == 3) {
        self.assetIndex = 3;
    }else if ((scrollView.contentOffset.x) / screenWidth == 4) {
        self.assetIndex = 4;
    }else if ((scrollView.contentOffset.x) / screenWidth == 5) {
        self.assetIndex = 5;
    }else if ((scrollView.contentOffset.x) / screenWidth == 6) {
        self.assetIndex = 6;
    }else if ((scrollView.contentOffset.x) / screenWidth == 7) {
        self.assetIndex = 7;
    }else if ((scrollView.contentOffset.x) / screenWidth == 8) {
        self.assetIndex = 8;
    }
}

//设置美化图片的调节视图-（裁剪比例、亮度、对比度等）view
- (void)setupBeautyPhotoBlock {
    
    __weak typeof(self) weakSelf = self;
    self.beautyPhotoTypeCollection.cutSetupViewBlock = ^(){
        
        //显示裁剪比例的view
        weakSelf.cutPIDCollectionView.hidden = NO;
        [weakSelf.view addSubview:weakSelf.cutPIDCollectionView];
    };
    
    //关闭裁剪比例视图
    self.cutPIDCollectionView.cancelBlock = ^(){
        weakSelf.cutPIDCollectionView.hidden = YES;
    };
    
    //关闭裁剪比例视图并拿到裁剪后的图片
    self.cutPIDCollectionView.doneBlock = ^(){
        weakSelf.cutPIDCollectionView.hidden = YES;
    };
    
    //亮度调节视图
    self.beautyPhotoTypeCollection.variabilityViewBlock = ^(){
        
        weakSelf.customSliderView.sliderView.value = 0.0;
        weakSelf.customSliderView.hidden = NO;
        weakSelf.customSliderView.beautyImageType = BeautyImageTypeVariable;
        [weakSelf.view addSubview:weakSelf.customSliderView];
        
        weakSelf.customSliderView.lightChangeBlock = ^(UISlider *slider){
            NSLog(@"亮度调节值为：%f", slider.value);
            GPUImageBrightnessFilter *filter = [[GPUImageBrightnessFilter alloc] init];
            filter.brightness = slider.value;
            [weakSelf setupBeautyImageViewWithFilter:filter withAssetIndex:weakSelf.assetIndex];
        };
    };
    
    //对比度调节视图
    self.beautyPhotoTypeCollection.contrastViewBlock = ^(){
        weakSelf.customSliderView.sliderView.value = 0.0;
        weakSelf.customSliderView.hidden = NO;
        weakSelf.customSliderView.beautyImageType = BeautyImageTypevContrast;
        [weakSelf.view addSubview:weakSelf.customSliderView];
       
        weakSelf.customSliderView.contrastChangeBlock = ^(UISlider *slider){
            GPUImageContrastFilter *filter = [[GPUImageContrastFilter alloc] init];
            filter.contrast = slider.value;
            [weakSelf setupBeautyImageViewWithFilter:filter withAssetIndex:weakSelf.assetIndex];
        };
    };
    
    //色温调节视图 --暂时没写---
    self.beautyPhotoTypeCollection.colorTemViewBlock = ^(){
        weakSelf.customSliderView.sliderView.value = 0.0;
        weakSelf.customSliderView.hidden = NO;
        weakSelf.customSliderView.beautyImageType = BeautyImageTypeColourTmp;
        [weakSelf.view addSubview:weakSelf.customSliderView];
        

    };
    
    //饱和度调节视图
    self.beautyPhotoTypeCollection.saturableViewBlock = ^(){
        weakSelf.customSliderView.sliderView.value = 0.0;
        weakSelf.customSliderView.hidden = NO;
        weakSelf.customSliderView.beautyImageType = BeautyImageTypeSaturability;
        [weakSelf.view addSubview:weakSelf.customSliderView];
        
        weakSelf.customSliderView.saturibleChangeBlock = ^(UISlider *slider){
            GPUImageContrastFilter *filter = [[GPUImageContrastFilter alloc] init];
            filter.contrast = slider.value;
            [weakSelf setupBeautyImageViewWithFilter:filter withAssetIndex:weakSelf.assetIndex];
        };
    };
    
    //取消
    self.customSliderView.cancelBlock = ^(NSInteger beautyImageType){
        weakSelf.customSliderView.hidden = YES;
        
        switch (beautyImageType) {
            case BeautyImageTypeVariable:
                [weakSelf cancelBeautyImageIndex:weakSelf.assetIndex];
                break;
            case BeautyImageTypevContrast:
                [weakSelf cancelBeautyImageIndex:weakSelf.assetIndex];
                break;
            case BeautyImageTypeColourTmp:
                [weakSelf cancelBeautyImageIndex:weakSelf.assetIndex];
                break;
            case BeautyImageTypeSaturability:
                [weakSelf cancelBeautyImageIndex:weakSelf.assetIndex];
                break;
                
            default:
                break;
        }
    };
    
    //确定--隐藏视图并保存图片
    self.customSliderView.doneBlock = ^(NSInteger beautyImageType){
        weakSelf.customSliderView.hidden = YES;
        //美化图片后，要用美化的图片把old替换掉，因为要在美化后的图片上添加滤镜。
        weakSelf.oldImageArr = weakSelf.imageArr;
        NSLog(@"点击确定按钮后的美化图片数据--%@", weakSelf.imageArr);
    };
}

//设置亮度变化效果
- (void)setupBeautyImageViewWithFilter:(GPUImageFilter *)filter withAssetIndex:(NSInteger)assetIndex{
    
    __weak typeof(self) weakSelf = self;
    [filter forceProcessingAtSize:[weakSelf.imageArr[assetIndex] size]];
    //这个方法放在addTarget之前调用，避免filter的某些东西为加到pic里时调用imageFromCurrentFramebuffer返回为nil的crash
    [filter useNextFrameForImageCapture];
    GPUImagePicture *pic = [[GPUImagePicture alloc] initWithImage:weakSelf.oldImageArr[assetIndex]];
    [pic addTarget:filter];
    [pic processImage];
   weakSelf.imageArr[assetIndex] = [filter imageFromCurrentFramebuffer];
    [weakSelf.collectionView reloadData];
    NSLog(@"======美化完毕了图片");
    
}

//返回按钮的触发事件
- (void)backBtnOnClick {
    [self.navigationController popViewControllerAnimated:YES];
}

//继续按钮的触发事件
- (void)continueBtnOnClick {
    NSLog(@"设置好后的图片数组为：%@", self.imageArr);
}

//滤镜库按钮点击
- (void)filterLibraryBtnOnClick {
    self.filterLibraryBtn.selected = !self.filterLibraryBtn.selected;
    if (self.filterLibraryBtn.selected) {
        [self.filterLibraryBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.beautyPhotoBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        //显示出滤镜库
        self.filterTypeCollectionView.hidden = NO;
        self.beautyPhotoTypeCollection.hidden = YES;
        
    }else {
        [self.filterLibraryBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.beautyPhotoBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        self.filterTypeCollectionView.hidden = NO;
        self.beautyPhotoTypeCollection.hidden = YES;
    }
}

//美化图片按钮点击
- (void)beautyPhotoBtnOnClick {
    self.beautyPhotoBtn.selected = !self.beautyPhotoBtn.selected;
    if (self.beautyPhotoBtn.selected) {
        [self.beautyPhotoBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.filterLibraryBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        //隐藏滤镜库，显示出美化图片的控件
        self.filterTypeCollectionView.hidden = YES;
        self.beautyPhotoTypeCollection.hidden = NO;
        
    }else{
        [self.beautyPhotoBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.filterLibraryBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        self.filterTypeCollectionView.hidden = YES;
        self.beautyPhotoTypeCollection.hidden = NO;
    }
}

//设置图片的滤镜效果
- (void)setupImageFilterRow:(NSInteger)row withImageIndex:(NSInteger)assetIndex {
    
    __weak typeof(self)weakSelf = self;
    switch (row) {
        case 0:
            weakSelf.imageArr[assetIndex] = weakSelf.oldImageArr[assetIndex];
            break;
        case 1:
            weakSelf.imageArr[assetIndex] = weakSelf.oldImageArr[assetIndex];
            weakSelf.imageArr[assetIndex] = [ImageUtil imageWithImage:weakSelf.imageArr[assetIndex] withColorMatrix:colorData_lomo];
            break;
        case 2:
            weakSelf.imageArr[assetIndex] = weakSelf.oldImageArr[assetIndex];
            weakSelf.imageArr[assetIndex] = [ImageUtil imageWithImage:weakSelf.imageArr[assetIndex] withColorMatrix:colorData_heibai];
            break;
        case 3:
            weakSelf.imageArr[assetIndex] = weakSelf.oldImageArr[assetIndex];
            weakSelf.imageArr[assetIndex] = [ImageUtil imageWithImage:weakSelf.imageArr[assetIndex] withColorMatrix:colorData_huajiu];
            break;
        case 4:
            weakSelf.imageArr[assetIndex] = weakSelf.oldImageArr[assetIndex];
            weakSelf.imageArr[assetIndex] = [ImageUtil imageWithImage:weakSelf.imageArr[assetIndex] withColorMatrix:colorData_gete];
            break;
        case 5:
            weakSelf.imageArr[assetIndex] = weakSelf.oldImageArr[assetIndex];
            weakSelf.imageArr[assetIndex] = [ImageUtil imageWithImage:weakSelf.imageArr[assetIndex] withColorMatrix:colorData_ruise];
            break;
        case 6:
            weakSelf.imageArr[assetIndex] = weakSelf.oldImageArr[assetIndex];
            weakSelf.imageArr[assetIndex] = [ImageUtil imageWithImage:weakSelf.imageArr[assetIndex] withColorMatrix:colorData_danya];
            break;
        case 7:
            weakSelf.imageArr[assetIndex] = weakSelf.oldImageArr[assetIndex];
            weakSelf.imageArr[assetIndex] = [ImageUtil imageWithImage:weakSelf.imageArr[assetIndex] withColorMatrix:colorData_jiuhong];
            break;
        case 8:
            weakSelf.imageArr[assetIndex] = weakSelf.oldImageArr[assetIndex];
            weakSelf.imageArr[assetIndex] = [ImageUtil imageWithImage:weakSelf.imageArr[assetIndex] withColorMatrix:colorData_qingning];
            break;
        case 9:
            weakSelf.imageArr[assetIndex] = weakSelf.oldImageArr[assetIndex];
            weakSelf.imageArr[assetIndex] = [ImageUtil imageWithImage:weakSelf.imageArr[assetIndex] withColorMatrix:colorData_langman];
            break;
        case 10:
            weakSelf.imageArr[assetIndex] = weakSelf.oldImageArr[assetIndex];
            weakSelf.imageArr[assetIndex] = [ImageUtil imageWithImage:weakSelf.imageArr[assetIndex] withColorMatrix:colorData_guangyun];
            break;
        case 11:
            weakSelf.imageArr[assetIndex] = weakSelf.oldImageArr[assetIndex];
            weakSelf.imageArr[assetIndex] = [ImageUtil imageWithImage:weakSelf.imageArr[assetIndex] withColorMatrix:colorData_landiao];
            break;
        case 12:
            weakSelf.imageArr[assetIndex] = weakSelf.oldImageArr[assetIndex];
            weakSelf.imageArr[assetIndex] = [ImageUtil imageWithImage:weakSelf.imageArr[assetIndex] withColorMatrix:colorData_menghuan];
            break;
        case 13:
            weakSelf.imageArr[assetIndex] = weakSelf.oldImageArr[assetIndex];
            weakSelf.imageArr[assetIndex] = [ImageUtil imageWithImage:weakSelf.imageArr[assetIndex] withColorMatrix:colorData_yese];
            break;
        default:
            break;
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.assets.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    EditPhotosCustomCell *Cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"EditPhotosCustomCell" forIndexPath:indexPath];
    if (self.imageArr.count > 0) {
        Cell.editPhotoImageView.image = self.imageArr[indexPath.row];
    }
    return Cell;
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
        _continueBtn.frame = CGRectMake(screenWidth - 50, 25, 40, 30);
        [_continueBtn setTitle:@"继续" forState:UIControlStateNormal];
        [_continueBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_continueBtn addTarget:self action:@selector(continueBtnOnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _continueBtn;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(screenWidth/2 - 50, 15, 100, 50)];
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

- (UIButton *)filterLibraryBtn {
    if (!_filterLibraryBtn) {
        _filterLibraryBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _filterLibraryBtn.frame = CGRectMake(0, screenHeight - 160, 90, 33);
        _filterLibraryBtn.backgroundColor = [UIColor whiteColor];
        [_filterLibraryBtn setTitle:@"滤镜库" forState:UIControlStateNormal];
        [_filterLibraryBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _filterLibraryBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        [_filterLibraryBtn addTarget:self action:@selector(filterLibraryBtnOnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _filterLibraryBtn;
}

- (UIButton *)beautyPhotoBtn {
    if (!_beautyPhotoBtn) {
        _beautyPhotoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _beautyPhotoBtn.frame = CGRectMake(93, screenHeight - 160, 90, 33);
        _beautyPhotoBtn.backgroundColor = [UIColor whiteColor];
        [_beautyPhotoBtn setTitle:@"美化照片" forState:UIControlStateNormal];
        [_beautyPhotoBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        _beautyPhotoBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        [_beautyPhotoBtn addTarget:self action:@selector(beautyPhotoBtnOnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _beautyPhotoBtn;
}

- (FilterTypeCollectionView *)filterTypeCollectionView {
    if (!_filterTypeCollectionView) {
        _filterTypeCollectionView = [[FilterTypeCollectionView alloc] initWithFrame:CGRectMake(0, screenHeight - 120, screenWidth, 100)];
    }
    return _filterTypeCollectionView;
}

- (BeautyPhotoTypeCollection *)beautyPhotoTypeCollection {
    if (!_beautyPhotoTypeCollection) {
        _beautyPhotoTypeCollection = [[BeautyPhotoTypeCollection alloc] initWithFrame:CGRectMake(0, screenHeight - 120, screenWidth, 100)];
        _beautyPhotoTypeCollection.hidden = YES;
    }
    return _beautyPhotoTypeCollection;
}

- (CutPIDCollectionView *)cutPIDCollectionView {
    if (!_cutPIDCollectionView) {
        _cutPIDCollectionView = [[CutPIDCollectionView alloc] initWithFrame:CGRectMake(0, screenHeight - 170, screenWidth, 150)];
        _cutPIDCollectionView.backgroundColor = [UIColor whiteColor];
    }
    return _cutPIDCollectionView;
}

- (CustomSliderView *)customSliderView {
    if (!_customSliderView) {
        _customSliderView = [[NSBundle mainBundle] loadNibNamed:@"CustomSliderView" owner:nil options:nil].lastObject;
        _customSliderView.frame = CGRectMake(0, screenHeight - 170, screenWidth, 150);
        _customSliderView.backgroundColor = [UIColor whiteColor];
    }
    return _customSliderView;
}

- (NSMutableArray *)imageArr {
    if (!_imageArr) {
        _imageArr = [NSMutableArray array];
    }
    return _imageArr;
}

- (NSMutableArray *)oldImageArr {
    if (!_oldImageArr) {
        _oldImageArr = [NSMutableArray array];
    }
    return _oldImageArr;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
