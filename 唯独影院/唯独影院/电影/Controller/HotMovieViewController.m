//
//  HotMovieViewController.m
//  唯独影院
//
//  Created by 史建伟 on 2019/6/17.
//  Copyright © 2019年 史建伟. All rights reserved.
//

#import "HotMovieViewController.h"
#import "MLMSegmentManager.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"

#ifndef weakify
#if DEBUG
#if __has_feature(objc_arc)
#define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif

#ifndef strongify
#if DEBUG
#if __has_feature(objc_arc)
#define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif
@interface HotMovieViewController ()

@property (nonatomic, strong) NSArray *list;
@property (nonatomic, strong) MLMSegmentHead *segHead;
@property (nonatomic, strong) MLMSegmentScroll *segScroll;
@property(nonatomic,strong)UIButton *BackBtn;
@property(nonatomic,strong)UIButton * DWImgBtn;
@property(nonatomic,strong)UIButton * DWBtn;

@end

@implementation HotMovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    _BackBtn=[[UIButton alloc]initWithFrame:CGRectMake(20, self.view.frame.size.height -90, 50, 50)];
    [_BackBtn setImage:[UIImage imageNamed:@"com_icon_my_default_hdpi"] forState:UIControlStateNormal];
    [_BackBtn addTarget:self action:@selector(backbtn) forControlEvents:UIControlEventTouchUpInside];
    
    _DWImgBtn=[[UIButton alloc]initWithFrame:CGRectMake(20, 45, 30, 30)];
    [_DWImgBtn setImage:[UIImage imageNamed:@"iconfontzhizuobiaozhun023117"] forState:UIControlStateNormal];
    
    _DWBtn=[[UIButton alloc]initWithFrame:CGRectMake(55, 45, 50, 30)];
    [_DWBtn setTitle:@"北京" forState:UIControlStateNormal];
    [_DWBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _DWBtn.titleLabel.textAlignment=NSTextAlignmentCenter;
    
    
    [self segmentStyle];
    [self.view addSubview:self.BackBtn];
    [self.view addSubview:self.DWImgBtn];
    [self.view addSubview:self.DWBtn];
    
    
    
}


#pragma mark - 数据源
- (NSArray *)vcArr:(NSInteger)count {
    NSMutableArray *arr = [NSMutableArray array];
    OneViewController *oneViewC = [OneViewController new];
    [arr addObject:oneViewC];
    
    TwoViewController *twoViewC = [TwoViewController new];
    [arr addObject:twoViewC];
    
    ThreeViewController *threeViewC = [ThreeViewController new];
    [arr addObject:threeViewC];
    return arr;
}

#pragma mark - 均分下划线
- (void)segmentStyle{
    self.list = @[@"热门电影",
                  @"正在热映",
                  @"即将上映"
                  ];
    _segHead = [[MLMSegmentHead alloc] initWithFrame:CGRectMake(0, 75, SCREEN_WIDTH, (65)) titles:self.list headStyle:SegmentHeadStyleSlide layoutStyle:MLMSegmentLayoutDefault];
    
    //    _segHead.fontScale = 1.05;
    _segHead.fontSize = (19);
    /**
     *  导航条的背景颜色
     */
    _segHead.headColor = [UIColor whiteColor];
    
    /*------------滑块风格------------*/
    /**
     *  滑块的颜色
     */
    _segHead.slideColor = [UIColor clearColor];
    
    /*------------下划线风格------------*/
    /**
     *  下划线的颜色
     */
    //    _segHead.lineColor = [UIColor redColor];
    /**
     *  选中颜色
     */
    _segHead.selectColor = [UIColor whiteColor];
    /**
     *  未选中颜色
     */
    _segHead.deSelectColor = [UIColor blackColor];
    /**
     *  下划线高度
     */
    //    _segHead.lineHeight = 2;
    /**
     *  下划线相对于正常状态下的百分比，默认为1
     */
    //    _segHead.lineScale = 0.8;
    
    /**
     *  顶部导航栏下方的边线
     */
    _segHead.bottomLineHeight = 0.5;
    _segHead.bottomLineColor = [UIColor whiteColor];
    /**
     *  设置当前屏幕最多显示的按钮数,只有在默认布局样式 - MLMSegmentLayoutDefault 下使用
     */
    //_segHead.maxTitles = 5;
    
    _segScroll = [[MLMSegmentScroll alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_segHead.frame), SCREEN_WIDTH, SCREEN_HEIGHT-CGRectGetMaxY(_segHead.frame)) vcOrViews:[self vcArr:self.list.count]];
    _segScroll.loadAll = NO;
    _segScroll.showIndex = 0;
    @weakify(self)
    [MLMSegmentManager associateHead:_segHead withScroll:_segScroll completion:^{
        @strongify(self)
        [self.view addSubview:self.segHead];
        [self.view addSubview:self.segScroll];
    } selectEnd:^(NSInteger index) {
        if (index == 2) {
            
        }else{
            
        }
    }];
}

-(void)backbtn{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
