//
//  AKALabel.m
//  HLYBadge
//
//  Created by Aka on 2017/7/3.
//  Copyright © 2017年 Aka. All rights reserved.
//

#import "AKALabel.h"

@implementation AKALabel

- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines {
    return CGRectMake(0, 0, bounds.size.width, bounds.size.height);
}

- (void)drawTextInRect:(CGRect)rect {
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, self.insetsPadding)];
}

@end
