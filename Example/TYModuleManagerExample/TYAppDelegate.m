//
//  TYAppDelegate.m
//  TYModuleManagerExample
//
//  Created by isfang on 06/14/2018.
//  Copyright (c) 2018 isfang. All rights reserved.
//

#import "TYAppDelegate.h"

@implementation TYAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    return YES;
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    
    return YES;
}

#pragma mark Remote Notification

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)err {
    
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    
}

#pragma mark - Local Notification

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    
}


@end
