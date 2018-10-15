//
//  TYAppDelegate.m
//  TYModuleManagerExample
//
//  Created by isfang on 06/14/2018.
//  Copyright (c) 2018 isfang. All rights reserved.
//

#import "TYAppDelegate.h"

#import "TYModuleManager.h"

@implementation TYAppDelegate

/*
 不要在 AppDelegate 中写任何与你业务相关的代码
 可以写用于测试的代码，也可以写涂鸦sdk的key、scret相关的注册代码
 因为 AppDelegate 属于工程，涂鸦App的工程中已经包含一份 AppDelegate
 你在 AppDelegate 中写的代码在打包时将无法合并到涂鸦App的工程中
 如果有需要，建议创建单独的 YourApplicationModule 模块 及单独工程
 并在此模块内实现你需要的 UIApplicationDelegate 方法
 然后将该 YourApplicationModule 配置到你其它工程的 config_modules.json 的 "appDelegate"项
 e.g.  "appDelegate": "YourApplicationModule"
 */

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 调用TYModuleManager，启动模块化加载
    // TYModuleManager将在模块化加载完成以后，调用 YourApplicationModule
    // 你可以在 YourApplicationModule 完成你的其它任务
    
    return [[TYModuleManager sharedInstance] application:application didFinishLaunchingWithOptions:launchOptions];
}

- (BOOL)respondsToSelector:(SEL)aSelector {
    return [super respondsToSelector:aSelector] || [[TYModule applicationService] respondsToSelector:aSelector];
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    return [[TYModule applicationService] respondsToSelector:aSelector] ? [TYModule applicationService] : nil;
}

/*
 开发阶段如果需要其它回调可以直接添加
 但是最终产出包时，这里的代码都不会打到包里
 */

@end
