//
//  OrderController.m
//  NativeMeal
//
//  Created by 孙烁鑫 on 17/5/19.
//  Copyright © 2017年 sunsx. All rights reserved.
//

#import "OrderController.h"
#import "OrderCell.h"
#import "NearbyCell.h"
#import "All_orderView.h"
#import "All_collectView.h"
#define Width [UIScreen mainScreen].bounds.size.width
#define Height [UIScreen mainScreen].bounds.size.height
@interface OrderController ()<UITableViewDelegate,UITableViewDataSource>
// 待付款
@property(strong,nonatomic)UIButton *  waitPay_btn;
// 待使用
@property(strong,nonatomic)UIButton *  waitUse_btn;
// 待评价
@property(strong,nonatomic)UIButton *  waitAnw_btn;
// 售后
@property(strong,nonatomic)UIButton *  returnMoney_btn;

@property(strong,nonatomic)UITableView * topTable;

@property(strong,nonatomic)UITableView * downTable;

@property(strong,nonatomic)UIScrollView * scrollView;

@end

@implementation OrderController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, Width, Height)];
    [self.view addSubview:self.scrollView];
    self.scrollView.contentSize = CGSizeMake(Width, Height + 50);
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self TopbuttonView];
    [self theTopTable];
//    [self theDownTable];
    // Do any additional setup after loading the view.
}
-(void)TopbuttonView{
    UIView * btn_view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Width, 90)];
    btn_view.backgroundColor  = [UIColor whiteColor];
    [self.scrollView addSubview:btn_view];
    NSArray * array1 = @[@"待付款",@"待使用",@"待评价",@"退款/售后"];
    for (int i = 0; i<4; i++) {
        UIButton * hotButton = [UIButton new];
   
            hotButton = [[UIButton alloc]initWithFrame:CGRectMake(5+i*((Width-25)/4+5), 5,  (Width-25)/4, 80)];
            [hotButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            hotButton.tag = i;
            [hotButton addTarget:self action:@selector(touchTheCityButton:) forControlEvents:UIControlEventTouchUpInside];
            hotButton.backgroundColor = [UIColor lightGrayColor];
            [hotButton setTitle:[NSString stringWithFormat:@"%@",[array1 objectAtIndex:i]] forState:UIControlStateNormal];
            [btn_view addSubview:hotButton];
    }
}

-(void)theTopTable{
    UIView * topView = [[UIView alloc]initWithFrame:CGRectMake(0, 95, Width, 500)];
    [self.scrollView addSubview:topView];
    self.topTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, Width, 500) style:UITableViewStyleGrouped];
    self.topTable.bounces = NO;
    self.topTable.delegate =self;
    self.topTable.dataSource = self;
    self.topTable.separatorStyle = UITableViewStyleGrouped;
    self.topTable.backgroundColor = [UIColor whiteColor];
    [topView addSubview:self.topTable];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellID = @"cell";
//    OrderCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];

//    if (!cell) {
//        cell = [[OrderCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
//    }
    if (indexPath.section == 0) {
            OrderCell * cell = [[OrderCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.header_imageView.image = [UIImage imageNamed:@"wen"];
        cell.name_Label.text = @"梅乐宝";
        cell.time_Label.text = @"下单时间：2017-11-11 11:11";
        cell.price_Label.text = @"总价:100";
        cell.status_Label.text = @"完成";
        [cell.again_Button  setTitle:@"再来一单" forState:UIControlStateNormal];
        return cell;
    }else{
        NearbyCell * cell = [[NearbyCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.header_imageView.image = [UIImage imageNamed:@"wen"];
        cell.name_Label.text = @"一品鲜牛";
        cell.grade_Label.text = @"5.5分";
        cell.sale_Label.text = @"月售100份";
        cell.cate_Label.text = @"肉类";
        cell.address_Label.text = @"河北工程大学西校区";
        return cell;
    }

    return  nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  80;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * footView= [[UIView alloc]initWithFrame:CGRectMake(0, 0, Width, 30)];
    UIButton * all_button = [[UIButton alloc]initWithFrame:CGRectMake(Width -100, 5, 90, 20)];
    [all_button setTitle:@"最近订单" forState:UIControlStateNormal];
    [all_button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [footView addSubview:all_button];
    UILabel * new_Label = [[UILabel alloc]initWithFrame:CGRectMake(5, 5, 100, 20)];
   
    [footView addSubview:new_Label];
    if (section == 0) {
     new_Label.text = @"最近订单1";
    }else{
      new_Label.text = @"我的收藏";
    }
    return footView;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView * headerFoot= [[UIView alloc]initWithFrame:CGRectMake(0, 0, Width, 30)];
    
    UIButton * look_btn = [[UIButton alloc]initWithFrame:CGRectMake(Width/2 -50,5, 100, 30)];
    look_btn.tag = 100 + section;
    [headerFoot addSubview:look_btn];
    [look_btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];

    [look_btn addTarget: self action:@selector(TouchLook:) forControlEvents:UIControlEventTouchUpInside];
 
    [look_btn setTitle:@"查看全部" forState:UIControlStateNormal];
    return headerFoot;
}
-(void)TouchLook:(UIButton *)sender{
    if (sender.tag == 101) {
        All_orderView * all_look = [[All_orderView alloc]init];
        [self.navigationController pushViewController:all_look animated:YES];
    }else{
        All_collectView * all_collectView = [[All_collectView alloc]init];
        [self.navigationController pushViewController:all_collectView animated:YES];
    }
  
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return  30;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return  30;
}
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    CGFloat sectionHeaderHeight = 40;
//    if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
//        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
//    } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
//        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
//    }
//}

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
