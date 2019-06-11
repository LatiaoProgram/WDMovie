//
//  MovieViewController.m
//  唯独影院
//
//  Created by 史建伟 on 2019/6/9.
//  Copyright © 2019年 史建伟. All rights reserved.
//

#import "MovieViewController.h"
#import "MovieTableViewCell.h"
#import "LQScrollView.h"

@interface MovieViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UIImageView *backgroundimg;
@property(nonatomic,strong)UITableView * tableV;
@property(nonatomic,strong)UIButton * DWImgBtn;
@property(nonatomic,strong)UIButton * DWBtn;
@end

@implementation MovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    self.navigationController.navigationBar.hidden = YES;
    
    self.backgroundimg=[[UIImageView alloc]initWithFrame:CGRectMake(0, -45, self.view.frame.size.width, 300)];
    self.backgroundimg.image=[UIImage imageNamed:@"background"];
    
    _DWImgBtn=[[UIButton alloc]initWithFrame:CGRectMake(30, 10, 30, 30)];
    [_DWImgBtn setImage:[UIImage imageNamed:@"定位"] forState:UIControlStateNormal];
    
    _DWBtn=[[UIButton alloc]initWithFrame:CGRectMake(65, 10, 50, 30)];
    [_DWBtn setTitle:@"北京" forState:UIControlStateNormal];
    [_DWBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _DWBtn.titleLabel.textAlignment=NSTextAlignmentCenter;
    
    NSMutableArray * arr = [NSMutableArray arrayWithObjects:@"scroll1",@"scroll2",@"scroll3",@"scroll4",@"scroll5", nil];
    LQScrollView * lq = [[LQScrollView alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 400) imageArray:arr];
//    lq.backgroundColor=[UIColor redColor];
    
    
    
    
//    [self.view addSubview:self.backgroundimg];
    [self.view addSubview:self.tableV];
    [self.tableV addSubview:self.DWImgBtn];
    [self.tableV addSubview:self.DWBtn];
    
    [self.tableV addSubview:lq];
}

-(UITableView *)tableV{
    
    if (!_tableV) {
        _tableV=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        //清除背景
        _tableV.backgroundColor=[UIColor clearColor];
        //清除分割线
        _tableV.separatorStyle=UITableViewCellSeparatorStyleNone;
        _tableV.showsHorizontalScrollIndicator=NO;
        _tableV.showsVerticalScrollIndicator=NO;
        //设置回弹
        _tableV.bounces = NO;
        _tableV.delegate=self;
        _tableV.dataSource=self;
        
    }
    
    return _tableV;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 7;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MovieTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell=[[MovieTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.backgroundColor=[UIColor clearColor];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    if (indexPath.row == 0) {
        
        [cell addSubview:self.backgroundimg];
    }else if(indexPath.row == 1){
        
        UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(20, 0, 200, 40)];
//        label.backgroundColor=[UIColor redColor];
        label.text=@"热门电影";
        label.textColor=[UIColor blackColor];
        label.font=[UIFont systemFontOfSize:21];
        label.textAlignment=NSTextAlignmentLeft;
        UIImageView *img=[[UIImageView alloc]initWithFrame:CGRectMake(20, 35, 45, 5)];
        img.image=[UIImage imageNamed:@"img"];
        
        UIImageView *rightimg=[[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width-50, 20, 15, 20)];
        rightimg.image=[UIImage imageNamed:@"rightimg"];
        
        [cell addSubview:label];
        [cell addSubview:img];
        [cell addSubview:rightimg];
        
    }else if(indexPath.row == 2){
        
    }else if(indexPath.row == 3){
        
        UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(20, 0, 200, 40)];
        //        label.backgroundColor=[UIColor redColor];
        label.text=@"正在热播";
        label.textColor=[UIColor blackColor];
        label.font=[UIFont systemFontOfSize:21];
        label.textAlignment=NSTextAlignmentLeft;
        UIImageView *img=[[UIImageView alloc]initWithFrame:CGRectMake(20, 35, 45, 5)];
        img.image=[UIImage imageNamed:@"img"];
        
        UIImageView *rightimg=[[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width-50, 20, 15, 20)];
        rightimg.image=[UIImage imageNamed:@"rightimg"];
        
        [cell addSubview:label];
        [cell addSubview:img];
        [cell addSubview:rightimg];
        
    }else if(indexPath.row == 4){
        
    }else if(indexPath.row == 5){
        
        UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(20, 0, 200, 40)];
        //        label.backgroundColor=[UIColor redColor];
        label.text=@"即将上映";
        label.textColor=[UIColor blackColor];
        label.font=[UIFont systemFontOfSize:21];
        label.textAlignment=NSTextAlignmentLeft;
        UIImageView *img=[[UIImageView alloc]initWithFrame:CGRectMake(20, 35, 45, 5)];
        img.image=[UIImage imageNamed:@"img"];
        
        UIImageView *rightimg=[[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width-50, 20, 15, 20)];
        rightimg.image=[UIImage imageNamed:@"rightimg"];
        
        [cell addSubview:label];
        [cell addSubview:img];
        [cell addSubview:rightimg];
        
    }else {
        
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        return 400;
    }else if(indexPath.row == 1){
        
        return 60;
    }else if(indexPath.row == 2){
        
        return 180;
    }else if(indexPath.row == 3){
        
        return 60;
    }else if(indexPath.row == 4){
        
        return 180;
    }else if(indexPath.row == 5){
        
        return 60;
    }else {
        
        return 180;
    }
    
    
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
