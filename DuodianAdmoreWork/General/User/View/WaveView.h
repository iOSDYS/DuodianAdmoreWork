//
//  WaveView.h
//  DuodianAdmoreWork
//
//  Created by duodian on 2017/7/18.
//  Copyright © 2017年 duodian. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum {
    Cos,
    Sin,
} Math;

@interface WaveView : UIView
- (instancetype)initWithFrame:(CGRect)frame andMath:(Math)math;
@end
