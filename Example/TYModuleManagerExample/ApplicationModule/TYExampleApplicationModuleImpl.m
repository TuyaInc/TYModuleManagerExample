//
//  TYExampleApplicationModuleImpl.m
//  TYModuleManagerExample_Example
//
//  Created by 朱盼 on 2018/9/25.
//  Copyright © 2018 Tuya. All rights reserved.
//

#import "TYExampleApplicationModuleImpl.h"

#import "TYModuleManager.h"
#import "TYNavigationController.h"

@implementation TYExampleApplicationModuleImpl

- (UIWindow *)window {
    if (![UIApplication sharedApplication].delegate.window) {
        UIWindow *win = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        win.backgroundColor = [UIColor whiteColor];
        [UIApplication sharedApplication].delegate.window = win;
    }
    return [UIApplication sharedApplication].delegate.window;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(nullable NSDictionary *)launchOptions {

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

- (void)resetRootViewController:(__kindof UIViewController *)rootVC {
    
    UIViewController *vc;
    if ([rootVC isKindOfClass:[UITabBarController class]] || [rootVC isKindOfClass:[UINavigationController class]]) {
        vc = rootVC;
    } else {
        TYNavigationController *navi = [[TYNavigationController alloc] initWithRootViewController:rootVC];
        navi.navigationBarHidden = YES;
        vc = navi;
    }
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];
}


#pragma mark - <UIApplicationDelegate>


@end
