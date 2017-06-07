//
//  LoginCell.h
//  NativeMeal
//
//  Created by 孙烁鑫 on 17/5/20.
//  Copyright © 2017年 sunsx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Expansion.h"
static CGFloat header_size = 40;
static CGFloat cell_height = 80;
static CGFloat title_font_size = 15;
static CGFloat des_font_size = 12;
@interface LoginCell : UITableViewCell
@property(weak,nonatomic)UIImageView *headerView;
@property(weak,nonatomic)UILabel *titleLabel;
@property(weak,nonatomic)UILabel *desLabel;
@end
