//
//  UIImageView+Circle.m
//  kdzb
//
//  Created by JiangZiWei on 2017/1/18.
//  Copyright © 2017年 JiangZiWei. All rights reserved.
//

#import "UIImageView+Circle.h"

@implementation UIImageView (Circle)
- (void)setAllCornerWithRoundedCornersSize:(CGFloat)cornersSize {
    UIBezierPath *maskPath;
    maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                          cornerRadius:cornersSize];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}
@end
