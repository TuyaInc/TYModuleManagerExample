//
//  TYModuleManagerExampleImpl.m
//  Pods
//
//  Created by 房栋 on 2018/6/14.
//

#import "TYModuleManagerExampleImpl.h"

#import "TYModuleTestTask1.h"
#import "TYModuleTestTask2.h"

//组件可以考虑给自己加一个编译头放一下
#import <TYModuleManager/TYModulPublic.h>
//#import "TYModulPublic.h"
#import "TYTestViewController.h"


//暂时 可使用不需额外申请的三方组件如下, 客户可以按需使用, 版本号需要跟我们的版本号保持一致
//pod 'SDWebImage/Core','4.2.2'
//pod 'MBProgressHUD', '0.9.2'
//pod 'IQKeyboardManager', '6.0.3'
//pod 'MJRefresh', '3.1.12'
//pod 'SDVersion', '4.3.2'
//pod 'Reachability', '3.2'
//pod 'UICKeyChainStore', '2.1.1'
//pod 'Masonry', '1.1.0'

@interface TYModuleManagerExampleImpl()<TYModuleProtocol>

@end

@implementation TYModuleManagerExampleImpl

#pragma mark -
#pragma mark - TYModuleProtocol
//可以不实现, 这块做的事情
//同步执行 会执行统计时间,如果耗时影响启动 会考虑关闭
- (void)moduleInit {
    
}

//可以不实现,目前这个是空实现,没有用
- (void)moduleDestory {
    
}

#pragma mark -
#pragma mark - TYModuleLifeCycleProtocol
//接收app的生命周期,每个模块可以自己处理
- (void)applicationWillEnterForeground:(UIApplication *)application {
    NSLog(@"log life cycle: %@", NSStringFromSelector(_cmd));
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    NSLog(@"log life cycle: %@", NSStringFromSelector(_cmd));
}

- (void)applicationWillResignActive:(UIApplication *)application {
    NSLog(@"log life cycle: %@", NSStringFromSelector(_cmd));
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    NSLog(@"log life cycle: %@", NSStringFromSelector(_cmd));
}

- (void)applicationWillTerminate:(UIApplication *)application {
    NSLog(@"log life cycle: %@", NSStringFromSelector(_cmd));
}


#pragma mark -
#pragma mark - TYModuleRouterProtocol
NSString *const TYXXXModule_HOSTTEST =  @"host-test";
//NSString *const TYXXXModule_XXXXXXX2 = @"schema1/path1";
//NSString *const TYXXXModule_XXXXXXX3 = @"schema1/path1/path2";
// ⚠️ 注册,该模块需要处理的URL,这个是默认用涂鸦内部的默认schema 实现的 在之后的版本注册会无效化,请使用下面的注册方法
// ⚠️ 该方法注册的路由会默认使用 打包进涂鸦的路由
- (NSArray *)registeUrlForModule {
    return @[
             TYXXXModule_HOSTTEST,
             ];
}


//注册,该模块需要处理的URL, 可自定义schema
- (NSDictionary<NSString *, NSArray<NSString *> *> *)registeUrlForSchema {
    return @{
             @"schema111":@[@"xxxxxxxxxxxxxxx"],
             @"schema222":@[
                     @"host-test2", @"host-test3"
                     ],
             };
}

//统一处理URL事件处理的回调
- (BOOL)handleUrl:(NSString *)url host:(NSString *)host path:(NSString *)path query:(NSDictionary *)query parameters:(NSDictionary *)parameters {
    
    //1.在此之前 会处理好 进来的URL的合法性校验
    //2.各组件可以自己处理一些help method 来优化 出现URL过多,代码多的问题
    if ([host isEqualToString:TYXXXModule_HOSTTEST]) {
        //TODO your work
        
        return YES;
    }
    
    return NO;
}

#pragma mark -
#pragma mark - TYModuleServiceProtocol

// ⚠️⚠️⚠️⚠️ 这个方法是当前模块提供给外部进行通信的自定义协议 非涂鸦内部理论上不需要, 使用一段时间看是否有类似需求, 后续会考虑不开放该协议
//- (NSArray<NSValue *> *)registereModuleServices {
//
//    return @[
//             MODULE_ServiceBuildValue(TYServiceTest, TYTestProtocol)
//             ];
//}

#pragma mark -
#pragma mark - TYModuleTabProtocol
//注册当前模块被作为TAB 存在着提供的输出能力
//如果希望你的模块成为一个tab 请注册以下方法
- (TYModuleTabMapping)registereModuleTab {
    bool showBadge = false;  //暂时可以忽略 直接false即可
    bool selected = false;   //暂时可以忽略 直接false即可
    
    NSString *viewController = @"ReplaceYourVCName";
    NSString *pageTitle = @"ReplaceYourPageTitle";
    NSString *normalImage = @"ReplaceYourNormalImage";
    NSString *selectedImage = @"ReplaceYourSelectedImage";
    
    TYModuleTabMapping mapping = {
        showBadge,
        selected,
        viewController,
        pageTitle,
        normalImage,
        selectedImage
    };
    
    return mapping;
}

#pragma mark -
#pragma mark - TYModuleTaskProtocol
//注册需要执行的启动任务
- (NSArray<Class<TYTaskProtocol>> *)registeTasksForModule {
    return @[
             [TYModuleTestTask1 class], [TYModuleTestTask2 class]
             ];
}

#pragma mark -
#pragma mark - TYModuleLoginLifeCycleProtocol


//下面三个是 用户登录状态变化的回调 请根据需要使用
- (void)userDidLoginSuccess {
    //登录成功
}
- (void)userDidLogOut {
    //用户登出
}
- (void)userDidForcedLogOut {
    //用户被强制登出, session过期等..
}

#pragma mark -
#pragma mark - TYModuleMainLoginProtocol
//登录模块返回一个需要被加载的登录的vc class
- (Class)mainLoginViewController {
    return [TYTestViewController class];
//    return [YourLoginGuideClass class];
}

@end
