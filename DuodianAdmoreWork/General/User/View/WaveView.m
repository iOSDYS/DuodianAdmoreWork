//
//  WaveView.m
//  DuodianAdmoreWork
//
//  Created by duodian on 2017/7/18.
//  Copyright © 2017年 duodian. All rights reserved.
//

#import "WaveView.h"
//#define ScreenRect [[UIScreen mainScreen] bounds]

@interface WaveView ()
/**
 *  绘制层
 */
@property (nonatomic, strong) CAShapeLayer *shapeLayer;

/**
 *  重绘定时器
 */
@property (nonatomic, strong) CADisplayLink *displayLink;

/**
 *  水波的高度
 */
@property (nonatomic, assign) CGFloat waterWaveHeight;

/**
 *  Y 轴方向的缩放
 */
@property (nonatomic, assign) CGFloat zoomY;

/**
 *  X 轴方向的平移
 */
@property (nonatomic, assign) CGFloat translateX;


@property (nonatomic, assign) BOOL flag;
@end

@implementation WaveView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self commitInit];
        
        [self addShapeLayer];
        
        [self startDisplayLink];
    }
    return self;
}

// 初始化数据
- (void)commitInit
{
    // 水波高度
    self.waterWaveHeight = self.height / 2;
    
    self.zoomY = 1.0f;
    self.translateX = 0.0f;
    self.flag = NO;
}

- (void)addShapeLayer
{
    self.shapeLayer = [CAShapeLayer layer];
    
    // 绘制的路径
    self.shapeLayer.path = [self waterWavePath];
    // 填充的颜色
    self.shapeLayer.fillColor = [[UIColor whiteColor] CGColor];
    // 路径线条的颜色
//    self.shapeLayer.lineWidth = 0.1;
    // 路径线条的颜色
//    self.shapeLayer.strokeColor = [[UIColor colorWithRed:86/255.0f green:202/255.0f blue:139/255.0f alpha:1] CGColor];
    
    [self.layer addSublayer:self.shapeLayer];
}

- (CGPathRef)waterWavePath
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, self.waterWaveHeight)];
    
    CGFloat y = 0.0f;
    for (float x = 0; x <= self.width; x ++)
    {
        y = self.zoomY * cos( x / 270 * M_PI - 4 * self.translateX / M_PI )*2 + self.waterWaveHeight;
        [path addLineToPoint:CGPointMake(x, y)];
    }
    [path addLineToPoint:CGPointMake(self.width, self.height)];
    [path addLineToPoint:CGPointMake(0, self.height)];
    [path addLineToPoint:CGPointMake(0, self.waterWaveHeight)];
    [path closePath];
    
    return [path CGPath];
}

- (void)startDisplayLink
{
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(handleDisplayLink:)];
    [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)stopDisplayLink
{
    [self.displayLink invalidate];
    self.displayLink = nil;
}

- (void)handleDisplayLink:(CADisplayLink *)displayLink
{
    
    self.translateX += 0.05;// 平移
    if (!self.flag)
    {
        self.zoomY += 0.02;
        if (self.zoomY >= 1.5)
        {
            self.flag = YES;
        }
    }
    else
    {
        self.zoomY -= 0.02;
        if (self.zoomY <= 1.0)
        {
            self.flag = NO;
        }
    }
    
    self.shapeLayer.path = [self waterWavePath];
}

- (void)dealloc {
    [self.displayLink invalidate];
}

@end
