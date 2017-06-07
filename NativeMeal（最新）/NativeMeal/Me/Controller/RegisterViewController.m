//
//  RegisterViewController.m
//  NativeMeal
//
//  Created by 孙烁鑫 on 17/5/24.
//  Copyright © 2017年 sunsx. All rights reserved.
//

#import "RegisterViewController.h"
//#import "TestPasswordViewController.h"
//#import "InputPasswordViewController.h"
#import "TermsServiceViewController.h"
#import "Screen.h"
//#import "Reachability.h"
#import "MBProgressHUD.h"

@interface RegisterViewController ()<UITextFieldDelegate>
@property (strong,nonatomic)UIButton * btn;
@property (strong,nonatomic)UITextField * textField;
@property (strong,nonatomic) MBProgressHUD * HUD;
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    imageView.userInteractionEnabled = YES;
    self.view = imageView;
    self.navigationItem.title = @"注册";
    //    请输入手机号码或者邮箱号
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(INDEX*7, INDEX*5, UISCREEN_WIDTH-12*INDEX, 5*INDEX)];
    label.text = @"请输入手机号码或者邮箱号";
    label.textColor = [UIColor colorWithRed:0.522 green:0.604 blue:0.745 alpha:1.00];
    label.font = [UIFont systemFontOfSize:15.5];
    [self.view addSubview:label];
    
    _textField = [[UITextField alloc]initWithFrame:CGRectMake(INDEX*7, INDEX*10, UISCREEN_WIDTH-14*INDEX, 4*INDEX)];
    _textField.placeholder = @"手机号码";
    _textField.font = [UIFont systemFontOfSize:15.0];
    _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _textField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    self.textField.delegate =self;
    //    [self.textField becomeFirstResponder];
    _textField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_textField];
    
    //        获取验证码
    _btn = [UIButton buttonWithType:UIButtonTypeSystem];
    _btn.frame = CGRectMake(INDEX*7, 15*INDEX, UISCREEN_WIDTH-14*INDEX, 4*INDEX);
    [_btn.layer setCornerRadius:8.0];
    _btn.backgroundColor = [UIColor colorWithRed:1.000 green:0.702 blue:0.200 alpha:1.00];
    [_btn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [_btn addTarget:self action:@selector(tapbtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn];
    
    UILabel * label2 = [[UILabel alloc]initWithFrame:CGRectMake(INDEX*12, 20*INDEX, 19*INDEX, 2*INDEX)];
    label2.text = @"点击获取验证码表示您已同意";
    label2.textColor = [UIColor colorWithRed:0.522 green:0.604 blue:0.745 alpha:1.00];
    label2.font = [UIFont systemFontOfSize:12.0];
    [self.view addSubview:label2];
    UIButton * btn2 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn2.frame = CGRectMake(15*INDEX, 22*INDEX, 15*INDEX, 3*INDEX);
    [btn2 setTitle:@"《家行天下服务条款》" forState:UIControlStateNormal];
    btn2.titleLabel.font = [UIFont systemFontOfSize:12.0];
    [btn2 addTarget:self action:@selector(tapbtn2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    UIButton * ceshi = [[UIButton alloc]initWithFrame:CGRectMake(80, 300, 100, 100)];
    [ceshi setTitle:@"测试" forState:UIControlStateNormal];
    
    //    [ceshi addTarget:self action:@selector(ceshi) forControlEvents:UIControlEventTouchUpInside];
    //    [self.view addSubview:ceshi];
    
}

//-(void)ceshi{
//    TestPasswordViewController * test = [[TestPasswordViewController alloc]init];
//    [self.navigationController pushViewController:test animated:YES];
//}


//获取验证码回调事件
-(void)tapbtn{
    //NSLog(@"%@",self.textField.text);
    //[self registerNetworking];
}
//《家行天下服务条款》
-(void)tapbtn2{
    TermsServiceViewController * termsService = [[TermsServiceViewController alloc]init];
    [self.navigationController pushViewController:termsService animated:YES];
}

//点击空白处结束编辑状态
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldClear:(UITextField *)textField{
    textField.text = @"";
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    //    NSLog(@"%ld %ld",range.location,range.length);
    //    NSLog(@"%ld",textField.text.length);
    //    NSLog(@"字符串  %@",string);
    //    NSLog(@"文本框  %@",textField.text);
    if (range.location-range.length+1 == 11) {
        _btn.enabled = YES;
    }else{
        _btn.enabled = NO;
    }
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"%@",textField.text);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - CustomMetoh
- (void)registerNetworking{
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachablityChanged:) name:kReachabilityChangedNotification object:nil];
//    Reachability * hostReach = [Reachability reachabilityWithHostName:@"www.baidu.com"];
//    [hostReach startNotifier];
}
- (void)reachablityChanged:(NSNotification *)notification{
//    Reachability * currentReach = notification.object;
//    NetworkStatus  networkStatus = [currentReach currentReachabilityStatus];
//    
//    // 断言
//    NSParameterAssert([currentReach isKindOfClass:[Reachability class]]);
//    if (networkStatus == ReachableViaWiFi || networkStatus == ReachableViaWWAN) {
//        //    短信验证
//        [SMSSDK registerApp:@"1219935bc5930" withSecret:@"383b25719b6fcaf6c4e774b746a5fca6"];
//    }else{
//        // HUD 提示
//        self.HUD = [[MBProgressHUD alloc]initWithView:self.view];
//        [self.view addSubview:self.HUD];
//        //当前view置于后台
//        self.HUD.dimBackground = YES;
//        self.HUD.labelText = @"无网络,请检查网络";
//        //显示对话框
//        [self.HUD showAnimated:YES whileExecutingBlock:^{
//            sleep(2);
//        } completionBlock:^{
//            [self.HUD removeFromSuperview];
//            self.HUD = nil;
//        }];
//    }
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
