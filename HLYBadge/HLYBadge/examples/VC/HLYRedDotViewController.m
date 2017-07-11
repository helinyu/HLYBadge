//
//  HLyRedDotViewController.m
//  HLYBadge
//
//  Created by Aka on 2017/6/30.
//  Copyright © 2017年 Aka. All rights reserved.
//

#import "HLYRedDotViewController.h"
#import "AKABadgeImport.h"
#import "UIView+HLYFrame.h"

@interface HLYRedDotViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *sources;

@property (nonatomic, strong) NSArray *titleSources;

@end

static NSString *const kNomalCellIdentifier =@"nomal.cell.identifier";

static const CGFloat kCellH = 60.f;
static const CGFloat kCellHeaderViewH = 44.f;

@implementation HLYRedDotViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"red dot";
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64.f, ScreenWidth, ScreenHeight-64.f) style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    self.automaticallyAdjustsScrollViewInsets = NO;
    _tableView.backgroundColor = [UIColor yellowColor];
    
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kNomalCellIdentifier];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    _tableView.allowsSelection = NO;
    _tableView.separatorColor = [UIColor greenColor];
    _tableView.separatorInset = UIEdgeInsetsMake(2, 2, 2, 2);
    
    _sources = @[
                 @[
                 @"aka_showRedDotBadgeWithCenter:",
                 @"aka_showRedDotBadgeWithCenter:radius:",
                 @"...WithCenter:radius:bgColor:",
                 @"...Center:radius:bgColor:cornerRadius:",
                 ],
                 @[
                     
                     @"AKABadgeCenterStyleRightTopCenter",          /* defualt position */
                     @"AKABadgeCenterStyleOutSideRightTopCenter",       /* right top outsize center  */
                     @"AKABadgeCenterStyleOutSideSelfRightTopAlighBadgeCenterY", /* outside right top & self top align to centerY */
                     @"AKABadgeCenterStyleOutSideRightTopAlighCenterY", /*outside right top *base right align top*/
                     @"AKABadgeCenterStyleOutSideTopRight",             /* outside top right & base top  */
                     @"AKABadgeCenterStyleRightTopInner",               /* right top inner */
                     @"AKABadgeCenterStyleRightBottomCenter",           /* right bottom center  */
                     @"AKABadgeCenterStyleRightBottomOutSide",          /* right bottom outside */
                     @"AKABadgeCenterStyleRightBottomInner",            /* right bottom inner */
                     @"AKABadgeCenterStyleLeftBottomCenter",            /* left bottom center */
                     @"AKABadgeCenterStyleLeftBottomOutside",           /* left bottom outside */
                     @"AKABadgeCenterStyleLeftBottomInner",             /* left bottom inner */
                     @"AKABadgeCenterStyleLeftTopCenter",               /* left top center */
                     @"AKABadgeCenterStyleLeftTopOutSide",              /* left top outside */
                     @"AKABadgeCenterStyleLeftTopInner",
                 ],
                 ];
    
    _titleSources = @[@"custom center ",
                      @"some conviniece center enum",
                      ];
}

#pragma mark -- tableView datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _titleSources.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return ((NSArray *)_sources[section]).count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kNomalCellIdentifier forIndexPath:indexPath];
    switch (indexPath.section) {
        case 0:
        {
            cell.textLabel.text = _sources[indexPath.section][indexPath.row];
            [cell.contentView showBadgePrePare];
            switch (indexPath.row) {
                case 0:
                    [cell.contentView aka_showRedDotBadgeWithCenter:cell.contentView.center];
                    break;
                case 1:
                    [cell.contentView aka_showRedDotBadgeWithCenter:cell.contentView.center radius:10.f];
                    break;
                case 2:
                    [cell.contentView aka_showRedDotBadgeWithCenter:cell.contentView.center radius:7.f bgColor:[UIColor greenColor]];
                    break;
                case 3:
                    [cell.contentView aka_showRedDotBadgeWithCenter:cell.contentView.center radius:8.f bgColor:[UIColor purpleColor] cornerRadius:6.f];
                    break;
                       default:
                    break;
            }
            break;
        }
        case 1:
        {
            cell.textLabel.text = _sources[indexPath.section][indexPath.row];
            switch (indexPath.row) {
                case 0:
                    [cell.contentView aka_showRedDotBadgeWithCenterType:AKABadgeCenterStyleRightTopCenter radius:6 bgColor:[UIColor redColor] cornerRadius:6];
                    break;
                case 1:
                    [cell.contentView aka_showRedDotBadgeWithCenterType:AKABadgeCenterStyleRightTopCenter radius:6 bgColor:[UIColor redColor] cornerRadius:6];
                    break;
                case 2:
                    [cell.contentView aka_showRedDotBadgeWithCenterType:AKABadgeCenterStyleRightTopCenter radius:6 bgColor:[UIColor redColor] cornerRadius:6];
                    break;
                case 3:
                    [cell.contentView aka_showRedDotBadgeWithCenterType:AKABadgeCenterStyleRightTopCenter radius:6 bgColor:[UIColor redColor] cornerRadius:6];
                    break;
                case 4:
                    [cell.contentView aka_showRedDotBadgeWithCenterType:AKABadgeCenterStyleRightTopCenter radius:6 bgColor:[UIColor redColor] cornerRadius:6];
                    break;
                case 5:
                    [cell.contentView aka_showRedDotBadgeWithCenterType:AKABadgeCenterStyleRightTopCenter radius:6 bgColor:[UIColor redColor] cornerRadius:6];
                    break;
                case 6:
                    [cell.contentView aka_showRedDotBadgeWithCenterType:AKABadgeCenterStyleRightTopCenter radius:6 bgColor:[UIColor redColor] cornerRadius:6];
                    break;
                case 7:
                    [cell.contentView aka_showRedDotBadgeWithCenterType:AKABadgeCenterStyleRightTopCenter radius:6 bgColor:[UIColor redColor] cornerRadius:6];
                    break;
                case 8:
                    [cell.contentView aka_showRedDotBadgeWithCenterType:AKABadgeCenterStyleRightTopCenter radius:6 bgColor:[UIColor redColor] cornerRadius:6];
                    break;
                case 9:
                    [cell.contentView aka_showRedDotBadgeWithCenterType:AKABadgeCenterStyleRightTopCenter radius:6 bgColor:[UIColor redColor] cornerRadius:6];
                    break;
                case 10:
                    [cell.contentView aka_showRedDotBadgeWithCenterType:AKABadgeCenterStyleRightTopCenter radius:6 bgColor:[UIColor redColor] cornerRadius:6];
                    break;
                case 11:
                    [cell.contentView aka_showRedDotBadgeWithCenterType:AKABadgeCenterStyleRightTopCenter radius:6 bgColor:[UIColor redColor] cornerRadius:6];
                    break;
                case 12:
                    [cell.contentView aka_showRedDotBadgeWithCenterType:AKABadgeCenterStyleRightTopCenter radius:6 bgColor:[UIColor redColor] cornerRadius:6];
                    break;
                case 13:
                    [cell.contentView aka_showRedDotBadgeWithCenterType:AKABadgeCenterStyleRightTopCenter radius:6 bgColor:[UIColor redColor] cornerRadius:6];
                    break;
                case 14:
                    [cell.contentView aka_showRedDotBadgeWithCenterType:AKABadgeCenterStyleRightTopCenter radius:6 bgColor:[UIColor redColor] cornerRadius:6];
                    break;
                default:
                    break;
            }
        }
            break;
        default:
            break;
    }
       return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kCellH;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return _titleSources[section];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return kCellHeaderViewH;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
