//
//  FeedBackViewController.m
//  NativeMeal
//
//  Created by 孙烁鑫 on 17/5/20.
//  Copyright © 2017年 sunsx. All rights reserved.
//

#import "FeedBackViewController.h"


@interface FeedBackViewController ()<UIPickerViewDataSource,UIPickerViewDelegate,UITextViewDelegate,UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (strong,nonatomic) UILabel * label;
@property (strong,nonatomic) UIPickerView * pickerView;
@property (strong,nonatomic) UIButton * btn1;
@property (strong,nonatomic) NSArray * adviceArray;
@property (strong,nonatomic) UITextView * textView;
@property (strong,nonatomic) UILabel * label3;
@property (strong,nonatomic) UIButton * imagBtn;
@property (strong,nonatomic) UIImagePickerController * imagePicker;
@property (strong,nonatomic) UIView * view1;
@property (strong,nonatomic) MBProgressHUD * HUD;
@end

@implementation FeedBackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tabBarController.tabBar.hidden = YES;
    self.view.backgroundColor =[UIColor colorWithRed:0.522 green:0.604 blue:0.745 alpha:1.00];
    [self creatUI];
}

-(void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = YES;
}

-(void)creatUI{
    
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(INDEX, INDEX + 64, 25*INDEX, INDEX)];
    label.text = @"请留下您的宝贵意见，以帮助我们做得更好";
    label.font = [UIFont systemFontOfSize:12.0];
    label.tintColor = [UIColor colorWithRed:0.761 green:0.761 blue:0.761 alpha:1.00];
    [self.view addSubview:label];
    
    //    问题类型
    self.btn1 = [UIButton buttonWithType:UIButtonTypeSystem];
    _btn1.frame = CGRectMake(0, 3*INDEX + 64, UISCREEN_WIDTH, 4*INDEX) ;
    [_btn1 addTarget:self action:@selector(tapAdvicebtn) forControlEvents:UIControlEventTouchUpInside];
    _btn1.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_btn1];
    UILabel * label2 = [[UILabel alloc]initWithFrame:CGRectMake(INDEX, INDEX, 8*INDEX, 2*INDEX)];
    label2.text = @"问题类型";
    [self.btn1 addSubview:label2];
    
    //    文字反馈
    self.textView = [[UITextView alloc]initWithFrame:CGRectMake(0, 8*INDEX + 64, UISCREEN_WIDTH, 13*INDEX)];
    //    _textView.backgroundColor = [UIColor blueColor];
    _textView.text = @"请简要描述您遇到的问题，我们会尽快为您解决（最最少5个字)";
    _textView.tintColor = [UIColor lightGrayColor];
    _textView.delegate = self;
    _textView.layer.borderColor = UIColor.lightGrayColor.CGColor;
    _textView.layer.borderWidth = 0.5;
    [self.view addSubview:_textView];
    
    _label3 = [[UILabel alloc]initWithFrame:CGRectMake(UISCREEN_WIDTH - 6*INDEX, 10*INDEX, 5*INDEX, 2*INDEX)];
    _label3.text = [NSString stringWithFormat:@"%lu/200",(unsigned long)_textView.text.length];
    _label3.font = [UIFont systemFontOfSize:12.5];
    _label3.tintColor = [UIColor lightGrayColor];
    [self.textView addSubview:_label3];
    
    self.imagBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    _imagBtn.frame = CGRectMake(2*INDEX, 22*INDEX + 64, 10*INDEX, 10*INDEX);
    [_imagBtn setBackgroundImage:[UIImage imageNamed:@"tappic"] forState:UIControlStateNormal];
    _imagBtn.titleLabel.font = [UIFont systemFontOfSize:13.0];
    _imagBtn.backgroundColor = [UIColor whiteColor];
    [_imagBtn addTarget:self action:@selector(tapImagebtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_imagBtn];
    
    //    提交
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(2*INDEX, 33*INDEX + 64, UISCREEN_WIDTH - 8*INDEX, 3*INDEX);
    [btn setTitle:@"提交" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor colorWithRed:1.000 green:0.702 blue:0.200 alpha:1.00];
    [btn addTarget:self action:@selector(tapBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    //实例化imagePicker
    _imagePicker = [[UIImagePickerController alloc]init];
    _imagePicker.allowsEditing = YES;
    _imagePicker.delegate = self;
    _imagePicker.view.backgroundColor = [UIColor orangeColor];
    
}



-(NSArray *)adviceArray{
    if (_adviceArray == nil) {
        self.adviceArray = @[@"App问题建议",@"酒店",@"家庭住宿",@"景点",@"地图",@"其他"];
    }
    return _adviceArray;
}
-(void)tapAdvicebtn{
    
    _view1 = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _view1.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_view1];
    
    UITextField * advicetf = [[UITextField alloc]initWithFrame:CGRectMake(2*INDEX, 1*INDEX, 2*INDEX, INDEX)];
    //    advicetf.backgroundColor = [UIColor redColor];
    advicetf.delegate = self;
    [_view1 addSubview:advicetf];
    self.pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, UISCREEN_HEIHT - 20*INDEX, UISCREEN_WIDTH, 20*INDEX)];
    
    [_view1 addSubview:self.pickerView];
    //    self.pickerView.backgroundColor = [UIColor whiteColor];
    self.pickerView.backgroundColor = [UIColor colorWithRed:0.457 green:0.690 blue:0.690 alpha:0.80];
    advicetf.inputView =self.pickerView;
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    
    self.navigationController.toolbarHidden = YES;
    UIToolbar * adviceBar = [[UIToolbar alloc]init];
    adviceBar.barTintColor= [UIColor grayColor];
    adviceBar.frame = CGRectMake(0, UISCREEN_HEIHT - 23*INDEX, UISCREEN_WIDTH, 3*INDEX);
    UIBarButtonItem * cancelBtn = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(tapCancelBtn)];
    [cancelBtn setTintColor:[UIColor whiteColor]];
    UIBarButtonItem * okBtn = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(tapOkBtn)];
    [okBtn setTintColor:[UIColor whiteColor]];
    UIBarButtonItem * spaceBtn = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    adviceBar.items = @[cancelBtn,spaceBtn,okBtn];
    [_view1 addSubview:adviceBar];
    advicetf.inputAccessoryView = adviceBar;
    
    
    
}
#pragma mark - pickerView取消的回调方法
-(void)tapCancelBtn{
    self.navigationController.toolbarHidden = YES;
    [self.view1 removeFromSuperview];
    //    [self.adviceBar removeFromSuperview];
    //    [self.pickerView removeFromSuperview];
}
#pragma mark - pickerView完成的回调方法
-(void)tapOkBtn{
    self.navigationController.toolbarHidden = YES;
    [self.view1 removeFromSuperview];
    //    [self.advicetf removeFromSuperview];
    //    [self.adviceBar removeFromSuperview];
    //    [self.pickerView removeFromSuperview];
}
#pragma mark - 点击上传图片的回调方法
-(void)tapImagebtn:(UIButton *)sender{
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"选取图片" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction * action1 = [UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            _imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
            [self presentViewController:_imagePicker animated:YES completion:nil];
        }else{
            NSLog(@"相机不可用");
        }
    }];
    UIAlertAction * action2 = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum]){
            _imagePicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
            [self presentViewController:_imagePicker animated:YES completion:nil];
        }
    }];
    UIAlertAction * action3 = [UIAlertAction actionWithTitle:@"图库" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
            _imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            [self presentViewController:_imagePicker animated:YES completion:nil];
        }else{
            NSLog(@"图库不可用");
        }
    }];
    UIAlertAction * action4 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction * action5 = [UIAlertAction actionWithTitle:@"删除" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:action1];
    [alert addAction:action2];
    [alert addAction:action3];
    [alert addAction:action4];
    if ([self.imagBtn backgroundImageForState:UIControlStateNormal] == [UIImage imageNamed:@"tappic"] ) {
        [alert addAction:action5];
    }
    //打开actionsheet
    [self presentViewController:alert animated:YES completion:nil];
}
#pragma mark - 发表完成回调方法
-(void)tapBtn{
    [self.textView resignFirstResponder];
    if ([self.textView.text isEqualToString:@""]|| [self.textView.text isEqualToString:@"请简要描述您遇到的问题，我们会尽快为您解决（最最少5个字)"]) {
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"问题描述不能为空哦" message:nil preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        }];
        [alert addAction:action1];
        [self presentViewController:alert animated:YES completion:nil];
    }else{
        // HUD 提示
        self.HUD = [[MBProgressHUD alloc]initWithView:self.view];
        [self.view addSubview:self.HUD];
        //当前view置于后台
        self.HUD.dimBackground = YES;
        //设置文字
        self.HUD.labelText = @"请稍等";
        //显示对话框
        [self.HUD showAnimated:YES whileExecutingBlock:^{
            sleep(2);
            self.HUD.labelText = @"提交成功";
            sleep(1);
        } completionBlock:^{
            [self.HUD removeFromSuperview];
            self.HUD = nil;
            [self.btn1 setTitle:@"" forState:UIControlStateNormal];
            self.textView.text = @"请简要描述您遇到的问题，我们会尽快为您解决（最最少5个字)";
            
            //[self.navigationController popViewControllerAnimated:YES];
        }];
        
        
    }
    
}

