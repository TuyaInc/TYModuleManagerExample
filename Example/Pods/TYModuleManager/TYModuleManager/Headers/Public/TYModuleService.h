//
//  TYModuleService.h
//  Pods
//
//  Created by 房栋 on 2018/3/27.
//

#import <Foundation/Foundation.h>

#import "TYMainViewControllerProtocol.h"

@interface TYModuleService : NSObject

+ (id _Nullable )moduleServiceForProtocol:(Protocol * _Nonnull)protocol;

+ (id<TYMainViewControllerProtocol> _Nullable )mainViewController;

+ (void)moduleServiceResetRoot:(UIViewController * _Nullable)viewController;

+ (void)moduleServiceResetMain;
@end
