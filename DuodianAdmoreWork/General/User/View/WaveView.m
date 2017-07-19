//
//  WaveView.m
//  DuodianAdmoreWork
//
//  Created by duodian on 2017/7/18.
//  Copyright © 2017年 duodian. All rights reserved.
//

#import "WaveView.h"
@interface WaveView ()
@property (nonatomic,strong)CADisplayLink *wavesDisplayLink;

@property (nonatomic,strong)CAShapeLayer *secondWavesLayer;

@property (nonatomic,strong)UIColor *secondWavesColor;

@property (nonatomic,assign)Math math;
@end

@implementation WaveView
{
    CGFloat waveA;//水纹振幅
    CGFloat waveW ;//水纹周期
    CGFloat offsetX; //位移
    CGFloat currentK; //当前波浪高度Y
    CGFloat wavesSpeed;//水纹速度
    CGFloat WavesWidth; //水纹宽度
}

- (instancetype)initWithFrame:(CGRect)frame andMath:(Math)math {
    if (self = [super initWithFrame:frame]) {
        _math = math;
        self.backgroundColor = [UIColor clearColor];
        self.layer.masksToBounds = YES;
        self.alpha = 0.6;
        [self setUpWaves];
    }
    return self;
}

- (void)setUpWaves{
    
    //设置波浪的宽度
    WavesWidth = self.frame.size.width;
    
    //第二个波浪颜色
    self.secondWavesColor = [UIColor colorWithRed:86/255.0f green:202/255.0f blue:139/255.0f alpha:1];
    
    //设置波浪的速度
    wavesSpeed = 1/M_PI;
    
    //初始化layer
    if (self.secondWavesLayer == nil) {
        
        //初始化
        self.secondWavesLayer = [CAShapeLayer layer];
        //设置闭环的颜色
        self.secondWavesLayer.fillColor = self.secondWavesColor.CGColor;
        //设置边缘线的颜色
//        _firstWaveLayer.strokeColor = [UIColor blueColor].CGColor;
        //设置边缘线的宽度
        //self.firstWavesLayer.lineWidth = 1.0;
        //        self.firstWavesLayer.strokeStart = 0.0;
        //        self.firstWavesLayer.strokeEnd = 0.8;
        
        [self.layer addSublayer:self.secondWavesLayer];
    }
    
    
    //同正弦函数相同,无交错效果
    //wavesSpeed = 0.02;
    //设置振幅
    //waveA = 12;
    //设置周期
    //waveW = 0.5/30.0;
    
    //同正弦函数不同,会有交错效果
    //设置波浪流动速度
    wavesSpeed = 0.04;
    //设置振幅
    waveA = 5;
    //设置周期
    waveW = 0.3/30.0;
    
    
    //设置波浪纵向位置
    currentK = self.frame.size.height;//屏幕居中
    
    //启动定时器
    self.wavesDisplayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(getCurrentWave:)];
    
    [self.wavesDisplayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}

-(void)getCurrentWave:(CADisplayLink *)displayLink{
    //实时的位移
    offsetX += wavesSpeed;
    
    [self setCurrentFirstWaveLayerPath];
}

-(void)setCurrentFirstWaveLayerPath{
    
    //创建一个路径
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGFloat y = currentK;
    //将点移动到 x=0,y=currentK的位置
    CGPathMoveToPoint(path, nil, 0, y);
    
    for (NSInteger i = 0.0f; i <= WavesWidth; i++) {
        //余弦函数波浪公式
        if (_math == Cos) {
            y = waveA * cos(waveW*i + offsetX)+currentK;
        }else{
            y = waveA * sin(waveW * i+ offsetX)+currentK;
        }
        
        //如果需要正弦函数的峰顶和余弦函数的峰底对应,可以替换成下方公式均可
        //y = waveA * cos(waveW*i + offsetX+M_PI_2)+currentK;
        
        //y = waveA * sin(-(waveW*i + offsetX))+currentK;
        
        //将点连成线
        CGPathAddLineToPoint(path, nil, i, y);
    }
    
    CGPathAddLineToPoint(path, nil, WavesWidth, 0);
    CGPathAddLineToPoint(path, nil, 0, 0);
    
    CGPathCloseSubpath(path);
    self.secondWavesLayer.path = path;
    
    //使用layer 而没用CurrentContext
    CGPathRelease(path);
    
}

-(void)dealloc
{
    [self.wavesDisplayLink invalidate];
}

@end
