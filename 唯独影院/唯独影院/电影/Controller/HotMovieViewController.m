//
//  HotMovieViewController.m
//  唯独影院
//
//  Created by 史建伟 on 2019/6/17.
//  Copyright © 2019年 史建伟. All rights reserved.
//

#import "HotMovieViewController.h"

@interface HotMovieViewController ()
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
    
    
    
    [self.view addSubview:self.BackBtn];
    [self.view addSubview:self.DWImgBtn];
    [self.view addSubview:self.DWBtn];
    
    
    
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
