//
//  CatagoryTableViewCell.m
//  NativeMeal
//
//  Created by JiangZiWei on 2017/5/25.
//  Copyright © 2017年 sunsx. All rights reserved.
//

#import "CatagoryTableViewCell.h"
#import "Screen.h"
@interface CatagoryTableViewCell()
@property(strong, nonatomic)NSMutableArray * imagesArr;
@end
@implementation CatagoryTableViewCell

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
    NSArray * titleName = @[@"美食",@"海鲜",@"特色",@"饮品"];
    float margin = 2*INDEX;
    float index = (UISCREEN_WIDTH-20*INDEX)/3;
    float imageWidth = 4*INDEX;
    self.imagesArr = [NSMutableArray array];
    for (int i = 0; i < 4; i++) {
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(margin+i*(imageWidth+index), INDEX, imageWidth, imageWidth)];
        imageView.image = [UIImage imageNamed:@""];
        imageView.userInteractionEnabled = YES;
        imageView.tag = i;
        [imageView setAllCornerWithRoundedCornersSize:imageWidth/2];
        imageView.backgroundColor = [UIColor redColor];
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(margin+i*(imageWidth+index), 5.5*INDEX, imageWidth, 2*INDEX)];
        label.text = titleName[i];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:12.0f];
        [self.contentView addSubview:imageView];
        [self.contentView addSubview:label];
        [self.imagesArr addObject:imageView];
    }
}
-(void)addItemTarget:(id)target action:(SEL)action{
    for (int i = 0; i < self.imagesArr.count; i++) {
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
        [self.imagesArr[i] addGestureRecognizer:tap];
    }
}
@end
