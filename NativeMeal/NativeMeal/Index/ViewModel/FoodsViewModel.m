//
//  FoodsViewModel.m
//  NativeMeal
//
//  Created by JiangZiWei on 2017/6/5.
//  Copyright © 2017年 sunsx. All rights reserved.
//

#import "FoodsViewModel.h"

@implementation FoodsViewModel
-(instancetype)initWithFoodsModel:(FoodsModel *)foodsModel{
    self = [super init];
    if (!self) return nil;
    self.foodsModel = foodsModel;
    return self;
}
- (void)loadDataArrFromNetworkWithPage:(int)page{
    _requestCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            
            NSString * url = [NSString stringWithFormat:@"http://47.94.19.44:8080/dftsms-web/data/indexOfAndroid?pagestamp=%d&areacountyCode=130401&numOfShow=10&rule=6&x=&y=",page];
            [JZRequestTool GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
                // 商家
                NSArray *FoodsModelArray = [NSArray modelArrayWithClass:[FoodsModel class] json:responseObject[@"pageItems"]];
                
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
