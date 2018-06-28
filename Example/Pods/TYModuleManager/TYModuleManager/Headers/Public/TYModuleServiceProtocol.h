//
//  TYModuleServiceProtocol.h
//  Pods
//
//  Created by 房栋 on 2018/3/20.
//

#import <Foundation/Foundation.h>

struct TYModuleServiceMapping {
    __unsafe_unretained NSString *servicesName;
    __unsafe_unretained Protocol *servicesProtocol;
};

typedef struct TYModuleServiceMapping TYModuleServiceMapping;

@protocol TYModuleServiceProtocol <NSObject>

@optional
- (NSArray<NSValue *> *_Nullable)registerModuleServices;
@end
