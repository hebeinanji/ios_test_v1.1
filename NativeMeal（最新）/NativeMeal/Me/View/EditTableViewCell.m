//
//  EditTableViewCell.m
//  NativeMeal
//
//  Created by 孙烁鑫 on 17/5/25.
//  Copyright © 2017年 sunsx. All rights reserved.
//

#import "EditTableViewCell.h"
#import "Screen.h"

@implementation EditTableViewCell

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
    
    self.textField = [[UITextField alloc]initWithFrame:CGRectMake(self.label1.bounds.size.width + 3*INDEX, INDEX/2, 22*INDEX, 3*INDEX)];
    self.textField.font = [UIFont systemFontOfSize:15.0];
    self.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.contentView addSubview:self.textField];
    
    
}
-(void)setCellDelegate:(id)delegate{
    self.textField.delegate = delegate;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField{
    textField.text = @"";
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    return YES;
}


@end
