//
//  TYModuleCommonConstant.h
//  TYModuleManager
//
//  Created by 房栋 on 2018/3/23.
//

#ifndef TYModuleCommonConstant_h
#define TYModuleCommonConstant_h

#import "TYModuleManagerContext.h"
#import "TYModuleProtocol.h"

#import "TYModuleCommonConstant.h"

static void *TYModuleManager_module_name_ = &TYModuleManager_module_name_;

#define MODULE_DefaultSchema @"tuyaSmart"

#define MODULE_RouteString(str)  [NSString stringWithFormat:@"%@://%@",  [TYModuleManagerContext sharedInstance].moduleRouteSchema, str];
#define MODULE_EmptyString(str)  (!str || str.length == 0)
#define MODULE_RouteKey(schema_, host_)  [NSString stringWithFormat:@"tuya_route_key_%@_%@_",  schema_, host_]

#define MODULE_ServiceMapping(mapping) [NSValue valueWithBytes:&mapping objCType:@encode(struct TYModuleServiceMapping)]
#define MODULE_ServiceBuildValue(cls, ptl) [NSValue valueWithBytes:&(TYModuleServiceMapping){NSStringFromClass([cls class]), @protocol(ptl)} objCType:@encode(struct TYModuleServiceMapping)]

#define MODULE_ServiceMapping_Empty (TYModuleTabMapping){false,false,nil,nil,nil, nil}

#endif /* TYModuleCommonConstant_h */
