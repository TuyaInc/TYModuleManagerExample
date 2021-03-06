//
//  YourModuleImpl.m
//  TYModuleManagerExample_Example
//
//  Created by 朱盼 on 2018/9/25.
//  Copyright © 2018 Tuya. All rights reserved.
//

#import "YourModuleImpl.h"

#import "TYModuleTabRegisterProtocol.h"

#import "TYNavigationController.h"
#import "UIViewController+TYNavigation.h"


@interface YourModuleImpl () <TYModuleTabRegisterProtocol>

@end

@implementation YourModuleImpl

/**
 为module配置tabItem
 */
- (NSArray<TYTabItemAttribute *> *)registModuleTabItems {
    TYTabItemAttribute *tabAttr = [TYTabItemAttribute new];
    
    // 为tabItem配置viewController，根据需求自己包装navi
    UIViewController *pageVC = [UIViewController new];
    pageVC.title = @"YourPage";
    UINavigationController *navi = [[TYNavigationController alloc] initWithRootViewController:pageVC];
    tabAttr.viewController = navi;
    
    // 配置tabItem的icon，可以根据需求自行控制RenderingMode
    // UIImageRenderingModeAlwaysTemplate: 始终将图片作为模板，图片颜色受tintColor影响
    // UIImageRenderingModeAlwaysOriginal: 始终将图片原样显示，图片不受tintColor影响
    // UIImageRenderingModeAutomatic: 根据场景判断图片的rRenderingMode，tabBar上icon为Template
    tabAttr.normalImage = [[UIImage imageNamed:@"YourTabIcon"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    tabAttr.selectedImage = [[UIImage imageNamed:@"YourTabIcon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 配置tabItem的title
    tabAttr.itemTitle = @"your_tab";
    
    return @[tabAttr];
}


@end
