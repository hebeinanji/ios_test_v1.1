//
//  EditTableViewCell.h
//  NativeMeal
//
//  Created by 孙烁鑫 on 17/5/25.
//  Copyright © 2017年 sunsx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditTableViewCell : UITableViewCell
@property (strong, nonatomic)UILabel * label1;
@property (strong, nonatomic)UITextField * textField;
-(void)setCellDelegate:(id)delegate;

@end
