//
//  TYModuleManagerContext.h
//  Pods
//
//  Created by 房栋 on 2018/5/22.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "TYModuleTabbarUtilProtocol.h"
#import "TYModuleProtocol.h"

@protocol TYModuleProtocol;

@interface TYModuleManagerContext : NSObject
+ (instancetype)sharedInstance;

@property (nonatomic, copy) NSString                                                    *moduleRouteSchema;

@property (nonatomic) Class<TYModuleTabbarUtilProtocol>                                 tabbarUtilClass;
@property (nonatomic) Class<UITabBarControllerDelegate>                                 tabBarControllerClass;

@property (nonatomic, strong) id<UITabBarControllerDelegate>                            tabBarControllerInstance;


@property (nonatomic, strong) NSMutableDictionary<NSString *, id<TYModuleProtocol>>     *modulesMap;
@property (nonatomic, strong) NSMutableArray<NSString *>                                *tabModules;

@end
