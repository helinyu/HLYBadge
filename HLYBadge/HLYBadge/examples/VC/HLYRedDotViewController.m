//
//  HLyRedDotViewController.m
//  HLYBadge
//
//  Created by Aka on 2017/6/30.
//  Copyright © 2017年 Aka. All rights reserved.
//

#import "HLYRedDotViewController.h"
#import "AKABadgeImport.h"

@interface HLYRedDotViewController ()

@end

@implementation HLYRedDotViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"red dot";
    
//    NSLog(@"min x :%f",CGRectGetMinX(self.view.frame));
//    NSLog(@"max x :%f",CGRectGetMaxX(self.view.frame));
//    NSLog(@"mid x :%f",CGRectGetMidX(self.view.frame));
//    [self.view aka_showRedDotBadgeWithCenter:CGPointMake(100, 100)];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"点击" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(toAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    btn.frame = CGRectMake(100, 100, 100, 100);
    btn.backgroundColor = [UIColor greenColor];
    [btn aka_showRedDotBadgeWithCenterType:AKABadgeCenterStyleOutSideTopRight radius:10.f bgColor:[UIColor redColor] cornerRadius:0.f];
    
    
    
    
}

- (void)toAction:(UIButton *)sender {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
