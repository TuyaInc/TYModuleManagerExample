//
//  TYModuleTabbarUtilProtocol.h
//  Pods
//
//  Created by 房栋 on 2018/5/22.
//

#import <Foundation/Foundation.h>

@protocol TYModuleTabbarUtilProtocol <NSObject>
+ (void)showTabbarWithModuleImpl:(Class)module;
+ (void)popToRootViewController;
+ (BOOL)isRootViewController:(UIViewController *)controller;
+ (void)showTabbarWithIndex:(NSInteger)index target:(UIViewController *)mainViewController;
@end
