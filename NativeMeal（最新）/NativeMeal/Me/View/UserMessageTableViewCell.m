//
//  UserMessageTableViewCell.m
//  NativeMeal
//
//  Created by 孙烁鑫 on 17/5/24.
//  Copyright © 2017年 sunsx. All rights reserved.
//

#import "UserMessageTableViewCell.h"
#import "Screen.h"

@implementation UserMessageTableViewCell

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
    
    self.label2 = [[UILabel alloc]initWithFrame:CGRectMake(self.label1.bounds.size.width + 3*INDEX, INDEX/2, 15*INDEX, 3*INDEX)];
    self.label2.font = [UIFont systemFontOfSize:15.0];
    [self.contentView addSubview:self.label2];
    
    
}

@end
