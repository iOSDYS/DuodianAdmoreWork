//
//  UIBarButtonItem+Extension.h
//  DuodianAdmoreWork
//
//  Created by duodian on 2017/7/13.
//  Copyright © 2017年 duodian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)
 + (instancetype)itemWithNorImage:(NSString *)image frame:(CGRect)frame target:(id)target action:(SEL)action;
@end
