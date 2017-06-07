//
//  UILabel+Automatic.m
//  链接微博接口
//
//  Created by 至远科技－18 on 16/4/12.
//  Copyright © 2016年 至远科技－18. All rights reserved.
//

#import "UILabel+Automatic.h"

@implementation UILabel (Automatic)
-(void)setTextIsAutomaticHeight:(NSString *)str{
    //给label设置内容
    self.text=str;
    //设置行数0(根据高度会自定义行数)
    self.numberOfLines=0;
    //创建一个可变的富文本对象
    NSMutableAttributedString * attributeStr=[[NSMutableAttributedString alloc]initWithString:self.text];
    //创建一个可变的段落风格
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    //注意,每一行的行间距分两部分，topSpacing 和 bottomSpacing
    [paragraphStyle setLineSpacing:3.0f];//行间距
    //把行间距添加到富文本中
    [attributeStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self.text length])];
    //设置label的富文本
    self.attributedText=attributeStr;
    //返回“最佳”大小适合给定的大小，默认返回现有的视图大小
    CGSize  size = [self sizeThatFits:CGSizeMake(self.frame.size.width, MAXFLOAT)];
    //获得frame
    CGRect frame = self.frame;
    frame.size.height=size.height;
    self.frame=frame;
        
}
@end
