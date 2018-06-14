//
//  TYModuleManagerExampleImpl.m
//  Pods
//
//  Created by 房栋 on 2018/6/14.
//

#import "TYModuleManagerExampleImpl.h"

#import <TYModuleManager/TYModulPublic.h>

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
#pragma mark - TYModuleAppDelegate
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
NSString *const TYXXXModule_XXXXXXX =  @"schema1";
NSString *const TYXXXModule_XXXXXXX2 = @"schema2";
NSString *const TYXXXModule_XXXXXXX3 = @"schema3";

//NSString *const TYXXXModule_XXXXXXX2 = @"schema1/path1";
//NSString *const TYXXXModule_XXXXXXX3 = @"schema1/path1/path2";


//注册,该模块需要处理的URL,这个是默认用涂鸦内部的默认schema 实现的 在之后的版本注册会无效化,请使用下面的注册方法
- (NSArray *)registeUrlForModule {
    
    return @[
             TYXXXModule_XXXXXXX,
             TYXXXModule_XXXXXXX2,
             TYXXXModule_XXXXXXX3
             ];
}


//注册,该模块需要处理的URL, 可自定义schema
- (NSDictionary<NSString *, NSArray<NSString *> *> *)registeUrlForSchema {
    return @{
             @"schema111":@[@"xxxxxxxxxxxxxxx"],
             @"schema222":@[
                     @"schema1", @"schema2"
                     ],
             };
}

//统一处理URL事件处理的回调
- (BOOL)handleUrl:(NSString *)url host:(NSString *)host path:(NSString *)path query:(NSDictionary *)query parameters:(NSDictionary *)parameters {
    
    //1.在此之前 会处理好 进来的URL的合法性校验
    //2.各组件可以自己处理一些help method 来优化 出现URL过多,代码多的问题
    if ([host isEqualToString:TYXXXModule_XXXXXXX]) {
        //xxx
        
        return YES;
    }
    else if ([host isEqualToString:TYXXXModule_XXXXXXX2]) {
        //xxx
        return YES;
    }
    
    return NO;
}

#pragma mark -
#pragma mark - TYModuleServiceProtocol

//- (NSArray<NSValue *> *)registereModuleServices {
//
//    return @[
//             MODULE_ServiceBuildValue(TYServiceTest, TYTestProtocol)
//             ];
//}

#pragma mark -
#pragma mark - TYModuleTabProtocol
- (TYModuleTabMapping)registereModuleTab {
    bool showBadge = false;
    bool selected = false;
    
    NSString *viewController = @"viewController";
    NSString *pageTitle = @"pageTitle";
    NSString *normalImage = @"normalImage";
    NSString *selectedImage = @"selectedImage";
    
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
//- (NSArray<Class<TYTaskProtocol>> *)registeTasksForModule {
//    //, [TYTask10 class], [TYTask11 class], [TYTask12 class]   这三个互相成环
//    //, [TYTask13 class]  与自己成环
//    return @[
//             [TYTask1 class], [TYTask2 class], [TYTask7 class], [TYTask8 class]
//             ];
//}

@end
