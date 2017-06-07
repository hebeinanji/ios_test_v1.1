//
//  EditUserDetailViewController.m
//  NativeMeal
//
//  Created by 孙烁鑫 on 17/5/24.
//  Copyright © 2017年 sunsx. All rights reserved.
//

#import "EditUserDetailViewController.h"
#import "EditTableViewCell.h"
#import "PictureTableViewCell.h"
#import "EditUserDetailViewController.h"
//#import "UserManager.h"
#import "Screen.h"
NSString * const EditUserDatailID = @"EditUserDatailID";
NSString * const PictureId = @"PictureId";
@interface EditUserDetailViewController ()<UITableViewDataSource,UITableViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextFieldDelegate>
{
    NSMutableArray * indexPaths;
    NSIndexPath * iconIndexPath;
}
@property (strong,nonatomic)NSMutableArray * datasource;
@property (strong,nonatomic)NSArray * array;
@property (strong,nonatomic)UIImagePickerController * imagePicker;
@property (strong,nonatomic)PictureTableViewCell * cell1;
@property (strong,nonatomic)UIView * view1;
@property (strong, nonatomic) UITableView * tableView;
@end

@implementation EditUserDetailViewController
-(NSMutableArray *)datasource{
    if (_datasource) {
        return _datasource;
    }
    _datasource = [NSMutableArray array];
    [_datasource addObject:self.user.iconImage];
    [_datasource addObject:self.user.username];
    [_datasource addObject:self.user.gender];
    [_datasource addObject:self.user.account];
    [_datasource addObject:self.user.phonenumber];
    [_datasource addObject:self.user.mailbox];
    return _datasource;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    _array = @[@"头像",@"用户名",@"性别",@"手机号",@"邮箱"];
    indexPaths = [NSMutableArray array];
    [self creatUI];
    
}

-(void)creatUI{
    UIBarButtonItem * commitButton = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(tapCommitButton:)];
    self.navigationItem.rightBarButtonItem = commitButton;
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 10, [UIScreen mainScreen].bounds.size.width, 600) style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    //cell自定义高度
    self.tableView.estimatedRowHeight = 250;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self.tableView registerClass:[EditTableViewCell class] forCellReuseIdentifier:EditUserDatailID];
    [self.tableView registerClass:[PictureTableViewCell class] forCellReuseIdentifier:PictureId];
    self.imagePicker = [[UIImagePickerController alloc]init];
    self.imagePicker.allowsEditing = YES;
    self.imagePicker.delegate = self;
    self.imagePicker.view.backgroundColor = [UIColor colorWithRed:0.459 green:0.541 blue:0.592 alpha:1.00];
}

#pragma mark - UITableViewDataSource, UITableViewDelegatge
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.array.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        iconIndexPath = indexPath;
        self.cell1 = [tableView dequeueReusableCellWithIdentifier:PictureId forIndexPath:indexPath];
        self.cell1.label1.text = _array[indexPath.row];
        [self.cell1.btn setBackgroundImage:self.datasource[indexPath.row] forState:UIControlStateNormal];
        [self.cell1 setTarget:self action:@selector(tapIconImage:)];
        return self.cell1;
    }else{
        [indexPaths addObject:indexPath];
        EditTableViewCell * cell2 = [tableView dequeueReusableCellWithIdentifier:EditUserDatailID forIndexPath:indexPath];
        if (indexPath.row == 4 || indexPath.row == 2) {
            cell2.textField.enabled = NO;
        }
        cell2.label1.text = _array[indexPath.row];
        cell2.textField.text = self.datasource[indexPath.row];
        [cell2 setCellDelegate:self];
        return cell2;
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 6*INDEX;
    }
    return 4*INDEX;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)tapCancel{
    [self.view1 removeFromSuperview];
}
-(void)tapCommitButton:(UIBarButtonItem *)sender{
    NSMutableArray * userInfo = [NSMutableArray array];
    for (int i = 0; i < 6; i++) {
        EditTableViewCell * cell = [self.tableView cellForRowAtIndexPath:indexPaths[i]];
        [userInfo addObject:cell.textField.text];
    }
    self.user.iconImage = userInfo[0];
    self.user.username = userInfo[1];
    self.user.gender = userInfo[2];
    self.user.phonenumber = userInfo[3];
    self.user.mailbox = userInfo[4];
//    [[UserManager sharedManager] changeUserInfo:self.user];
    self.changeUserInfoBlock(self.user);
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)tapIconImage:(UIButton *)sender{
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
    [alert addAction:action1];
    [alert addAction:action2];
    [alert addAction:action3];
    [alert addAction:action4];
    
    //打开actionsheet
    [self presentViewController:alert animated:YES completion:nil];
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view1 endEditing:YES];
}
#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
#pragma mark - UIImagePickerController Delegate
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    [picker dismissViewControllerAnimated:YES completion:nil];
    UIImage * image = info[@"UIImagePickerControllerEditedImage"];
    [self.datasource replaceObjectAtIndex:0 withObject:image];
    self.user.iconImage = image;
    [self.tableView reloadRowsAtIndexPaths:@[iconIndexPath] withRowAnimation:UITableViewRowAnimationFade];
}

@end
