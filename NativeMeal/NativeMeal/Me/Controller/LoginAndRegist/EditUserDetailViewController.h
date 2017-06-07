//
//  EditUserDetailViewController.h
//  NativeMeal
//
//  Created by 孙烁鑫 on 17/5/24.
//  Copyright © 2017年 sunsx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
typedef void(^changeUserInfo)(User * user);
@interface EditUserDetailViewController : UIViewController
@property(strong, nonatomic) User * user;
@property(copy, nonatomic) changeUserInfo changeUserInfoBlock;

@end
