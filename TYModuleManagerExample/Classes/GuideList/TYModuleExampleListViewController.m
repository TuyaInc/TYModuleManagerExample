//
//  TYModuleExampleListViewController.m
//  TYModuleManagerExample
//
//  Created by 朱盼 on 2018/9/25.
//

#import "TYModuleExampleListViewController.h"

#import "TYConfigExampleViewController.h"

static NSString * const kTYModuleExampleCellIdentifier = @"kTYModuleExampleCellIdentifier";

static NSString *const kTYModuleExampleTypeConfig = @"Config信息";
static NSString *const kTYModuleExampleTypeRoute = @"Route用法";
static NSString *const kTYModuleExampleTypeTab = @"Tab用法";
static NSString *const kTYModuleExampleTypeNotify = @"Notify用法";
static NSString *const kTYModuleExampleTypeApplication = @"Application用法";

@interface TYModuleExampleListViewController ()

@property (nonatomic, strong) NSArray *data;

@end

@implementation TYModuleExampleListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        
    self.data = @[
                  kTYModuleExampleTypeConfig,
                  kTYModuleExampleTypeRoute,
                  kTYModuleExampleTypeTab,
//                  kTYModuleExampleTypeNotify,
                  kTYModuleExampleTypeApplication,
                  ];
    
    self.clearsSelectionOnViewWillAppear = YES;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kTYModuleExampleCellIdentifier];
}

#pragma mark - <UITableViewDataSource>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTYModuleExampleCellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = self.data[indexPath.row];
    
    return cell;
}

#pragma mark - <UITableViewDelegate>
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == [_data indexOfObject:kTYModuleExampleTypeConfig]) {   // config
        TYConfigExampleViewController *vc = [TYConfigExampleViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.row == [_data indexOfObject:kTYModuleExampleTypeRoute]) { // route
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"TYServicesExample" bundle:[NSBundle mainBundle]];
        UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"kRouteExample"];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.row == [_data indexOfObject:kTYModuleExampleTypeTab]) { // tab
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"TYServicesExample" bundle:[NSBundle mainBundle]];
        UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"kTabExample"];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.row == [_data indexOfObject:kTYModuleExampleTypeNotify]) { // notify
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"TYServicesExample" bundle:[NSBundle mainBundle]];
        UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"kNotifyExample"];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.row == [_data indexOfObject:kTYModuleExampleTypeApplication]) { // application
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"TYServicesExample" bundle:[NSBundle mainBundle]];
        UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"kApplicationExample"];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
