//
//  RecommendMD.h
//  维度电影
//
//  Created by 杨阳 on 2019/6/12.
//  Copyright © 2019年 杨阳. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"
NS_ASSUME_NONNULL_BEGIN
@class Details;
@interface RecommendMD : NSObject

@property (nonatomic,strong)NSString *status;
@property (nonatomic,strong)NSString *message;
@property (nonatomic,strong)NSArray<Details *>*result;

@end


@interface Details : NSObject
@property(nonatomic,assign)int id;//影院ID
@property(nonatomic,strong)NSString * address;//影院地址
@property(nonatomic,assign)int followCinema;//是否关注
@property(nonatomic,strong)NSString * name;//影院名称
@property(nonatomic,strong)NSString * logo;//影院logo
@property(nonatomic,assign)int commentTotal;//影院评论数
@property(nonatomic,assign)int distance;//影院距离
@end

NS_ASSUME_NONNULL_END
