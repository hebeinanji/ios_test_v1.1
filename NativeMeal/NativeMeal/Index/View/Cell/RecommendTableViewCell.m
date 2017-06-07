//
//  RecommendTableViewCell.m
//  NativeMeal
//
//  Created by JiangZiWei on 2017/5/25.
//  Copyright © 2017年 sunsx. All rights reserved.
//

#import "RecommendTableViewCell.h"
#import "Screen.h"
@interface RecommendTableViewCell()
/**
 图1
 */
@property(strong, nonatomic)UIImageView * dishesOneImageView;
@property(strong, nonatomic)UILabel * dishesOneName;
@property(strong, nonatomic)UILabel * dishesOneDescribe;

/**
 图2
 */
@property(strong, nonatomic)UIImageView * dishesTwoImageView;
@property(strong, nonatomic)UILabel * dishesTwoName;
@property(strong, nonatomic)UILabel * dishesTwoDescribe;

/**
 图3
 */
@property(strong, nonatomic)UIImageView * dishesThreeImageView;
@property(strong, nonatomic)UILabel * dishesThreeName;
@property(strong, nonatomic)UILabel * dishesThreeDescribe;

/**
 图4
 */
@property(strong, nonatomic)UIImageView * dishesFourImageView;
@property(strong, nonatomic)UILabel * dishesFourName;
@property(strong, nonatomic)UILabel * dishesFourDescribe;

/**
 图5
 */
@property(strong, nonatomic)UIImageView * dishesFiveImageView;
@property(strong, nonatomic)UILabel * dishesFiveName;
@property(strong, nonatomic)UILabel * dishesFiveDescribe;
@end
@implementation RecommendTableViewCell

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
    UILabel * label = [[UILabel alloc] init];
    label.text = @"爆款推荐";
    label.textAlignment = NSTextAlignmentCenter;
