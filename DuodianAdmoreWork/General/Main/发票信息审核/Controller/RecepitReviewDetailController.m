//
//  RecepitReviewDetailController.m
//  DuodianAdmoreWork
//
//  Created by duodian on 2017/7/18.
//  Copyright © 2017年 duodian. All rights reserved.
//

#import "RecepitReviewDetailController.h"

@interface RecepitReviewDetailController ()
@property (weak, nonatomic) IBOutlet UIButton *refuseBtn;
@property (weak, nonatomic) IBOutlet UIButton *passBtn;
@property (weak, nonatomic) IBOutlet UIImageView *testImageView;
@end

@implementation RecepitReviewDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[ColorGradualTool shareInstance] setGradientBGColorWithView:_passBtn frame:_passBtn.bounds LeftColor:[UIColor colorWithRed:112/255.0 green:209/255.0 blue:253/255.0 alpha:1 ] rightColor:[UIColor colorWithRed:95/255.0 green:176/255.0 blue:252/255.0 alpha:1]];
    ViewRadius(_passBtn, 5);
    
    [[ColorGradualTool shareInstance] setGradientBGColorWithView:_refuseBtn frame:_passBtn.bounds LeftColor:[UIColor colorWithRed:112/255.0 green:209/255.0 blue:253/255.0 alpha:1 ] rightColor:[UIColor colorWithRed:95/255.0 green:176/255.0 blue:252/255.0 alpha:1]];
    ViewRadius(_refuseBtn, 5);
    
    [_testImageView setImageUrlWithStr:@"http://img4.imgtn.bdimg.com/it/u=1928808592,936433638&fm=214&gp=0.jpg"];
}



@end
