//
//  TYTaskProtocol.h
//  Pods
//
//  Created by 房栋 on 2018/4/11.
//

#import <Foundation/Foundation.h>

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wnullability-declspec"

typedef enum : NSUInteger {
    TYModuleTaskLevelAsync = 0,
    TYModuleTaskLevelTail
} TYModuleTaskLevel;

@protocol TYTaskProtocol <NSObject>

- (void)executeTask;

@optional
- (NSString _Nonnull *)taskName;
//该方法 使用init方法代替效果一样
- (void)initializeForTask;
- (TYModuleTaskLevel)taskLevel;
+ (instancetype _Nonnull)taskInstance;
@end

@interface NSObject (TYAppmModuleTask)

@property(nonatomic, assign) BOOL isTYTaskExecuted;

@property(nonatomic, assign) BOOL isTYTaskDependencyed;

@property (nonatomic, weak)NSDictionary * _Nullable weakLaunchOptions;  

- (void)addDependency:(NSString _Nonnull *)dependencyTaskName;

- (void)addDependencyList:(NSArray<NSString *> _Nonnull *)dependencyTaskNameList;

- (NSArray<NSString *> _Nonnull *)dependencyList;

- (void)setTaskName:(NSString _Nonnull *)taskName;

- (void)setTtaskLevel:(TYModuleTaskLevel)taskLevel;

+ (instancetype _Nonnull)taskInstance;


@end

#pragma clang diagnostic pop
