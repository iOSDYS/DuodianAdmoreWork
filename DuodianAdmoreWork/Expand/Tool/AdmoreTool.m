//
//  AdmoreTool.m
//  DuodianAdmoreWork
//
//  Created by duodian on 2017/7/12.
//  Copyright © 2017年 duodian. All rights reserved.
//

#import "AdmoreTool.h"
#import <AdSupport/AdSupport.h>
#import <sys/utsname.h>
#import <CoreLocation/CoreLocation.h>

@interface AdmoreTool ()<CLLocationManagerDelegate>
@property (nonatomic , strong) CLLocationManager *locationManger;
@end

@implementation AdmoreTool

+ (instancetype)shareInstance {
    static AdmoreTool *shareInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[AdmoreTool alloc] init];
    });
    return shareInstance;
}

- (NSString *)getCurrentNetStats {
    NSString *netWorkStats = @"NONET";
    switch ([YYReachability reachability].status) {
        case 0:
            netWorkStats = @"NONET";
            break;
        case 1:
            netWorkStats = @"3G";
            break;
        case 2:
            netWorkStats = @"WIFI";
            break;
    }
    return netWorkStats;
}

- (NSDictionary *)getCommonParameter {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"DE4990FE0FD0CBC3BE731988D461D74D" forKey:@"identifier"];
    if ([[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString]) {
        [dic setObject:DeviceIDFA forKey:@"x-device-idfa"];               //idfa
    }
    [dic setObject:OSVersion forKey:@"x-os-version"];                 //系统版本
    if ([self device] != nil) {
        [dic setObject:[self device] forKey:@"x-device"];                   //获取设备信息
    }
    if (DeviceIDFV) {
        [dic setObject:DeviceIDFV forKey:@"x-device-idfv"];               //idfv
    }
    [dic setObject:AppVersion forKey:@"x-app-version"];               //app的版本
    if ([self getCurrentNetStats] != nil) {
        [dic setObject:[self getCurrentNetStats] forKey:@"x-net"];          //网络状态
    }
    
    if ([USER_DEFAULT objectForKey:@"adMore_latitude"]) {
        [dic setObject:[USER_DEFAULT objectForKey:@"adMore_latitude"] forKey:@"latitude"];
    }
    
    if ([USER_DEFAULT objectForKey:@"adMore_longitude"]) {
        [dic setObject:[USER_DEFAULT objectForKey:@"adMore_longitude"] forKey:@"longitude"];
    }
    
    [dic setObject:ChannelType forKey:@"x-device-platform"];          //设备平台
    [dic setObject:AppBundleId forKey:@"x-app-bundle"];               //应用的bundle ID
    [dic setObject:AppPackName forKey:@"x-app-package"];              //应用的包名
    
    CGFloat screenWidth = [[UIScreen mainScreen] currentMode].size.width;
    CGFloat screenHeight = [[UIScreen mainScreen] currentMode].size.height;
    [dic setObject:[NSString stringWithFormat:@"%f*%f",screenWidth,screenHeight] forKey:@"resolution"];//屏幕分辨率
    return dic;
}

#pragma mark 获取设备的信息
-(NSString*)device {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    return deviceString;
}

#pragma mark 获取当前位置
- (void)getCurrentLocation {
    if ([CLLocationManager locationServicesEnabled] &&
        ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedAlways
         || [CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse)) {
            //定位功能可用，开始定位
            _locationManger = [[CLLocationManager alloc] init];
            _locationManger.delegate = self;
            [_locationManger startUpdatingLocation];
        } else if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied){
            DLog(@"=======");
        } else {
            DLog(@"......");
        }
}

#pragma mark CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    CLLocation *currentLocation = [locations lastObject];
    NSString *strLat = [NSString stringWithFormat:@"%@",[NSNumber numberWithDouble:currentLocation.coordinate.latitude]];
    NSString *strLng = [NSString stringWithFormat:@"%@",[NSNumber numberWithDouble:currentLocation.coordinate.longitude]];
    if (strLat) {
        [USER_DEFAULT setObject:strLat forKey:@"adMore_latitude"];
    }
    if (strLng) {
        [USER_DEFAULT setObject:strLng forKey:@"adMore_longitude"];
    }
    [manager stopUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    [_locationManger stopUpdatingLocation];
}
@end
