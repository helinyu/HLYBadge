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

#pragma mark -- quarter badge

- (UILabel *)quarterBadge {
    return objc_getAssociatedObject(self, &quarterBadgeKey);
}

- (void)setQuarterBadge:(UILabel *)quarterBadge {
    objc_setAssociatedObject(self, &quarterBadge, quarterBadge, OBJC_ASSOCIATION_RETAIN);
}

- (UIView *)quarterArrow {
    return objc_getAssociatedObject(self, &quarterBadgeArrowKey);
}

- (void)setQuarterArrow:(UIView *)quarterArrow {
    objc_setAssociatedObject(self, &quarterBadgeArrowKey, quarterArrow, OBJC_ASSOCIATION_RETAIN);
}

- (void)aka_showTextQuarterBadgeWithOrigin:(CGPoint)origin
             quarterBadgeArrowStyle:(AKAQuarterBadgeArrowStyle)arrowStyle
                            bgColor:(UIColor *)color
                                      text:(NSString *)text
                                 textColor:(UIColor *)textColor {
    BOOL needCache = NO;
    UILabel *quarterBage ;
    if (self.badgeCache) {
        quarterBage = (UILabel *)[self.badgeCache objectForKey:@(AKABadgeStyleQuarterText)];
    }else{
        self.badgeCache = [NSCache new];
        quarterBage = [UILabel new];
        needCache = YES;
    }
    
    quarterBage.text = text;
    [quarterBage sizeToFit];
    CGRect frame = quarterBage.frame;
    frame.origin = origin;
    quarterBage.frame = frame;
    
    if (!color) {
        color = AKABadgeDefautBgColor;
    }
    quarterBage.backgroundColor = color;
    
    if (!textColor) {
        textColor = AKABadgeDefautTextColor;
    }
    quarterBage.textColor = textColor;
    [self addSubview:quarterBage];
    
    if (needCache && quarterBage) {
        [self.badgeCache setObject:quarterBage forKey:@(AKABadgeStyleQuarterText)];
    }
    
    [self configureArrow:quarterBage arrowStyle:arrowStyle];
    
}

