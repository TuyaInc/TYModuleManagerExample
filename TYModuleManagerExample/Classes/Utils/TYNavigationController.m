//
//  TYNavigationController.m
//  TYModuleManagerExample
//
//  Created by 朱盼 on 2018/9/25.
//

#import "TYNavigationController.h"

@interface TYNavigationController ()

@end

@implementation TYNavigationController

// 根据层级隐藏tabbar
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    viewController.hidesBottomBarWhenPushed = self.childViewControllers.count > 0;
    
    [super pushViewController:viewController animated:animated];
    
    viewController.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@""
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:nil];
}

@end
