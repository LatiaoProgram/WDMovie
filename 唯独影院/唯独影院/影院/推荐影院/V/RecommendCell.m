//
//  RecommendCell.m
//  维度电影
//
//  Created by 杨阳 on 2019/6/12.
//  Copyright © 2019年 杨阳. All rights reserved.
//

#import "RecommendCell.h"
#import "screenLayOut.h"
#import "UIImageView+WebCache.h"
@implementation RecommendCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self addSubview:self.LogoImg];
        [self addSubview:self.nameLabel];
        [self addSubview:self.AddressLabel];
        [self addSubview:self.GapLabel];
        [self addSubview:self.LoveBtn];
        
    }
    return self;
}

-(UIImageView *)LogoImg{
    if (_LogoImg == nil) {
        _LogoImg = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 80, 120)];
    }
    return _LogoImg;
}

-(UILabel *)nameLabel{
    if (_nameLabel == nil) {
        
        _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 10, 200, 20)];
        _nameLabel.font = [UIFont systemFontOfSize:15];
        _nameLabel.textColor = [UIColor blackColor];
    }
    return _nameLabel;
}

-(UILabel *)AddressLabel{
    if (_AddressLabel == nil) {
        _AddressLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 40, 230, 60)];
        _AddressLabel.font = [UIFont systemFontOfSize:13];
        _AddressLabel.textColor = [UIColor lightGrayColor];
        _AddressLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _AddressLabel.numberOfLines = 0;
    }
    return _AddressLabel;
}

-(UILabel *)GapLabel{
    if (_GapLabel == nil) {
        
        _GapLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 80, 30)];
        _GapLabel.font = [UIFont systemFontOfSize:12];
        _GapLabel.textColor = [UIColor lightGrayColor];
        
    }
    return _GapLabel;
}

-(UIButton *)LoveBtn{
    if (_LoveBtn == nil) {
        _LoveBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCR_W-40, 100, 30, 30)];
        [_LoveBtn setImage:[UIImage imageNamed:@"dianzan"] forState:UIControlStateNormal];
        [_LoveBtn setImage:[UIImage imageNamed:@"dianzan-2"] forState:UIControlStateSelected];
    }
    return _LoveBtn;
}

-(void)SetCelldataWithModel:(Details *)md{
    

    [_LogoImg sd_setImageWithURL:[NSURL URLWithString:md.logo] placeholderImage:nil];
    self.nameLabel.text = md.name;
    
    self.AddressLabel.text = md.address;
    
    self.GapLabel.text = [NSString stringWithFormat:@"%d",md.distance];
    
}

@end
