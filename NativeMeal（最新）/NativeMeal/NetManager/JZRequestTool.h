//
//  JZRequestTool.h
//  kuaidian
//
//  Created by JiangZiWei on 2016/11/18.
//  Copyright © 2016年 JiangZiWei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JZNetManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface JZRequestTool : NSObject

+ (nullable NSURLSessionDataTask *)GET:(NSString *)URLString
                            parameters:(nullable id)parameters
                              progress:(nullable void (^)(NSProgress *downloadProgress))downloadProgress
                               success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
                               failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure;


+ (nullable NSURLSessionDataTask *)POST:(NSString *)URLString
                             parameters:(nullable id)parameters
                               progress:(nullable void (^)(NSProgress *uploadProgress))uploadProgress
                                success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
                                failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure;

+ (void)cancel;

@end
NS_ASSUME_NONNULL_END
