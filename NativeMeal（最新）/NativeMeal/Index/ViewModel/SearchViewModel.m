//
//  SearchViewModel.m
//  NativeMeal
//
//  Created by JiangZiWei on 2017/5/26.
//  Copyright © 2017年 sunsx. All rights reserved.
//

#import "SearchViewModel.h"

@implementation SearchViewModel
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
                
                // 商家
                NSArray *FoodsModelArray = [NSArray modelArrayWithClass:[FoodsModel class] json:responseObject[@"pageItems"][0][@"list"]];
                
                if (!FoodsModelArray) {
                    FoodsModelArray = [NSArray array];
                }
                [subscriber sendNext:FoodsModelArray];
                
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
