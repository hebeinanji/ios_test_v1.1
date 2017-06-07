//
//  All_collectView.m
//  NativeMeal
//
//  Created by 陈文 on 17/5/25.
//  Copyright © 2017年 sunsx. All rights reserved.
//

#import "All_collectView.h"
#import "OrderCell.h"
@interface All_collectView ()<UITableViewDelegate,UITableViewDataSource>
@property(strong,nonatomic)UITableView * tableView;

@end

@implementation All_collectView

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"全部收藏";
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    self.tableView.delegate =self;
    self.tableView.dataSource =self;
    [self.view addSubview:self.tableView];
    // Do any additional setup after loading the view.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  10;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellID = @"cell";
    OrderCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[OrderCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    

    cell.header_imageView.image = [UIImage imageNamed:@"wen"];
    cell.name_Label.text = @"梅乐宝";
    cell.time_Label.text = @"下单时间：2017-11-11 11:11";
    cell.price_Label.text = @"总价:100";
    cell.status_Label.text = @"完成";
    [cell.again_Button  setTitle:@"再来一单" forState:UIControlStateNormal];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  80;
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
