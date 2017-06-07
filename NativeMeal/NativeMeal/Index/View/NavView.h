//
//  NavView.h
//  NativeMeal
//
//  Created by JiangZiWei on 2017/5/25.
//  Copyright © 2017年 sunsx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavView : UIView
@property(copy, nonatomic)NSString *location;
- (void)addTarget:(id)target tapLocation:(SEL)tapLocation tapSearch:(SEL)tapSearch;
@end
