//
//  RegisterController.m
//  DuodianAdmoreWork
//
//  Created by duodian on 2017/7/12.
//  Copyright © 2017年 duodian. All rights reserved.
//

#import "RegisterController.h"

@interface RegisterController ()
@property (weak, nonatomic) IBOutlet UIButton *goContinueBtn;
@property (weak, nonatomic) IBOutlet UITextField *nicknameTextF;
@property (weak, nonatomic) IBOutlet UITextField *registerEmailTextF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextF;
@property (weak, nonatomic) IBOutlet UITextField *passwordAgainTextF;
@end

@implementation RegisterController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"注册";
}

@end
