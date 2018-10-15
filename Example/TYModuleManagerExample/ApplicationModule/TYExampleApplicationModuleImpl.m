//
//  TYExampleApplicationModuleImpl.m
//  TYModuleManagerExample_Example
//
//  Created by 朱盼 on 2018/9/25.
//  Copyright © 2018 Tuya. All rights reserved.
//

#import "TYExampleApplicationModuleImpl.h"

#import "TYModuleManager.h"

@implementation TYExampleApplicationModuleImpl

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(nullable NSDictionary *)launchOptions config:(id<TYModuleConfigBlueprint>)config {

    [self reloadRootViewController];
    
    return YES;
}

- (void)reloadRootViewController {
    // 你可以在这里处理一些自己的逻辑，并加载正确的rootVC
    // 此处简单示意根据用户是否登录显式不同的rootVC
    UIViewController *rootVC;
    BOOL userDidLogin = YES;
    if (!userDidLogin) {
        UIViewController *loginVC = [UIViewController new];
        loginVC.view.backgroundColor = [UIColor whiteColor];
        loginVC.title = @"login";
        UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:loginVC];
        rootVC = navi;
    } else {
        // 通过 TYModule 提供的快捷方法获取 tabService，并通过 tabService 获取 tabBarController
        UIViewController *tabVC = [TYModule tabService].tabBarController;
        rootVC = tabVC;
    }
    
    [self resetRootViewController:rootVC];
}

#pragma mark - <UIApplicationDelegate>

#pragma mark - Push Notifications
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken NS_AVAILABLE_IOS(3_0) {
    // TODO: resister push token success
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error NS_AVAILABLE_IOS(3_0) {
    // TODO: resister push token failure
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler {
    // TODO: do anything you want
}

@end
