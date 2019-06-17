//
//  ThreeTableViewCell.h
//  唯独影院
//
//  Created by 史建伟 on 2019/6/17.
//  Copyright © 2019年 史建伟. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ThreeTableViewCell : UITableViewCell

@property(nonatomic,strong)UIImageView * backgroundImg;
@property(nonatomic,strong)UIImageView * MovieImg;
@property(nonatomic,strong)UILabel * MovieName;
@property(nonatomic,strong)UILabel * MovieSummary;

@end

NS_ASSUME_NONNULL_END
