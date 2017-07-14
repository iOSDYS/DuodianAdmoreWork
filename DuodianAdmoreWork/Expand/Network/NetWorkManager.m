//
//  NetWorkManager.m
//  DuodianAdmoreWork
//
//  Created by duodian on 2017/7/12.
//  Copyright © 2017年 duodian. All rights reserved.
//

#import "NetWorkManager.h"
#import "AdmoreTool.h"

@implementation NetWorkManager
#pragma mark - shareManager
/**
 *  获得全局唯一的网络请求实例单例方法
 *
 *  @return 网络请求类的实例
 */

+(instancetype)shareManager
{
    static NetWorkManager * manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] initWithBaseURL:[NSURL URLWithString:NORMALDOMAIN]];
    });
    return manager;
}


#pragma mark - 重写initWithBaseURL
- (instancetype)initWithBaseURL:(NSURL *)url {
    if (self = [super initWithBaseURL:url]) {
        self.requestSerializer.timeoutInterval = 10;
        self.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
        self.requestSerializer = [AFHTTPRequestSerializer serializer];
        AFJSONResponseSerializer * response = [AFJSONResponseSerializer serializer];
        response.removesKeysWithNullValues = YES;
        self.responseSerializer = response;
        [self.requestSerializer setValue:@"application/json;charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        [self.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"text/plain",@"application/json",@"text/json",@"text/javascript",@"text/html", nil]];
        [self.requestSerializer setValue:@"application/json"forHTTPHeaderField:@"Accept"];
        [self.requestSerializer setValue:DeviceIDFV forHTTPHeaderField:@"x-device-idfv"];
        [self.requestSerializer setValue:ChannelType forHTTPHeaderField:@"x-device-platform"];
    }
    return self;
}


#pragma mark - 网络请求的类方法---get/post

/**
 *  网络请求的实例方法
 *
 *  @param type         get / post
 *  @param urlString    请求的地址
 *  @param otherParameter    请求的参数
 *  @param successBlock 请求成功的回调
 *  @param failureBlock 请求失败的回调
 *  @param progress 进度
 */

+(void)requestWithType:(HttpRequestType)type withUrlString:(NSString *)urlString withParaments:(id)otherParameter withSuccessBlock:(requestSuccess)successBlock withFailureBlock:(requestFailure)failureBlock progress:(downloadProgress)progress {
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithDictionary:[[AdmoreTool shareInstance] getCommonParameter]];
    if (otherParameter) {
        [parameters setDictionary:otherParameter];
    }
    switch (type) {
        case HttpRequestTypeGet:{
            [[NetWorkManager shareManager] GET:urlString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
                progress(downloadProgress.completedUnitCount / downloadProgress.totalUnitCount);
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if ([responseObject[@"success"] integerValue] != 1) {
                    [SVProgressHUD showErrorWithStatus:responseObject[@"message"]];
                    return;
                }
                successBlock(responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                failureBlock(error);
            }];
            break;
        }
        case HttpRequestTypePost:{
            [[NetWorkManager shareManager] POST:urlString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
                progress(uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if ([responseObject[@"success"] integerValue] != 1) {
                    [SVProgressHUD showErrorWithStatus:responseObject[@"message"]];
                    return;
                }
                successBlock(responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                failureBlock(error);
            }];
        }
    }
}


#pragma mark - 多图上传
/**
 *  上传图片
 *
 *  @param operations   上传图片等预留参数---视具体情况而定 可移除
 *  @param imageArray   上传的图片数组
 *  @parm width      图片要被压缩到的宽度
 *  @param urlString    上传的url---请填写完整的url
 *  @param successBlock 上传成功的回调
 *  @param failureBlock 上传失败的回调
 *  @param progress     上传进度
 *
 */
+(void)uploadImageWithOperations:(NSDictionary *)operations withImageArray:(NSArray *)imageArray withtargetWidth:(CGFloat )width withUrlString:(NSString *)urlString withSuccessBlock:(requestSuccess)successBlock withFailurBlock:(requestFailure)failureBlock withUpLoadProgress:(uploadProgress)progress {
    
    
    //1.创建管理者对象
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager POST:urlString parameters:operations constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        NSUInteger i = 0 ;
        
        for (UIImage * image in imageArray) {
            
            //image的分类方法
            //            UIImage *  resizedImage =  [UIImage IMGCompressed:image targetWidth:width];
            //
            //            NSData * imgData = UIImageJPEGRepresentation(resizedImage, .5);
            //
            //            //拼接data
            //            [formData appendPartWithFileData:imgData name:[NSString stringWithFormat:@"picflie%ld",(long)i] fileName:@"image.png" mimeType:@" image/jpeg"];
            
            i++;
        }
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        progress(uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *  _Nullable responseObject) {
        
        successBlock(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failureBlock(error);
        
    }];
}

#pragma mark - 文件下载
/**
 *  文件下载
 *
 *  @param operations   文件下载预留参数---视具体情况而定 可移除
 *  @param savePath     下载文件保存路径
 *  @param urlString        请求的url
 *  @param successBlock 下载文件成功的回调
 *  @param failureBlock 下载文件失败的回调
 *  @param progress     下载文件的进度显示
 */

+(void)downLoadFileWithOperations:(NSDictionary *)operations withSavaPath:(NSString *)savePath withUrlString:(NSString *)urlString withSuccessBlock:(requestSuccess)successBlock withFailureBlock:(requestFailure)failureBlock withDownLoadProgress:(downloadProgress)progress {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    [manager downloadTaskWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlString]] progress:^(NSProgress * _Nonnull downloadProgress) {
        progress(downloadProgress.completedUnitCount / downloadProgress.totalUnitCount);
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        return  [NSURL URLWithString:savePath];
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        
        if (error) {
            
            failureBlock(error);
        }
        
    }];
    
}


