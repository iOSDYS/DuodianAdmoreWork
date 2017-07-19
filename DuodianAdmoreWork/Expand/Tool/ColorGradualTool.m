//
//  ColorGradualTool.m
//  DuodianAdmoreWork
//
//  Created by duodian on 2017/7/13.
//  Copyright © 2017年 duodian. All rights reserved.
//

#import "ColorGradualTool.h"

@implementation ColorGradualTool

+ (instancetype)shareInstance {
    static ColorGradualTool *shareInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[ColorGradualTool alloc] init];
    });
    return shareInstance;
}

- (void)setGradientBGColorWithView:(UIView *)view frame:(CGRect)frame LeftColor:(UIColor *)leftColor rightColor:(UIColor *)rightColor {
    view.backgroundColor = [UIColor redColor];
    if ([[view.layer.sublayers lastObject] isKindOfClass:[CAGradientLayer class]]) {
        [[view.layer.sublayers lastObject] removeFromSuperlayer];
    }
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)leftColor.CGColor, (__bridge id)rightColor.CGColor];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1, 0);
    gradientLayer.frame = frame;
    [view.layer addSublayer:gradientLayer];
    
    view.layer.masksToBounds = NO;
    view.clipsToBounds = NO;
    view.layer.shadowColor = leftColor.CGColor;
    view.layer.shadowRadius = 6;
    view.layer.shadowOpacity = 0.36;
    view.layer.shadowOffset = CGSizeMake(0, 3);
}

- (void)setGradientBGColorWithView:(UIView *)view frame:(CGRect)frame TopColor:(UIColor *)topColor bottomColor:(UIColor *)bottomColor {
    view.backgroundColor = [UIColor clearColor];
    if ([[view.layer.sublayers lastObject] isKindOfClass:[CAGradientLayer class]]) {
        [[view.layer.sublayers lastObject] removeFromSuperlayer];
    }
    //渐变色
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)topColor.CGColor, (__bridge id)bottomColor.CGColor];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(0, 1);
    gradientLayer.frame = frame;
//    gradientLayer.cornerRadius = view.layer.cornerRadius;
//    gradientLayer.masksToBounds = YES;
//    gradientLayer.zPosition = -1;
    [view.layer addSublayer:gradientLayer];
    
}
@end
