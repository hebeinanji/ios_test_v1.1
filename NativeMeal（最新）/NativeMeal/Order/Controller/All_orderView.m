//
//  All_orderView.m
//  NativeMeal
//
//  Created by 陈文 on 17/5/25.
//  Copyright © 2017年 sunsx. All rights reserved.
//

#import "All_orderView.h"
#import "NearbyCell.h"
@interface All_orderView ()<UITableViewDelegate,UITableViewDataSource>
@property(strong,nonatomic)UITableView * tableView;
@end

@implementation All_orderView

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"全部订单";
    // Do any additional setup after loading the view.
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    self.tableView.delegate =self;
    self.tableView.dataSource =self;
    [self.view addSubview:self.tableView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  10;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellID = @"cell";
    NearbyCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
    cell = [[NearbyCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }

    cell.header_imageView.image = [UIImage imageNamed:@"wen"];
    cell.name_Label.text = @"一品鲜牛";
    cell.grade_Label.text = @"5.5分";
    cell.sale_Label.text = @"月售100份";
    cell.cate_Label.text = @"肉类";
    cell.address_Label.text = @"河北工程大学西校区";
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
