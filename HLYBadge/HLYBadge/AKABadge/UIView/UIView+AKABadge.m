//
//  UIView+AKABadge.m
//  HLYBadge
//
//  Created by Aka on 2017/6/30.
//  Copyright © 2017年 Aka. All rights reserved.
//

#import "UIView+AKABadge.h"
#import "UIView+HLYFrame.h"
#import <objc/runtime.h>

@implementation UIView (AKABadge)

#pragma mark -- show method

- (void)aka_showRedDotBadgeWithCenter:(CGPoint)center {
    [self aka_showRedDotBadgeWithCenter:center radius:0.f];
}

- (void)aka_showRedDotBadgeWithCenter:(CGPoint)center
                               radius:(CGFloat)radius{
    [self aka_showRedDotBadgeWithCenter:center radius:radius bgColor:nil];
    
}

- (void)aka_showRedDotBadgeWithCenter:(CGPoint)center
                               radius:(CGFloat)radius
                              bgColor:(UIColor *)color {
    [self aka_showRedDotBadgeWithCenter:center radius:radius bgColor:color cornerRadius:0.f];
    
}

- (void)aka_showRedDotBadgeWithCenter:(CGPoint)center
                               radius:(CGFloat)radius
                              bgColor:(UIColor *)color
                         cornerRadius:(CGFloat)cornerRadius {
    if (!self.badgeCache) {
        self.badgeCache = [NSCache new];
    }
    UILabel *badge = (UILabel *)[self.badgeCache objectForKey:@(AKABadgeStyleRedDot)];
    if (!badge) {
        badge = [UILabel new];
    }
    badge.text = @"";
    
    badge.center = center;
    
    if (radius <= 0.f) {
        radius = 4.f;
    }
    badge.size = CGSizeMake(radius *2, radius *2);
    
    if (!color) {
        color = AKABadgeDefautBgColor;
    }
    badge.backgroundColor = color;
    
    if (cornerRadius <= 0) {
        cornerRadius = radius;
    }
    badge.layer.cornerRadius = cornerRadius;
    
    badge.layer.masksToBounds = YES;
    
    [self addSubview:badge];
}

- (void)aka_showRedDotBadgeWithCenterType:(AKABadgeCenterStyle)centerType
                               radius:(CGFloat)radius
                              bgColor:(UIColor *)color
                         cornerRadius:(CGFloat)cornerRadius {
    if (!self.badgeCache) {
        self.badgeCache = [NSCache new];
    }
    UILabel *badge = (UILabel *)[self.badgeCache objectForKey:@(AKABadgeStyleRedDot)];
    if (!badge) {
        badge = [UILabel new];
    }
    badge.text = @"";
    
    if (radius <= 0.f) {
        radius = 4.f;
    }
    badge.size = CGSizeMake(radius *2, radius *2);
    
    if (!color) {
        color = AKABadgeDefautBgColor;
    }
    badge.backgroundColor = color;
    
    if (cornerRadius <= 0) {
        cornerRadius = radius;
    }
    badge.layer.cornerRadius = cornerRadius;
    
    switch (centerType) {
        case AKABadgeCenterStyleRightTopCenter:
            badge.center = CGPointMake(CGRectGetMaxX(self.bounds), CGRectGetMinY(self.bounds));
            break;
        case AKABadgeCenterStyleOutSideRightTopCenter:
            badge.center = CGPointMake(CGRectGetMaxX(self.bounds)+sqrt2(radius), CGRectGetMinY(self.bounds) - sqrt2(radius));
            break;
//        case AKABadgeCenterStyleOutSideRightTop:
//            badge.center = CGPointMake(CGRectGetMaxX(self.bounds)+sqrt2(radius), CGRectGetMinY(self.bounds)+sqrt2(radius));
//            break;
        case AKABadgeCenterStyleOutSideTopRight:
            badge.center = CGPointMake(CGRectGetMaxX(self.bounds)+sqrt2(radius), CGRectGetMinY(self.bounds) - sqrt2(radius));
            break;
        case AKABadgeCenterStyleRightTopInner:
            badge.center = CGPointMake(CGRectGetMaxX(self.bounds)- radius, CGRectGetMinY(self.bounds)+ radius);
            break;
        case AKABadgeCenterStyleRightBottomCenter:
            badge.center = CGPointMake(CGRectGetMaxX(self.bounds), CGRectGetMinY(self.bounds));
            break;
        case AKABadgeCenterStyleRightBottomOutSide:
            badge.center = CGPointMake(CGRectGetMaxX(self.bounds), CGRectGetMinY(self.bounds));
            break;
        case AKABadgeCenterStyleRightBottomInner:
            badge.center = CGPointMake(CGRectGetMaxX(self.frame), CGRectGetMinY(self.frame));
            break;
        case AKABadgeCenterStyleLeftBottomCenter:
            badge.center = CGPointMake(CGRectGetMaxX(self.frame), CGRectGetMinY(self.frame));
            break;
        case AKABadgeCenterStyleLeftBottomOutside:
            badge.center = CGPointMake(CGRectGetMaxX(self.frame), CGRectGetMinY(self.frame));
            break;
        case AKABadgeCenterStyleLeftBottomInner:
            badge.center = CGPointMake(CGRectGetMaxX(self.frame), CGRectGetMinY(self.frame));
            break;
        case AKABadgeCenterStyleLeftTopCenter:
            badge.center = CGPointMake(CGRectGetMaxX(self.frame), CGRectGetMinY(self.frame));
            break;
        case AKABadgeCenterStyleLeftTopOutSide:
            badge.center = CGPointMake(CGRectGetMaxX(self.frame), CGRectGetMinY(self.frame));
            break;
        case AKABadgeCenterStyleLeftTopInner:
            badge.center = CGPointMake(CGRectGetMaxX(self.frame), CGRectGetMinY(self.frame));
            break;
        default:
            badge.center = CGPointMake(CGRectGetMaxX(self.bounds), CGRectGetMinY(self.bounds));
            break;
    }
    
    badge.layer.masksToBounds = YES;
    
    [self addSubview:badge];
}


#pragma mark -- getter/setter

//(1) round badge

- (void)setRoundBadge:(UILabel *)roundBadge {
    objc_setAssociatedObject(self, &roundBadgeKey, roundBadge, OBJC_ASSOCIATION_RETAIN);
}

- (UILabel *)roundBadge {
    return objc_getAssociatedObject(self, &roundBadgeKey);
}

- (void)setRoundCornerRadius:(CGFloat)roundCornerRadius {
    NSNumber *roundCornerRadiusObj = @(roundCornerRadius);
    objc_setAssociatedObject(self, &roundBadgeCornerRadiusKey, roundCornerRadiusObj, OBJC_ASSOCIATION_ASSIGN);
}

- (CGFloat)roundCornerRadius {
  id obj = objc_getAssociatedObject(self, &roundBadgeCornerRadiusKey);
    if (obj != nil && [obj isKindOfClass:[NSNumber class]]) {
        return [obj floatValue];
    }
    return .0f;
}

- (void)setBadgeCache:(NSCache *)badgeCache {
    if (!badgeCache) {
        badgeCache = [NSCache new];
    }
    objc_setAssociatedObject(self, &badgeCacheKey, badgeCache, OBJC_ASSOCIATION_RETAIN);
}

- (NSCache *)badgeCache {
    return objc_getAssociatedObject(self, &badgeCacheKey);
}

@end
