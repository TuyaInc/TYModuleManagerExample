//
//  TYSmartHouseIndexProtocol.h
//  Pods
//
//  Created by 房栋 on 2018/4/20.
//

#import <Foundation/Foundation.h>

@class TuyaSmartDeviceModel, TuyaSmartGroupModel;

@protocol TYSmartHouseIndexProtocol <NSObject>

- (void)didSelectRowWithModel:(TuyaSmartDeviceModel *)deviceModel groupModel:(TuyaSmartGroupModel *)groupModel;
@end
