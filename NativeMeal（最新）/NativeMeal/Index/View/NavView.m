//
//  NavView.m
//  NativeMeal
//
//  Created by JiangZiWei on 2017/5/25.
//  Copyright © 2017年 sunsx. All rights reserved.
//

#import "NavView.h"
#import "SDAutoLayout.h"
#import "Screen.h"
@interface NavView()

/**
 定位按钮
 */
@property(strong, nonatomic)UIButton * locationBtn;

/**
 搜索
 */
@property(strong, nonatomic)UIView * searchView;

/**
 图标
 */
@property(strong, nonatomic)UIView * searchLogo;

/**
 文字
 */
@property(strong, nonatomic)UILabel * searchText;
@end
@implementation NavView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}
- (void)setup{
    self.backgroundColor = [UIColor orangeColor];
    
    self.locationBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.locationBtn.titleLabel.font = [UIFont systemFontOfSize:12.0f];
    [self.locationBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    self.searchView = [[UIView alloc] init];
    self.searchView.backgroundColor = [UIColor colorWithRed:0.996 green:0.765 blue:0.522 alpha:1.00];
    
    self.searchLogo = [[UIView alloc] init];
    self.searchLogo.backgroundColor = [UIColor redColor];
    
    self.searchText = [[UILabel alloc] init];
    self.searchText.text = @"想吃啥呢";
    self.searchText.font = [UIFont systemFontOfSize:12.0f];
    
    [self sd_addSubviews:@[self.locationBtn,self.searchView]];
    [self.searchView sd_addSubviews:@[self.searchLogo,self.searchText]];
    
    // 添加约束
    self.locationBtn.sd_layout
    .leftSpaceToView(self, INDEX)
    .topSpaceToView(self, 27)
    .widthIs(6*INDEX)
    .heightIs(30);
    
    self.searchView.sd_layout
    .leftSpaceToView(self.locationBtn, INDEX)
    .topEqualToView(self.locationBtn)
    .widthIs(UISCREEN_WIDTH-9*INDEX)
    .heightIs(30);
    
    self.searchLogo.sd_layout
    .leftSpaceToView(self.searchView, INDEX)
    .topEqualToView(self.searchView)
    .widthIs(3*INDEX)
    .heightRatioToView(self.searchView, 1.0f);
    
    self.searchText.sd_layout
    .rightEqualToView(self.searchView)
    .topEqualToView(self.searchView)
    .widthIs(UISCREEN_WIDTH-14*INDEX)
    .heightRatioToView(self.searchView, 1.0f);
    
}
-(void)addTarget:(id)target tapLocation:(SEL)tapLocation tapSearch:(SEL)tapSearch{
    [self.locationBtn addTarget:target action:tapLocation forControlEvents:UIControlEventTouchUpInside];
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:tapSearch];
    [self.searchView addGestureRecognizer:tap];
}
-(void)setLocation:(NSString *)location{
    [self.locationBtn setTitle:location forState:UIControlStateNormal];
}
@end
