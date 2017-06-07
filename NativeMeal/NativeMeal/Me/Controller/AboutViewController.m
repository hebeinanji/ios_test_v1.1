//
//  AboutViewController.m
//  NativeMeal
//
//  Created by 孙烁鑫 on 17/5/19.
//  Copyright © 2017年 sunsx. All rights reserved.
//


#import "AboutViewController.h"
#import "UILabel+Automatic.h"
#import "Screen.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //    self.navigationItem.title = @"关于";
    [self creatUI];
}

-(void)creatUI{
    //    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 20, 80, 80)];
    //    UIImage * image = [UIImage imageNamed:@"icon"];
    //    imageView.image = image;
    //    [self.view addSubview:imageView];
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel * title = [[UILabel alloc]initWithFrame:CGRectMake(2*INDEX, 2*INDEX, 13*INDEX, 3*INDEX)];
    title.text = @"关于家行天下";
    title.font = [UIFont fontWithName:@"黑体" size:12.0] ;
    [self.view addSubview:title];
    
    UIScrollView * scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(2*INDEX, title.frame.origin.y + title.frame.size.height+5, UISCREEN_WIDTH - 3*INDEX, 40*INDEX)];
    
    //    scrollView.backgroundColor = [UIColor redColor];
    [self.view addSubview:scrollView];
    
    UILabel * information = [[UILabel alloc]initWithFrame:CGRectMake(INDEX/2, 2*INDEX, UISCREEN_WIDTH - 1.5*INDEX, 3*INDEX)];
    //    information.backgroundColor = [UIColor redColor];
    [information setTextIsAutomaticHeight:@"家行天下是中国领先的无线和在线旅游平台，其网站上线我＂5年5月，公司总部位于北京，在全国多家城市设有分支机构与办公域，每个服务城市均拥有精英优质的地推团队，由比己合总：部完成服务于全国中高端用户的各项线上线下规线与部署。家行天下网通过网站及移动客户端的全平台覆盖，随时随地为旅行者提供国内外机票、酒店度假、旅游团购｀及旅行信息的深度：搜索，帮助旅行者找到性价比最高的产品和最优；质的信息聪明地安排旅行。家行天下网凭借其便捷｀先进的智能搜索技术对互联网上的旅行信息：进行整合，为用户提供实时、可靠、全面的旅游：产品查询和信息比交服务。根据2013年1月艾瑞监测数据，在旅行类网站月度访问次数统计中，去哪儿网以744万人次高居榜首。截至2013年6月底，家行天下网可实时搜索约1250家旅游供应商网站，搜索范围覆盖全球范围内超过4“000家酒店约125000条机票：航线｀186＂0条度假线路、8500个旅游景：点，并且每日提供逾“00种旅游团购产品。家行天下网移动客户端＂去哪儿旅行＂是中国旅行类最：受欢迎的移动应用，其拥有约4300万的激活用户量，根据中国互联网络信息中心（CNNC）发布：的《2012年中国网民在线旅行预订行为调查报告》，去哪儿旅行是手机旅行信息查询用户安装：最多且使用最多的移动客户端。"];
    [scrollView addSubview:information];
    
    UILabel * title2 = [[UILabel alloc]initWithFrame:CGRectMake(INDEX/2, information.frame.origin.y + information.frame.size.height, 10*INDEX, 3*INDEX)];
    title2.text = @"联系我们";
    title2.font = [UIFont fontWithName:@"黑体" size:12.0];
    [scrollView addSubview:title2];
    
    UILabel * information2 = [[UILabel alloc]initWithFrame:CGRectMake(INDEX/2, title2.frame.origin.y + title2.frame.size.height, UISCREEN_WIDTH - 6*INDEX, 3*INDEX)];
    [information2 setTextIsAutomaticHeight:@"电话： 0310 - 74892437"];
    [scrollView addSubview:information2];
    
    UILabel * information3 = [[UILabel alloc]initWithFrame:CGRectMake(INDEX/2, information2.frame.origin.y + information2.frame.size.height, UISCREEN_WIDTH - 6*INDEX, 3*INDEX)];
    [information3 setTextIsAutomaticHeight:@"地址： 邯郸市光明南大街199号"];
    [scrollView addSubview:information3];
    scrollView.contentSize = CGSizeMake(0, information3.frame.size.height+information3.frame.origin.y);
    UILabel * footer = [[UILabel alloc]initWithFrame:CGRectMake(7*INDEX, scrollView.frame.origin.y + scrollView.frame.size.height, UISCREEN_WIDTH-14*INDEX, 2*INDEX)];
    //    footer.backgroundColor = [UIColor greenColor];
    footer.font = [UIFont systemFontOfSize:13.0];
    footer.text  = @"Copyright(C) 家行天下2016-））";
    [self.view addSubview:footer];
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
