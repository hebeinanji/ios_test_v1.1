//
//  SettingController.m
//  NativeMeal
//
//  Created by 孙烁鑫 on 17/5/19.
//  Copyright © 2017年 sunsx. All rights reserved.
//
//设置：账号与安全、     个人资料、清楚缓存、检查更新、      关于我们、服务条款、      退出登录
#import "SettingController.h"
#import "MBProgressHUD.h"
static NSString *iden_setting_cell = @"iden_setting_cell";
@interface SettingController ()
@property(strong,nonatomic)NSArray <NSArray <NSString *>*>* dataSource;
@property (strong, nonatomic) MBProgressHUD * HUD;
@end

@implementation SettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataSource = @[@[@"账号与安全"],@[@"个人资料",@"清除缓存",@"检查更新"],@[@"关于我们",@"服务条款"],@[@"退出登录"]];
    self.title = @"设置";
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:iden_setting_cell];
    
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSource[section].count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:iden_setting_cell forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = _dataSource[indexPath.section][indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //账号与安全
    if (indexPath.section == 0 && indexPath.row == 0) {
        AccountController * accountVC = [[AccountController alloc] initWithStyle:UITableViewStyleGrouped];
        [self.navigationController pushViewController:accountVC animated:YES];
    //清理缓存
    }else if (indexPath.section == 1 && indexPath.row == 1) {
            self.HUD = [[MBProgressHUD alloc]initWithView:self.view];
            [self.view addSubview:self.HUD];
            //当前view置于后台
            self.HUD.dimBackground = YES;
            //设置文字
            self.HUD.labelText = @"请稍等";
            //显示对话框
            [self.HUD showAnimated:YES whileExecutingBlock:^{
                sleep(2);
                self.HUD.labelText = @"清理完成";
                sleep(1);
            } completionBlock:^{
                [self.HUD removeFromSuperview];
                self.HUD = nil;
            }];
    //检查更新
    }else if (indexPath.section == 1 && indexPath.row == 2) {
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"已是最新版本" message:nil preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        }];
        [alert addAction:okAction];
        [self presentViewController:alert animated:YES completion:nil];
    //关于我们
    }else if (indexPath.section == 2 && indexPath.row == 0) {
        AboutViewController * aboutVC = [[AboutViewController alloc] init];
        [self.navigationController pushViewController:aboutVC animated:YES];
    //服务条款
    }else if (indexPath.section == 2 && indexPath.row == 1) {
        TermsServiceViewController * termsService = [[TermsServiceViewController alloc]init];
        [self.navigationController pushViewController:termsService animated:YES];
        
    }

}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