#pragma mark - UITextViewDelegate
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if (self.textView.text.length == 200 ||[text isEqualToString:@"\n"]) {
        [self.textView resignFirstResponder];
        return NO;
    }else{
        return YES;
    }
    return YES;
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    _textView.text = @"";
    _label3.text = [NSString stringWithFormat:@"%ld/200",_textView.text.length];
    return YES;
}

- (void)textViewDidChange:(UITextView *)textView{
    if ([textView.text length] == 0) {
        [self.label3 setHidden:NO];
    }else{
        [self.label3 setHidden:YES];
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

-(BOOL)textViewShouldEndEditing:(UITextView *)textView{
    return YES;
}

#pragma mark - UIPickerViewDataSource,UIPickerDelegate
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSString * name = self.adviceArray[row];
    return  name;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.adviceArray.count;
}
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view{
    UILabel * pickerLabel = (UILabel *)view;
    if (!pickerLabel) {
        pickerLabel = [[UILabel alloc]init];
        pickerLabel.frame = CGRectMake(0, UISCREEN_HEIHT-3*INDEX, UISCREEN_WIDTH, 2*INDEX);
        
        pickerLabel.font = [UIFont systemFontOfSize:14.0];
        pickerLabel.textAlignment = NSTextAlignmentCenter;
        pickerLabel.text = [self pickerView:self.pickerView titleForRow:row forComponent:component];
    }
    return pickerLabel;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (component == 0) {
        [self.btn1 setTitle:self.adviceArray[row] forState:UIControlStateNormal];
    }
}

#pragma - mark UIImagePickerDelegate
//完成选取时调用
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    //    NSLog(@"%@",info);
    UIImage * image = info[@"UIImagePickerControllerEditedImage"];
    [_imagBtn setBackgroundImage:image forState:UIControlStateNormal];
    [_imagBtn setTitle:@"" forState:UIControlStateNormal];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:nil];
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
