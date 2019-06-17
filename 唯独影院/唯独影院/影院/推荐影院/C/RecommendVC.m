//
//  RecommendVC.m
//  维度电影
//
//  Created by 杨阳 on 2019/6/12.
//  Copyright © 2019年 杨阳. All rights reserved.
//

#import "RecommendVC.h"
#import "screenLayOut.h"
#import "RecommendCell.h"
#import "RecommendMD.h"
#import "AFNetworking.h"
#import "MJExtension.h"
@interface RecommendVC ()<UITableViewDelegate,UITableViewDataSource>
{
    RecommendMD * recoMD;
}

@property(nonatomic,strong)UITableView * tab;
@property(nonatomic,strong)NSMutableArray * Array;

@end

@implementation RecommendVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.tab];
    
    self.Array = [NSMutableArray array];
    
    [self loadData];
    
}

-(UITableView *)tab{
    if (_tab == nil) {
        
        _tab = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
        
        _tab.delegate = self;
        
        _tab.dataSource = self;
        
        _tab.rowHeight = 130;
        
        [_tab registerClass:[RecommendCell class] forCellReuseIdentifier:@"cell"];
    }
    return _tab;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return recoMD.result.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    RecommendCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    Details * md = recoMD.result[indexPath.row];
    
    [cell SetCelldataWithModel:md];
    
    cell.LoveBtn.tag = indexPath.row;
    
    
    return cell;
}


-(void)loadData{
    
    // [self.Array removeAllObjects];
    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:@"http://172.17.8.100/movieApi/cinema/v1/findRecommendCinemas" parameters:@{@"userId":@(18),@"sessionId":@"15320748258726",@"page":@(1),@"count":@(10)} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
         NSLog(@"%@",responseObject);
        
        NSDictionary * json = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        NSLog(@"%@",json);
        
        self->recoMD = [RecommendMD mj_objectWithKeyValues:json];
        
        [self.tab reloadData];
        
        //        NSArray * arr = json[@"result"];
        //
        //        for (NSDictionary * dic in arr) {
        //
        //
        //        }
        //
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"error===%ld",(long)error.code);
        
    }];
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}


@end
