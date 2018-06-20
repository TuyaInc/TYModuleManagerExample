//
//  TYModuleTestTask1.m
//  Pods
//
//  Created by 房栋 on 2018/6/20.
//

#import "TYModuleTestTask1.h"

@implementation TYModuleTestTask1

//如果你的启动任务不需要有依赖任务的那么直接不实现即可
//- (NSArray<NSString *> *)dependencyList {
//    return @[@"TYTask3", @"TYTask4"];
//}

//该方法 使用init方法代替效果一样
- (void)initializeForTask {
    NSLog(@"initializeForTask: %@ in %@", NSStringFromSelector(_cmd), NSStringFromClass([self class]));
}

//在此处执行耗时操作
- (void)executeTask {
    NSLog(@"executeTask: %@ in %@", NSStringFromSelector(_cmd), NSStringFromClass([self class]));
}

//返回该启动任务的等级

//TYModuleTaskLevelAsync 异步启动执行     不实现默认为TYModuleTaskLevelAsync
//TYModuleTaskLevelTail  启动后在闲置 队列执行的任务
// ⚠️ 同步执行的任务 不开放给组件,有需要的话 需要单独联系我们这边的技术人员
- (TYModuleTaskLevel)taskLevel {
    return TYModuleTaskLevelTail;
}

@end
