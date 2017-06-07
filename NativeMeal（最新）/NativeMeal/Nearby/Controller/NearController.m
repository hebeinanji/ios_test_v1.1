//
//  NearController.m
//  NativeMeal
//
//  Created by 孙烁鑫 on 17/5/19.
//  Copyright © 2017年 sunsx. All rights reserved.
//

#import "NearController.h"
#import "NearbyCell.h"
#define Width [UIScreen mainScreen].bounds.size.width
#define Height [UIScreen mainScreen].bounds.size.height
static NSString *iden_cell = @"iden_cell";
@interface NearController ()
@property(strong,nonatomic)NSArray * array1;
@property(strong,nonatomic)NSArray * array2;
@property(strong,nonatomic)NSArray * dataSource;
@end

@implementation NearController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView * titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Width , 64)];
    
    UISegmentedControl *segmentedControl=[[UISegmentedControl alloc] initWithFrame:CGRectMake((Width-160)/2, 10, 160, 30.0) ];
    [segmentedControl insertSegmentWithTitle:@"销量最高" atIndex:0 animated:YES];
    [segmentedControl insertSegmentWithTitle:@"距离最近" atIndex:1 animated:YES];
//    segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
    segmentedControl.selectedSegmentIndex = 0;
//    segmentedControl.momentary = YES;
    segmentedControl.multipleTouchEnabled=NO;
    [segmentedControl addTarget:self action:@selector(Selectbutton:) forControlEvents:UIControlEventValueChanged];
    
    [titleView addSubview:segmentedControl];
    self.navigationItem.titleView = titleView;
    
    
    [self.tableView registerClass:[NearbyCell class] forCellReuseIdentifier:iden_cell];
      _array1  = @[@"孙烁鑫盖饭",@"月售100份",@"4.8份",@"狗肉",@"河北工程大学南门",@"啥也不卖了"];
      _array2  = @[@"孙烁鑫盖饭2号",@"月售101份",@"4.9份",@"狗",@"河北工程大学西门",@"啥也不卖了。。。。。。。。"];
    self.dataSource = [NSArray arrayWithArray:self.array1];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *iden_cell1 = @"iden_celloo";
    NearbyCell *cell = [tableView dequeueReusableCellWithIdentifier:iden_cell forIndexPath:indexPath];
    if (!cell) {
        cell = [[NearbyCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iden_cell1];
    }
    // Configure the cell...
//    cell.textLabel.text = [NSString stringWithFormat:@"%ld - %ld",indexPath.section,indexPath.row];
    
    
    cell.header_imageView.image = [UIImage imageNamed:@"wen"];
    cell.name_Label.text = [self.dataSource objectAtIndex:0];
    cell.sale_Label.text = [self.dataSource objectAtIndex:1];
    cell.grade_Label.text = [self.dataSource objectAtIndex:2];
    cell.cate_Label.text = [self.dataSource objectAtIndex:3];
    cell.address_Label.text = [self.dataSource objectAtIndex:4];
    cell.message_Label.text = [self.dataSource objectAtIndex:5];
    
    
    return cell;
}
#pragma mark - Table View Delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ShopController *shopVC = [[ShopController alloc] init];
    [self.navigationController pushViewController:shopVC animated:YES];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  90;
}
-(void)Selectbutton:(UISegmentedControl *)sender{
    NSLog(@"%ld",sender.selectedSegmentIndex);
    switch (sender.selectedSegmentIndex) {
        case 0:
            self.dataSource = [NSArray arrayWithArray:self.array1];
            [self.tableView reloadData];
            break;
        case 1:
            self.dataSource = [NSArray arrayWithArray:self.array2];
            [self.tableView reloadData];
            break;
            
        default:
            break;
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
