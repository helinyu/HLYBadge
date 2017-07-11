//
//  UIView+AKABadge.h
//  HLYBadge
//
//  Created by Aka on 2017/6/30.
//  Copyright © 2017年 Aka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AKABadgeProtocol.h"

@interface UIView (AKABadge)<AKABadgeProtocol>

//(1) round badge

@property (nonatomic, strong) UILabel *roundBadge; //recommend not to not to set manually

@property (nonatomic, assign) CGFloat roundCornerRadius; // set the round badge corner radius

//@property (nonatomic, strong) NSCache *badgeCache;  // cache the badge



/**
 *  showRedotBadge
 * param 
 * center : badge center position
 * radius : badge radius (radius = width /2)
 * color  : badge background color
 * cornerRadius : default like that (cornerRadius = radius/2)
 *
 */
- (void)aka_showRedDotBadgeWithCenter:(CGPoint)center
                               radius:(CGFloat)radius
                              bgColor:(UIColor *)color
                         cornerRadius:(CGFloat)cornerRadius;
/**
 * showBadge conviniece methods
 */
- (void)aka_showRedDotBadgeWithCenter:(CGPoint)center;
- (void)aka_showRedDotBadgeWithCenter:(CGPoint)center
                               radius:(CGFloat)radius;
- (void)aka_showRedDotBadgeWithCenter:(CGPoint)center
                               radius:(CGFloat)radius
                              bgColor:(UIColor *)color;

/*
 * another method for display center style for red dot
 */
- (void)aka_showRedDotBadgeWithCenterType:(AKABadgeCenterStyle)centerType
                                   radius:(CGFloat)radius
                                  bgColor:(UIColor *)color
                             cornerRadius:(CGFloat)cornerRadius;

- (void)hideBadge;
- (void)showBadgePrePare;


#pragma mark -- quarter corner

// (2) quarter badge

@property (nonatomic, strong) UILabel *quarterBadge; // recommen not no to set manually

@property (nonatomic, strong) UIView *quarterArrow;  // Arrow for direction

- (void)aka_showTextQuarterBadgeWithOrigin:(CGPoint)origin
                    quarterBadgeArrowStyle:(AKAQuarterBadgeArrowStyle)arrowStyle
                                   bgColor:(UIColor *)color
                                      text:(NSString *)text
                                 textColor:(UIColor *)textColo;

@end
