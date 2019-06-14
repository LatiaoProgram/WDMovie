//
//  MovieModel.h
//  唯独影院
//
//  Created by 史建伟 on 2019/6/9.
//  Copyright © 2019年 史建伟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"
NS_ASSUME_NONNULL_BEGIN


@class Res;

@interface MovieModel : NSObject

@property(nonatomic,strong)NSString * status;//状态
@property(nonatomic,strong)NSString * message;//提示信息
@property(nonatomic,strong)NSArray<Res * > * result;
@end

@interface Res : NSObject
@property(nonatomic,assign)Boolean * followMovie;
@property(nonatomic,assign)int id;
@property(nonatomic,strong)NSString * imageUrl;
@property(nonatomic,strong)NSString * name;
@property(nonatomic,strong)NSString * summary;

@end



NS_ASSUME_NONNULL_END
