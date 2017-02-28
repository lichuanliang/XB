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
#import "UIImage+ImageScale.h"
#import "BeautyPhotoTypeCollection.h"
#import "CutPIDCollectionView.h"
#import "CustomSliderView.h"

#define kWidth 50
#define kHeight 70
#define kSpace 22

#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

#define kBarHeight 55
#define kTitleWidth 60
#define kTitleHeight 20
#define kCancelHeight 30


@interface EditPhotosViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

/** 图片*/
@property (nonatomic, strong) UIImageView *imageView;
/** 滤镜库按钮*/
@property (nonatomic, strong) UIButton *filterLibraryBtn;
/** 美化照片按钮*/
@property (nonatomic, strong) UIButton *beautyPhotoBtn;
/** 滤镜库collectionView*/
@property (nonatomic, strong) FilterTypeCollectionView *filterTypeCollectionView;

@property (nonatomic, strong) FWEffectBar *styleBar;
@property (nonatomic, strong) FWEffectBar *filterStyleBar;
@property BOOL isBlurActivate;
@property BOOL isDarkCornerActivate;

@property (nonatomic, strong) UIImage *currentImage;
/** 美化图片的type-collcetion*/
@property (nonatomic, strong) BeautyPhotoTypeCollection *beautyPhotoTypeCollection;
/** 裁剪图片的比例-collection*/
@property (nonatomic, strong) CutPIDCollectionView *cutPIDCollectionView;
/** 滑条视图*/
@property (nonatomic, strong) CustomSliderView *customSliderView;

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
    self.filterLibraryBtn.selected = YES;
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
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
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 60, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 200) collectionViewLayout:flowLayout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    flowLayout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 200);
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([EditPhotosCustomCell class]) bundle:nil] forCellWithReuseIdentifier:@"EditPhotosCustomCell"];
    collectionView.pagingEnabled = YES;
    [self.view addSubview:collectionView];
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = YES;
    
    [self setupBeautyPhotoBlock];
    
    
    
//    NSMutableArray *items = [[NSMutableArray alloc] initWithCapacity:0];
//    NSArray *titles = [NSArray arrayWithObjects:@"LOMO", @"美颜", @"格调", @"艺术", nil];
//    for (int i = 0; i < [titles count]; i ++)
//    {
//        FWEffectBarItem *item = [[FWEffectBarItem alloc] initWithFrame:CGRectZero];
//        item.title = [titles objectAtIndex:i];
//        
//        [items addObject:item];
//    }
//    
//    UIButton * btnBlur = [UIButton buttonWithType:UIButtonTypeCustom];
//    [btnBlur setImage:[UIImage imageNamed:@"blur_deactivated"] forState:UIControlStateNormal];
//    self.isBlurActivate = NO;
//    btnBlur.frame = CGRectMake(10, [UIScreen mainScreen].bounds.size.height - 45 - [UIScreen mainScreen].bounds.size.height, 25, 25);
//    //    [btnBlur addTarget:self action:@selector(btnBlurClicked:) forControlEvents:UIControlEventTouchUpInside];
//    btnBlur.backgroundColor = [UIColor clearColor];
//    [self.view addSubview:btnBlur];
//    
//    UIButton * btnDark = [UIButton buttonWithType:UIButtonTypeCustom];
//    
//    [btnDark setImage:[UIImage imageNamed:@"dark_corner_deactivated"] forState:UIControlStateNormal];
//    self.isDarkCornerActivate = NO;
//    btnDark.frame = CGRectMake(10, HEIGHT - 10 - kHeight, 25, 25);
//    //    [btnDark addTarget:self action:@selector(btnDarkClicked:) forControlEvents:UIControlEventTouchUpInside];
//    btnDark.backgroundColor = [UIColor clearColor];
//    [self.view addSubview:btnDark];
//    
//    self.filterStyleBar = [[FWEffectBar alloc] initWithFrame:CGRectMake(15, HEIGHT - 20 - kHeight, WIDTH - 70, kHeight)];
//    self.filterStyleBar.effectBarDelegate = self;
//    self.filterStyleBar.itemBeginX = 15.0;
//    self.filterStyleBar.itemWidth = 50.0;
//    self.filterStyleBar.margin = 10.0;
//    [self.view addSubview:self.filterStyleBar];
//    [self setupLOMOFilter];
    
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = YES;
}

