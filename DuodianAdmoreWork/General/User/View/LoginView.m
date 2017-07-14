//
//  LoginView.m
//  DuodianAdmoreWork
//
//  Created by duodian on 2017/7/13.
//  Copyright © 2017年 duodian. All rights reserved.
//

#import "LoginView.h"
@interface LoginView ()
@property (weak, nonatomic) IBOutlet UITextField *accountTextF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextF;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *forgetPswdBtn;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;
@property (weak, nonatomic) IBOutlet UILabel *logoView;
@end

@implementation LoginView

- (void)awakeFromNib {
    [super awakeFromNib];
    [self initView];
}

- (void)initView {
//    [[ColorGradualTool shareInstance] setGradientBGColorWithView:self.loginBtn frame:self.loginBtn.bounds TopColor:[UIColor colorWithHexString:@"6FD2FA"] bottomColor:[UIColor colorWithHexString:@"60B0F8"]];
    ViewBorderRadius(self.loginBtn, self.loginBtn.height/2, 0.5f, [UIColor colorWithHexString:@"f7f7f7"]);
    ViewBorderRadius(self.accountTextF, self.accountTextF.height/2, 0.5f, [UIColor colorWithHexString:@"f7f7f7"]);
    ViewBorderRadius(self.passwordTextF, self.passwordTextF.height/2, 0.5f, [UIColor colorWithHexString:@"f7f7f7"]);
    [self loadLogoView];
}

- (void) loadLogoView {
    [UIView animateWithDuration:0.1 animations:^{
        self.logoView.transform = CGAffineTransformMakeScale(0, 0);
    }completion:^(BOOL finished) {
        [UIView animateWithDuration:1.5 animations:^{
            self.logoView.transform = CGAffineTransformMakeScale(1, 1);
        }];
    }];
}

- (IBAction)forgetPwdClicked:(id)sender {
    if (self.forgetPwdBlock) {
        self.forgetPwdBlock();
    }
}


- (IBAction)registerClicked:(id)sender {
    if (self.registerBlock) {
        self.registerBlock();
    }
}

@end
