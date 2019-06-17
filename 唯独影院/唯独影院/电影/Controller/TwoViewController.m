//
//  TwoViewController.m
//  唯独影院
//
//  Created by 史建伟 on 2019/6/17.
//  Copyright © 2019年 史建伟. All rights reserved.
//

#import "TwoViewController.h"
#import "TwoTableViewCell.h"
#import "AFNetworking.h"
#import "MJExtension.h"
#import "MJRefresh.h"
#import "UIImageView+WebCache.h"
#import "ReleaseModel.h"

@interface TwoViewController ()<UITableViewDataSource,UITableViewDelegate>

{
    ReleaseModel * ReleaseM;
}

@property(nonatomic,strong)UITableView *tableV;
@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:@"http://172.17.8.100/movieApi/movie/v1/findReleaseMovieList" parameters:@{@"userId":@(18),@"sessionId":@"15320748258726",@"page":@(1),@"count":@(10)} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"++++++++++++++++++++%@",responseObject);
        NSDictionary * json = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        self->ReleaseM = [ReleaseModel mj_objectWithKeyValues:json];
        
        [self.tableV reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"电影界面滚动视图获取网络图片错误：%@",error);
        
    }];
    
    [self.view addSubview:self.tableV];
}

-(UITableView *)tableV{
    
    if (!_tableV) {
        _tableV=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 800) style:UITableViewStylePlain];
        //        _tableV.backgroundColor=[UIColor greenColor];
        //清除背景
        _tableV.backgroundColor=[UIColor clearColor];
        //清除分割线
        _tableV.separatorStyle=UITableViewCellSeparatorStyleNone;
        _tableV.showsHorizontalScrollIndicator=NO;
        _tableV.showsVerticalScrollIndicator=NO;
        //设置回弹
        //        _tableV.bounces = NO;
        _tableV.dataSource=self;
        _tableV.delegate=self;
        
    }
    
    return _tableV;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return ReleaseM.result.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TwoTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell=[[TwoTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
//    ReleaseRes *ReleaseR=ReleaseRes.[indexPath.row];
    
    ReleaseRes *ReleaseR=ReleaseM.result[indexPath.row];
    [cell.MovieImg sd_setImageWithURL:[NSURL URLWithString:ReleaseR.imageUrl]placeholderImage:[UIImage imageNamed:@""]];
    cell.MovieName.text=ReleaseR.name;
    cell.MovieSummary.text=ReleaseR.summary;
    
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 280;
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
