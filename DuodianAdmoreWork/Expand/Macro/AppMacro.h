//
//  AppMacro.h
//  DuodianAdmoreWork
//
//  Created by duodian on 2017/7/12.
//  Copyright © 2017年 duodian. All rights reserved.
//

#ifndef AppMacro_h
#define AppMacro_h

#define TESTDOMAIN @"http://192.168.74.114:8081"
#define NORMALDOMAIN @"http://work.duodian.com/"

#define OSVersion     [UIDevice currentDevice].systemVersion //@"ios7"
#define DeviceIDFV     [[[UIDevice currentDevice] identifierForVendor] UUIDString]
#define ChannelType    @"iOS"
#define DeviceIDFA     [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString]
#define AppVersion     [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define AppBundleId    [[NSBundle mainBundle]bundleIdentifier]
#define AppPackName    [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"]



#endif /* AppMacro_h */
