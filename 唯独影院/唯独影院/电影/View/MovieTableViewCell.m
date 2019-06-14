//
//  MovieTableViewCell.m
//  唯独影院
//
//  Created by 史建伟 on 2019/6/9.
//  Copyright © 2019年 史建伟. All rights reserved.
//

#import "MovieTableViewCell.h"

@implementation MovieTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self addSubview:self.image];
        [self addSubview:self.img];
        [self addSubview:self.namelabel];
    }
    
    return self;
}

//-(UIImageView *)image{
//
//    if (!_image) {
//        _image=[[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 5, 5)];
//        _image.backgroundColor=[UIColor yellowColor];
//
//    }
//
//    return _image;
//}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
