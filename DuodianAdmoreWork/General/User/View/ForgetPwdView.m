//
//  ForgetPwdView.m
//  DuodianAdmoreWork
//
//  Created by duodian on 2017/7/13.
//  Copyright © 2017年 duodian. All rights reserved.
//

#import "ForgetPwdView.h"
@interface ForgetPwdView ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *widthConstraint;
@property (weak, nonatomic) IBOutlet UIButton *gainCodeBtn;
@property (weak, nonatomic) IBOutlet UIButton *submitBtn;

@end

@implementation ForgetPwdView
- (void)awakeFromNib {
    [super awakeFromNib];
    [self initView];
}

- (IBAction)gainCodeClicked:(id)sender {
    [self loadTimerWithbutton:_gainCodeBtn];
}

- (void)loadTimerWithbutton:(UIButton *)btn{
    btn.userInteractionEnabled = NO;
    __block int timeout = 60; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //没秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout <= 0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                [btn setTitle:@"获取验证码" forState:UIControlStateNormal];
                btn.userInteractionEnabled = YES;
            });
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                NSString *strTime = [NSString stringWithFormat:@"重新获取%ds",timeout];
                [btn setTitle:strTime forState:UIControlStateNormal];
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
}


- (IBAction)backClicked:(id)sender {
    [self endEditing:YES];
    if (self.backBlock) {
        self.backBlock();
    }
}

- (IBAction)submitClicked:(id)sender {
    
}

- (void)initView {
    _widthConstraint.constant = SCREEN_WIDTH * 0.7;
    ViewBorderRadius(_gainCodeBtn, _gainCodeBtn.height/2, 0.5, [UIColor colorWithHexString:@"f7f7f7"]);
    ViewBorderRadius(_submitBtn, _submitBtn.height/2, 0.5, [UIColor colorWithHexString:@"f7f7f7"]);
}
@end
