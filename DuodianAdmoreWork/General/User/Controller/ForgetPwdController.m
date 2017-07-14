//
//  ForgetPwdController.m
//  DuodianAdmoreWork
//
//  Created by duodian on 2017/7/13.
//  Copyright © 2017年 duodian. All rights reserved.
//

#import "ForgetPwdController.h"
#import "AutoCodeView.h"

@interface ForgetPwdController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneTextF;
@property (weak, nonatomic) IBOutlet UITextField *picCodeTextF;
@property (weak, nonatomic) IBOutlet AutoCodeView *picAuthVIew;
@property (weak, nonatomic) IBOutlet UILabel *sendSmsCodeLabel;
@property (weak, nonatomic) IBOutlet UIButton *sendSmsCodeBtn;
@property (weak, nonatomic) IBOutlet UITextField *smsCodeTextF;
@property (weak, nonatomic) IBOutlet UIButton * submitInfoBtn;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextF;

@end

@implementation ForgetPwdController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
