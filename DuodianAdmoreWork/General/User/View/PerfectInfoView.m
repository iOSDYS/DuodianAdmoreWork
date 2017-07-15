//
//  PerfectInfoView.m
//  DuodianAdmoreWork
//
//  Created by duodian on 2017/7/14.
//  Copyright © 2017年 duodian. All rights reserved.
//

#import "PerfectInfoView.h"
@interface PerfectInfoView ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *widthConstraint;
@property (weak, nonatomic) IBOutlet UIButton *gainCodeBtn;
@property (weak, nonatomic) IBOutlet UIButton *submitBtn;
@end

@implementation PerfectInfoView
- (void)awakeFromNib {
    [super awakeFromNib];
    [self initView];
}

- (IBAction)backClicked:(id)sender {
    [self endEditing:YES];
    if (self.backBlock) {
        self.backBlock();
    }
}

- (void)initView {
    _widthConstraint.constant = SCREEN_WIDTH * 0.7;
    ViewBorderRadius(_gainCodeBtn, _gainCodeBtn.height/2, 0.5, [UIColor colorWithHexString:@"f7f7f7"]);
    ViewBorderRadius(_submitBtn, _submitBtn.height/2, 0.5, [UIColor colorWithHexString:@"f7f7f7"]);
}


@end
