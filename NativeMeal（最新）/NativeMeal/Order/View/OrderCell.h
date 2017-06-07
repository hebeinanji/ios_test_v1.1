//
//  OrderCell.h
//  NativeMeal
//
//  Created by 陈文 on 17/5/25.
//  Copyright © 2017年 sunsx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderCell : UITableViewCell
@property(strong,nonatomic)UIImageView * header_imageView;
@property(strong,nonatomic)UILabel * name_Label;
@property(strong,nonatomic)UILabel * time_Label;
@property(strong,nonatomic)UILabel * price_Label;
@property(strong,nonatomic)UILabel * status_Label;
@property(strong,nonatomic)UIButton * again_Button;
@end
