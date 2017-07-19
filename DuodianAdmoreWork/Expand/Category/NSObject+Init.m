//
//  NSObject+Init.m
//  DuodianAdmoreWork
//
//  Created by duodian on 2017/7/18.
//  Copyright © 2017年 duodian. All rights reserved.
//

#import "NSObject+Init.h"

@implementation NSObject (Init)
+ (id)classInitializtion {
    return [[self alloc]init];
}

+ (id)nibInitializtion {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil]firstObject];
}



@end
