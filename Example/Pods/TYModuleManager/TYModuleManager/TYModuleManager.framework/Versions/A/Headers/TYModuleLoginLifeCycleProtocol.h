//
//  TYModuleLoginLifeCycleProtocol.h
//  TYModuleManager
//
//  Created by 房栋 on 2018/5/7.
//

#import <Foundation/Foundation.h>

@protocol TYModuleLoginLifeCycleProtocol <NSObject>

@optional
- (void)userDidLoginSuccess;
- (void)userDidLogOut;
- (void)userDidForcedLogOut;
@end
