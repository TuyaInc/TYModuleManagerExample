//
//  TYRouteExampleViewController.m
//  TYModuleManagerExample
//
//  Created by 朱盼 on 2018/9/25.
//

#import "TYRouteExampleViewController.h"

#import "TYModule.h"

@interface TYRouteExampleViewController ()

@property (nonatomic, weak) IBOutlet UITextField *triggerRouteField;

@end

@implementation TYRouteExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)setupUI {
    UILabel *tipLabel = [UILabel new];
    tipLabel.text = @"✏️";
    [tipLabel sizeToFit];
    self.triggerRouteField.leftView = tipLabel;
    self.triggerRouteField.leftViewMode = UITextFieldViewModeAlways;
}

#pragma mark - <UITableViewDelegate>
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
    NSString *route = self.triggerRouteField.text;
    if (route && indexPath.section == self.tableView.numberOfSections - 1) {
        [[TYModule routeService] openRoute:route withParams:nil];
    }
}

@end
