//
//  ResetPasswordViewController.m
//  NativeMeal
//
//  Created by 孙烁鑫 on 17/5/24.
//  Copyright © 2017年 sunsx. All rights reserved.
//

#import "ResetPasswordViewController.h"
#import "LoginViewController.h"
//#import "TestPasswordViewController.h"
#import "Screen.h"

@interface ResetPasswordViewController ()<UITextFieldDelegate>
@property (strong,nonatomic)UITextField * textField;
@property (strong, nonatomic) UIButton * loginBtn;
@end

@implementation ResetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;

    
    self.navigationItem.title = @"重置密码";
    UIImageView * backImageView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    backImageView.image = [UIImage imageNamed:@"登录"];
    backImageView.userInteractionEnabled = YES;
    self.view = backImageView;
    
    
    //    请输入注册手机号码以验证账户
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(8*INDEX, INDEX*2, UISCREEN_WIDTH-18*INDEX, INDEX*3)];
    label.text = @"请输入注册手机号码";
    label.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:label];
//    UILabel * label2 = [[UILabel alloc]initWithFrame:CGRectMake(11*INDEX, INDEX*4, INDEX*10, INDEX*4)];
//    label.font = [UIFont systemFontOfSize:14.5];
//    label2.text = @"验证账户";
//    [self.view addSubview:label2];
    //    输入11手机号码
    _textField = [[UITextField alloc]initWithFrame:CGRectMake(INDEX*8, INDEX*7, INDEX*20, INDEX*4)];
    _textField.placeholder = @"请输入11手机号码";
    _textField.borderStyle = UITextBorderStyleRoundedRect;
    _textField.delegate = self;
    [self.view addSubview:_textField];
    
    //    获取验证码
    _loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    _loginBtn.frame = CGRectMake(INDEX*8, INDEX*13, UISCREEN_WIDTH - 18*INDEX, INDEX*4);
    [_loginBtn.layer setCornerRadius:8.0];
    _loginBtn.backgroundColor = [UIColor colorWithRed:1.000 green:0.702 blue:0.200 alpha:1.00];
    [_loginBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [_loginBtn addTarget:self action:@selector(taploginBtn) forControlEvents:UIControlEventTouchUpInside];
    _loginBtn.enabled = NO;
    _textField.delegate = self;
    [self.view addSubview:_loginBtn];
    //    未绑定手机号？请致电836579250
    UILabel * label3 = [[UILabel alloc]initWithFrame:CGRectMake(INDEX*9, INDEX*18, INDEX*25, INDEX*3)];
    label3.font = [UIFont systemFontOfSize:12];
    //获取要调整颜色的文字位置,调整颜色
       NSMutableAttributedString *hintString=[[NSMutableAttributedString alloc]initWithString:@"未绑定手机号？请致电836579250"];
    NSRange range1=[[hintString string]rangeOfString:@"未绑定手机号？请致电836579250"];
    [hintString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:0.353 green:0.408 blue:0.373 alpha:1.00] range:range1];
     label3.attributedText=hintString;
    [self.view addSubview:label3];
    
    UIButton * ceshi = [[UIButton alloc]initWithFrame:CGRectMake(80, 300, 100, 100)];
    [ceshi setTitle:@"测试" forState:UIControlStateNormal];
    //    [ceshi addTarget:self action:@selector(ceshi) forControlEvents:UIControlEventTouchUpInside];
    //    [self.view addSubview:ceshi];
    
}

//-(void)ceshi{
//    TestPasswordViewController * test = [[TestPasswordViewController alloc]init];
//    [self.navigationController pushViewController:test animated:YES];
//}
//登录回调
-(void)taploginBtn{
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
