//
//  NSObject+Init.h
//  DuodianAdmoreWork
//
//  Created by duodian on 2017/7/18.
//  Copyright © 2017年 duodian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Init)
/**
 *  initialize a class file
 *
 *  @return a object from class
 */
+(id)classInitializtion;
/**
 *  initializtion a nib file
 *
 *  @return a object from class
 */
+(id)nibInitializtion;

@end
