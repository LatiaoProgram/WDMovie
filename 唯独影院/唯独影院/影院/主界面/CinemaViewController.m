//
//  CinemaViewController.m
//  维度电影
//
//  Created by 史建伟 on 2019/6/10.
//  Copyright © 2019年 Person. All rights reserved.
//

#import "CinemaViewController.h"
#import "screenLayOut.h"
#import "MCPageView.h"
#import "RecommendVC.h"
#import "NearbyVC.h"
#import "GYZChooseCityController.h"
@interface CinemaViewController ()
@property(nonatomic,strong)MCPageView * pageV;
@property(nonatomic,strong)NSMutableArray * Controller;
@property(nonatomic,strong)NSMutableArray * titles;
@property(nonatomic,strong)UIButton * CityBtn;
@end

@implementation CinemaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
    self.Controller = [NSMutableArray array];
    
    self.titles = [NSMutableArray array];
    
    [_Controller addObject:[RecommendVC new]];
    [_titles addObject:@"推荐影院"];
    
    [_Controller addObject:[NearbyVC new]];
    [_titles addObject:@"附近影院"];
    
    [self.view addSubview:self.pageV];
    
    [self.view addSubview:self.CityBtn];
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES];
}

-(UIButton *)CityBtn{
    if (_CityBtn == nil) {
        _CityBtn = [[UIButton alloc]initWithFrame:CGRectMake(15, 40, 80, 50)];
        
        [_CityBtn setTitle:@"请选择城市" forState:UIControlStateNormal];//城市选择，之后会填真实地址
        [_CityBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        _CityBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        
        [_CityBtn addTarget:self action:@selector(CitySelect:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _CityBtn;
}

-(void)CitySelect:(UIButton *)sender{
    
    GYZChooseCityController * CityPickVC = [[GYZChooseCityController alloc]init];
    [CityPickVC setDelegate:self];
    
    [self presentViewController:[[UINavigationController alloc] initWithRootViewController:CityPickVC] animated:YES completion:^{
        
    }];
}

#pragma mark - GYZCityPickerDelegate
- (void) cityPickerController:(GYZChooseCityController *)chooseCityController didSelectCity:(GYZCity *)city
{
    [_CityBtn setTitle:city.cityName forState:UIControlStateNormal];
    [chooseCityController dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void) cityPickerControllerDidCancel:(GYZChooseCityController *)chooseCityController
{
    [chooseCityController dismissViewControllerAnimated:YES completion:^{
        
    }];
}


-(MCPageView *)pageV{
    if (_pageV == nil) {
        _pageV = [[MCPageView alloc]initWithFrame:CGRectMake(0, 80, SCR_W, SCR_H) titles:_titles controllers:_Controller];
        
        _pageV.titleButtonWidth = 60;
        _pageV.lineWitdhScale = 0.2;
        _pageV.selectTitleFont = [UIFont systemFontOfSize:15];
        _pageV.defaultTitleFont = [UIFont systemFontOfSize:12];
        _pageV.defaultTitleColor = [UIColor lightGrayColor];
        _pageV.selectTitleColor = [UIColor redColor];
        [_pageV setBadgeWithIndex:3 badge:0];
        [_pageV setBadgeWithIndex:5 badge:-1];
        [_pageV setBadgeWithIndex:2 badge:1000];
    }
    return _pageV;
}


@end
