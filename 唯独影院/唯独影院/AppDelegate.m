//
//  AppDelegate.m
//  唯独影院
//
//  Created by 史建伟 on 2019/6/6.
//  Copyright © 2019年 史建伟. All rights reserved.
//

#import "AppDelegate.h"
#import "MovieViewController.h"
#import "CinemaViewController.h"
#import "MyViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    MovieViewController *MovieVC=[[MovieViewController alloc]init];
    UINavigationController *MovieNav=[[UINavigationController alloc]initWithRootViewController:MovieVC];
    MovieNav.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"电影" image:[UIImage imageNamed:@"com_icon_film_fault_xxhdpi"] tag:1];
    
    CinemaViewController *CinemaVC=[[CinemaViewController alloc]init];
    UINavigationController *CinemaNav=[[UINavigationController alloc]initWithRootViewController:CinemaVC];
    CinemaNav.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"影院" image:[UIImage imageNamed:@"com_icon_cinema_default_xxhdpi"] tag:2];
    
    MyViewController *MyVC=[[MyViewController alloc]init];
    UINavigationController *MyNav=[[UINavigationController alloc]initWithRootViewController:MyVC];
    MyNav.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"我的" image:[UIImage imageNamed:@"com_icon_my_default_xxhdpi"] tag:3];
    
    UITabBarController *tabbar=[[UITabBarController alloc]init];
    
    tabbar.viewControllers=@[MovieNav,CinemaNav,MyNav];
    
    self.window.rootViewController=tabbar;
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
