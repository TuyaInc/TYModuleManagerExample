//
//  TYModuleExampleListViewController.m
//  TYModuleManagerExample
//
//  Created by 朱盼 on 2018/9/25.
//

#import "TYModuleExampleListViewController.h"

#import "TYConfigExampleViewController.h"

static NSString * const kTYModuleExampleCellIdentifier = @"kTYModuleExampleCellIdentifier";

@interface TYModuleExampleListViewController ()

@property (nonatomic, strong) NSArray *data;

@end

@implementation TYModuleExampleListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        
    self.data = @[
                  @"config信息",
                  @"Route用法",
                  @"Tab用法",
                  @"Notify用法",
                  @"Application用法",
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
    if (indexPath.row == 0) {   // config
        TYConfigExampleViewController *vc = [TYConfigExampleViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.row == 1) { // route
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"TYServicesExample" bundle:[NSBundle mainBundle]];
        UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"kRouteExample"];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.row == 2) { // tab
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"TYServicesExample" bundle:[NSBundle mainBundle]];
        UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"kTabExample"];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.row == 3) { // notify
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"TYServicesExample" bundle:[NSBundle mainBundle]];
        UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"kNotifyExample"];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.row == 4) { // application
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"TYServicesExample" bundle:[NSBundle mainBundle]];
        UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"kApplicationExample"];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
