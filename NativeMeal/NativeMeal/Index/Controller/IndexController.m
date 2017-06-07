//
//  IndexController.m
//  NativeMeal
//
//  Created by 孙烁鑫 on 17/5/19.
//  Copyright © 2017年 sunsx. All rights reserved.
//

#import "IndexController.h"
#import "ADTableViewCell.h"
#import "CatagoryTableViewCell.h"
#import "RecommendTableViewCell.h"
#import "MerchantsTableViewCell.h"
#import "FoodsTableViewCell.h"
#import "FoodsHeaderView.h"
#import "IndexViewModel.h"
#import "FoodsViewModel.h"
#import "NavView.h"
#import "Screen.h"
#import <MapKit/MapKit.h>
#import "PYSearchViewController.h"
#import "PYSearch.h"
static NSString *identer_nomal = @"identer_nomal";
@interface IndexController ()<UITableViewDelegate, UITableViewDataSource,CLLocationManagerDelegate,PYSearchViewControllerDelegate>
{
    int pageNum;
    NSMutableArray * pics;
}
@property(strong, nonatomic)UITableView * tableView;
@property(strong, nonatomic)NSMutableArray * foodsDataSource;
@property(strong, nonatomic)NSMutableArray * adDataSource;
@property(strong, nonatomic)NSMutableArray * recommendDataSource;
@property(strong, nonatomic)NSMutableArray * merchantsDataSource;
@property(strong, nonatomic)NavView * navView;
@property(strong, nonatomic)IndexViewModel * indexVM;
@property(strong, nonatomic)FoodsViewModel * foodsVM;
@property(strong,nonatomic)CLLocationManager* locationManager;
@property(copy, nonatomic)NSString * currentCity;
@end

@implementation IndexController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];

}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}
-(IndexViewModel *)indexVM{
    if (!_indexVM) {
        _indexVM = [[IndexViewModel alloc] init];
    }
    return _indexVM;
}
-(FoodsViewModel *)foodsVM{
    if(!_foodsVM){
        _foodsVM = [[FoodsViewModel alloc] init];
    }
    return _foodsVM;
}
-(NSMutableArray *)foodsDataSource{
    if (!_foodsDataSource) {
        _foodsDataSource = [NSMutableArray array];
    }
    return _foodsDataSource;
}
-(NSMutableArray *)adDataSource{
    if (!_adDataSource) {
        _adDataSource = [NSMutableArray array];
    }
    return _adDataSource;
}
-(NSMutableArray *)recommendDataSource{
    if (!_recommendDataSource) {
        _recommendDataSource = [NSMutableArray array];
    }
    return _recommendDataSource;
}
-(NSMutableArray *)merchantsDataSource{
    if (!_merchantsDataSource) {
        _merchantsDataSource = [NSMutableArray array];
    }
    return _merchantsDataSource;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self initNavBar];
    [self configurationTableView];
    [self refresh];
    [self locate];
}
- (void)refresh{
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        pageNum = 1;
        //        self.pageAndNumArr = [NSMutableArray array];
        [self.tableView.mj_footer resetNoMoreData];
        self.tableView.userInteractionEnabled = NO;
        [self loadData];
    }];
    [self.tableView.mj_header beginRefreshing];
    MJRefreshBackNormalFooter * footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        pageNum++;
        self.tableView.userInteractionEnabled = NO;
        [self loadNextPage];
    }];
    [footer setTitle:@"没有更多商家了" forState:MJRefreshStateNoMoreData];
    self.tableView.mj_footer = footer;
}
- (void)loadData{
    [self.indexVM loadDataArrFromNetwork];
    
//    [self.indexVM loadDataArrFromNetworkWithPage:pageNum];
    self.tableView.userInteractionEnabled = NO;
    // 创建数据信号
    RACSignal *indexSignal = [self.indexVM.requestCommand execute:nil];
    
    @weakify(self);
    [[RACSignal combineLatest:@[indexSignal]] subscribeNext:^(RACTuple *x) {
        @strongify(self);
        
        RACTupleUnpack(NSArray *indexArr) = x;
//        NSLog(@"%@",indexArr);
        // indexArr 里包括所有数据的model
        self.adDataSource = [indexArr[0] mutableCopy];
        self.recommendDataSource = [indexArr[1] mutableCopy];
        self.merchantsDataSource = [indexArr[2] mutableCopy];
        pics = [NSMutableArray array];
        for (int i = 0; i < [indexArr[0] count]; i++) {
            [pics addObject:[indexArr[0][i] picURL]];
        }
        
        
    } error:^(NSError *error) {
        NSLog(@"%@",error.localizedDescription);
        [self.tableView.mj_header endRefreshing];
        self.tableView.userInteractionEnabled = YES;
    } completed:^{
        [self.foodsVM loadDataArrFromNetworkWithPage:pageNum];
        RACSignal *foodsSignal = [self.foodsVM.requestCommand execute:nil];
        [[RACSignal combineLatest:@[foodsSignal]] subscribeNext:^(RACTuple *x) {
            @strongify(self);
            
            RACTupleUnpack(NSArray *foodArr) = x;
//            NSLog(@"%@",foodArr);
            self.foodsDataSource = [foodArr mutableCopy];
            // indexArr 里包括所有数据的model
            [self.tableView reloadData];
            [self.tableView.mj_header endRefreshing];
            self.tableView.userInteractionEnabled = YES;
            
        } error:^(NSError *error) {
            NSLog(@"%@",error.localizedDescription);
            [self.tableView.mj_header endRefreshing];
            self.tableView.userInteractionEnabled = YES;
        }];
    }];
    
    
}
- (void)loadNextPage{
    [self.foodsVM loadDataArrFromNetworkWithPage:pageNum];
    RACSignal *foodsSignal = [self.foodsVM.requestCommand execute:nil];
    @weakify(self);
    [[RACSignal combineLatest:@[foodsSignal]] subscribeNext:^(RACTuple *x) {
        @strongify(self);
        
        RACTupleUnpack(NSArray *foodArr) = x;
//        NSLog(@"%@",foodArr);
        for (int i = 0; i< foodArr.count; i++) {
            [self.foodsDataSource addObject:foodArr[i]];
        }
        // indexArr 里包括所有数据的model
        
        [self.tableView reloadData];
        [self.tableView.mj_footer endRefreshing];
        self.tableView.userInteractionEnabled = YES;
        
    } error:^(NSError *error) {
        pageNum--;
        NSLog(@"%@",error.localizedDescription);
        [self.tableView.mj_footer endRefreshing];
        self.tableView.userInteractionEnabled = YES;
    }];
    
}
- (void)initNavBar{
    self.navView = [[NavView alloc] initWithFrame:CGRectMake(0, 0, UISCREEN_WIDTH, 64)];
    [self.navView addTarget:self tapLocation:@selector(tapLocation:) tapSearch:@selector(tapSearch:)];
    [self.view addSubview:self.navView];
}
- (void)configurationTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, UISCREEN_WIDTH, UISCREEN_HEIHT-110) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[ADTableViewCell class] forCellReuseIdentifier:adTableViewCellID];
    [self.tableView registerClass:[CatagoryTableViewCell class] forCellReuseIdentifier:catagoryTableViewCellID];
    [self.tableView registerClass:[RecommendTableViewCell class] forCellReuseIdentifier:recommendTableViewCellID];
    [self.tableView registerClass:[MerchantsTableViewCell class] forCellReuseIdentifier:merchantsTableViewCellID];
    [self.tableView registerClass:[FoodsTableViewCell class] forCellReuseIdentifier:foodsTableViewCellID];
    [self.tableView registerClass:[FoodsHeaderView class] forHeaderFooterViewReuseIdentifier:foodsHeaderViewID];
    [self.view addSubview:self.tableView];
