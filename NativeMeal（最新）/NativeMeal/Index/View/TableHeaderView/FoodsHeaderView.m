//
//  FoodsHeaderView.m
//  NativeMeal
//
//  Created by JiangZiWei on 2017/5/26.
//  Copyright © 2017年 sunsx. All rights reserved.
//

#import "FoodsHeaderView.h"
#import "Screen.h"
@implementation FoodsHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup{
    UIView * view = [[UIView alloc] init];
    view.backgroundColor = [UIColor colorWithRed:0.988 green:0.533 blue:0.145 alpha:1.00];
    UILabel * label = [[UILabel alloc] init];
    label.text = @"精品推荐";
    
    [self.contentView sd_addSubviews:@[view,label]];
    
    view.sd_layout
    .leftSpaceToView(self.contentView, INDEX)
    .centerYEqualToView(self.contentView)
    .widthIs(2)
    .heightIs(3*INDEX);
    
    label.sd_layout
    .leftSpaceToView(view, 1.5*INDEX)
    .centerYEqualToView(self.contentView)
    .widthIs(10*INDEX)
    .heightIs(2*INDEX);
            
}
@end
