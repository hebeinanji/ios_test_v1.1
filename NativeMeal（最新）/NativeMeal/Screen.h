//
//  Screen.h
//  goTravel
//
//  Created by JiangZiWei on 16/4/19.
//  Copyright © 2016年 至远科技－17. All rights reserved.
//

#import <Foundation/Foundation.h>
#define INDEX [UIScreen mainScreen].bounds.size.width/37.5
#define UISCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define UISCREEN_HEIHT [UIScreen mainScreen].bounds.size.height
#define WIDTH ([UIScreen mainScreen].bounds.size.width-2*4*[UIScreen mainScreen].bounds.size.width/37.5 - [UIScreen mainScreen].bounds.size.width/37.5)/2


static NSString * const adTableViewCellID = @"adTableViewCellID";
static NSString * const catagoryTableViewCellID = @"catagoryTableViewCellID";
static NSString * const recommendTableViewCellID = @"recommendTableViewCellID";
static NSString * const merchantsTableViewCellID = @"merchantsTableViewCellID";
static NSString * const foodsTableViewCellID = @"foodsTableViewCellID";
static NSString * const foodsHeaderViewID = @"foodsHeaderViewID";





// 类目

#import "UIImageView+Circle.h"
#import "NSObject+YYModel.h"

// 自动布局
#import "SDAutoLayout.h"

// 下拉刷新
#import "MJRefresh.h"

// RAC
#import "ReactiveCocoa.h"
#import "NSObject+RACKVOWrapper.h"
#import "RACReturnSignal.h"

#import "JZRequestTool.h"

@interface Screen : NSObject

@end
