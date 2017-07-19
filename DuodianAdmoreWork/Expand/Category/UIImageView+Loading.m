//
//  UIImageView+Loading.m
//  DuodianAdmoreWork
//
//  Created by duodian on 2017/7/18.
//  Copyright © 2017年 duodian. All rights reserved.
//

#import "UIImageView+Loading.h"

@implementation UIImageView (Loading)
- (void)setImageUrlWithStr:(NSString *)str {
    __block UIActivityIndicatorView *testActivityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    testActivityIndicator.center = self.center;
    [self addSubview:testActivityIndicator];
    [testActivityIndicator startAnimating];
    
    [self setImageWithURL:[NSURL URLWithString:str] placeholder:nil options:YYWebImageOptionShowNetworkActivity completion:^(UIImage * _Nullable image, NSURL * _Nonnull url, YYWebImageFromType from, YYWebImageStage stage, NSError * _Nullable error) {
//        self.image = image;
        [testActivityIndicator stopAnimating];
        [testActivityIndicator removeFromSuperview];
        testActivityIndicator = nil;
    }];
}
@end
