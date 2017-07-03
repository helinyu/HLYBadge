//
//  AKABadgeProtocol.h
//  HLYBadge
//
//  Created by Aka on 2017/6/30.
//  Copyright © 2017年 Aka. All rights reserved.
//

#import <UIKit/UIKit.h>

#define AKABadgeDefautBgColor [UIColor colorWithRed:255.0/255.f green:88.f/255.f blue:81.f/255.f alpha:1.f]
#define AKABadgeDefautTextColor [UIColor whiteColor]

static const CGFloat quarterBadgeDefaultRadius = 5.f;

static const double quartRootOf2 = 1.4142135623731;

#define sqrt2(x) (x/quartRootOf2)
/*
key for associative methods
*/
static char roundBadgeKey;
static char roundBadgeCornerRadiusKey;
static char badgeCacheKey;

static char quarterBadgeKey;
static char quarterBadgeArrowKey;

typedef NS_ENUM(NSUInteger, AKABadgeStyle)
{
    AKABadgeStyleRedDot = 0,          /* red dot style */
    AKABadgeStyleNumber,              /* badge with number */
    AKABadgeStyleText,                /* badge with a fixed text */
    AKABadgeStyleImage,               /* badge with a fixed image */
    AKABadgeStyleQuarterText,         /* badge with a arrow configure text */
};

typedef NS_ENUM(NSUInteger, AKABadgeCenterStyle)
{
    AKABadgeCenterStyleRightTopCenter = 0,          /* defualt position */
    AKABadgeCenterStyleOutSideRightTopCenter,       /* right top outsize center  */
    AKABadgeCenterStyleOutSideSelfRightTopAlighBadgeCenterY, /* outside right top & self top align to centerY */
    AKABadgeCenterStyleOutSideRightTopAlighCenterY, /*outside right top *base right align top*/
    AKABadgeCenterStyleOutSideTopRight,             /* outside top right & base top  */
    AKABadgeCenterStyleRightTopInner,               /* right top inner */
    AKABadgeCenterStyleRightBottomCenter,           /* right bottom center  */
    AKABadgeCenterStyleRightBottomOutSide,          /* right bottom outside */
    AKABadgeCenterStyleRightBottomInner,            /* right bottom inner */
    AKABadgeCenterStyleLeftBottomCenter,            /* left bottom center */
    AKABadgeCenterStyleLeftBottomOutside,           /* left bottom outside */
    AKABadgeCenterStyleLeftBottomInner,             /* left bottom inner */
    AKABadgeCenterStyleLeftTopCenter,               /* left top center */
    AKABadgeCenterStyleLeftTopOutSide,              /* left top outside */
    AKABadgeCenterStyleLeftTopInner,                /* left top inner */
};

typedef NS_ENUM(NSUInteger, AKAQuarterBadgeArrowStyle)
{
    AKAQuarterBadgeArrowStyleLeftBottom, /*default style ,  arrow position relative the badge, the arrow direction is fisrt is left & bottom */
    AKAQuarterBadgeArrowStylebottomLeft, /*arrow position, relative the badge ,the arrow direction is first is bottom * left*/
    AKAQuarterBadgeArrowStyleLeftTop, /*…… left & top */
    AKAQuarterBadgeArrowStyleTopLeft, /*…… top & left */
    AKAQuarterBadgeArrowStyleRightTop, /* …… right & top*/
    AKAQuarterBadgeArrowStyleTopRight, /* …… top & right */
    AKAQuarterBadgeArrowStyleRightBottom, /* …… right & bottom */
    AKAQuarterBadgeArrowStyleBottomRight, /* …… botton & right */
};

static const CGFloat defaultRedotRadius = 4.f;

@protocol AKABadgeProtocol <NSObject>

@required

@property (nonatomic, strong) NSCache *badgeCache;  // cache the badge

//(1) round badge

@property (nonatomic, strong) UILabel *roundBadge; //recommend not to not to set manually

@property (nonatomic, assign) CGFloat roundCornerRadius; // set the round badge corner radius


// (2) quarter badge

@property (nonatomic, strong) UILabel *quarterBadge; // recommen not no to set manually

@property (nonatomic, strong) UIView *quarterArrow;  // Arrow for direction


@end