//    self.tableView.tableFooterView = [UIView new];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)locate {
    //判断定位功能是否打开
    if ([CLLocationManager locationServicesEnabled]) {
        self.locationManager = [[CLLocationManager alloc]init];
        _locationManager.delegate = self;
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        _locationManager.distanceFilter = 10;
        [_locationManager requestAlwaysAuthorization];//添加这句
        [_locationManager startUpdatingLocation];
    }
    
}

#pragma mark CoreLocation delegate

//定位失败则执行此代理方法
//定位失败弹出提示框,点击"打开定位"按钮,会打开系统的设置,提示打开定位服务
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    UIAlertController * alertVC = [UIAlertController alertControllerWithTitle:@"允许\"定位\"提示" message:@"请在设置中打开定位" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * ok = [UIAlertAction actionWithTitle:@"打开定位" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //打开定位设置
        NSURL *settingsURL = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        [[UIApplication sharedApplication] openURL:settingsURL];
    }];
    UIAlertAction * cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertVC addAction:cancel];
    [alertVC addAction:ok];
    [self presentViewController:alertVC animated:YES completion:nil];
    
}
//定位成功
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    [self.locationManager stopUpdatingLocation];
    CLLocation *currentLocation = [locations lastObject];
    CLGeocoder * geoCoder = [[CLGeocoder alloc] init];
    
    // 保存 Device 的现语言 (英语 法语 ，，，)
    NSMutableArray *userDefaultLanguages = [[NSUserDefaults standardUserDefaults]
                                            objectForKey:@"AppleLanguages"];
    // 强制 成 简体中文
    [[NSUserDefaults standardUserDefaults] setObject:[NSArray arrayWithObjects:@"zh-hans",nil]
                                              forKey:@"AppleLanguages"];
    
    //反编码
    
    // 逆地理编码
    [geoCoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        if(!error){
            for (CLPlacemark * placemark in placemarks) {
                NSString *cityName = [placemark locality];
//                NSLog(@"cityName===》%@", cityName);//这里可看到输出为中文
                self.navView.location = cityName;
                break;
            }
        }
        // 还原Device 的语言
        [[NSUserDefaults standardUserDefaults] setObject:userDefaultLanguages forKey:@"AppleLanguages"];
    }];
    
