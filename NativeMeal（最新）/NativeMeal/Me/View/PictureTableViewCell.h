//
//  PictureTableViewCell.h
//  NativeMeal
//
//  Created by 孙烁鑫 on 17/5/24.
//  Copyright © 2017年 sunsx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PictureTableViewCell : UITableViewCell

@property (strong, nonatomic)UILabel * label1;
@property (strong, nonatomic)UIButton * btn;
- (void)setTarget:(id)target action:(SEL)action;
@end
