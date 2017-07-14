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

@end

@implementation ForgetPwdView
- (void)awakeFromNib {
    [super awakeFromNib];
    [self initView];
}

- (IBAction)backClicked:(id)sender {
    if (self.backBlock) {
        self.backBlock();
    }
}


- (void)initView {
    _widthConstraint.constant = SCREEN_WIDTH * 0.7;
}
@end
