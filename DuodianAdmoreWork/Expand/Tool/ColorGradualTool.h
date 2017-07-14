//
//  ColorGradualTool.h
//  DuodianAdmoreWork
//
//  Created by duodian on 2017/7/13.
//  Copyright © 2017年 duodian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ColorGradualTool : NSObject
// 单例
+ (instancetype)shareInstance;
//水平渐变
- (void)setGradientBGColorWithView:(UIView *)view frame:(CGRect)frame LeftColor:(UIColor *)leftColor rightColor:(UIColor *)rightColor;
//垂直渐变
- (void)setGradientBGColorWithView:(UIView *)view frame:(CGRect)frame TopColor:(UIColor *)topColor bottomColor:(UIColor *)bottomColor;
@end
