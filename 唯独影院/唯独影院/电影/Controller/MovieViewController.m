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
#import "AFNetworking.h"
#import "MJExtension.h"
#import "MJRefresh.h"
#import "UIImageView+WebCache.h"
#import "MovieModel.h"


@interface MovieViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

{
    
    MovieModel *movieM;
}
@property(nonatomic,strong)UIImageView *backgroundimg;
@property(nonatomic,strong)UITableView * tableV;
@property(nonatomic,strong)UIButton * DWImgBtn;
@property(nonatomic,strong)UIButton * DWBtn;
@property(nonatomic,strong)UIScrollView *scrollV;
@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)UICollectionView *collectionViewtwo;
@property(nonatomic,strong)UICollectionView *collectionViewthree;
//@property(nonatomic,strong)NSMutableArray *dataSourceArr;
@property(nonatomic,strong)NSDictionary *dic;

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
    
    NSMutableArray * arr=[NSMutableArray arrayWithObjects:@"scroll1",@"scroll2",@"scroll3",@"scroll4",@"scroll5", nil];
    
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
        //http://172.17.8.100/movieApi/movie/v1/findHotMovieList
        AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        [manager GET:@"http://172.17.8.100/movieApi/movie/v1/findHotMovieList" parameters:@{@"userId":@(18),@"sessionId":@"15320748258726",@"page":@(1),@"count":@(10)} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            NSDictionary * json = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            
            self->movieM = [MovieModel mj_objectWithKeyValues:json];
            
            [self.collectionView reloadData];
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            NSLog(@"电影界面滚动视图获取网络图片错误：%@",error);
            
        }];
        
        
        //创建流水布局
        UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
        
        layout.itemSize=CGSizeMake(120, 180);
        // 横向滚动
        layout.scrollDirection= UICollectionViewScrollDirectionHorizontal;
        // cell间的间距
        //设置最小行间距
        layout.minimumLineSpacing=20;
        
        _collectionView =[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 190) collectionViewLayout:layout];
        _collectionView.dataSource=self;
        _collectionView.delegate=self;
        _collectionView.backgroundColor=[UIColor greenColor];
        _collectionView.showsHorizontalScrollIndicator=NO;
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        
        [cell addSubview:self.collectionView];
        
        
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
        //创建流水布局
        UICollectionViewFlowLayout *layouttwo=[[UICollectionViewFlowLayout alloc]init];
        
        layouttwo.itemSize=CGSizeMake(120, 180);
        // 横向滚动
        layouttwo.scrollDirection= UICollectionViewScrollDirectionHorizontal;
        // cell间的间距
        //设置最小行间距
        layouttwo.minimumLineSpacing=20;
        
        _collectionViewtwo =[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 190) collectionViewLayout:layouttwo];
        _collectionViewtwo.dataSource=self;
        _collectionViewtwo.delegate=self;
        _collectionViewtwo.backgroundColor=[UIColor greenColor];
        _collectionViewtwo.showsHorizontalScrollIndicator=NO;
        [_collectionViewtwo registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        
        [cell addSubview:self.collectionViewtwo];
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
        
        //创建流水布局
        UICollectionViewFlowLayout *layoutthree=[[UICollectionViewFlowLayout alloc]init];
        
        layoutthree.itemSize=CGSizeMake(120, 180);
        // 横向滚动
        layoutthree.scrollDirection= UICollectionViewScrollDirectionHorizontal;
        // cell间的间距
        //设置最小行间距
        layoutthree.minimumLineSpacing=20;
        
        _collectionViewthree =[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 190) collectionViewLayout:layoutthree];
        _collectionViewthree.dataSource=self;
        _collectionViewthree.delegate=self;
        _collectionViewthree.backgroundColor=[UIColor greenColor];
        _collectionViewthree.showsHorizontalScrollIndicator=NO;
        
        [_collectionViewthree registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        
        [cell addSubview:self.collectionViewthree];
    }
    return cell;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return movieM.result.count;
    
}



-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.backgroundColor=[UIColor yellowColor];
    
    Res *MovieR=movieM.result[indexPath.row];
    UIImageView *img=[[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 120, 180)];
    [img sd_setImageWithURL:[NSURL URLWithString:MovieR.imageUrl]];
    [cell addSubview:img];
    return cell;
    
}

#pragma mark  定义整个CollectionViewCell与整个View的间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(0, 20, 0, 20 );//（上、左、下、右）
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        return 400;
    }else if(indexPath.row == 1){
        
        return 50;
    }else if(indexPath.row == 2){
        
        return 190;
    }else if(indexPath.row == 3){
        
        return 50;
    }else if(indexPath.row == 4){
        
        return 190;
    }else if(indexPath.row == 5){
        
        return 50;
    }else {
        
        return 190;
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
