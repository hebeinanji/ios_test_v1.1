//
//  FoodsTableViewCell.m
//  NativeMeal
//
//  Created by JiangZiWei on 2017/5/25.
//  Copyright © 2017年 sunsx. All rights reserved.
//

#import "FoodsTableViewCell.h"
#import "Screen.h"
@interface FoodsTableViewCell()
@property(nonatomic, strong) UIImageView * merchantImageView;
@property(nonatomic, strong) UILabel * merchantName;
@property(nonatomic, strong) UIView *foregroundStarView;  // 星级评分
@property(nonatomic, strong) UIView *backgroundStarView;  // 星级评分
@property(nonatomic, strong) UILabel * salesNum;
@property(nonatomic, strong) UILabel * catagory;
@property(nonatomic, strong) UILabel * location;
@property(nonatomic, strong) UIImageView * newsImageView;
@property(nonatomic, strong) UILabel * news;
@end
@implementation FoodsTableViewCell

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
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup{
    
    self.merchantImageView = [[UIImageView alloc] init];
    self.merchantImageView.backgroundColor = [UIColor redColor];
    self.merchantName = [[UILabel alloc] init];
    self.merchantName.font = [UIFont systemFontOfSize:16.0f];
    self.salesNum = [[UILabel alloc] init];
    self.salesNum.font = [UIFont systemFontOfSize:11.0f];
    self.catagory = [[UILabel alloc] init];
    self.catagory.font = [UIFont systemFontOfSize:12.0f];
    self.location = [[UILabel alloc] init];
    self.location.font = [UIFont systemFontOfSize:11.0f];
    self.location.textAlignment = NSTextAlignmentRight;
    self.newsImageView = [[UIImageView alloc] init];
    self.news = [[UILabel alloc] init];
    self.news.font = [UIFont systemFontOfSize:10.0f];
    
    [self.contentView sd_addSubviews:@[self.merchantImageView,self.merchantName,self.salesNum,self.catagory,self.location,self.newsImageView,self.news]];
    
    //星级评分
    self.foregroundStarView = [self createStarViewWithImage:@"小星星"];
    self.foregroundStarView.frame = CGRectMake(11*INDEX, 4*INDEX, 5.5*INDEX, 1.1*INDEX);
    self.backgroundStarView = [self createStarViewWithImage:@"镂空星星"];
    self.backgroundStarView.frame = CGRectMake(11*INDEX, 4*INDEX, 5.5*INDEX, 1.1*INDEX);
    [self.contentView addSubview:self.backgroundStarView];
    [self.contentView addSubview:self.foregroundStarView];
    
    // 添加约束
    self.merchantImageView.sd_layout
    .leftSpaceToView(self.contentView, INDEX)
    .topSpaceToView(self.contentView, INDEX)
    .widthIs(9*INDEX)
    .heightIs(7*INDEX);
    
    self.merchantName.sd_layout
    .leftSpaceToView(self.merchantImageView, INDEX)
    .topEqualToView(self.merchantImageView)
    .widthIs(20*INDEX)
    .heightIs(2*INDEX);
    
    self.salesNum.sd_layout
    .leftSpaceToView(self.backgroundStarView, INDEX)
    .topSpaceToView(self.contentView, 4*INDEX)
    .widthIs(8*INDEX)
    .heightIs(1.1*INDEX);
    
    self.catagory.sd_layout
    .leftEqualToView(self.merchantName)
    .topSpaceToView(self.foregroundStarView, 1.5*INDEX)
    .widthIs(8*INDEX)
    .heightIs(INDEX);
    
    self.location.sd_layout
    .rightSpaceToView(self.contentView, INDEX)
    .centerYEqualToView(self.catagory)
    .widthIs(15*INDEX)
    .heightIs(INDEX);
    
    self.newsImageView.sd_layout
    .leftEqualToView(self.merchantName)
    .topSpaceToView(self.catagory, 2*INDEX)
    .widthIs(INDEX)
    .heightIs(INDEX);
    
    self.news.sd_layout
    .leftSpaceToView(self.newsImageView, 0)
    .centerYEqualToView(self.newsImageView)
    .widthIs(20*INDEX)
    .heightIs(INDEX);
    
}
- (UIView *)createStarViewWithImage:(NSString *)imageName {
    UIView *view = [[UIView alloc] initWithFrame:self.bounds];
    view.clipsToBounds = YES;
    view.backgroundColor = [UIColor clearColor];
    for (NSInteger i = 0; i < 5; i ++)
    {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
        imageView.frame = CGRectMake(i * 1.1*INDEX, 0, 1.1*INDEX, 1.1*INDEX);
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [view addSubview:imageView];
    }
    return view;
}

-(void)setModel:(FoodsModel *)model{
    self.merchantName.text = model.shopTitle;
    self.salesNum.text = [NSString stringWithFormat:@"月售 %@",model.sellCount];
    self.catagory.text = model.sort;
    self.location.text = model.address;
    self.foregroundStarView.frame = CGRectMake(11*INDEX, 4*INDEX, 1.1*INDEX*[model.startCount floatValue], 1.1*INDEX);
    self.news.text = @"单人餐99元，4人餐148元，6人餐228元";
}
@end
