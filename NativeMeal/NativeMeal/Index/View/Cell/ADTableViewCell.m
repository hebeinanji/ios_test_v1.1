//
//  ADTableViewCell.m
//  NativeMeal
//
//  Created by JiangZiWei on 2017/5/25.
//  Copyright © 2017年 sunsx. All rights reserved.
//

#import "ADTableViewCell.h"
#import "AdScrollView.h"
#import "Screen.h"
@interface ADTableViewCell()
@property(strong, nonatomic) AdScrollView * scrollView;   // banner
@end
@implementation ADTableViewCell

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
        [self creatUI];
    }
    return self;
}

- (void)creatUI{
    self.scrollView = [[AdScrollView alloc]initWithFrame:CGRectMake(0, 0, UISCREEN_WIDTH, (UISCREEN_WIDTH)/16*9)];
    self.scrollView.myTapCurrentImgBlock = ^(NSInteger index){
        NSLog(@"点击了第%ld图",(long)index);
    };
    [self addSubview:self.scrollView];
}
-(void)setImages:(NSArray *)pics{
    [self.scrollView setPageControlShowStyle:UIPageControlShowStyleRight pageNum:(int)pics.count];
    self.scrollView.pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    self.scrollView.pageControl.currentPageIndicatorTintColor = [UIColor colorWithRed:0.243 green:0.694 blue:0.714 alpha:1.00];
    NSMutableArray * arr = [NSMutableArray arrayWithArray:pics];
    NSString * str = arr[pics.count-1];
    [arr removeObjectAtIndex:pics.count-1];
    [arr insertObject:str atIndex:0];
    [self.scrollView setImageNameArray:arr];
}
- (void)endScrollViewTimer{
    [self.scrollView endTimer];
}
@end
