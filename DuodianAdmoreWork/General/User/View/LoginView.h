//
//  LoginView.h
//  DuodianAdmoreWork
//
//  Created by duodian on 2017/7/13.
//  Copyright © 2017年 duodian. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^RegisterBlock)();
typedef void(^ForgetPwdBlock)();

@interface LoginView : UIView
@property (nonatomic,strong) RegisterBlock registerBlock;
@property (nonatomic,strong) ForgetPwdBlock forgetPwdBlock;
@end
