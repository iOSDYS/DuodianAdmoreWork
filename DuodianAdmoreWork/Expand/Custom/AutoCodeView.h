//
//  AutoCodeView.h
//  DuodianAdmoreWork
//
//  Created by duodian on 2017/7/13.
//  Copyright © 2017年 duodian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AutoCodeView : UIView
@property (strong, nonatomic) NSMutableString *authCodeStr;//验证码字符串
- (void)getAuthcode;
@end
