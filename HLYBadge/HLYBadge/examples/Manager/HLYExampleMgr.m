//
//  ExmpleMgr.m
//  HLYBadge
//
//  Created by Aka on 2017/6/30.
//  Copyright © 2017年 Aka. All rights reserved.
//

#import "HLYExampleMgr.h"
#import "HLYRedDotViewController.h"

@interface HLYExampleMgr ()

@property (nonatomic, strong, readwrite) NSArray *itemCatogries;

@end

@implementation HLYExampleMgr

+ (instancetype)shared {
    static id singleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleton = [[self alloc] init];
    });
    return singleton;
}

- (void)initLoadDatas {
    _itemCatogries = @[
                       @{descriptionIndex:@"描述",vcIndex:[HLYRedDotViewController new]},
                       ];
}



@end
