//
//  ReceiptReviewViewController.m
//  DuodianAdmoreWork
//
//  Created by duodian on 2017/7/17.
//  Copyright © 2017年 duodian. All rights reserved.
//

#import "ReceiptReviewViewController.h"
#import "RecepitReviewDetailController.h"
#import "ReceiptReviewCell.h"

@interface ReceiptReviewViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation ReceiptReviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}

#pragma mark 懒加载
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.tableFooterView = [UIView new];
        [_tableView registerNib:[UINib nibWithNibName:@"ReceiptReviewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    }
    return _tableView;
}

#pragma mark tableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ReceiptReviewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 64;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    RecepitReviewDetailController *vc = [[RecepitReviewDetailController alloc] initWithNibName:@"RecepitReviewDetailController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
