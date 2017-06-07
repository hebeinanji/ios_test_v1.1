//
//  MeController.m
//  NativeMeal
//
//  Created by 孙烁鑫 on 17/5/19.
//  Copyright © 2017年 sunsx. All rights reserved.
//

#import "MeController.h"
static NSString *identer_nomal_cell = @"identer_nomal_cell";
static NSString *identer_login_cell = @"identer_login_cell";
@interface MeController ()
@property(strong,nonatomic)NSArray <NSString *>*dataSource;
@end

@implementation MeController
//我的—————————我的钱包、我的收藏、我的评价、设置、意见反馈
//
//设置：账号与安全、     个人资料、清楚缓存、检查更新、      关于我们、服务条款、      退出登录
//账号与安全：用户名、手机号、邮箱、修改密码
//个人资料：头像、用户名、性别、手机号、邮箱（未验证(点击去验证)/9832@qq.com）
//意见反馈：问题类型（可要可不要），问题描述、上传照片
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"我的";
    
//    self.tabBarController.tabBar.hidden = NO;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identer_nomal_cell];
    [self.tableView registerClass:[LoginCell class] forCellReuseIdentifier:identer_login_cell];
    _dataSource = @[@"我的钱包",@"我的收藏",@"我的评价",@"设置",@"意见反馈"];
}

-(void)viewWillAppear:(BOOL)animated {
    //显示tabBar页面
    self.tabBarController.tabBar.hidden = NO;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return section == 0?1:_dataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 ) {//登陆
        LoginCell *cell = [tableView dequeueReusableCellWithIdentifier:identer_login_cell forIndexPath:indexPath];
        return cell;
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identer_nomal_cell forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = _dataSource[indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //登陆
    if (indexPath.section == 0 && indexPath.row == 0) {
//        LoginViewController * loginVC = [[LoginViewController alloc] init];
//        [self.navigationController pushViewController:loginVC animated:YES];
        UserDetailViewController * userVC = [[UserDetailViewController alloc] init];
        [self.navigationController pushViewController:userVC animated:YES];
        
    }else if(indexPath.section == 1 && indexPath.row == 3) {//设置
        SettingController *setVC = [[SettingController alloc] initWithStyle:UITableViewStyleGrouped];
        [self.navigationController pushViewController:setVC animated:YES];
    //意见反馈
    }else if (indexPath.section == 1 && indexPath.row == 4){
        FeedBackViewController * feedbackVC = [[FeedBackViewController alloc] init];
        [self.navigationController pushViewController:feedbackVC animated:YES];
        
    }//nibiedong womeidonga
    

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return indexPath.section == 0?cell_height:44;
}



@end
