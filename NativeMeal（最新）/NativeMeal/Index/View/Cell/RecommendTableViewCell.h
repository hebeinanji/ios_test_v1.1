//
//  RecommendTableViewCell.h
//  NativeMeal
//
//  Created by JiangZiWei on 2017/5/25.
//  Copyright © 2017年 sunsx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FoodsModel.h"
@interface RecommendTableViewCell : UITableViewCell
@property(strong, nonatomic)NSArray * recommendArr;
- (void)addItemTarget:(id)target action:(SEL)action;
@end