#pragma mark -  取消所有的网络请求

/**
 *  取消所有的网络请求
 *  a finished (or canceled) operation is still given a chance to execute its completion block before it iremoved from the queue.
 */

+(void)cancelAllRequest {
    [[NetWorkManager shareManager].operationQueue cancelAllOperations];
}



#pragma mark -   取消指定的url请求/
/**
 *  取消指定的url请求
 *
 *  @param requestType 该请求的请求类型
 *  @param string      该请求的完整url
 */

+(void)cancelHttpRequestWithRequestType:(NSString *)requestType requestUrlString:(NSString *)string
{
    
    NSError * error;
    
    /**根据请求的类型 以及 请求的url创建一个NSMutableURLRequest---通过该url去匹配请求队列中是否有该url,如果有的话 那么就取消该请求*/
    
    NSString * urlToPeCanced = [[[[NetWorkManager shareManager].requestSerializer requestWithMethod:requestType URLString:string parameters:nil error:&error] URL] path];
    
    
    for (NSOperation * operation in [NetWorkManager shareManager].operationQueue.operations) {
        
        //如果是请求队列
        if ([operation isKindOfClass:[NSURLSessionTask class]]) {
            
            //请求的类型匹配
            BOOL hasMatchRequestType = [requestType isEqualToString:[[(NSURLSessionTask *)operation currentRequest] HTTPMethod]];
            
            //请求的url匹配
            
            BOOL hasMatchRequestUrlString = [urlToPeCanced isEqualToString:[[[(NSURLSessionTask *)operation currentRequest] URL] path]];
            
            //两项都匹配的话  取消该请求
            if (hasMatchRequestType&&hasMatchRequestUrlString) {
                
                [operation cancel];
                
            }
        }
        
    }
}

+ (NSArray *)commonParameters {
    NSMutableDictionary * dic = [NSMutableDictionary dictionary];
    //    if ([[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString]) {
    //        [dic setObject:DeviceIDFA forKey:@"x-device-idfa"];               //idfa
    //    }
    //    [dic setObject:OSVersion forKey:@"x-os-version"];                 //系统版本
    //    if ([self device] != nil) {
    //        [dic setObject:[self device] forKey:@"x-device"];                   //获取设备信息
    //    }
    //    if (DeviceIDFV) {
    //        [dic setObject:DeviceIDFV forKey:@"x-device-idfv"];               //idfv
    //    }
    //    [dic setObject:AppVersion forKey:@"x-app-version"];               //app的版本
    //    if ([[admore_tools getInstance] getCurrentNetStats] != nil) {
    //        [dic setObject:[[admore_tools getInstance] getCurrentNetStats] forKey:@"x-net"];          //网络状态
    //    }
    [dic setObject:ChannelType forKey:@"x-device-platform"];          //设备平台
    [dic setObject:AppBundleId forKey:@"x-app-bundle"];               //应用的bundle ID
    [dic setObject:AppPackName forKey:@"x-app-package"];              //应用的包名
    
    CGFloat screenWidth = [[UIScreen mainScreen] currentMode].size.width;
    CGFloat screenHeight = [[UIScreen mainScreen] currentMode].size.height;
    [dic setObject:[NSString stringWithFormat:@"%f*%f",screenWidth,screenHeight] forKey:@"resolution"];//屏幕分辨率
    
    return dic;
}
@end
