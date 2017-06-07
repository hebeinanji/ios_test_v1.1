//
//  ShopController.m
//  NativeMeal
//
//  Created by 孙烁鑫 on 17/6/3.
//  Copyright © 2017年 sunsx. All rights reserved.
//

#import "ShopController.h"
@interface ShopController()
@property(weak,nonatomic)WKWebView *shopPage;
@end
@implementation ShopController
-(void)viewDidLoad{
    WKWebView *shopView = [[WKWebView alloc] init];
    shopView.frame = self.view.bounds;
    [self.view addSubview:shopView];
    _shopPage = shopView;
    NSString *urlPath = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
    NSString *HTMLStr = [NSString stringWithContentsOfFile:urlPath encoding:NSUTF8StringEncoding error:nil];
//    NSLog(@"html is %@",HTMLStr);
    [_shopPage loadHTMLString:HTMLStr baseURL:nil];
}
@end
