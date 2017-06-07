//
//  IndexViewModel.m
//  NativeMeal
//
//  Created by JiangZiWei on 2017/5/26.
//  Copyright © 2017年 sunsx. All rights reserved.
//

#import "IndexViewModel.h"

@implementation IndexViewModel
#pragma mark - Public
/** 初始化方法 */
-(instancetype)initWithADModel:(ADModel *)adModel{
    self = [super init];
    if (!self) return nil;
    self.adModel = adModel;
    return self;
}
-(instancetype)initWithFoodsModel:(FoodsModel *)foodsModel{
    self = [super init];
    if (!self) return nil;
    self.foodsModel = foodsModel;
    return self;
}

/** 从网络中加载启动页数据 */

- (void)loadDataArrFromNetwork{
    _requestCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            
            [JZRequestTool GET:@"https://www.bilibili.com/index/rank/all-3-0.json" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                // 广告
                NSArray *adModelArray = [NSArray modelArrayWithClass:[ADModel class] json:responseObject[@"pageItems"][0][@"list"]];
                
                // 爆款推荐
                NSArray *recommendModelArray = [NSArray modelArrayWithClass:[FoodsModel class] json:responseObject[@"pageItems"][2][@"list"]];
                
                // 商家推荐
                NSArray *merchantsModelArray = [NSArray modelArrayWithClass:[FoodsModel class] json:responseObject[@"pageItems"][3][@"list"]];
                
                // 商家
                NSArray *FoodsModelArray = [NSArray modelArrayWithClass:[FoodsModel class] json:responseObject[@"pageItems"][4][@"list"]];
                
                if (!adModelArray) {
                    adModelArray = [NSArray array];
                }
                if (!recommendModelArray) {
                    recommendModelArray = [NSArray array];
                }
                if (!merchantsModelArray) {
                    merchantsModelArray = [NSArray array];
                }
                if (!FoodsModelArray) {
                    FoodsModelArray = [NSArray array];
                }
                [subscriber sendNext:@[adModelArray,recommendModelArray,merchantsModelArray,FoodsModelArray]];
                
                [subscriber sendCompleted];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [subscriber sendError:error];
            }];
            
            return nil;
        }];
        
        return signal;
    }];
}
@end
