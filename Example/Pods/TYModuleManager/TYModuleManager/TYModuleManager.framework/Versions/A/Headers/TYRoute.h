//
//  TYRouteUtil.h
//  TYModuleManager
//
//  Created by 房栋 on 2018/3/23.
//

#import <Foundation/Foundation.h>

@interface TYRoute : NSObject
+ (BOOL)openURL:(NSString * _Nonnull)targetURL;
+ (BOOL)openURL:(NSString * _Nonnull)targetURL parameters:(nullable NSDictionary *)parameters;
@end
