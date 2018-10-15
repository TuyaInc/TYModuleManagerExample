//
//  TYNotifyModuleImpl.m
//  TYModuleManagerExample
//
//  Created by 朱盼 on 2018/9/28.
//

#import "TYNotifyModuleImpl.h"

#import "TYModule.h"

#import "TYModuleNotifyRegisterProtocol.h"

#import "TYNotifyProtocol.h"

@interface TYNotifyModuleImpl () <TYModuleNotifyRegisterProtocol, TYNotifyProtocol>

@end

@implementation TYNotifyModuleImpl

#pragma mark - <TYModuleNotifyRegisterProtocol>
// notify注册方式一
- (NSArray<NSString *> *)registRespondsNotifies {
    return @[
             NSStringFromSelector(@selector(tyNotifyTest1)),
             NSStringFromSelector(@selector(tyNotifyTest2:)),
             ];
}

#pragma mark - Private
// notify注册方式二
- (void)registNotify2 {
    [[TYModule notifyService] registResponder:self forNotify:@selector(tyNotifyTest2:)];
    // 反复注册也没有影响
}


#pragma mark - <TYNotifyProtocol>
- (void)tyNotifyTest1 {
    // 收到通知1时，会去注册另一个通知
    [self registNotify2];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Notify Example" message:@"this is notify 1 from TYNotifyModuleImpl" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

- (void)tyNotifyTest2:(NSDictionary *)userInfo {
    NSString *msg = @"this is notify 2 message";
    if ([userInfo isKindOfClass:[NSDictionary class]] && [userInfo[@"msg"] isKindOfClass:[NSString class]]) {
        msg = userInfo[@"msg"];
    }
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Notify Example" message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

@end
