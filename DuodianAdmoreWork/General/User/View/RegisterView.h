//
//  RegisterView.h
//  DuodianAdmoreWork
//
//  Created by duodian on 2017/7/13.
//  Copyright © 2017年 duodian. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^BackBlock)();
typedef void(^NextBlock)();

@interface RegisterView : UIView
@property (nonatomic,strong) BackBlock backBlock;
@property (nonatomic,strong) NextBlock nextBlock;
@end
