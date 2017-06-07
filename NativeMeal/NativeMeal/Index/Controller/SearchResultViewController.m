//
//  SearchResultViewController.m
//  NativeMeal
//
//  Created by JiangZiWei on 2017/5/26.
//  Copyright © 2017年 sunsx. All rights reserved.
//

#import "SearchResultViewController.h"
#import "FoodsTableViewCell.h"
#import "SearchViewModel.h"
#import "Screen.h"
@interface SearchResultViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(strong, nonatomic)UITableView * tableView;
@property(strong, nonatomic)NSMutableArray * foodsDataSource;
@property(strong, nonatomic)SearchViewModel * searchVM;
@end

@implementation SearchResultViewController
-(void)setSearchText:(NSString *)searchText{
    [self loadData];
}
-(SearchViewModel *)searchVM{
    if (!_searchVM) {
        _searchVM = [[SearchViewModel alloc] init];
    }
    return _searchVM;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTableView];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)loadData{
    [self.searchVM loadDataArrFromNetwork];
    self.tableView.userInteractionEnabled = NO;
    // 创建数据信号
    RACSignal *searchSignal = [self.searchVM.requestCommand execute:nil];
    @weakify(self);
    [[RACSignal combineLatest:@[searchSignal]] subscribeNext:^(RACTuple *x) {
        @strongify(self);
        
        RACTupleUnpack(NSArray *searchArr) = x;
        
        // indexArr 里包括所有数据的model
        
        // 假数据
        
        
        // 商家
        FoodsModel * f20 = [[FoodsModel alloc] init];
        f20.stoName = @"一品鲜牛（牛扒.鸡扒）";
        f20.score = @"3.5";
        f20.saleValume = @"1220";
        f20.addConcrete = @"农业大学西校区 1200m";
//        f20.sort = @"肉";
        f20.URL = @"";
        
        FoodsModel * f21 = [[FoodsModel alloc] init];
        f21.stoName = @"第一佳大鸡排";
        f21.score = @"4.5";
        f21.saleValume = @"120";
        f21.addConcrete = @"农业大学西校区 100m";
//        f21.sort = @"米饭";
        f21.URL = @"";
        
        FoodsModel * f22 = [[FoodsModel alloc] init];
        f22.stoName = @"填鸭梨烤鸭店";
        f22.score = @"3.5";
        f22.saleValume = @"220";
        f22.addConcrete = @"农业大学西校区 1200m";
//        f22.sort = @"鸭";
        f22.URL = @"";
        
        FoodsModel * f23 = [[FoodsModel alloc] init];
        f23.stoName = @"西安分会";
        f23.score = @"3.7";
        f23.saleValume = @"120";
        f23.addConcrete = @"主校区 100m";
//        f23.sort = @"米饭";
        f23.URL = @"";
        
        FoodsModel * f24 = [[FoodsModel alloc] init];
        f24.stoName = @"吉野家（上地三街店）";
        f24.score = @"3.5";
        f24.saleValume = @"2220";
        f24.addConcrete = @"上地三街 1200m";
//        f24.sort = @"快餐";
        f24.URL = @"";
        
        FoodsModel * f25 = [[FoodsModel alloc] init];
        f25.stoName = @"山西面食馆（三街店）";
        f25.score = @"4.5";
        f25.saleValume = @"20";
        f25.addConcrete = @"上地三街 1200m";
//        f25.sort = @"面食";
        f25.URL = @"";
        
        FoodsModel * f26 = [[FoodsModel alloc] init];
        f26.stoName = @"水煮鱼（西二旗店）";
        f26.score = @"3.9";
        f26.saleValume = @"220";
        f26.addConcrete = @"西二旗街 1200m";
//        f26.sort = @"鱼";
        f26.URL = @"";
        
        FoodsModel * f27 = [[FoodsModel alloc] init];
        f27.stoName = @"来自星星的韩式炸鸡";
        f27.score = @"5";
        f27.saleValume = @"1220";
        f27.addConcrete = @"上地 1200m";
//        f27.sort = @"快餐";
        f27.URL = @"";
        
        FoodsModel * f28 = [[FoodsModel alloc] init];
        f28.stoName = @"一茶一坐（北京店）";
        f28.score = @"3";
        f28.saleValume = @"150";
        f28.addConcrete = @"北京那个 1200m";
//        f28.sort = @"茶";
        f28.URL = @"";
        
        FoodsModel * f29 = [[FoodsModel alloc] init];
        f29.stoName = @"这个不规范";
        f29.score = @"5";
        f29.saleValume = @"1220";
        f29.addConcrete = @"上地 1200m";
//        f29.sort = @"快餐";
        f29.URL = @"";
        
        NSArray * foodsArr = @[f20,f21,f22,f23,f24,f25,f26,f27,f28,f29];
        self.foodsDataSource = [foodsArr mutableCopy];
        
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
        self.tableView.userInteractionEnabled = YES;
        
    } error:^(NSError *error) {
        NSLog(@"%@",error.localizedDescription);
        [self.tableView.mj_header endRefreshing];
        self.tableView.userInteractionEnabled = YES;
    }];
}
- (void)initTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, UISCREEN_WIDTH, UISCREEN_HEIHT) style:UITableViewStylePlain];
    [_tableView setContentInset:UIEdgeInsetsMake(64, 0, 0, 0)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[FoodsTableViewCell class] forCellReuseIdentifier:foodsTableViewCellID];
    [self.view addSubview:self.tableView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.foodsDataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FoodsTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:foodsTableViewCellID forIndexPath:indexPath];
    if (self.foodsDataSource && self.foodsDataSource.count != 0 && self.foodsDataSource != nil && self.foodsDataSource.count>indexPath.row){
        cell.model = self.foodsDataSource[indexPath.row];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 12*INDEX;
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
