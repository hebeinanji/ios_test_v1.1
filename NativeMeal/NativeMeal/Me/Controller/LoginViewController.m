//
//  LoginViewController.m
//  NativeMeal
//
//  Created by 孙烁鑫 on 17/5/21.
//  Copyright © 2017年 sunsx. All rights reserved.
//

#import "LoginViewController.h"
#import "AccountController.h"
//#import "User.h"
#import "Screen.h"
#import "MBProgressHUD.h"
#import "AFNetworking.h"
#import "AFHTTPSessionManager.h"

@interface LoginViewController ()<UITextFieldDelegate,UIGestureRecognizerDelegate>
{
    BOOL statue;
    NSInteger flag;
}
@property (strong,nonatomic)UIView * view1;
@property (strong, nonatomic)UITextField * textField1;
@property (strong, nonatomic)UITextField * textField2;
@property (strong,nonatomic)UIButton * btn3;
@property (strong,nonatomic)UIButton * btn5;
@property (strong,nonatomic)UIButton * btn6;
@property (strong,nonatomic)UIButton * btn7;
@property (strong,nonatomic)UIButton * btn8;
@property (strong,nonatomic)NSTimer * timer;
@property (strong,nonatomic) MBProgressHUD * HUD;
@end

@implementation LoginViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    statue = YES;
    self.navigationItem.title = @"登录";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor =[UIColor colorWithRed:0.522 green:0.604 blue:0.745 alpha:1.00];
    [self creatUI];
    
}

