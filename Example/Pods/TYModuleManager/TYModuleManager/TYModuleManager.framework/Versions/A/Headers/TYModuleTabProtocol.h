//
//  TYModuleTabProtocol.h
//  Pods
//
//  Created by 房栋 on 2018/3/21.
//

#import <Foundation/Foundation.h>

struct TYModuleTabMapping {
    bool showBadge;
    bool selected;

    __unsafe_unretained NSString *viewController;
    __unsafe_unretained NSString *pageTitle;
    __unsafe_unretained NSString *normalImage;
    __unsafe_unretained NSString *selectedImage;
};

typedef struct TYModuleTabMapping TYModuleTabMapping;

@protocol TYModuleTabProtocol <NSObject>

@optional

//注册当前模块被作为TAB 存在着提供的输出能力
- (TYModuleTabMapping)registerModuleTab;
@end
