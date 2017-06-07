//
//  IndexViewModel.h
//  NativeMeal
//
//  Created by JiangZiWei on 2017/5/26.
//  Copyright © 2017年 sunsx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ADModel.h"
#import "RecommendModel.h"
#import "Screen.h"
@interface IndexViewModel : NSObject
/** 首页内容数据模型 */
@property (nonatomic, strong) ADModel *adModel;

#pragma mark - init
/** 初始化方法 */
- (instancetype)initWithADModel:(ADModel *)adModel;



#pragma mark - init
/** 初始化方法 */
- (instancetype)initWithRecommendModel:(RecommendModel *)recommendModel;

/** 首页内容数据模型 */
@property (nonatomic, strong) RecommendModel *recommendModel;




#pragma mark - 数据请求相关
/** 请求命令 */
@property (nonatomic, strong, readonly) RACCommand *requestCommand;

/** 从网络中加载启动页数据 */
- (void)loadDataArrFromNetwork;

@end