//    [geoCoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
//        if (placemarks.count > 0) {
//            CLPlacemark *placeMark = placemarks[0];
//            self.currentCity = placeMark.locality;
//            if (!self.currentCity) {
//                self.currentCity = @"无法定位当前城市";
//            }
//            NSLog(@"%@",self.currentCity); //这就是当前的城市
////            NSLog(@"%@",placeMark.name);//具体地址:  xx市xx区xx街道
//        }
//        else if (error == nil && placemarks.count == 0) {
//            NSLog(@"No location and error return");
//        }
//        else if (error) {
//            NSLog(@"location error: %@ ",error);
//        }
//        
//    }];        
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 4) {
        return self.foodsDataSource.count;
    }else{
        return 1;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return (UISCREEN_WIDTH)/16*9;
    }else if (indexPath.section == 1){
        return 8.5*INDEX;
    }else if (indexPath.section == 2){
        return 29*INDEX;
    }else if (indexPath.section == 3){
        return 16*INDEX;
    }else{
        return 12*INDEX;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 4) {
        return 4*INDEX;
    }else{
        return CGFLOAT_MIN;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 4) {
        FoodsHeaderView * view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:foodsHeaderViewID];
        return view;
    }else{
        return nil;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        ADTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:adTableViewCellID forIndexPath:indexPath];
        if (pics && pics.count != 0 && pics != nil){
            cell.images = pics;
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (indexPath.section == 1){
        CatagoryTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:catagoryTableViewCellID forIndexPath:indexPath];
        [cell addItemTarget:self action:@selector(tapCatagory:)];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if(indexPath.section == 2){
        RecommendTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:recommendTableViewCellID forIndexPath:indexPath];
        if (self.recommendDataSource && self.recommendDataSource.count != 0 && self.recommendDataSource != nil && self.recommendDataSource.count>indexPath.row){
            cell.recommendArr = self.recommendDataSource;
            [cell addItemTarget:self action:@selector(tapRecommend:)];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (indexPath.section == 3){
        MerchantsTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:merchantsTableViewCellID forIndexPath:indexPath];
        if (self.merchantsDataSource && self.merchantsDataSource.count != 0 && self.merchantsDataSource != nil && self.merchantsDataSource.count>indexPath.row){
            cell.merchantsArr = self.merchantsDataSource;
            [cell addItemTarget:self action:@selector(tapMerchart:)];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        FoodsTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:foodsTableViewCellID forIndexPath:indexPath];
        if (self.foodsDataSource && self.foodsDataSource.count != 0 && self.foodsDataSource != nil && self.foodsDataSource.count>indexPath.row){
            cell.model = self.foodsDataSource[indexPath.row];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
}
#pragma mark - UITableView Delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 4) {
        // 跳转
    }
}
#pragma mark - PYSearchViewControllerDelegate
-(void)searchViewController:(PYSearchViewController *)searchViewController didSelectSearchHistoryAtIndex:(NSInteger)index searchText:(NSString *)searchText{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"tapHistoryLabelChangeSearchBarText" object:searchText];
}
- (void)searchViewController:(PYSearchViewController *)searchViewController searchTextDidChange:(UISearchBar *)seachBar searchText:(NSString *)searchText
{
    if (searchText.length) { // 与搜索条件再搜索
        // 根据条件发送查询（这里模拟搜索）
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{ // 搜素完毕
            // 显示建议搜索结果
            NSMutableArray *searchSuggestionsM = [NSMutableArray array];
            for (int i = 0; i < arc4random_uniform(5) + 10; i++) {
                NSString *searchSuggestion = [NSString stringWithFormat:@"搜索建议 %d", i];
                [searchSuggestionsM addObject:searchSuggestion];
            }
            // 返回
            searchViewController.searchSuggestions = searchSuggestionsM;
        });
    }
}
#pragma mark - CallBack Method
- (void)tapLocation:(UIButton *)sender{
    NSLog(@"点击定位");
}
- (void)tapSearch:(UIButton *)sender{
    NSLog(@"点击搜索");
    // 2. 创建控制器
    PYSearchViewController *searchViewController = [PYSearchViewController searchViewControllerWithHotSearches:nil searchBarPlaceholder:@"搜索主题、视频" didSearchBlock:nil];
    searchViewController.hotSearchStyle = PYHotSearchStyleDefault; // 热门搜索风格为默认
    searchViewController.searchHistoryStyle = PYSearchHistoryStyleBorderTag; // 搜索历史风格根据选择
    
    // 4. 设置代理
    searchViewController.delegate = self;
    //    [self.navigationController pushViewController:searchViewController animated:YES];
    // 5. 跳转到搜索控制器
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:searchViewController];
    [self presentViewController:nav animated:NO completion:nil];
}
- (void)tapCatagory:(UIButton *)sender{
    NSLog(@"%ld",[(UITapGestureRecognizer *)sender view].tag);
}
- (void)tapRecommend:(UIButton *)sender{
    NSLog(@"%ld",[(UITapGestureRecognizer *)sender view].tag);
}
- (void)tapMerchart:(UIButton *)sender{
    NSLog(@"%ld",[(UITapGestureRecognizer *)sender view].tag);
}
@end
