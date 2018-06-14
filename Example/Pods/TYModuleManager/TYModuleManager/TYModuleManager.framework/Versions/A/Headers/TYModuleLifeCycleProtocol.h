//
//  TYModuleLifeCycleProtocol.h
//  Pods
//
//  Created by 房栋 on 2018/3/20.
//

#import <Foundation/Foundation.h>

@protocol TYModuleLifeCycleProtocol <NSObject>

NS_ASSUME_NONNULL_BEGIN

@optional
- (void)applicationWillEnterForeground:(UIApplication * _Nonnull)application;

- (void)applicationDidBecomeActive:(UIApplication * _Nonnull)application;

- (void)applicationWillResignActive:(UIApplication * _Nonnull)application;

- (void)applicationDidEnterBackground:(UIApplication * _Nonnull)application;

- (void)applicationWillTerminate:(UIApplication * _Nonnull)application;

NS_ASSUME_NONNULL_END

@end
