//
//  TYModuleRouterProtocol.h
//  Pods
//
//  Created by 房栋 on 2018/3/20.
//

#import <Foundation/Foundation.h>

@protocol TYModuleRouterProtocol <NSObject>

@optional
//注册,该模块需要处理的URL,注册基础的链接
- (NSArray<NSString *> * _Nullable)registerUrlForModule;

//统一处理URL事件处理的回调
- (BOOL)handleUrl:(NSString * _Nonnull)url host:(NSString * _Nonnull)host path:(NSString *_Nullable)path query:(NSDictionary *_Nullable)query parameters:(NSDictionary *)parameters;

//注册,该模块需要处理的URL,注册基础的链接
- (NSDictionary<NSString *, NSArray<NSString *> *> *_Nullable)registerUrlForSchema;
@end
