//
//  LeftController.m
//  DuodianAdmoreWork
//
//  Created by duodian on 2017/7/12.
//  Copyright © 2017年 duodian. All rights reserved.
//

#import "LeftController.h"
#import "InvoiceCancelController.h"
#import "BaseNavController.h"
#import "UIViewController+MMDrawerController.h"
#import "LeftItemCell.h"
#import "Masonry.h"
#import "UserCenterController.h"

@interface LeftController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UIView *headView;
@property (nonatomic,strong) UIImageView *headIconImg;
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *idLabel;
@property (nonatomic,strong) NSMutableArray *titleArray;
@end

@implementation LeftController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.headView];
    [self.view addSubview:self.tableView];
    
    NSString * content = @"{\"success\":true,\"result\":[{\"name\":\"统计数据\",\"icon\":\"glyphicon glyphicon-credit-card\",\"url\":\"admore_CensusDataViewController\"},{\"name\":\"发票信息审核\",\"icon\":\"glyphicon glyphicon-credit-card\",\"url\":\"admore_ReceiptReviewViewController\"},{\"name\":\"已开发票\",\"icon\":\"glyphicon glyphicon-print\",\"url\":\"admore_AlreadyOpenReceiptViewController\"},{\"name\":\"充值报表\",\"icon\":\"glyphicon glyphicon-log-in\",\"url\":\"admore_ChargeJournalingViewController\"},{\"name\":\"现金流水\",\"icon\":\"glyphicon glyphicon-log-out\",\"url\":\"admore_CashStreamViewController\"},{\"name\":\"试客推广\",\"icon\":\"glyphicon glyphicon-tree-conifer\",\"url\":\"admore_shikeGeneralizeViewController\"},{\"name\":\"资源包退款审核\",\"icon\":\"glyphicon glyphicon-exclamation-sign\",\"url\":\"admore_UnsubscribeReviewViewController\"},{\"name\":\"资源包购买记录\",\"icon\":\"glyphicon glyphicon-tasks\",\"url\":\"admore_resourceBuyRecordViewController\"},{\"name\":\"广告主提现审核\",\"icon\":\"glyphicon glyphicon-btc\",\"url\":\"admore_WithdrawCheckController\"},{\"name\":\"预开发票\",\"icon\":\"glyphicon glyphicon-credit-card\",\"url\":\"admore_PreOpneReceiptViewController\"},{\"name\":\"资源包消耗明细\",\"icon\":\"glyphicon glyphicon-list\",\"url\":\"admore_RespackageConsumeDetailViewController\"},{\"name\":\"试客计划\",\"icon\":\"glyphicon glyphicon-tree-conifer\",\"url\":\"admore_shikePlanViewController\"},{\"name\":\"预开发票审核\",\"icon\":\"glyphicon glyphicon-eye-open\",\"url\":\"admore_PreOpenReceiptReviewViewController\"},{\"name\":\"结算明细\",\"icon\":\"glyphicon glyphicon-usd\",\"url\":\"admore_SettlementDetailViewController\"},{\"name\":\"PLAY计划\",\"icon\":\"glyphicon glyphicon-flag\",\"url\":\"admore_PlayPlanViewController\"},{\"name\":\"PLAY推广\",\"icon\":\"glyphicon glyphicon-flag\",\"url\":\"admore_PlayGeneralizeViewController\"},{\"name\":\"发票作废审核\",\"icon\":\"glyphicon glyphicon-ice-lolly-tasted\",\"url\":\"admore_ReceiptCancelReviewViewController\"},{\"name\":\"效果日报\",\"icon\":\"glyphicon glyphicon-piggy-bank\",\"url\":\"admore_EffectDailyRecordViewController\"},{\"name\":\"代理消耗返点\",\"icon\":\"glyphicon glyphicon-transfer\",\"url\":\"admore_AgentRebateViewController\"},{\"name\":\"结算汇总\",\"icon\":\"glyphicon glyphicon-usd\",\"url\":\"admore_SettlementGatherViewController\"},{\"name\":\"不结算明细\",\"icon\":\"glyphicon glyphicon-list-alt\",\"url\":\"admore_NotSettlementDetailViewController\"},{\"name\":\"不结算汇总\",\"icon\":\"glyphicon glyphicon-map-marker\",\"url\":\"admore_NotSettlementGatherViewController\"}],\"message\":\"\",\"code\":\"200\",\"date\":\"2017-05-05 16:34:19\"}";
    
    NSData *data = [content dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    self.titleArray = [dic objectForKey:@"result"];
    [self.tableView reloadData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

#pragma mark 懒加载
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.headView.frame), SCREEN_WIDTH*2/3, SCREEN_HEIGHT - self.headView.height)];
        _tableView.tableFooterView = [UIView new];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = NO;
        [_tableView registerNib:[UINib nibWithNibName:@"LeftItemCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    }
    return _tableView;
}

- (UIView *)headView {
    if (!_headView) {
        _headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH /3 * 2 , 180 )];
        _headView.backgroundColor = COLOR(68, 68, 68, 1);
        
        UIImageView *img = [[UIImageView alloc] initWithFrame:_headView.bounds];
        img.image = [UIImage imageNamed:@"leftBg.jpg"];
        [_headView addSubview:img];
        
        UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:_headView.bounds];
        toolBar.alpha = 0.5;
        toolBar.barStyle = UIBarStyleBlack;
        [_headView addSubview:toolBar];
        
        _headIconImg = [[UIImageView alloc] init] ;
        _headIconImg.image = [UIImage imageNamed:@"tu"];
        [_headView addSubview:_headIconImg];
        [_headIconImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(_headView);
            make.top.mas_equalTo(_headView).mas_offset(80);
            make.size.mas_equalTo(CGSizeMake(40, 40));
        }];
        ViewRadius(_headIconImg, 20);
        
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.headIconImg.frame) + 10, self.headView.frame.size.width, 18)];
        _nameLabel.font = [UIFont systemFontOfSize:14];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.textColor = [UIColor whiteColor];
        _nameLabel.text = @"用户昵称";
        [_headView addSubview:self.nameLabel];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_headIconImg.mas_bottom).mas_offset(10);
            make.left.mas_equalTo(_headView).mas_offset(10);
            make.right.mas_equalTo(_headView).mas_offset(-10);
        }];
        
        _idLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.nameLabel.frame) + 10, self.headView.frame.size.width, 18)];
        _idLabel.font = [UIFont systemFontOfSize:14];
        _idLabel.textAlignment = NSTextAlignmentCenter;
        _idLabel.textColor = [UIColor whiteColor];
        _idLabel.text = @"用户账号";
        [_headView addSubview:self.idLabel];
        [_idLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_nameLabel.mas_bottom).mas_equalTo(10);
            make.left.mas_equalTo(_headView).mas_offset(10);
            make.right.mas_equalTo(_headView).mas_offset(-10);
        }];
    }
    return _headView;
}

#pragma mark tableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LeftItemCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSDictionary *dic = self.titleArray[indexPath.row];
    cell.titLabel.text = [dic objectForKey:@"name"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSDictionary *dict = _titleArray[indexPath.row];
    NSString *url = dict[@"url"];
    NSRange range = [url rangeOfString:@"_"];
//    BaseViewController *vc = (BaseViewController *)[[NSClassFromString([url substringFromIndex:range.location + 1]) alloc] init];
//    vc.title = dict[@"name"];
    UserCenterController *vc = [[UserCenterController alloc] init];
    BaseNavController *nav = (BaseNavController *)self.mm_drawerController.centerViewController;
    [nav pushViewController:vc animated:YES];
    [self.mm_drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
        //设置打开抽屉模式为MMOpenDrawerGestureModeNone，也就是没有任何效果。
//        [self.mm_drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeNone];
    }];
}

@end
