//
//  ReleaseModel.h
//  唯独影院
//
//  Created by 史建伟 on 2019/6/14.
//  Copyright © 2019年 史建伟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"

NS_ASSUME_NONNULL_BEGIN

@class ReleaseRes;
@interface ReleaseModel : NSObject
@property(nonatomic,strong)NSString * status;//状态
@property(nonatomic,strong)NSString * message;//提示信息
@property(nonatomic,strong)NSArray<ReleaseRes * > * result;
@end


@interface ReleaseRes : NSObject
@property(nonatomic,assign)Boolean * followMovie;
@property(nonatomic,assign)int id;
@property(nonatomic,strong)NSString * imageUrl;
@property(nonatomic,strong)NSString * name;
@property(nonatomic,strong)NSString * summary;
@property(nonatomic,strong)NSString * releaseTimeShow;

@end

NS_ASSUME_NONNULL_END
