//
//  TYNotifyProtocol.h
//  Masonry
//
//  Created by 朱盼 on 2018/9/28.
//

#import <Foundation/Foundation.h>


@protocol TYNotifyProtocol <NSObject>

@optional
- (void)tyNotifyTest1;
- (void)tyNotifyTest2:(NSDictionary *)userInfo;

@end

