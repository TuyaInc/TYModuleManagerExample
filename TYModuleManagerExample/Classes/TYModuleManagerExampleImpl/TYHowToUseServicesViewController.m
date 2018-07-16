//
//  TYHowToUseServicesViewController.m
//  Pods
//
//  Created by 房栋 on 2018/7/16.
//

#import "TYHowToUseServicesViewController.h"

#import "TYModuleService.h"
#import "TYSmartHouseIndexProtocol.h"

@interface TYHowToUseServicesViewController ()

@end

@implementation TYHowToUseServicesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    id<TYSmartHouseIndexProtocol> impl = [TYModuleService moduleServiceForProtocol:@protocol(TYSmartHouseIndexProtocol)];
    
    if ([impl respondsToSelector:@selector(didSelectRowWithModel:groupModel:)]) {
        [impl didSelectRowWithModel:nil groupModel:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
