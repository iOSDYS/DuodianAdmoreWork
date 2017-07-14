//
//  RegisterView.m
//  DuodianAdmoreWork
//
//  Created by duodian on 2017/7/13.
//  Copyright © 2017年 duodian. All rights reserved.
//

#import "RegisterView.h"
@interface RegisterView ()
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;
@end

@implementation RegisterView

- (void)awakeFromNib {
    [super awakeFromNib];
    [self initView];
}

- (void)initView {
    ViewBorderRadius(self.nextBtn, self.nextBtn.height/2, 0.5f, [UIColor colorWithHexString:@"f7f7f7"]);
}

- (IBAction)backClicked:(id)sender {
    if (self.backBlock) {
        self.backBlock();
    }
}

@end
