//
//  DDTextField.m
//  DuodianAdmoreWork
//
//  Created by duodian on 2017/7/14.
//  Copyright © 2017年 duodian. All rights reserved.
//

#import "DDTextField.h"

@implementation DDTextField

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    [self setValue:[UIColor colorWithHexString:@"f7f7f7"] forKeyPath:@"_placeholderLabel.textColor"];
}


@end
