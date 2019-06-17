//
//  OneViewController.m
//  唯独影院
//
//  Created by 史建伟 on 2019/6/17.
//  Copyright © 2019年 史建伟. All rights reserved.
//

#import "OneViewController.h"

@interface OneViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableV;
@property(nonatomic,strong)NSMutableArray * array;
@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.tableV];
    
}


-(UITableView *)tableV{
    
    if (!_tableV) {
        _tableV=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        _tableV.backgroundColor=[UIColor greenColor];
        _tableV.dataSource=self;
        _tableV.delegate=self;
        
    }
    
    return _tableV;
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
