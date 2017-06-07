//
//  MerchantsTableViewCell.m
//  NativeMeal
//
//  Created by JiangZiWei on 2017/5/25.
//  Copyright © 2017年 sunsx. All rights reserved.
//

#import "MerchantsTableViewCell.h"
#import "Screen.h"
@interface MerchantsTableViewCell()

/**
 商家1
 */
@property(strong, nonatomic)UIImageView * merchantsOneImageView;
@property(strong, nonatomic)UILabel * merchantsOneName;

/**
 商家2
 */
@property(strong, nonatomic)UIImageView * merchantsTwoImageView;
@property(strong, nonatomic)UILabel * merchantsTwoName;

/**
 商家3
 */
@property(strong, nonatomic)UIImageView * merchantsThreeImageView;
@property(strong, nonatomic)UILabel * merchantsThreeName;

@end
@implementation MerchantsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self setup];
    }
    return self;
}

- (void)setup{
    UILabel * label = [[UILabel alloc] init];
    label.text = @"品牌商家";
    label.textAlignment = NSTextAlignmentCenter;
//    label.font = [UIFont systemFontOfSize:15.0f];
    UIView * leftLine = [[UIView alloc] init];
    leftLine.backgroundColor = [UIColor blackColor];
    UIView * rightLine = [[UIView alloc] init];
    rightLine.backgroundColor = [UIColor blackColor];
    
    self.merchantsOneImageView = [[UIImageView alloc] init];
    self.merchantsOneImageView.backgroundColor = [UIColor redColor];
    self.merchantsOneName = [[UILabel alloc] init];
    self.merchantsOneName.textAlignment = NSTextAlignmentCenter;
    self.merchantsOneName.text = @"金百万";
    
    self.merchantsTwoImageView = [[UIImageView alloc] init];
    self.merchantsTwoImageView.backgroundColor = [UIColor redColor];
    self.merchantsTwoName = [[UILabel alloc] init];
    self.merchantsTwoName.textAlignment = NSTextAlignmentCenter;
    self.merchantsTwoName.text = @"柚恋柠檬";
    
    self.merchantsThreeImageView = [[UIImageView alloc] init];
    self.merchantsThreeImageView.backgroundColor = [UIColor redColor];
    self.merchantsThreeName = [[UILabel alloc] init];
    self.merchantsThreeName.textAlignment = NSTextAlignmentCenter;
    self.merchantsThreeName.text = @"张阿姨奶茶";

    [self.contentView sd_addSubviews:@[leftLine,label,rightLine,self.merchantsOneImageView,self.merchantsOneName,self.merchantsTwoImageView,self.merchantsTwoName,self.merchantsThreeImageView,self.merchantsThreeName]];
    
    float imageWidth = 11*INDEX;
    float index = 0.5*INDEX;
    float margin = (UISCREEN_WIDTH-34*INDEX)/2;
    // 添加约束
    label.sd_layout
    .topSpaceToView(self.contentView, INDEX)
    .centerXEqualToView(self.contentView)
    .widthIs(10*INDEX)
    .heightIs(2*INDEX);
    
    leftLine.sd_layout
    .rightSpaceToView(label, 0.5*INDEX)
    .centerYEqualToView(label)
    .widthIs(INDEX)
    .heightIs(1);
    
    rightLine.sd_layout
    .leftSpaceToView(label, 0.5*INDEX)
    .centerYEqualToView(label)
    .widthIs(INDEX)
    .heightIs(1);
    
    // 图1
    self.merchantsOneImageView.sd_layout
    .leftSpaceToView(self.contentView, index)
    .topSpaceToView(label, INDEX)
    .widthIs(imageWidth)
    .heightIs(8*INDEX);
    
    
    self.merchantsOneName.sd_layout
    .centerXEqualToView(self.merchantsOneImageView)
    .topSpaceToView(self.merchantsOneImageView, 0.5*INDEX)
    .widthIs(imageWidth)
    .heightIs(2*INDEX);
    
    // 图2
    self.merchantsTwoImageView.sd_layout
    .leftSpaceToView(self.merchantsOneImageView, margin)
    .topSpaceToView(label, INDEX)
    .widthIs(imageWidth)
    .heightIs(8*INDEX);
    
    self.merchantsTwoName.sd_layout
    .centerXEqualToView(self.merchantsTwoImageView)
    .topSpaceToView(self.merchantsTwoImageView, 0.5*INDEX)
    .widthIs(imageWidth)
    .heightIs(2*INDEX);
    
    // 图3
    self.merchantsThreeImageView.sd_layout
    .rightSpaceToView(self.contentView, index)
    .topSpaceToView(label, INDEX)
    .widthIs(imageWidth)
    .heightIs(8*INDEX);
    
    self.merchantsThreeName.sd_layout
    .centerXEqualToView(self.merchantsThreeImageView)
    .topSpaceToView(self.merchantsThreeImageView, 0.5*INDEX)
    .widthIs(imageWidth)
    .heightIs(2*INDEX);
}
-(void)addItemTarget:(id)target action:(SEL)action{
    self.merchantsOneImageView.userInteractionEnabled = YES;
    self.merchantsOneImageView.tag = 1;
    UITapGestureRecognizer * tap1 = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    [self.merchantsOneImageView addGestureRecognizer:tap1];
    
    self.merchantsTwoImageView.userInteractionEnabled = YES;
    self.merchantsTwoImageView.tag = 2;
    UITapGestureRecognizer * tap2 = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    [self.merchantsTwoImageView addGestureRecognizer:tap2];
    
    self.merchantsThreeImageView.userInteractionEnabled = YES;
    self.merchantsThreeImageView.tag = 3;
    UITapGestureRecognizer * tap3 = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    [self.merchantsThreeImageView addGestureRecognizer:tap3];
}

-(void)setMerchantsArr:(NSArray *)merchantsArr{
    
//    self.merchantsOneImageView
    self.merchantsOneName.text = [merchantsArr[0] shopTitle];
    
    //    self.merchantsTwoImageView
    self.merchantsTwoName.text = [merchantsArr[1] shopTitle];
    
    //    self.merchantsThreeImageView
    self.merchantsThreeName.text = [merchantsArr[2] shopTitle];
    
    
}

@end
