//
//  EntranceController.m
//  DuodianAdmoreWork
//
//  Created by duodian on 2017/7/13.
//  Copyright © 2017年 duodian. All rights reserved.
//

#import "EntranceController.h"
#import "LoginView.h"
#import "RegisterView.h"
#import "ForgetPwdView.h"
#import "PerfectInfoView.h"
#import "BaseNavController.h"
#import "MMDrawerController.h"
#import "LeftController.h"

@interface EntranceController ()
@property (nonatomic,strong) LoginView *loginView;
@property (nonatomic,strong) RegisterView *registerView;
@property (nonatomic,strong) ForgetPwdView *forgetPwdView;
@property (nonatomic,strong) PerfectInfoView *perfectInfoView;
@property (nonatomic,strong) UIView *transView;
@end

@implementation EntranceController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [[ColorGradualTool shareInstance] setGradientBGColorWithView:self.view frame:self.view.bounds TopColor:[UIColor colorWithHexString:@"6FD2FA"] bottomColor:[UIColor colorWithHexString:@"60B0F8"]];
    UIImageView *bgView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    bgView.image = [UIImage imageNamed:@"BG9"];
    [self.view addSubview:bgView];
    [self.view addSubview:self.transView];
    [self.view addSubview:self.loginView];
}


#pragma mark 懒加载

- (LoginView *)loginView {
    if (!_loginView) {
        _loginView = [[[NSBundle mainBundle] loadNibNamed:@"LoginView" owner:nil options:nil] lastObject];
        _loginView.backgroundColor = [UIColor clearColor];
        _loginView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        __weak typeof(self) ws = self;
        _loginView.registerBlock = ^{
            [ws.view addSubview:ws.registerView];
            [UIView animateWithDuration:0.5 animations:^{
                ws.loginView.frame = CGRectMake(-SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
                ws.registerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
            } completion:^(BOOL finished) {
                
            }];
        };
        
        _loginView.forgetPwdBlock = ^{
            [ws.view addSubview:ws.forgetPwdView];
            [UIView animateWithDuration:0.5 animations:^{
                ws.loginView.frame = CGRectMake(-SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
                ws.forgetPwdView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
            } completion:^(BOOL finished) {
                
            }];
        };
        
        _loginView.loginBlock = ^{
            [SVProgressHUD showWithStatus:@"正在登陆"];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [SVProgressHUD dismiss];
                [ws initVC];
            });
        };
    }
    return _loginView;
}

- (RegisterView *)registerView {
    if (!_registerView) {
        _registerView = [[[NSBundle mainBundle] loadNibNamed:@"RegisterView" owner:nil options:nil] lastObject];
        _registerView.frame = CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        _registerView.backgroundColor = [UIColor clearColor];
        __weak typeof(self) ws = self;
        _registerView.backBlock = ^{
            [UIView animateWithDuration:0.5 animations:^{
                ws.loginView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
                ws.registerView.frame = CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
            } completion:^(BOOL finished) {
                _registerView = nil;
            }];
            
        };
        _registerView.nextBlock = ^{
            [ws.view addSubview:ws.perfectInfoView];
            [UIView animateWithDuration:0.5 animations:^{
                ws.perfectInfoView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
                ws.registerView.frame = CGRectMake(-SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
            } completion:^(BOOL finished) {
            }];
        };
    }
    return _registerView;
}

- (ForgetPwdView *)forgetPwdView {
    if (!_forgetPwdView) {
        _forgetPwdView = [[[NSBundle mainBundle] loadNibNamed:@"ForgetPwdView" owner:nil options:nil] lastObject];
        _forgetPwdView.frame = CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        _forgetPwdView.backgroundColor = [UIColor clearColor];
        __weak typeof(self) ws = self;
        _forgetPwdView.backBlock = ^{
            [UIView animateWithDuration:0.5 animations:^{
                ws.loginView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
                ws.forgetPwdView.frame = CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
            } completion:^(BOOL finished) {
                _forgetPwdView = nil;
            }];
        };
    }
    return _forgetPwdView;
}

- (PerfectInfoView *)perfectInfoView {
    if (!_perfectInfoView) {
        _perfectInfoView = [[[NSBundle mainBundle] loadNibNamed:@"PerfectInfoView" owner:nil options:nil] lastObject];
        _perfectInfoView.frame = CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        _perfectInfoView.backgroundColor = [UIColor clearColor];
        __weak typeof(self) ws = self;
        _perfectInfoView.backBlock = ^{
            [UIView animateWithDuration:0.5 animations:^{
                ws.registerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
                ws.perfectInfoView.frame = CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
            } completion:^(BOOL finished) {
                _perfectInfoView = nil;
            }];
        };
        
    }
    return _perfectInfoView;
}

- (UIView *)transView {
    if (!_transView) {
        _transView = [[UIView alloc] initWithFrame:self.view.bounds];
        _transView.backgroundColor = [UIColor blackColor];
        _transView.alpha = 0.3;
    }
    return _transView;
}

- (void)initVC {
    
    
    BaseNavController *leftNav = [[BaseNavController alloc] initWithRootViewController:[[LeftController alloc] init]];
    MMDrawerController *drawVC = [[MMDrawerController alloc] initWithCenterViewController:[[BaseNavController alloc] initWithRootViewController:[[BaseViewController alloc] init]] leftDrawerViewController:leftNav];
    drawVC.maximumLeftDrawerWidth = SCREEN_WIDTH*2/3;
    [drawVC setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [drawVC setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    
    typedef void (^Animation)(void);
    UIWindow* window = [UIApplication sharedApplication].keyWindow;
    
//    drawVC.modalTransitionStyle = 2;
    drawVC.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    Animation animation = ^{
        BOOL oldState = [UIView areAnimationsEnabled];
        [UIView setAnimationsEnabled:NO];
        window.rootViewController = drawVC;
        [UIView setAnimationsEnabled:oldState];
    };
    
    [UIView transitionWithView:window
                      duration:1.0f
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:animation
                    completion:nil];
}

@end