////简单边框视图
//- (void)setupLOMOFilter
//{
//    [self setupFilterWithNormalImages:nil HighlightImages:nil titles:[NSArray arrayWithObjects:@"原图", @"LOMO", @"流年", @"HDR", @"碧波", @"上野", @"优格", @"彩虹瀑", @"云端", @"淡雅", @"粉红佳人", @"复古", @"候鸟", @"黑白", @"一九〇〇", @"古铜色", @"哥特风", @"移轴", @"TEST1", @"TEST2", @"TEST3", nil]];
//}
//
//- (void)setupFilterWithNormalImages:(NSArray *)normalImages HighlightImages:(NSArray *)highlightImages titles:(NSArray *)titles
//{
//    FWEffectBarItem *item = nil;
//    NSMutableArray *items = [[NSMutableArray alloc] initWithCapacity:0];
//    
//    for (int i = 0; i < [titles count]; i++)
//    {
//        item = [[FWEffectBarItem alloc] initWithFrame:CGRectMake((kWidth + kSpace) * i + 10, 0, kWidth, kHeight)];
//        item.titleOverlay = YES;
//        item.backgroundColor = [UIColor blackColor];
//        UIImage *img = [UIImage scaleImage:self.image targetHeight:70];
//        
//        [item setFinishedSelectedImage:img withFinishedUnselectedImage:img];
//        item.title = [titles objectAtIndex:i];
//        [items addObject:item];
//    }
//    
//    self.filterStyleBar.items = items;
//}

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
        
        weakSelf.customSliderView.hidden = NO;
        [weakSelf.view addSubview:weakSelf.customSliderView];
    };
    
    //对比度调节视图
    self.beautyPhotoTypeCollection.contrastViewBlock = ^(){
        weakSelf.customSliderView.hidden = NO;
        [weakSelf.view addSubview:weakSelf.customSliderView];
    };
    
    //色温调节视图
    self.beautyPhotoTypeCollection.colorTemViewBlock = ^(){
        weakSelf.customSliderView.hidden = NO;
        [weakSelf.view addSubview:weakSelf.customSliderView];
    };
    
    //饱和度调节视图
    self.beautyPhotoTypeCollection.saturableViewBlock = ^(){
        weakSelf.customSliderView.hidden = NO;
        [weakSelf.view addSubview:weakSelf.customSliderView];
    };
    //取消
    self.customSliderView.cancelBlock = ^(){
        weakSelf.customSliderView.hidden = YES;
    };
    
    //确定--隐藏视图并保存图片
    self.customSliderView.doneBlock = ^(){
        weakSelf.customSliderView.hidden = YES;
    };
}


//返回按钮的触发事件
- (void)backBtnOnClick {
    [self.navigationController popViewControllerAnimated:YES];
}

//继续按钮的触发事件
- (void)continueBtnOnClick {
    
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

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.assets.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    EditPhotosCustomCell *Cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"EditPhotosCustomCell" forIndexPath:indexPath];
    PHImageRequestOptions *options = [[PHImageRequestOptions alloc] init];
    options.deliveryMode = PHImageRequestOptionsDeliveryModeHighQualityFormat;
    [[PHImageManager defaultManager] requestImageForAsset:(PHAsset *)[self.assets objectAtIndex:indexPath.row] targetSize:[UIScreen mainScreen].bounds.size contentMode:PHImageContentModeAspectFit options:options resultHandler:^(UIImage *result, NSDictionary *info) {
        //设置图片
        Cell.editPhotoImageView.image = result;
        
    }];
    
    return Cell;
}

