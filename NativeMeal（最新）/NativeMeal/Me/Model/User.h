//
//  User.h
//  NativeMeal
//
//  Created by 孙烁鑫 on 17/5/24.
//  Copyright © 2017年 sunsx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
@interface User : NSObject
//属性
@property(assign, nonatomic) int userID;
@property(strong, nonatomic) UIImage * iconImage; // 头像
@property(copy, nonatomic) NSString * username; // 用户名
@property(copy, nonatomic) NSString * gender; // 性别
@property(copy, nonatomic) NSString * account; // 账号
@property(copy, nonatomic) NSString * phonenumber; // 手机号
@property(copy, nonatomic) NSString * mailbox; // 邮箱
@property(assign, nonatomic) CLLocationCoordinate2D nowCoor;
+(instancetype)userOfMine;

@end
