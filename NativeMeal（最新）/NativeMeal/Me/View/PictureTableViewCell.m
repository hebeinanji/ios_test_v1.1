//
//  PictureTableViewCell.m
//  NativeMeal
//
//  Created by 孙烁鑫 on 17/5/24.
//  Copyright © 2017年 sunsx. All rights reserved.
//

#import "PictureTableViewCell.h"
#import "Screen.h"

@implementation PictureTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self creatUI];
    }
    return self;
}

-(void)creatUI{
    self.label1 = [[UILabel alloc]initWithFrame:CGRectMake(2*INDEX, INDEX/2, 10*INDEX, 3*INDEX)];
    self.label1.font = [UIFont systemFontOfSize:15.0];
    [self.contentView addSubview:self.label1];
    
    self.btn = [[UIButton alloc]initWithFrame:CGRectMake(self.label1.bounds.size.width + 4*INDEX, 0, 5*INDEX, 5*INDEX)];
    self.btn.layer.cornerRadius = self.btn.bounds.size.height/2;
    self.btn.layer.masksToBounds = YES;
    self.btn.titleLabel.font = [UIFont systemFontOfSize:15.0];
    
    [self.contentView addSubview:self.btn];
    
    
}

- (void)setTarget:(id)target action:(SEL)action{
    [self.btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}
@end
