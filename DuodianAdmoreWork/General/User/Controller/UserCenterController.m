//
//  UserCenterController.m
//  DuodianAdmoreWork
//
//  Created by duodian on 2017/7/18.
//  Copyright © 2017年 duodian. All rights reserved.
//

#import "UserCenterController.h"
#import "WaveView.h"
#import <Masonry/Masonry.h>

@interface UserCenterController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)WaveView *firstWare;
@property (nonatomic,strong)WaveView *secondWare;
@property (nonatomic,strong)UIView *headView;
@property (nonatomic,strong) UIImageView *headIconImg;
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *idLabel;
@property (nonatomic,strong)UITableView *tableView;
@end

@implementation UserCenterController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (UIView *)headView {
    if (!_headView) {
        _headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
        self.firstWare = [[WaveView alloc]initWithFrame:_headView.bounds andMath:Cos];
        self.secondWare = [[WaveView alloc]initWithFrame:_headView.bounds andMath:Sin];
//        [[ColorGradualTool shareInstance] setGradientBGColorWithView:self.firstWare frame:_firstWare.bounds TopColor:[UIColor redColor] bottomColor:[UIColor yellowColor]];
//        [[ColorGradualTool shareInstance] setGradientBGColorWithView:_secondWare frame:_secondWare.bounds TopColor:[UIColor redColor] bottomColor:[UIColor yellowColor]];
        [[ColorGradualTool shareInstance] setGradientBGColorWithView:self.firstWare frame:_firstWare.bounds LeftColor:[UIColor redColor] rightColor:[UIColor yellowColor]];
        [[ColorGradualTool shareInstance] setGradientBGColorWithView:self.secondWare frame:_firstWare.bounds LeftColor:[UIColor redColor] rightColor:[UIColor yellowColor]];
        [_headView addSubview:self.firstWare];
        [_headView addSubview:self.secondWare];
        UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        backBtn.frame = CGRectMake(16, 30, 24, 24);
        [backBtn addTarget:self action:@selector(backClicked) forControlEvents:UIControlEventTouchUpInside];
        [_headView addSubview:backBtn];
        [backBtn setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        
        _idLabel = [[UILabel alloc] init];
        _idLabel.text = @"2429567641@qq.com";
        _idLabel.font = [UIFont systemFontOfSize:14];
        _idLabel.textColor = [UIColor colorWithHexString:@"333333"];
        [_headView addSubview:_idLabel];
        [_idLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(_headView);
            make.bottom.mas_equalTo(_headView).mas_offset(-10);
        }];
        
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.text = @"帅狗黑皮";
        _nameLabel.font = [UIFont systemFontOfSize:14];
        _nameLabel.textColor = [UIColor colorWithHexString:@"333333"];
        [_headView addSubview:_nameLabel];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(_headView);
            make.bottom.mas_equalTo(_idLabel.mas_top).mas_equalTo(-10);
        }];
        
        _headIconImg = [[UIImageView alloc] init];
        _headIconImg.image = [UIImage imageNamed:@"tu"];
        [_headView addSubview:_headIconImg];
        ViewRadius(_headIconImg, 40);
        [_headIconImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(_headView);
            make.size.mas_equalTo(CGSizeMake(80, 80));
            make.bottom.mas_equalTo(_nameLabel.mas_top).mas_equalTo(-10);
        }];
    }
    return _headView;
}

- (void)backClicked{
    [self.navigationController popViewControllerAnimated:YES];
}

- (UITableView *)tableView {
    if(!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = self.headView;
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.textLabel.text = @"test";
    return cell;
}
@end
