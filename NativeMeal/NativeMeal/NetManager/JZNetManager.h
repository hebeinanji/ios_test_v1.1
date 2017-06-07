//
//  JZNetManager.h
//  kuaidian
//
//  Created by JiangZiWei on 2016/11/18.
//  Copyright © 2016年 JiangZiWei. All rights reserved.
//  基于AFHTTPSession的单例类

#import "AFHTTPSessionManager.h"

@interface JZNetManager : AFHTTPSessionManager

/**
 *  单例
 */
+ (instancetype)shareManager;

@end
