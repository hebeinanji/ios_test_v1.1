//
//  NearbyCell.m
//  NativeMeal
//
//  Created by 陈文 on 17/5/24.
//  Copyright © 2017年 sunsx. All rights reserved.
//

#import "NearbyCell.h"
#define Width [UIScreen mainScreen].bounds.size.width
#define Height [UIScreen mainScreen].bounds.size.height
@implementation NearbyCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self creatTheCell];
    }
    return self;
}

-(void)creatTheCell{
    
    self.header_imageView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 3, 100, 70)];
    self.header_imageView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:self.header_imageView];
    
    
    self.name_Label = [[UILabel alloc]initWithFrame:CGRectMake(110, 3, Width - 110, 20)];
    self.name_Label.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.name_Label];
    
    self.sale_Label = [[UILabel alloc]initWithFrame:CGRectMake(170, 25, 70, 10)];
    self.sale_Label.textColor = [UIColor lightGrayColor];
    self.sale_Label.font = [UIFont systemFontOfSize:11];
    [self.contentView addSubview:self.sale_Label];
    
    self.grade_Label = [[UILabel alloc]initWithFrame:CGRectMake(115, 25, 50, 10)];
    self.grade_Label.textColor = [UIColor lightGrayColor];
    self.grade_Label.font = [UIFont systemFontOfSize:11];
    [self.contentView addSubview:self.grade_Label];
    
    self.cate_Label = [[UILabel alloc]initWithFrame:CGRectMake(110, 50, 40, 10)];
    self.cate_Label.textColor  = [UIColor orangeColor];
    self.cate_Label.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:self.cate_Label];
    
    self.address_Label = [[UILabel alloc]initWithFrame:CGRectMake(150, 50, Width - 160, 10)];
    self.address_Label.textColor = [UIColor lightGrayColor];
    self.address_Label.textAlignment = NSTextAlignmentRight;
    self.address_Label.font = [UIFont systemFontOfSize:11];
    [self.contentView addSubview:self.address_Label];
    
    
    self.message_Label = [[UILabel alloc]initWithFrame:CGRectMake(110, 68, Width - 110, 10)];
    self.message_Label.textColor = [UIColor lightGrayColor];
    self.message_Label.font = [UIFont systemFontOfSize:11];
    [self.contentView addSubview:self.message_Label];
    
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
