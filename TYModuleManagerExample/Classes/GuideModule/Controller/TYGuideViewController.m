//
//  TYGuideViewController.m
//  TYModuleManagerExample
//
//  Created by 朱盼 on 2018/9/25.
//

#import "TYGuideViewController.h"

#import "TYModuleExampleListViewController.h"

static NSString *const kTYGuideCellIdentifier = @"kTYGuideCellIdentifier";

@interface TYGuideViewController ()

@property (nonatomic, strong) NSArray *data;

@end

@implementation TYGuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.data = @[@"基础服务使用方法"];

    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kTYGuideCellIdentifier];
}

#pragma mark - <UITableViewDataSource>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTYGuideCellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = self.data[indexPath.row];
    
    return cell;
}


#pragma mark - <UITableViewDelegate>
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:self.tableView.indexPathForSelectedRow animated:YES];
    
    if (indexPath.row == 0) {
        TYModuleExampleListViewController *vc = [TYModuleExampleListViewController new];
        [self.navigationController pushViewController:vc animated:YES];
        
    }
}

@end
