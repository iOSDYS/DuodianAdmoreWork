//
//  AppDelegate.m
//  DuodianAdmoreWork
//
//  Created by duodian on 2017/7/11.
//  Copyright © 2017年 duodian. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginController.h"
#import "BaseNavController.h"
#import "MMDrawerController.h"
#import "LeftController.h"
#import "BaseNavController.h"
#import "BaseViewController.h"
#import <IQKeyboardManager.h>
#import "EntranceController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    self.window.rootViewController = [[EntranceController alloc] init];
//    LoginController *loginVC = SB(@"User", @"loginVC");
//    BaseNavController *nav = [[BaseNavController alloc] initWithRootViewController:loginVC];
//    self.window.rootViewController = nav;
//    [self initVC];
    [self initKeyboard];
    return YES;
}

- (void)initVC {
    BaseNavController *leftNav = [[BaseNavController alloc] initWithRootViewController:[[LeftController alloc] init]];
    MMDrawerController *drawVC = [[MMDrawerController alloc] initWithCenterViewController:[[BaseNavController alloc] initWithRootViewController:[[BaseViewController alloc] init]] leftDrawerViewController:leftNav];
    drawVC.maximumLeftDrawerWidth = SCREEN_WIDTH*2/3;
    [drawVC setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [drawVC setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    self.window.rootViewController = drawVC;
}

- (void)initKeyboard {
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
    [IQKeyboardManager sharedManager].enableAutoToolbar = NO;
}

@end
