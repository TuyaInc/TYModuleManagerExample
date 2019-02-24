//
//  TYConfigExampleViewController.m
//  TYModuleManagerExample
//
//  Created by 朱盼 on 2018/9/29.
//

#import "TYConfigExampleViewController.h"

#import "TYModuleManager.h"

@interface TYConfigExampleViewController ()

@property (nonatomic, strong) NSArray *keyDataArr;

@end

@implementation TYConfigExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:self.tableView.frame style:UITableViewStyleGrouped];
    self.title = @"Config信息";
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    _keyDataArr = @[
                    @"buildModules",
                    @"applicationService",
                    @"moduleOnTabBar",
                    @"tabSelectedModule",
                    ];
}

#pragma mark - <UITableViewDataSource>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _keyDataArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSString *key = _keyDataArr[section];
    id<TYModuleConfigBlueprint> configService = [TYModule configService];
    SEL sel = NSSelectorFromString(key);
    if ([configService respondsToSelector:sel]) {
        id value = [configService performSelector:sel];
        if ([value isKindOfClass:[NSArray class]]) {
            NSArray *arr = value;
            return arr.count + 1;
        } else {
            return 2;
        }
    } else {
        return 1;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (indexPath.row == 0) {
        cell.textLabel.text = _keyDataArr[indexPath.section];
        cell.textLabel.textColor = [UIColor darkTextColor];
    } else {
        NSString *key = _keyDataArr[indexPath.section];
        NSObject *configService = [TYModule configService];
        id value = [configService valueForKey:key];
        if ([value isKindOfClass:[NSArray class]]) {
            NSArray *arr = value;
            Class cls = arr[indexPath.row-1];
            cell.textLabel.text = NSStringFromClass(cls);
        } else if ([value isKindOfClass:[NSString class]]) {
            NSString *str = value;
            cell.textLabel.text = str;
        } else {
            Class cls = value;
            cell.textLabel.text = NSStringFromClass(cls);
        }
        
        cell.textLabel.textColor = [UIColor darkGrayColor];
        cell.textLabel.text = [NSString stringWithFormat:@"%@%@", @"-> ", cell.textLabel.text];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}


@end
