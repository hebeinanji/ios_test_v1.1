//
//  AdScrollView.h
//  广告循环滚动效果
//
//  Created by JiangZiWei on 16/8/29.
//  Copyright © 2016年 JiangZiWei. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, UIPageControlShowStyle)
{
    UIPageControlShowStyleNone,//default
    UIPageControlShowStyleLeft,
    UIPageControlShowStyleCenter,
    UIPageControlShowStyleRight,
};

typedef NS_ENUM(NSUInteger, AdTitleShowStyle)
{
    AdTitleShowStyleNone,
    AdTitleShowStyleLeft,
    AdTitleShowStyleCenter,
    AdTitleShowStyleRight,
};
// 轻拍图片Block
typedef void (^TapCurrentImgBlock) (NSInteger index);
@interface AdScrollView : UIScrollView<UIScrollViewDelegate>
@property (nonatomic, copy) TapCurrentImgBlock myTapCurrentImgBlock;
@property (retain,nonatomic,readonly) UIPageControl * pageControl;
@property (retain,nonatomic,readwrite) NSArray * imageNameArray;
@property (retain,nonatomic,readonly) NSArray * adTitleArray;
@property (assign,nonatomic,readwrite) UIPageControlShowStyle  PageControlShowStyle;
@property (assign,nonatomic,readonly) AdTitleShowStyle  adTitleStyle;

- (void)setAdTitleArray:(NSArray *)adTitleArray withShowStyle:(AdTitleShowStyle)adTitleStyle;
- (void)setPageControlShowStyle:(UIPageControlShowStyle)PageControlShowStyle pageNum:(int)pageNum;
- (void)endTimer;
@end
