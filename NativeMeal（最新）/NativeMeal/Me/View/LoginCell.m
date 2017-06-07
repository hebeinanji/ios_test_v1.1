//
//  LoginCell.m
//  NativeMeal
//
//  Created by 孙烁鑫 on 17/5/20.
//  Copyright © 2017年 sunsx. All rights reserved.
//

#import "LoginCell.h"


@implementation LoginCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    if (selected) {
        [self setSelected:NO animated:animated];
    }

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
    UIImageView *headerView = [[UIImageView alloc] init];
    headerView.width = header_size;
    headerView.height = header_size;
    headerView.X = header_size / 2;
    headerView.Y = header_size / 2;
    headerView.layer.cornerRadius = header_size / 2;
    headerView.clipsToBounds = YES;
    headerView.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:headerView];
    self.headerView = headerView;
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"立即登陆";
    titleLabel.Y =header_size / 2;
    titleLabel.X = header_size + self.headerView.width;
    titleLabel.height = [UIFont systemFontOfSize:title_font_size].lineHeight;
    titleLabel.width = self.contentView.width - titleLabel.X - header_size;
    titleLabel.font = [UIFont systemFontOfSize:title_font_size];
    [self.contentView addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    UILabel *desLabel = [[UILabel alloc] init];
    desLabel.text = @"登陆之后享受更多特权";
    desLabel.height = [UIFont systemFontOfSize:des_font_size].lineHeight;
    desLabel.width = self.titleLabel.width;
    desLabel.X = self.titleLabel.X;
    desLabel.Y = self.headerView.Y + self.headerView.height - desLabel.height;
    desLabel.font = [UIFont systemFontOfSize:des_font_size];
    desLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:desLabel];
    self.desLabel = desLabel;
    
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
}

@end
