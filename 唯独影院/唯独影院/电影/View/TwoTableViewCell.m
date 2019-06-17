//
//  TwoTableViewCell.m
//  唯独影院
//
//  Created by 史建伟 on 2019/6/17.
//  Copyright © 2019年 史建伟. All rights reserved.
//

#import "TwoTableViewCell.h"

@implementation TwoTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self addSubview:self.backgroundImg];
        [self addSubview:self.MovieImg];
        [self addSubview:self.MovieName];
        [self addSubview:self.MovieSummary];
        
    }
    
    return self;
}

-(UIImageView *)backgroundImg{
    
    if (!_backgroundImg) {
        _backgroundImg=[[UIImageView alloc]initWithFrame:CGRectMake(0, 30, 415, 220)];
        _backgroundImg.image=[UIImage imageNamed:@"hdpi∏±±æ"];
    }
    
    return _backgroundImg;
}

-(UIImageView *)MovieImg{
    
    if (!_MovieImg) {
        _MovieImg=[[UIImageView alloc]initWithFrame:CGRectMake(20, 5, 160, 235)];
        //        _MovieImg.backgroundColor=[UIColor redColor];
        _MovieImg.layer.masksToBounds=YES;
        _MovieImg.layer.cornerRadius=15;
    }
    
    return _MovieImg;
}

-(UILabel *)MovieName{
    
    if (!_MovieName) {
        _MovieName=[[UILabel alloc]initWithFrame:CGRectMake(200, 50, 150, 30)];
        //        _MovieName.backgroundColor=[UIColor yellowColor];
        _MovieName.textAlignment=NSTextAlignmentLeft;
        _MovieName.textColor=[UIColor whiteColor];
        _MovieName.font=[UIFont systemFontOfSize:20];
    }
    
    return _MovieName;
}

-(UILabel *)MovieSummary{
    
    if (!_MovieSummary) {
        _MovieSummary=[[UILabel alloc]initWithFrame:CGRectMake(200, 80, 200, 160)];
        //        _MovieSummary.backgroundColor=[UIColor greenColor];
        _MovieSummary.textAlignment=NSTextAlignmentLeft;
        _MovieSummary.textColor=[UIColor whiteColor];
        _MovieSummary.font=[UIFont systemFontOfSize:17];
        //        _MovieSummary.lineBreakMode = NSLineBreakByWordWrapping;
        _MovieSummary.numberOfLines = 0;
    }
    
    return _MovieSummary;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
