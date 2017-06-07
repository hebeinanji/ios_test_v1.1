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

-(instancetype)initWithRecommendModel:(RecommendModel *)recommendModel{
    self = [super init];
    if (!self) return nil;
    self.recommendModel = recommendModel;
    return self;
}
/** 从网络中加载启动页数据 */

- (void)loadDataArrFromNetwork{
    _requestCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            
            NSString * url = @"http://47.94.19.44:8080/dftsms-web/data/indexOfAndroid?pagestamp=0&areacountyCode=130401&numOfShow=10&rule=6&x=&y=";
            [JZRequestTool GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if([responseObject[@"pageItems"] count] == 10){
                    return;
                }
                // 广告
                NSArray *adModelArray = [NSArray modelArrayWithClass:[ADModel class] json:responseObject[@"pageItems"][@"a_lbt"][@"lbt"]];
                
                // 爆款推荐
                NSArray *recommendModelArray = [NSArray modelArrayWithClass:[RecommendModel class] json:responseObject[@"pageItems"][@"b_bktj"][@"bktj"]];
                
                // 商家推荐
                NSArray *merchantsModelArray = [NSArray modelArrayWithClass:[RecommendModel class] json:responseObject[@"pageItems"][@"c_tjsj"][@"tjsj"]];
                
                
                if (!adModelArray) {
                    adModelArray = [NSArray array];
                }
                if (!recommendModelArray) {
                    recommendModelArray = [NSArray array];
                }
                if (!merchantsModelArray) {
                    merchantsModelArray = [NSArray array];
                }
                
                [subscriber sendNext:@[adModelArray,recommendModelArray,merchantsModelArray]];
                
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
