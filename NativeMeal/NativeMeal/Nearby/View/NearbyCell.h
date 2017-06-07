//
//  NearbyCell.h
//  NativeMeal
//
//  Created by 陈文 on 17/5/24.
//  Copyright © 2017年 sunsx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NearbyCell : UITableViewCell
// 图片
@property(strong,nonatomic)UIImageView * header_imageView;
// 名称
@property(strong,nonatomic)UILabel * name_Label;
//销售
@property(strong,nonatomic)UILabel * sale_Label;
//分类
@property(strong,nonatomic)UILabel * cate_Label;
//地址
@property(strong,nonatomic)UILabel * address_Label;
//消息
@property(strong,nonatomic)UILabel * message_Label;
//评分
@property(strong,nonatomic)UILabel * grade_Label;
@end
