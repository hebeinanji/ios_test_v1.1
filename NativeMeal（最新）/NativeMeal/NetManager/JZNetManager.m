//
//  JZNetManager.m
//  kuaidian
//
//  Created by JiangZiWei on 2016/11/18.
//  Copyright © 2016年 JiangZiWei. All rights reserved.
//

#import "JZNetManager.h"

@implementation JZNetManager

- (instancetype)init
{
    self = [super init];
    if (!self) return nil;
    self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/plain",@"text/html", nil];
//    self.securityPolicy.allowInvalidCertificates = YES; // not recommended for production
    return self;
}
#pragma mark - Public
+ (instancetype)shareManager
{
    static JZNetManager *_instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
        [_instance.requestSerializer setTimeoutInterval:30];
    });
    return _instance;
}

@end
