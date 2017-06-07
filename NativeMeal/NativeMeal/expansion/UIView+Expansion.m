//
//  UIView+Expansion.m
//  NativeMeal
//
//  Created by 孙烁鑫 on 17/5/20.
//  Copyright © 2017年 sunsx. All rights reserved.
//

#import "UIView+Expansion.h"

@implementation UIView (Expansion)
-(CGFloat)X{
    return self.frame.origin.x;
}
-(void)setX:(CGFloat)X{
    CGRect frame = self.frame;
    frame.origin.x = X;
    self.frame = frame;
    
}
-(CGFloat)Y{
    return self.frame.origin.y;
}
-(void)setY:(CGFloat)Y{
    CGRect frame = self.frame;
    frame.origin.y = Y;
    self.frame = frame;
}
-(CGFloat)width{
    return self.frame.size.width;
}
-(void)setWidth:(CGFloat)width{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}
-(CGFloat)height{
    return self.frame.size.height;
}
-(void)setHeight:(CGFloat)height{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}
@end
