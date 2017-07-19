//
//  BaseNavController.m
//  DuodianAdmoreWork
//
//  Created by duodian on 2017/7/12.
//  Copyright © 2017年 duodian. All rights reserved.
//

#import "BaseNavController.h"
#import "UIBarButtonItem+Extension.h"

@interface BaseNavController ()

@end

@implementation BaseNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationBar.barTintColor = [UIColor colorWithHexString:@"6FD2FA"];
//    self.navigationBar.barTintColor = [UIColor clearColor];
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:17]};
     
    self.navigationBar.translucent = YES;
//    [[ColorGradualTool shareInstance] setGradientBGColorWithView:self.navigationBar frame:CGRectMake(0, -20, SCREEN_WIDTH, 64) LeftColor:[UIColor colorWithHexString:@"6FD2FA"] rightColor:[UIColor colorWithHexString:@"60B0F8"]];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        UIBarButtonItem *backItem = [UIBarButtonItem itemWithNorImage:@"back" frame:CGRectMake(0, 0, 24, 24) target:self action:@selector(backClicked)];
        viewController.navigationItem.leftBarButtonItem = backItem;
    }
    [super pushViewController:viewController animated:animated];
}

- (void)backClicked {
    [self popViewControllerAnimated:YES];
}

@end
