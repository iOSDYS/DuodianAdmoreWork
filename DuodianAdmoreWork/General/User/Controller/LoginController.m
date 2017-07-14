//
//  LoginController.m
//  DuodianAdmoreWork
//
//  Created by duodian on 2017/7/12.
//  Copyright © 2017年 duodian. All rights reserved.
//

#import "LoginController.h"
#import "RegisterController.h"
#import "AdmoreTool.h"
#import "ForgetPwdController.h"

@interface LoginController ()
@property (weak, nonatomic) IBOutlet UITextField *accountTextF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextF;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *forgetPswdBtn;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;
@property (weak, nonatomic) IBOutlet UILabel *logoView;
@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[AdmoreTool shareInstance] getCurrentLocation];
    
    [[ColorGradualTool shareInstance] setGradientBGColorWithView:self.view frame:self.view.bounds TopColor:[UIColor colorWithHexString:@"6FD2FA"] bottomColor:[UIColor colorWithHexString:@"60B0F8"]];
    
    [self initView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)initView {
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

#pragma mark 界面上的点击事件
- (IBAction)loginBtnClick:(UIButton *)sender {
    if (_accountTextF.text.length == 0) {
        [SVProgressHUD showInfoWithStatus:@"账号不能为空"];
//        return;
    }
    
    self.accountTextF.text = @"test@test.com";
    
    self.passwordTextF.text= @"testtest";
    
    NSString * accout = self.accountTextF.text;
    
//    NSString * password = [[admore_tools getInstance] sha1:self.passwordTextF.text];
    
//    [[admore_tools getInstance] showLoadingWithString:@"正在登陆..." andShowInView:self.view];
    
//    NSString * requestUri = [[admore_tools getInstance] getRequestUrl:@"/api/ios/v1/login"];
//    
//    NSMutableDictionary * postDic = [[admore_tools getInstance] getPostBody];
    
//    [postDic setObject:accout forKey:@"email"];
//    
//    [postDic setObject:password forKey:@"password"];
//    [self initVC];
//    [httpRequestService postWithURLString:requestUri parameters:postDic success:^(NSDictionary *data) {
//        [[admore_tools getInstance] hideLoading];
//        sleep(2);
//        if ([[admore_tools getInstance] checkResponseCode:data]) {
//            NSLog(@"%@" , data);
//            
//            dispatch_async(dispatch_get_main_queue(), ^{
//                NSDictionary * result = [data objectForKey:@"result"];
//                NSString * identifier = [result objectForKey:@"identifier"];
//                NSString * nickName = [result objectForKey:@"nickName"];
//                NSString * userNo = [result objectForKey:@"userNo"];
//                
//                NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
//                [defaults setObject:identifier forKey:@"identifier"];
//                [defaults setObject:nickName forKey:@"nickName"];
//                [defaults setObject:userNo forKey:@"userNo"];
//                [defaults synchronize];
//                [self initVC];
//            });
//            
//        }
//        
//    } failure:^(NSError *error) {
//        [[admore_tools getInstance] showNetError];
//    }];
}

- (IBAction)forgetPswdBtnClick:(UIButton *)sender {
    ForgetPwdController *forgetPwdVC = SB(@"User", @"forgetPwdVC");
    [self.navigationController pushViewController:forgetPwdVC animated:YES];
}

- (IBAction)registerBtnClick:(UIButton *)sender {
    RegisterController *registerVC = SB(@"User", @"registerVC");
    [self.navigationController pushViewController:registerVC animated:YES];
}

@end