#pragma mark - FWEffectBarDelegate
- (void)effectBar:(FWEffectBar *)bar didSelectItemAtIndex:(NSInteger)index
{
//    if (bar == self.styleBar)
//    {
//        switch (index) {
//            case 0:
//                [self setupLOMOFilter];
//                break;
//                
//            case 1:
////                [self setupBeautyFilter];
//                break;
//                
//            case 2:
////                [self setupPatternFilter];
//                break;
//                
//            case 3:
////                [self setupArtistFilter];
//                break;
//        }
//    }
//    else
//    {
//        FWEffectBarItem *item = (FWEffectBarItem *)[bar.items objectAtIndex:index];
//        item.ShowBorder = YES;
//        [self.filterStyleBar scrollRectToVisible:item.frame  animated:YES];
//        
//        switch (index) {
//            case 0:
//                self.currentImage = self.image;
//                break;
//                
//            case 1:
//                self.currentImage = [FWApplyFilter applyLomofiFilter:self.image];
//                break;
//                
//            case 2:
//                self.currentImage = [FWApplyFilter applyLomo1Filter:self.image];
//                break;
//                
//            case 3:
//                self.currentImage =[FWApplyFilter applyMissetikateFilter:self.image];
//                break;
//                
//            case 4:
//                self.currentImage =[FWApplyFilter applyNashvilleFilter:self.image];
//                break;
//                
//            case 5:
//                self.currentImage =[FWApplyFilter applyLordKelvinFilter:self.image];
//                break;
//                
//            case 6:
//                self.currentImage = [FWApplyFilter applyAmatorkaFilter:self.image];
//                break;
//                
//            case 7:
//                self.currentImage = [FWApplyFilter applyRiseFilter:self.image];
//                break;
//                
//            case 8:
//                self.currentImage= [FWApplyFilter applyHudsonFilter:self.image];
//                break;
//                
//            case 9:
//                self.currentImage = [FWApplyFilter applyXproIIFilter:self.image];
//                break;
//                
//            case 10:
//                self.currentImage =[FWApplyFilter apply1977Filter:self.image];
//                break;
//                
//            case 11:
//                self.currentImage =[FWApplyFilter applyValenciaFilter:self.image];
//                break;
//                
//            case 12:
//                self.currentImage =[FWApplyFilter applyWaldenFilter:self.image];
//                break;
//                
//            case 13:
//                self.currentImage = [FWApplyFilter applyLocalBinaryPatternFilter:self.image];
//                break;
//                
//            case 14:
//                self.currentImage = [FWApplyFilter applyInkwellFilter:self.image];
//                break;
//                
//            case 15:
//                self.currentImage= [FWApplyFilter applySierraFilter:self.image];
//                break;
//                
//            case 16:
//                self.currentImage = [FWApplyFilter applyEarlybirdFilter:self.image];
//                break;
//                
//            case 17:
//                self.currentImage =[FWApplyFilter applySutroFilter:self.image];
//                break;
//                
//            case 18:
//                self.currentImage =[FWApplyFilter applyToasterFilter:self.image];
//                self.imageView.image = self.currentImage;
//                break;
//                
//            case 19:
//                self.currentImage =[FWApplyFilter applyBrannanFilter:self.image];
//                break;
//                
//            case 20:
//                self.currentImage = [FWApplyFilter applyHefeFilter:self.image];
//                break;
//        }
//        
//        self.imageView.image = self.currentImage;
//    }
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

- (UIButton *)filterLibraryBtn {
    if (!_filterLibraryBtn) {
        _filterLibraryBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _filterLibraryBtn.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 130, 90, 33);
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
        _beautyPhotoBtn.frame = CGRectMake(93, [UIScreen mainScreen].bounds.size.height - 130, 90, 33);
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
        _filterTypeCollectionView = [[FilterTypeCollectionView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 90, [UIScreen mainScreen].bounds.size.width, 100)];
    }
    return _filterTypeCollectionView;
}

- (BeautyPhotoTypeCollection *)beautyPhotoTypeCollection {
    if (!_beautyPhotoTypeCollection) {
        _beautyPhotoTypeCollection = [[BeautyPhotoTypeCollection alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 90, [UIScreen mainScreen].bounds.size.width, 100)];
        _beautyPhotoTypeCollection.hidden = YES;
    }
    return _beautyPhotoTypeCollection;
}

- (CutPIDCollectionView *)cutPIDCollectionView {
    if (!_cutPIDCollectionView) {
        _cutPIDCollectionView = [[CutPIDCollectionView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 140, [UIScreen mainScreen].bounds.size.width, 150)];
        _cutPIDCollectionView.backgroundColor = [UIColor whiteColor];
    }
    return _cutPIDCollectionView;
}

- (CustomSliderView *)customSliderView {
    if (!_customSliderView) {
        _customSliderView = [[NSBundle mainBundle] loadNibNamed:@"CustomSliderView" owner:nil options:nil].lastObject;
        _customSliderView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 150, [UIScreen mainScreen].bounds.size.width, 150);        _customSliderView.backgroundColor = [UIColor whiteColor];
    }
    return _customSliderView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
