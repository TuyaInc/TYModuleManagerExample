//
//  TYNotifyExampleViewController.m
//  TYModuleManager
//
//  Created by 朱盼 on 2018/9/28.
//

#import "TYNotifyExampleViewController.h"

#import "TYModule.h"

@interface TYNotifyExampleViewController ()

@property (unsafe_unretained, nonatomic) IBOutlet UITextField *triggerNotifyField;
@property (unsafe_unretained, nonatomic) IBOutlet UITextField *notifyMessageField;

@end

@implementation TYNotifyExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)setupUI {
    UILabel *tipLabel = [UILabel new];
    tipLabel.text = @"✏️";
    [tipLabel sizeToFit];
    self.triggerNotifyField.leftView = tipLabel;
    self.triggerNotifyField.leftViewMode = UITextFieldViewModeAlways;

    
    UILabel *tipLabel2 = [UILabel new];
    tipLabel2.text = @"📨";
    [tipLabel2 sizeToFit];
    self.notifyMessageField.leftView = tipLabel2;
    self.notifyMessageField.leftViewMode = UITextFieldViewModeAlways;
}

#pragma mark - <UITableViewDelegate>
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
    
    NSString *sel = self.triggerNotifyField.text;
    
    if (sel && indexPath.section == self.tableView.numberOfSections - 1) {
        NSString *msg = self.notifyMessageField.text;
        [[TYModule notifyService] triggerNotify:NSSelectorFromString(sel) withUserInfo:@{@"msg": msg}];
    }
}

@end
