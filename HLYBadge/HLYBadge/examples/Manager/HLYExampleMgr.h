//
//  ExmpleMgr.h
//  HLYBadge
//
//  Created by Aka on 2017/6/30.
//  Copyright © 2017年 Aka. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HLYExampleMgr : NSObject

@property (nonatomic, strong, readonly) NSArray *itemCatogries;

+ (instancetype)shared;
- (void)initLoadDatas;

@end

static NSString *const descriptionIndex = @"title";
static NSString *const vcIndex = @"vc";