- (void)configureArrow:(UILabel *)quarterBadge arrowStyle:(AKAQuarterBadgeArrowStyle)arrowStyle{
    CGFloat x = quarterBadge.x;
    CGFloat y = quarterBadge.y;
    CGFloat width = quarterBadge.width;
    CGFloat height = quarterBadge.height;
    CGFloat shortEdge = height * (1 - 0.618);
    CGFloat longEdge = height * 0.618;
    
    switch (arrowStyle) {
        case AKAQuarterBadgeArrowStyleLeftBottom:
        {
            CAShapeLayer *arrowLayer = [CAShapeLayer new];
            [quarterBadge.layer addSublayer:arrowLayer];
            UIBezierPath *linePath = [UIBezierPath bezierPath];
            [linePath moveToPoint:CGPointMake(0, height)];
            [linePath addLineToPoint:CGPointMake(-longEdge, height)];
            [linePath addLineToPoint:CGPointMake(0, height - shortEdge)];
            arrowLayer.path = linePath.CGPath;
            arrowLayer.lineWidth = 0.f;
            arrowLayer.fillColor = AKABadgeDefautBgColor.CGColor;
            arrowLayer.strokeColor = AKABadgeDefautBgColor.CGColor;
            arrowLayer.lineCap = kCALineCapButt;
        }
            break;
        case AKAQuarterBadgeArrowStylebottomLeft:
        {
            CAShapeLayer *arrowLayer = [CAShapeLayer new];
            [quarterBadge.layer addSublayer:arrowLayer];
            UIBezierPath *linePath = [UIBezierPath bezierPath];
            [linePath moveToPoint:CGPointMake(0, height)];
            [linePath addLineToPoint:CGPointMake(0, longEdge + height)];
            [linePath addLineToPoint:CGPointMake(shortEdge,height)];
            arrowLayer.path = linePath.CGPath;
            arrowLayer.lineWidth = 0.f;
            arrowLayer.fillColor = AKABadgeDefautBgColor.CGColor;
            arrowLayer.strokeColor = AKABadgeDefautBgColor.CGColor;
            arrowLayer.lineCap = kCALineCapButt;
        }
            break;
        case AKAQuarterBadgeArrowStyleLeftTop:
        {
            CAShapeLayer *arrowLayer = [CAShapeLayer new];
            [quarterBadge.layer addSublayer:arrowLayer];
            UIBezierPath *linePath = [UIBezierPath bezierPath];
            [linePath moveToPoint:CGPointMake(0, 0)];
            [linePath addLineToPoint:CGPointMake(0, shortEdge)];
            [linePath addLineToPoint:CGPointMake(-longEdge, 0)];
            arrowLayer.path = linePath.CGPath;
            arrowLayer.lineWidth = 0.f;
            arrowLayer.fillColor = AKABadgeDefautBgColor.CGColor;
            arrowLayer.strokeColor = AKABadgeDefautBgColor.CGColor;
            arrowLayer.lineCap = kCALineCapButt;
        }
            break;
        case AKAQuarterBadgeArrowStyleTopLeft:
        {
            CAShapeLayer *arrowLayer = [CAShapeLayer new];
            [quarterBadge.layer addSublayer:arrowLayer];
            UIBezierPath *linePath = [UIBezierPath bezierPath];
            [linePath moveToPoint:CGPointMake(0,0)];
            [linePath addLineToPoint:CGPointMake(shortEdge, 0)];
            [linePath addLineToPoint:CGPointMake(0, -longEdge)];
            arrowLayer.path = linePath.CGPath;
            arrowLayer.lineWidth = 0.f;
            arrowLayer.fillColor = AKABadgeDefautBgColor.CGColor;
            arrowLayer.strokeColor = AKABadgeDefautBgColor.CGColor;
            arrowLayer.lineCap = kCALineCapButt;
        }
            break;
        case AKAQuarterBadgeArrowStyleRightTop:
        {
            CAShapeLayer *arrowLayer = [CAShapeLayer new];
            [quarterBadge.layer addSublayer:arrowLayer];
            UIBezierPath *linePath = [UIBezierPath bezierPath];
            [linePath moveToPoint:CGPointMake(width,0)];
            [linePath addLineToPoint:CGPointMake(longEdge+width,0)];
            [linePath addLineToPoint:CGPointMake(width, shortEdge)];
            arrowLayer.path = linePath.CGPath;
            arrowLayer.lineWidth = 0.f;
            arrowLayer.fillColor = AKABadgeDefautBgColor.CGColor;
            arrowLayer.strokeColor = AKABadgeDefautBgColor.CGColor;
            arrowLayer.lineCap = kCALineCapButt;
        }
            break;
        case AKAQuarterBadgeArrowStyleTopRight:
        {
            CAShapeLayer *arrowLayer = [CAShapeLayer new];
            [quarterBadge.layer addSublayer:arrowLayer];
            UIBezierPath *linePath = [UIBezierPath bezierPath];
            [linePath moveToPoint:CGPointMake(width, 0)];
            [linePath addLineToPoint:CGPointMake(width, -longEdge)];
            [linePath addLineToPoint:CGPointMake(width-shortEdge,0)];
            arrowLayer.path = linePath.CGPath;
            arrowLayer.lineWidth = 0.f;
            arrowLayer.fillColor = AKABadgeDefautBgColor.CGColor;
            arrowLayer.strokeColor = AKABadgeDefautBgColor.CGColor;
            arrowLayer.lineCap = kCALineCapButt;
        }
            break;
        case AKAQuarterBadgeArrowStyleRightBottom:
        {
            CAShapeLayer *arrowLayer = [CAShapeLayer new];
            [quarterBadge.layer addSublayer:arrowLayer];
            UIBezierPath *linePath = [UIBezierPath bezierPath];
            [linePath moveToPoint:CGPointMake(width, height)];
            [linePath addLineToPoint:CGPointMake(width+longEdge, height)];
            [linePath addLineToPoint:CGPointMake(width, height-shortEdge)];
            arrowLayer.path = linePath.CGPath;
            arrowLayer.lineWidth = 0.f;
            arrowLayer.fillColor = AKABadgeDefautBgColor.CGColor;
            arrowLayer.strokeColor = AKABadgeDefautBgColor.CGColor;
            arrowLayer.lineCap = kCALineCapButt;
        }
            break;
        case AKAQuarterBadgeArrowStyleBottomRight:
        {
            CAShapeLayer *arrowLayer = [CAShapeLayer new];
            [quarterBadge.layer addSublayer:arrowLayer];
            UIBezierPath *linePath = [UIBezierPath bezierPath];
            [linePath moveToPoint:CGPointMake(width, height)];
            [linePath addLineToPoint:CGPointMake(width, height+longEdge)];
            [linePath addLineToPoint:CGPointMake(width-shortEdge,height)];
            arrowLayer.path = linePath.CGPath;
            arrowLayer.lineWidth = 0.f;
            arrowLayer.fillColor = AKABadgeDefautBgColor.CGColor;
            arrowLayer.strokeColor = AKABadgeDefautBgColor.CGColor;
            arrowLayer.lineCap = kCALineCapButt;
        }
            break;
        default:
            break;
    }
}



@end