//    label.font = [UIFont systemFontOfSize:15.0f];
    UIView * leftLine = [[UIView alloc] init];
    leftLine.backgroundColor = [UIColor blackColor];
    UIView * rightLine = [[UIView alloc] init];
    rightLine.backgroundColor = [UIColor blackColor];
    // 图1
    self.dishesOneImageView = [[UIImageView alloc] init];
    self.dishesOneImageView.backgroundColor = [UIColor redColor];
    self.dishesOneName = [[UILabel alloc] init];
    self.dishesOneName.text = @"古法黄焖鸡";
    self.dishesOneName.font = [UIFont systemFontOfSize:12.0f];
    
    self.dishesOneDescribe = [[UILabel alloc] init];
    self.dishesOneDescribe.text = @"排骨";
    self.dishesOneDescribe.textAlignment = NSTextAlignmentCenter;
    self.dishesOneDescribe.font = [UIFont systemFontOfSize:11.0f];
    self.dishesOneDescribe.layer.borderWidth = 1;
    self.dishesOneDescribe.layer.borderColor = [UIColor blackColor].CGColor;
    // 图2
    self.dishesTwoImageView = [[UIImageView alloc] init];
    self.dishesTwoImageView.backgroundColor = [UIColor redColor];
    self.dishesTwoName = [[UILabel alloc] init];
    self.dishesTwoName.text = @"老王推荐";
    self.dishesTwoName.font = [UIFont systemFontOfSize:12.0f];
    self.dishesTwoDescribe = [[UILabel alloc] init];
    self.dishesTwoDescribe.text = @"排骨";
    self.dishesTwoDescribe.textAlignment = NSTextAlignmentCenter;
    self.dishesTwoDescribe.font = [UIFont systemFontOfSize:11.0f];
    self.dishesTwoDescribe.layer.borderWidth = 1;
    self.dishesTwoDescribe.layer.borderColor = [UIColor blackColor].CGColor;
    // 图3
    self.dishesThreeImageView = [[UIImageView alloc] init];
    self.dishesThreeImageView.backgroundColor = [UIColor redColor];
    self.dishesThreeName = [[UILabel alloc] init];
    self.dishesThreeName.text = @"田老师红烧肉";
    self.dishesThreeName.font = [UIFont systemFontOfSize:12.0f];
    self.dishesThreeDescribe = [[UILabel alloc] init];
    self.dishesThreeDescribe.text = @"排骨";
    self.dishesThreeDescribe.textAlignment = NSTextAlignmentCenter;
    self.dishesThreeDescribe.font = [UIFont systemFontOfSize:11.0f];
    self.dishesThreeDescribe.layer.borderWidth = 1;
    self.dishesThreeDescribe.layer.borderColor = [UIColor blackColor].CGColor;
    // 图4
    self.dishesFourImageView = [[UIImageView alloc] init];
    self.dishesFourImageView.backgroundColor = [UIColor redColor];
    self.dishesFourName = [[UILabel alloc] init];
    self.dishesFourName.text = @"东方饺子王";
    self.dishesFourName.font = [UIFont systemFontOfSize:12.0f];
    self.dishesFourDescribe = [[UILabel alloc] init];
    self.dishesFourDescribe.text = @"排骨";
    self.dishesFourDescribe.textAlignment = NSTextAlignmentCenter;
    self.dishesFourDescribe.font = [UIFont systemFontOfSize:11.0f];
    self.dishesFourDescribe.layer.borderWidth = 1;
    self.dishesFourDescribe.layer.borderColor = [UIColor blackColor].CGColor;
    // 图5
    self.dishesFiveImageView = [[UIImageView alloc] init];
    self.dishesFiveImageView.backgroundColor = [UIColor redColor];
    self.dishesFiveName = [[UILabel alloc] init];
    self.dishesFiveName.text = @"张姐烤肉拌饭";
    self.dishesFiveName.font = [UIFont systemFontOfSize:12.0f];
    self.dishesFiveDescribe = [[UILabel alloc] init];
    self.dishesFiveDescribe.text = @"排骨";
    self.dishesFiveDescribe.textAlignment = NSTextAlignmentCenter;
    self.dishesFiveDescribe.font = [UIFont systemFontOfSize:11.0f];
    self.dishesFiveDescribe.layer.borderWidth = 1;
    self.dishesFiveDescribe.layer.borderColor = [UIColor blackColor].CGColor;
    
    [self.contentView sd_addSubviews:@[leftLine,label,rightLine,self.dishesOneImageView,self.dishesTwoImageView,self.dishesThreeImageView,self.dishesFourImageView,self.dishesFiveImageView]];
    
    [self.dishesOneImageView sd_addSubviews:@[self.dishesOneName,self.dishesOneDescribe]];
    [self.dishesTwoImageView sd_addSubviews:@[self.dishesTwoName,self.dishesTwoDescribe]];
    [self.dishesThreeImageView sd_addSubviews:@[self.dishesThreeName,self.dishesThreeDescribe]];
    [self.dishesFourImageView sd_addSubviews:@[self.dishesFourName,self.dishesFourDescribe]];
    [self.dishesFiveImageView sd_addSubviews:@[self.dishesFiveName,self.dishesFiveDescribe]];
    
    float BigImageWidth = 13*INDEX;
    float smallImageWidth = 10*INDEX;
    float margin = (UISCREEN_WIDTH-33*INDEX)/4;
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
    self.dishesOneImageView.sd_layout
    .leftSpaceToView(self.contentView, margin)
    .topSpaceToView(label, INDEX)
    .widthIs(BigImageWidth)
    .heightIs(24*INDEX);
    
    self.dishesOneName.sd_layout
    .leftSpaceToView(self.dishesOneImageView, 0.5*INDEX)
    .topSpaceToView(self.dishesOneImageView, 0.5*INDEX)
    .widthIs(BigImageWidth-0.5*INDEX)
    .heightIs(1.5*INDEX);
    
    self.dishesOneDescribe.sd_layout
    .leftSpaceToView(self.dishesOneImageView, INDEX)
    .topSpaceToView(self.dishesOneName, INDEX)
    .widthIs(4*INDEX)
    .heightIs(2*INDEX);
    
    // 图2
    self.dishesTwoImageView.sd_layout
    .leftSpaceToView(self.dishesOneImageView, margin)
    .topEqualToView(self.dishesOneImageView)
    .widthIs(smallImageWidth)
    .heightIs(23*INDEX/2);
    
    self.dishesTwoName.sd_layout
    .leftSpaceToView(self.dishesTwoImageView, 0.5*INDEX)
    .topSpaceToView(self.dishesTwoImageView, 0.5*INDEX)
    .widthIs(smallImageWidth-0.5*INDEX)
    .heightIs(1.5*INDEX);
    
    self.dishesTwoDescribe.sd_layout
    .leftSpaceToView(self.dishesTwoImageView, INDEX)
    .topSpaceToView(self.dishesTwoName, INDEX)
    .widthIs(4*INDEX)
    .heightIs(2*INDEX);
    // 图3
    self.dishesThreeImageView.sd_layout
    .rightSpaceToView(self.contentView, margin)
    .topEqualToView(self.dishesOneImageView)
    .widthIs(smallImageWidth)
    .heightIs(23*INDEX/2);
    
    self.dishesThreeName.sd_layout
    .leftSpaceToView(self.dishesThreeImageView, 0.5*INDEX)
    .topSpaceToView(self.dishesThreeImageView, 0.5*INDEX)
    .widthIs(smallImageWidth-0.5*INDEX)
    .heightIs(1.5*INDEX);
    
    self.dishesThreeDescribe.sd_layout
    .leftSpaceToView(self.dishesThreeImageView, INDEX)
    .topSpaceToView(self.dishesThreeName, INDEX)
    .widthIs(4*INDEX)
    .heightIs(2*INDEX);
    // 图4
    self.dishesFourImageView.sd_layout
    .leftEqualToView(self.dishesTwoImageView)
    .topSpaceToView(self.dishesTwoImageView, INDEX)
    .widthIs(smallImageWidth)
    .heightIs(23*INDEX/2);
    
    self.dishesFourName.sd_layout
    .leftSpaceToView(self.dishesFourImageView, 0.5*INDEX)
    .topSpaceToView(self.dishesFourImageView, 0.5*INDEX)
    .widthIs(smallImageWidth-0.5*INDEX)
    .heightIs(1.5*INDEX);
    
    self.dishesFourDescribe.sd_layout
    .leftSpaceToView(self.dishesFourImageView, INDEX)
    .topSpaceToView(self.dishesFourName, INDEX)
    .widthIs(4*INDEX)
    .heightIs(2*INDEX);

    // 图5
    self.dishesFiveImageView.sd_layout
    .rightEqualToView(self.dishesThreeImageView)
    .topEqualToView(self.dishesFourImageView)
    .widthIs(smallImageWidth)
    .heightIs(23*INDEX/2);
    
    self.dishesFiveName.sd_layout
    .leftSpaceToView(self.dishesFiveImageView, 0.5*INDEX)
    .topSpaceToView(self.dishesFiveImageView, 0.5*INDEX)
    .widthIs(smallImageWidth-0.5*INDEX)
    .heightIs(1.5*INDEX);
    
    self.dishesFiveDescribe.sd_layout
    .leftSpaceToView(self.dishesFiveImageView, INDEX)
    .topSpaceToView(self.dishesFiveName, INDEX)
    .widthIs(4*INDEX)
    .heightIs(2*INDEX);


}
-(void)addItemTarget:(id)target action:(SEL)action{
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    [self.dishesOneImageView addGestureRecognizer:tap1];
    self.dishesOneImageView.tag = 1;
    self.dishesOneImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    [self.dishesTwoImageView addGestureRecognizer:tap2];
    self.dishesTwoImageView.tag = 2;
    self.dishesTwoImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap3 = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    [self.dishesThreeImageView addGestureRecognizer:tap3];
    self.dishesThreeImageView.tag = 3;
    self.dishesThreeImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap4 = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    [self.dishesFourImageView addGestureRecognizer:tap4];
    self.dishesFourImageView.tag = 4;
    self.dishesFourImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap5 = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    [self.dishesFiveImageView addGestureRecognizer:tap5];
    self.dishesFiveImageView.tag = 5;
    self.dishesFiveImageView.userInteractionEnabled = YES;
    
}
-(void)setRecommendArr:(NSArray *)recommendArr{
//    self.dishesOneImageView
    self.dishesOneName.text = [recommendArr[0] shopTitle];
    CGSize tagSize1 = [[recommendArr[0] sort] sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:11.0f]}];
    self.dishesOneDescribe.sd_layout
    .widthIs(tagSize1.width+INDEX);
    self.dishesOneDescribe.text = [recommendArr[0] sort];
    
    //    self.dishesTwoImageView
    self.dishesTwoName.text = [recommendArr[1] shopTitle];
    CGSize tagSize2 = [[recommendArr[1] sort] sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:11.0f]}];
    self.dishesOneDescribe.sd_layout
    .widthIs(tagSize2.width+INDEX);
    self.dishesTwoDescribe.text = [recommendArr[1] sort];
    
    //    self.dishesThreeImageView
    self.dishesThreeName.text = [recommendArr[2] shopTitle];
    CGSize tagSize3 = [[recommendArr[2] sort] sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:11.0f]}];
    self.dishesOneDescribe.sd_layout
    .widthIs(tagSize3.width+INDEX);
    self.dishesThreeDescribe.text = [recommendArr[2] sort];
    
    //    self.dishesFourImageView
    self.dishesFourName.text = [recommendArr[3] shopTitle];
    CGSize tagSize4 = [[recommendArr[3] sort] sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:11.0f]}];
    self.dishesOneDescribe.sd_layout
    .widthIs(tagSize4.width+INDEX);
    self.dishesFourDescribe.text = [recommendArr[3] sort];
    
    //    self.dishesFiveImageView
    self.dishesFiveName.text = [recommendArr[4] shopTitle];
    CGSize tagSize5 = [[recommendArr[4] sort] sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:11.0f]}];
    self.dishesOneDescribe.sd_layout
    .widthIs(tagSize5.width+INDEX);
    self.dishesFiveDescribe.text = [recommendArr[4] sort];
    
    
    
}
@end
