//
//  AppDelegate.m
//  NativeMeal
//
//  Created by 孙烁鑫 on 17/5/19.
//  Copyright © 2017年 sunsx. All rights reserved.
//

#import "AppDelegate.h"
#define tabBar_title_nomal_color [UIColor colorWithRed:122/255.0 green:126/255.0 blue:131/255.0 alpha:1]
#define tabBar_title_selected_color [UIColor colorWithRed:250/255.0 green:79/255.0 blue:135/255.0 alpha:1]
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    UITabBarController *tabVC = [[UITabBarController alloc] init];
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:tabBar_title_nomal_color, NSForegroundColorAttributeName,nil] forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:tabBar_title_selected_color, NSForegroundColorAttributeName,nil] forState:UIControlStateSelected];
    
    
    
    //首页导航
    IndexController *indexVC = [[IndexController alloc] init];
    UINavigationController *indexNav = [[UINavigationController alloc] initWithRootViewController:indexVC];
    indexNav.tabBarItem.image = [UIImage imageNamed:@"icon_tab_shouye_normal"];
    indexNav.tabBarItem.selectedImage = [UIImage imageNamed:@"icon_tab_shouye_highlight"];
    indexNav.tabBarItem.title = @"首页";
    
    
    //附近
    NearController *nearVC = [[NearController alloc] initWithStyle:UITableViewStylePlain];
    UINavigationController *nearNav = [[UINavigationController alloc] initWithRootViewController:nearVC];
    nearNav.tabBarItem.image = [UIImage imageNamed:@"icon_tab_fujin_normal"];
    nearNav.tabBarItem.selectedImage = [UIImage imageNamed:@"icon_tab_fujin_highlight"];
    nearNav.tabBarItem.title = @"附近";
    
    
    //订单
    OrderController * orderVC = [[OrderController alloc] init];
    UINavigationController * orderNaV = [[UINavigationController alloc] initWithRootViewController:orderVC];
    orderNaV.tabBarItem.image = [UIImage imageNamed:@"tab_icon_selection_normal"];
    orderNaV.tabBarItem.selectedImage = [UIImage imageNamed:@"tab_icon_selection_highlight"];
    orderNaV.tabBarItem.title = @"订单";
    
    //我的
    MeController * MeVC = [[MeController alloc] initWithStyle:UITableViewStyleGrouped];
    UINavigationController * MeNaV = [[UINavigationController alloc] initWithRootViewController:MeVC];
    MeNaV.tabBarItem.image = [UIImage imageNamed:@"icon_tab_wode_normal"];
    MeNaV.tabBarItem.selectedImage = [UIImage imageNamed:@"icon_tab_wode_highlight"];
    MeNaV.tabBarItem.title = @"我的";
    
    
    tabVC.viewControllers = @[indexNav,nearNav,orderNaV,MeNaV];
    self.window.rootViewController = tabVC;
    [self.window makeKeyAndVisible];
    return YES;
}



@end