-(void)creatUI{
    UIImageView * backImageView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    backImageView.userInteractionEnabled = YES;
    self.view = backImageView;
    //  账号登录/无密码快捷登录
    UIButton * btn1 = [[UIButton alloc]initWithFrame:CGRectMake(4*INDEX, INDEX*2, WIDTH, INDEX*4)];
    [btn1 setTitle:@"旅行账号登录" forState:UIControlStateNormal];
    btn1.titleLabel.font = [UIFont systemFontOfSize:15.0];
//        btn1.backgroundColor = [UIColor redColor];
    [btn1 setTitleColor:[UIColor colorWithRed:0.353 green:0.408 blue:0.373 alpha:1.00] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(tapbtn1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    UIButton * btn2 = [[UIButton alloc]initWithFrame:CGRectMake(4*INDEX+WIDTH+INDEX, INDEX*2, WIDTH, INDEX*4)];
    //    btn2.backgroundColor = [UIColor blueColor];
    [btn2 setTitle:@"无密码快捷登录" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor colorWithRed:0.353 green:0.408 blue:0.373 alpha:1.00] forState:UIControlStateNormal];
    btn2.titleLabel.font = [UIFont systemFontOfSize:15.0];
    [btn2 addTarget:self action:@selector(tapbtn2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    //    默认的下划线
    self.view1 = [[UIView alloc]initWithFrame:CGRectMake(5*INDEX, INDEX*6, WIDTH-INDEX, 1)];
    self.view1.backgroundColor = [UIColor colorWithRed:0.353 green:0.408 blue:0.373 alpha:1.00];
    [self.view addSubview:self.view1];
    //    账号和密码
    _textField1 = [[UITextField alloc]initWithFrame:CGRectMake((UISCREEN_WIDTH-25*INDEX)/2, INDEX*9, 25*INDEX, INDEX*4)];
    //    textField1.backgroundColor = [UIColor redColor];
    _textField1.placeholder = @"请输入手机号";
    _textField1.font = [UIFont systemFontOfSize:14.0];
    _textField1.tintColor = [UIColor whiteColor];
    _textField1.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    _textField1.clearButtonMode = UITextFieldViewModeWhileEditing;
    _textField1.borderStyle = UITextBorderStyleRoundedRect;
    //    [_textField1 becomeFirstResponder];
    self.textField1.delegate = self;
    [self.view addSubview:_textField1];
    _textField2 = [[UITextField alloc]initWithFrame:CGRectMake((UISCREEN_WIDTH-25*INDEX)/2, INDEX*15, 25*INDEX, INDEX*4)];
    _textField2.placeholder = @"请输入密码";
    _textField2.tintColor = [UIColor whiteColor];
    _textField2.borderStyle = UITextBorderStyleRoundedRect;
    _textField2.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    _textField2.font = [UIFont systemFontOfSize:14.0];
    _textField2.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.textField2.delegate = self;
    [self.view addSubview:_textField2];
    _textField2.secureTextEntry = YES;
    
    //    登录
    UIButton * btn4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn4.layer setCornerRadius:8.0]; //设置矩圆角半径
    //    [btn4.layer setBorderWidth:1.0];   //边框宽度
    btn4.frame = CGRectMake(INDEX*6, INDEX*21, UISCREEN_WIDTH-13*INDEX, INDEX*4);
    btn4.backgroundColor = [UIColor colorWithRed:1.000 green:0.702 blue:0.200 alpha:1.00];
    [btn4 setTitle:@"登录" forState:UIControlStateNormal];
    [btn4 addTarget:self action:@selector(tapbtn4) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn4];
    //    快速注册
    _btn5 = [UIButton buttonWithType:UIButtonTypeSystem];
    _btn5.frame = CGRectMake(INDEX*16, INDEX*27, INDEX*8, INDEX*2);
    _btn5.tintColor = [UIColor colorWithRed:0.353 green:0.408 blue:0.373 alpha:1.00];
    [_btn5 setTitle:@"快速注册 |" forState:UIControlStateNormal];
    _btn5.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    _btn5.titleEdgeInsets = UIEdgeInsetsMake(0, INDEX, 0, 0);
    _btn5.titleLabel.font = [UIFont systemFontOfSize:12.0];
    [_btn5 addTarget:self action:@selector(tapbtn5) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn5];
    //    忘记密码
    _btn6 = [UIButton buttonWithType:UIButtonTypeSystem];
    _btn6.frame = CGRectMake(INDEX*24, INDEX*27, INDEX*8, INDEX*2);
    [_btn6 setTitle:@"忘记密码" forState:UIControlStateNormal];
    _btn6.tintColor = [UIColor colorWithRed:0.353 green:0.408 blue:0.373 alpha:1.00];
    _btn6.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    _btn6.titleEdgeInsets = UIEdgeInsetsMake(0, INDEX, 0, 0);
    _btn6.titleLabel.font = [UIFont systemFontOfSize:12.0];
    [_btn6 addTarget:self action:@selector(tapbtn6) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn6];
    
    _btn7 = [UIButton buttonWithType:UIButtonTypeSystem];
    _btn7.frame = CGRectMake(INDEX/2, UISCREEN_HEIHT-INDEX*15, INDEX*10, INDEX*2);
    [_btn7 setTitle:@"其他方法登录" forState:UIControlStateNormal];
    _btn7.tintColor = [UIColor colorWithRed:0.353 green:0.408 blue:0.373 alpha:1.00];
    _btn7.titleLabel.font = [UIFont systemFontOfSize:14.0];
    [_btn7 addTarget:self action:@selector(tapbtn7) forControlEvents:UIControlEventTouchUpInside];
    
    _btn8 = [UIButton buttonWithType:UIButtonTypeSystem];
    _btn8.frame = CGRectMake(UISCREEN_WIDTH - INDEX*10, UISCREEN_HEIHT-INDEX*15, INDEX*10, INDEX*2);
    [_btn8 setTitle:@"登录遇到问题" forState:UIControlStateNormal];
    _btn8.tintColor = [UIColor colorWithRed:0.353 green:0.408 blue:0.373 alpha:1.00];
    _btn8.titleLabel.font = [UIFont systemFontOfSize:14.0];
    [_btn8 addTarget:self action:@selector(tapbtn8:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)timego {
    flag --;
    [self.btn3 setTitle:[NSString stringWithFormat:@"%lds后获取",flag] forState:UIControlStateNormal];
    if (flag == 0) {
        [self.btn3 setTitle:@"重新获取" forState:UIControlStateNormal];
        [self.timer invalidate];
    }
}

//旅行账号登录
-(void)tapbtn1{
    _textField1.text = @"";
    _textField2.text = @"";
    [self.btn7 removeFromSuperview];
    [self.btn8 removeFromSuperview];
    
    [self.view addSubview:_btn5];
    [self.view addSubview:_btn6];
    _textField2.frame = CGRectMake((UISCREEN_WIDTH-25*INDEX)/2, INDEX*15, 25*INDEX, INDEX*4);
    //    下划线
    [self.btn3 removeFromSuperview];
    //    _textField1.frame =CGRectMake(55, 100, 200, 40);
    //    _textField2.frame = CGRectMake(55, 160, 200, 40);
    self.view1.frame = CGRectMake(INDEX*5, INDEX*6 , WIDTH-INDEX, 1);
    [self.view addSubview:self.view1];
    _textField1.placeholder = @"请输入手机号";
    _textField2.placeholder = @"请输入密码";
    statue = YES;
}
//无密码快捷登录
-(void)tapbtn2{
    _textField1.text = @"";
    _textField2.text = @"";
    [self.btn5 removeFromSuperview];
    [self.btn6 removeFromSuperview];
    //下划线
    self.view1.frame = CGRectMake(WIDTH+5*INDEX, INDEX*6, WIDTH-INDEX , 1);
    [self.view addSubview:self.view1];
    _textField1.placeholder = @"输入手机号";
    //    _textField1.frame =CGRectMake(55, 100, 140, 40);
    _textField2.placeholder = @"请输入验证码";
    _textField2.frame = CGRectMake((UISCREEN_WIDTH-25*INDEX)/2, INDEX*15, INDEX*12, INDEX*4);
    //    获取验证码
    _btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    _btn3.frame = CGRectMake((UISCREEN_WIDTH-25*INDEX)/2+14*INDEX, INDEX*15, INDEX*11, INDEX*4);
    [_btn3 setTitle:@"获取验证码" forState:UIControlStateNormal];
    [_btn3.layer setCornerRadius:8.0]; //设置矩圆角半径
    _btn3.titleLabel.font = [UIFont systemFontOfSize:14.0];
    _btn3.backgroundColor = [UIColor colorWithRed:0.522 green:0.604 blue:0.745 alpha:1.00];
    [_btn3 addTarget:self action:@selector(tapbtn3) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn3];
    [self.view addSubview:_btn7];
    [self.view addSubview:_btn8];
    statue = NO;
}
//获取验证码的回调事件
-(void)tapbtn3{
    //请求数据
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    // 转化为json
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    NSDictionary * pay_id = [NSDictionary dictionaryWithObjectsAndKeys:@"手机号",@"phone", nil];
  [manager GET:@"/dftsms-web/IdentifyCode/sendIdentifyCode" parameters:pay_id progress:^(NSProgress * _Nonnull downloadProgress) {
      
      
      
  } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
      
  } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
      
  }];
}

//登录的回调事件
-(void)tapbtn4 {
//    [self.textField1 resignFirstResponder];
//    [self.textField2 resignFirstResponder];
//    if (statue) {
//        NSString * userID = [[AccountAndPasswordManager sharedManager] findUserByAccount:_textField1.text password:_textField2.text];
//        [User userOfMine].userID = [userID intValue];
//        // HUD 提示
//        self.HUD = [[MBProgressHUD alloc]initWithView:self.view];
//        [self.view addSubview:self.HUD];
//        //当前view置于后台
//        self.HUD.dimBackground = YES;
//        // 判断用户名 密码
//        if (userID != nil) {
//            //显示对话框
//            [self.HUD showAnimated:YES whileExecutingBlock:^{
//                sleep(1);
//            } completionBlock:^{
//                [self.HUD removeFromSuperview];
//                self.HUD = nil;
//                // 成功跳转
//                [[NSNotificationCenter defaultCenter] postNotificationName:@"changeFlag" object:[NSNumber numberWithBool:YES]];
//                [[NSNotificationCenter defaultCenter] postNotificationName:@"changeUserIcon" object:[NSNumber numberWithBool:YES]];
//                [[NSNotificationCenter defaultCenter] postNotificationName:@"user" object:userID];
//                [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:YES] forKey:@"loginStatue"];
//                [[NSUserDefaults standardUserDefaults] setObject:userID forKey:@"user"];
//                [self.navigationController popViewControllerAnimated:YES];
//            }];
//        }else{
//            //显示对话框
//            [self.HUD showAnimated:YES whileExecutingBlock:^{
//                sleep(1);
//                //设置文字
//                self.HUD.labelText = @"用户名或密码错误";
//                sleep(1);
//            } completionBlock:^{
//                [self.HUD removeFromSuperview];
//                self.HUD = nil;
//            }];
//        }
//    }else{
//        [SMSSDK commitVerificationCode:_textField1.text phoneNumber:@"18231067191" zone:@"86" result:^(NSError *error) {
//            if (!error) {
//                NSLog(@"验证成功");
//                [[NSNotificationCenter defaultCenter] postNotificationName:@"changeFlagByNoPassword" object:[NSNumber numberWithBool:NO]];
//                [[NSNotificationCenter defaultCenter] postNotificationName:@"changeUserIcon" object:[NSNumber numberWithBool:NO]];
//                [self.navigationController popViewControllerAnimated:YES];
//            } else {
//                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:@"验证失败" preferredStyle:UIAlertControllerStyleAlert];
//                UIAlertAction * okAlertAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//                    NSLog(@"%@",error);
//                }];
//                [alertController addAction:okAlertAction];
//                // 弹出alertController
//                [self presentViewController:alertController animated:YES completion:nil];
//            }
//        }];
//    }
}
//快速注册

-(void)tapbtn5 {

    RegisterViewController  * register1 = [[RegisterViewController alloc]init];
    [self.navigationController pushViewController:register1 animated:YES];
     
}
 

//忘记密码
-(void)tapbtn6 {
    
    ResetPasswordViewController * resetPassword = [[ResetPasswordViewController alloc] init];
    [self.navigationController pushViewController:resetPassword animated:YES];

}

-(void)tapbtn7 {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:@"后续版本添加此功能" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * okAlertAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    }];
    [alertController addAction:okAlertAction];
    //  弹出alertController
    [self presentViewController:alertController animated:YES completion:nil];
    
    
}

-(void)tapbtn8:(UIButton *)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:@"登录遇到问题" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction * action1 = [UIAlertAction actionWithTitle:@"找回密码" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        ResetPasswordViewController * reset = [[ResetPasswordViewController alloc]init];
        [self.navigationController pushViewController:reset animated:YES];
    }];
    UIAlertAction * action2 = [UIAlertAction actionWithTitle:@"语音验证码登录" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    }];
    UIAlertAction * action3 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    [alertController addAction:action1];
    [alertController addAction:action2];
    [alertController addAction:action3];
    // 弹出alertController
    [self presentViewController:alertController animated:YES completion:nil];
    
    
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

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.textField1 resignFirstResponder];
    [self.textField2 resignFirstResponder];
    return YES;
}

@end
