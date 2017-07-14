//
//  AdmoreTool.h
//  DuodianAdmoreWork
//
//  Created by duodian on 2017/7/12.
//  Copyright © 2017年 duodian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AdmoreTool : NSObject

// 单例
+ (instancetype)shareInstance;
// 公共的参数
- (NSDictionary *)getCommonParameter;
// 获取当前位置
- (void)getCurrentLocation;
@end
