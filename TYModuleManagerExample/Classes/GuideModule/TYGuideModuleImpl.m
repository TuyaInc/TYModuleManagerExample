//
//  TYExampleModuleImpl.m
//  Pods-TYModuleManagerExample_Example
//
//  Created by 朱盼 on 2018/9/25.
//

#import "TYGuideModuleImpl.h"

#import "TYGuideViewController.h"
#import "TYNavigationController.h"

#import "TYModuleTabRegisterProtocol.h"
#import "TYModuleRouteRegisterProtocol.h"
#import "TYModuleNotifyRegisterProtocol.h"

#import "TYNotifyProtocol.h"

#define UseCustomButton

@interface TYGuideModuleImpl () <TYModuleTabRegisterProtocol, TYModuleRouteRegisterProtocol, TYModuleNotifyRegisterProtocol, TYNotifyProtocol>

@end

@implementation TYGuideModuleImpl

#pragma mark - <TYModuleTabRegisterProtocol>

/*
 为module配置tabItem
 此方法会在 didFinishLaunch 以及手动触发 reload 后回调
 一个module允许配置多个tabItem
 */
- (NSArray<TYTabItemAttribute *> *)registModuleTabItems {
    TYTabItemAttribute *tabAttr = [TYTabItemAttribute new];
    
    // 为tabItem配置viewController，根据需求自己包装navi
    UIViewController *pageVC = [TYGuideViewController new];
    pageVC.title = @"涂鸦向导";
    TYNavigationController *navi = [[TYNavigationController alloc] initWithRootViewController:pageVC];
    tabAttr.viewController = navi;

    UIImage *normalImage = [[UIImage imageNamed:@"tab_guide_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    UIImage *selectImage = [[UIImage imageNamed:@"tab_guide_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
#ifdef UseCustomButton
    // 完全自定义tabButton ↓↓↓↓↓↓
    
    // 创建一个button用于tabItemButton，此处使用UIButton，实际只要是UIControl或其子类就行
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
    button.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    button.contentHorizontalAlignment= UIControlContentHorizontalAlignmentFill;
    button.contentVerticalAlignment = UIControlContentVerticalAlignmentFill;
    button.imageView.contentMode = UIViewContentModeScaleAspectFit;
    button.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [button setImage:selectImage forState:UIControlStateSelected];
    // 这里直接使用 同一张图片+tintColor 配合RenderingMode 的方式简单实现未选中状态的颜色问题，实际请根据需求来
    button.tintColor = [UIColor lightGrayColor];
    [button setImage:normalImage forState:UIControlStateNormal];
    
    /*
     在注册tabItem时，允许传入一个UIControl或其子类作为tabButton，此处以UIButton示例
     UIControl是UIView的子类，所以通过UIView能实现的样式大多都能通过UIControl实现
     */
    tabAttr.customButton = button;
    
    // 被用作customButton的实例，需要实现两个属性
    /*
     1、ty_centerOffset  用于调整customButton的位置
     关于customButton的位置的计算
     customButton.centerY = (tabHeight - safeInsets.bottom)/2.0 + ty_centerOffset.y
     即 垂直方向 在tab除去安全区域(iPhoneX系)外的部分的中心点 基础上进行偏移
     customButton.centerX = systemButton.centerX + ty_contentOffset.x
     即 水平方向 在默认Button的中心点 基础上进行偏移
     */
    button.ty_centerOffset = CGPointMake(0, -20);
    
    /*
     2、ty_hitMask  用于帮助处理超出tabBar部分的异形点击
     如果不设置，则使用默认的点击判断(pointInside & hitTest)
     当用户点击customButton时，会等比例的在ty_hitMask找到对应坐标点位，
     然后取出ty_hitMask图片上该点的alpha值，如果alpha>0.85，则该点可以点击
     所以 ty_hitMask是一张与customButton等比例的图片，可以是纯色图，它的颜色应当包含所有能被点击的部分
     */
    // 此处偷了个懒，直接使用了icon，但是并不建议这么操作，因为icon上透明的部分可能需求上是可以点击的
    button.ty_hitMask = normalImage;

#else
    // 使用系统的tabButton ↓↓↓↓↓↓
    
    // 配置tabItem的icon，可以根据需求自行控制RenderingMode
    // UIImageRenderingModeAlwaysTemplate: 始终将图片作为模板，图片颜色受tintColor影响
    // UIImageRenderingModeAlwaysOriginal: 始终将图片原样显示，图片不受tintColor影响
    // UIImageRenderingModeAutomatic: 根据场景判断图片的rRenderingMode，tabBar上icon为Template
    tabAttr.normalImage = normalImage;
    tabAttr.selectedImage = selectImage;
#endif
    
    // 配置tabItem的title，如果使用customButton且包含title，此处不要设置
    tabAttr.itemTitle = @"涂鸦向导";
    
    return @[tabAttr];
}

#pragma mark - <TYModuleRouteRegisterProtocol>
// Step1: 注册Route
- (NSArray<NSString *> *)registModuleRoutes {
    return @[
             @"TYRouteTest_1",
             @"TYRouteTest_2",
             ];
}

// Step2: 处理Route回调
- (BOOL)handleRouteWithSchema:(NSString *)schema host:(NSString *)host path:(NSString *)path params:(NSDictionary *)params {
    
    // TODO: do anything you want
    
    NSString *message;
    if ([host isEqualToString:@"TYRouteTest_1"]) {
        message = @"this is test 1 message";
    } else if ([host isEqualToString:@"TYRouteTest_2"]) {
        message = @"this is test 2 message";
    } else {
        return NO;
    }
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Route Example" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
    
    return YES;
}

#pragma mark - <TYModuleNotifyRegisterProtocol>
- (NSArray<NSString *> *)registRespondsNotifies {
    return @[
             NSStringFromSelector(@selector(tyNotifyTest1)),
             ];
}

#pragma mark - <TYNotifyProtocol>
- (void)tyNotifyTest1 {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Notify Example" message:@"this is notify 1 from TYGuideModuleImpl" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

@end
