//
//  OrderCell.m
//  NativeMeal
//
//  Created by 陈文 on 17/5/25.
//  Copyright © 2017年 sunsx. All rights reserved.
//

#import "OrderCell.h"
#define Width [UIScreen mainScreen].bounds.size.width
#define Height [UIScreen mainScreen].bounds.size.height
@implementation OrderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=  [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self cellCreate];
    }
    return  self;
}
-(void)cellCreate{
    self.header_imageView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 70, 70)];
    [self.contentView addSubview:self.header_imageView];
    
    self.name_Label = [[UILabel alloc]initWithFrame:CGRectMake(80, 5, 100, 20)];
    [self.contentView addSubview:self.name_Label];
    
    
    self.status_Label = [[UILabel alloc]initWithFrame:CGRectMake(Width -50, 5, 30, 20)];
    self.status_Label.font = [UIFont systemFontOfSize:12];
    self.status_Label.textColor = [UIColor orangeColor];
    [self.contentView addSubview:self.status_Label];
    
    self.time_Label = [[UILabel alloc]initWithFrame:CGRectMake(80, 35, 250, 10)];
    self.time_Label.textColor = [UIColor lightGrayColor];
    self.time_Label.font = [UIFont systemFontOfSize:11];
    [self.contentView addSubview:self.time_Label];
    
    self.price_Label = [[UILabel alloc]initWithFrame:CGRectMake(80, 55, 100, 10)];
    self.price_Label.textColor = [UIColor lightGrayColor];
    self.price_Label.font = [UIFont systemFontOfSize:11];
    [self.contentView addSubview:self.price_Label];
    
    self.again_Button = [[UIButton alloc]initWithFrame:CGRectMake(Width - 80, 40, 70, 20)];
    [self.again_Button setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    self.again_Button.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:self.again_Button];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
