//
//  TestController.m
//  DuodianAdmoreWork
//
//  Created by duodian on 2017/7/13.
//  Copyright © 2017年 duodian. All rights reserved.
//

#import "TestController.h"
#import "LoginView.h"
#import "RegisterView.h"

@interface TestController ()
@property (nonatomic,strong) LoginView *firstView;
@property (nonatomic,strong) UIView *secondView;
@end

@implementation TestController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.firstView];
    
    // Do any additional setup after loading the view.
}

- (void)firstClicked {
    
    [self.view addSubview:self.secondView];
    [UIView animateWithDuration:0.5 animations:^{
        self.firstView.frame = CGRectMake(-SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        self.secondView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);

    } completion:^(BOOL finished) {
        
    }];
    
}

- (UIView *)firstView {
    if (!_firstView) {
        _firstView = [[[NSBundle mainBundle] loadNibNamed:@"LoginView" owner:nil options:nil] lastObject];
        _firstView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    }
    return _firstView;
}

- (UIView *)secondView {
    if (!_secondView) {
        _secondView = [[[NSBundle mainBundle] loadNibNamed:@"RegisterView" owner:nil options:nil] lastObject];
        _secondView.frame = CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        _secondView.backgroundColor = [UIColor clearColor];
        
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
        btn.backgroundColor = [UIColor grayColor];
        [_secondView addSubview:btn];
    }
    return _secondView;
}

@end
