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
    self.tableView.userInteractionEnabled = NO;
    // 创建数据信号
    RACSignal *indexSignal = [self.indexVM.requestCommand execute:nil];
    @weakify(self);
    [[RACSignal combineLatest:@[indexSignal]] subscribeNext:^(RACTuple *x) {
        @strongify(self);
        
        RACTupleUnpack(NSArray *indexArr) = x;
        
        // indexArr 里包括所有数据的model
        
        // 假数据
        
        // 广告
        ADModel * ad1 = [[ADModel alloc] init];
        ad1.url = @"1";
        ADModel * ad2 = [[ADModel alloc] init];
        ad2.url = @"1";
        ADModel * ad3 = [[ADModel alloc] init];
        ad3.url = @"1";
        NSArray * adArr = @[ad1,ad2,ad3];
        self.adDataSource = [adArr mutableCopy];
        pics = [NSMutableArray array];
        for (int i = 0; i < self.adDataSource.count; i++) {
            [pics addObject:[self.adDataSource[i] url]];
        }
        // 爆款推荐
        FoodsModel * f1 = [[FoodsModel alloc] init];
        f1.shopTitle = @"骨法黄焖鸡";
        f1.startCount = @"3.5";
        f1.sellCount = @"220";
        f1.address = @"农业大学西校区 1200m";
        f1.sort = @"鸭";
        f1.imgUrl = @"";
        
        FoodsModel * f2 = [[FoodsModel alloc] init];
        f2.shopTitle = @"老王推荐";
        f2.startCount = @"3.5";
        f2.sellCount = @"220";
        f2.address = @"农业大学西校区 1200m";
        f2.sort = @"鸭";
        f2.imgUrl = @"";
        
        FoodsModel * f3 = [[FoodsModel alloc] init];
        f3.shopTitle = @"东方饺子馆";
        f3.startCount = @"3.5";
        f3.sellCount = @"220";
        f3.address = @"农业大学西校区 1200m";
        f3.sort = @"鸭";
        f3.imgUrl = @"";
        
        FoodsModel * f4 = [[FoodsModel alloc] init];
        f4.shopTitle = @"田老师红烧肉";
        f4.startCount = @"3.5";
        f4.sellCount = @"220";
        f4.address = @"农业大学西校区 1200m";
        f4.sort = @"鸭";
        f4.imgUrl = @"";
        
        FoodsModel * f5 = [[FoodsModel alloc] init];
        f5.shopTitle = @"张姐烤肉拌饭";
        f5.startCount = @"3.5";
        f5.sellCount = @"220";
        f5.address = @"农业大学西校区 1200m";
        f5.sort = @"鸭";
        f5.imgUrl = @"";
        NSArray * recommendArr = @[f1,f2,f3,f4,f5];
        self.recommendDataSource = [recommendArr mutableCopy];
        
        // 品牌商家
        FoodsModel * f11 = [[FoodsModel alloc] init];
        f11.shopTitle = @"金百万";
        f11.startCount = @"3.5";
        f11.sellCount = @"220";
        f11.address = @"农业大学西校区 1200m";
        f11.sort = @"鸭";
        f11.imgUrl = @"";
        
        FoodsModel * f12 = [[FoodsModel alloc] init];
        f12.shopTitle = @"柚恋柠檬";
        f12.startCount = @"3.5";
        f12.sellCount = @"220";
        f12.address = @"农业大学西校区 1200m";
        f12.sort = @"鸭";
        f12.imgUrl = @"";
        
        FoodsModel * f13 = [[FoodsModel alloc] init];
        f13.shopTitle = @"张阿姨奶茶";
        f13.startCount = @"3.5";
        f13.sellCount = @"220";
        f13.address = @"农业大学西校区 1200m";
        f13.sort = @"鸭";
        f13.imgUrl = @"";
        NSArray * merchantsArr = @[f11,f12,f13];
        self.merchantsDataSource = [merchantsArr mutableCopy];
        
        // 商家
        FoodsModel * f20 = [[FoodsModel alloc] init];
        f20.shopTitle = @"一品鲜牛（牛扒.鸡扒）";
        f20.startCount = @"3.5";
        f20.sellCount = @"1220";
        f20.address = @"农业大学西校区 1200m";
        f20.sort = @"肉";
        f20.imgUrl = @"";
        
        FoodsModel * f21 = [[FoodsModel alloc] init];
        f21.shopTitle = @"第一佳大鸡排";
        f21.startCount = @"4.5";
        f21.sellCount = @"120";
        f21.address = @"农业大学西校区 100m";
        f21.sort = @"米饭";
        f21.imgUrl = @"";
        
        FoodsModel * f22 = [[FoodsModel alloc] init];
        f22.shopTitle = @"填鸭梨烤鸭店";
        f22.startCount = @"3.5";
        f22.sellCount = @"220";
        f22.address = @"农业大学西校区 1200m";
        f22.sort = @"鸭";
        f22.imgUrl = @"";
        
        FoodsModel * f23 = [[FoodsModel alloc] init];
        f23.shopTitle = @"西安分会";
        f23.startCount = @"3.7";
        f23.sellCount = @"120";
        f23.address = @"主校区 100m";
        f23.sort = @"米饭";
        f23.imgUrl = @"";
        
        FoodsModel * f24 = [[FoodsModel alloc] init];
        f24.shopTitle = @"吉野家（上地三街店）";
        f24.startCount = @"3.5";
        f24.sellCount = @"2220";
        f24.address = @"上地三街 1200m";
        f24.sort = @"快餐";
        f24.imgUrl = @"";
        
        FoodsModel * f25 = [[FoodsModel alloc] init];
        f25.shopTitle = @"山西面食馆（三街店）";
        f25.startCount = @"4.5";
        f25.sellCount = @"20";
        f25.address = @"上地三街 1200m";
        f25.sort = @"面食";
        f25.imgUrl = @"";
        
        FoodsModel * f26 = [[FoodsModel alloc] init];
        f26.shopTitle = @"水煮鱼（西二旗店）";
        f26.startCount = @"3.9";
        f26.sellCount = @"220";
        f26.address = @"西二旗街 1200m";
        f26.sort = @"鱼";
        f26.imgUrl = @"";
        
        FoodsModel * f27 = [[FoodsModel alloc] init];
        f27.shopTitle = @"来自星星的韩式炸鸡";
        f27.startCount = @"5";
        f27.sellCount = @"1220";
        f27.address = @"上地 1200m";
        f27.sort = @"快餐";
        f27.imgUrl = @"";
        
        FoodsModel * f28 = [[FoodsModel alloc] init];
        f28.shopTitle = @"一茶一坐（北京店）";
        f28.startCount = @"3";
        f28.sellCount = @"150";
        f28.address = @"北京那个 1200m";
        f28.sort = @"茶";
        f28.imgUrl = @"";
        
        FoodsModel * f29 = [[FoodsModel alloc] init];
        f29.shopTitle = @"这个不规范";
        f29.startCount = @"5";
        f29.sellCount = @"1220";
        f29.address = @"上地 1200m";
        f29.sort = @"快餐";
        f29.imgUrl = @"";
        
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
- (void)loadNextPage{
    [self.tableView.mj_footer endRefreshing];
    self.tableView.userInteractionEnabled = YES;
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
