//
//  ViewController.m
//  HLYBadge
//
//  Created by Aka on 2017/6/30.
//  Copyright © 2017年 Aka. All rights reserved.
//

#import "ViewController.h"
#import "HLYExampleMgr.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

static NSString *const cellNomalIdentifier = @"cell.nomal.indentifier";
static const CGFloat cellNomalH = 60;

static const CGFloat tabBarH = 64.f;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[HLYExampleMgr shared] initLoadDatas];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, tabBarH, CGRectGetHeight([UIScreen mainScreen].bounds) -tabBarH, CGRectGetWidth([UIScreen mainScreen].bounds)) style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellNomalIdentifier];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
}

#pragma mark -- tableView datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [HLYExampleMgr shared].itemCatogries.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellNomalIdentifier forIndexPath:indexPath];
    cell.textLabel.text = [HLYExampleMgr shared].itemCatogries[indexPath.row][descriptionIndex];
    cell.backgroundColor = [UIColor grayColor];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return cellNomalH;
}

#pragma mark -- yd delegate

#pragma mark --table delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.navigationController pushViewController:[HLYExampleMgr shared].itemCatogries[indexPath.row][vcIndex] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
