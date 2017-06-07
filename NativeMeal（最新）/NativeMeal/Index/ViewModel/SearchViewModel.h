//
//  SearchViewModel.h
//  NativeMeal
//
//  Created by JiangZiWei on 2017/5/26.
//  Copyright © 2017年 sunsx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FoodsModel.h"
#import "Screen.h"
@interface SearchViewModel : NSObject
/** 搜索内容数据模型 */
@property (nonatomic, strong) FoodsModel *foodsModel;

#pragma mark - init
/** 初始化方法 */
- (instancetype)initWithFoodsModel:(FoodsModel *)foodsModel;
#pragma mark - 数据请求相关
/** 请求命令 */
@property (nonatomic, strong, readonly) RACCommand *requestCommand;

/** 从网络中加载启动页数据 */
- (void)loadDataArrFromNetwork;
@end
