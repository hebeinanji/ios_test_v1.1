//
//  UserDetailViewController.m
//  NativeMeal
//
//  Created by 孙烁鑫 on 17/5/24.
//  Copyright © 2017年 sunsx. All rights reserved.
//

#import "UserDetailViewController.h"
#import "UserMessageTableViewCell.h"
#import "PictureTableViewCell.h"
#import "EditUserDetailViewController.h"
#import "Screen.h"
NSString * const UserDatailID = @"UserDatailID";
NSString * const PictureID = @"PictureID";
@interface UserDetailViewController ()<UITableViewDataSource,UITableViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (strong,nonatomic)NSMutableArray * datasource;
@property (strong,nonatomic)NSArray * array;
@property (strong,nonatomic)UIImagePickerController * imagePicker;
@property (strong,nonatomic)PictureTableViewCell * cell1;
@property (strong,nonatomic)UIView * view1;
@property (strong, nonatomic) UITableView * tableView;
@end

//个人资料：头像、用户名、性别、手机号、邮箱（未验证(点击去验证)/9832@qq.com）

@implementation UserDetailViewController
-(NSMutableArray *)datasource{
    if (_datasource) {
        return _datasource;
    }
    _datasource = [NSMutableArray array];
    [_datasource addObject:self.user.username];
    [_datasource addObject:self.user.gender];
    [_datasource addObject:self.user.account];
    [_datasource addObject:self.user.phonenumber];
    [_datasource addObject:self.user.mailbox];
    return _datasource;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
//    self.turnUserInfoBlock(self.user);
    //user 里面的属性值都是空的 你的这个block也是空的，咋改呀 在block把修改的内容上报给服务器 我现在有事 去吧 我关了啊？？
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    self.tableView.tableFooterView = [UIView new];
    _array = @[@"头像",@"用户名",@"性别",@"手机号",@"邮箱"];
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(tapEditBtn)];
    self.navigationItem.rightBarButtonItem = rightItem;
    [self creatUI];
    //八婆。返回去会不会蹦啊，现在翻不回去了=
}

-(void)creatUI{
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 10, [UIScreen mainScreen].bounds.size.width, 600) style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    //cell自定义高度
    self.tableView.estimatedRowHeight = 250;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self.tableView registerClass:[UserMessageTableViewCell class] forCellReuseIdentifier:UserDatailID];
    [self.tableView registerClass:[PictureTableViewCell class] forCellReuseIdentifier:PictureID];
    self.imagePicker = [[UIImagePickerController alloc]init];
    self.imagePicker.allowsEditing = YES;
    self.imagePicker.delegate = self;
    self.imagePicker.view.backgroundColor = [UIColor colorWithRed:0.459 green:0.541 blue:0.592 alpha:1.00];
}

-(void)tapEditBtn{
    EditUserDetailViewController * editUserDetail = [[EditUserDetailViewController alloc]init];
//    editUserDetail.user = self.user;
//    editUserDetail.changeUserInfoBlock = ^(User * user){
//        self.user = user;
//        self.datasource = nil;
//        [self.tableView reloadData];
//    };
    [self.navigationController pushViewController:editUserDetail animated:YES];
}

#pragma mark - UITableViewDataSource, UITableViewDelegatge
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.array.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        self.cell1 = [tableView dequeueReusableCellWithIdentifier:PictureID forIndexPath:indexPath];
        self.cell1.label1.text = _array[indexPath.row];
        [self.cell1.btn setBackgroundImage:[UIImage imageNamed:@"user_login"] forState:UIControlStateNormal];
        return self.cell1;
    }
    UserMessageTableViewCell * cell2 = [tableView dequeueReusableCellWithIdentifier:UserDatailID forIndexPath:indexPath];
    // Configure the cell...
    cell2.label1.text = self.array[indexPath.row];
//    cell2.label2.text = self.datasource[indexPath.row];// 这么写就行 
    cell2.label2.text = self.array[indexPath.row];//DataSource有了数据在改回去
//    咋写的，我都没看见 你的DataSource都是空的，别用datasource就行了//那现在用的是a对啊
//啊，我不懂啊 不用懂 这么写就行 好知道了 你上班吧，八婆
    return cell2;
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
-(void)tapOk{
    
}
/*//用户展示页不需修改头像
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
 UIAlertAction * action5 = [UIAlertAction actionWithTitle:@"删除" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
 
 }];
 [alert addAction:action1];
 [alert addAction:action2];
 [alert addAction:action3];
 [alert addAction:action4];
 if ([self.cell1.btn backgroundImageForState:UIControlStateNormal]) {
 [alert addAction:action5];
 }
 //打开actionsheet
 [self presentViewController:alert animated:YES completion:nil];
 
 }
 */
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view1 endEditing:YES];
}
//????
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
