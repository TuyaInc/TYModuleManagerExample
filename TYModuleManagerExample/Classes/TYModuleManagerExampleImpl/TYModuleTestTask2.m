//
//  TYModuleTestTask2.m
//  Pods
//
//  Created by 房栋 on 2018/6/20.
//

#import "TYModuleTestTask2.h"

@implementation TYModuleTestTask2
//如果你的启动任务需要有依赖任务先执行的 可注册多个依赖任务

// ⚠️⚠️⚠️⚠️ 程序会执行前检查 是否有 依赖任务成环,或者自身成环, 检测到将直接中断执行,
- (NSArray<NSString *> *)dependencyList {
    return @[@"TYModuleTestTask1"];
}

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
