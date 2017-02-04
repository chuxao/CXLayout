//
//  CXLayoutCommon.h
//  CXLayout
//
//  Created by chuxiao on 2016/1/19.
//  Copyright © 2016年 chuxiao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define CX_Nil nil
#define CX_Default    1
#define CX__Default nil,1
#define CX_Width nil,1
#define CX_Height nil,1
#define CX_Center nil,1
#define CX_Equal(x) x,1,0

#define Equal_left(x,y,z)      equal.left(x,y,z)
#define Equal_top(x,y,z)       equal.top(x,y,z)
#define Equal_right(x,y,z)     equal.right(x,y,z)
#define Equal_bottom(x,y,z)    equal.bottom(x,y,z)
#define Equal_leading(x,y,z)   equal.leading(x,y,z)
#define Equal_trailing(x,y,z)  equal.trailing(x,y,z)
#define Equal_width(x,y,z)     equal.width(x,y,z)
#define Equal_height(x,y,z)    equal.height(x,y,z)
#define Equal_centerX(x,y,z)   equal.centerX(x,y,z)
#define Equal_centerY(x,y,z)   equal.centerY(x,y,z)

typedef NS_ENUM(NSInteger, CXLayoutType) {
    CXLayoutTypeAdd = 1,
    CXLayoutTypeUpdate,
    
};

typedef NS_OPTIONS(NSInteger, CXAttribute) {
    CXAttributeLeft = 1 << NSLayoutAttributeLeft,
    CXAttributeRight = 1 << NSLayoutAttributeRight,
    CXAttributeTop = 1 << NSLayoutAttributeTop,
    CXAttributeBottom = 1 << NSLayoutAttributeBottom,
    CXAttributeLeading = 1 << NSLayoutAttributeLeading,
    CXAttributeTrailing = 1 << NSLayoutAttributeTrailing,
    CXAttributeWidth = 1 << NSLayoutAttributeWidth,
    CXAttributeHeight = 1 << NSLayoutAttributeHeight,
    CXAttributeCenterX = 1 << NSLayoutAttributeCenterX,
    CXAttributeCenterY = 1 << NSLayoutAttributeCenterY,
    CXAttributeBaseline = 1 << NSLayoutAttributeBaseline,
    
#if (__IPHONE_OS_VERSION_MIN_REQUIRED >= 80000) || (__TV_OS_VERSION_MIN_REQUIRED >= 9000) || (__MAC_OS_X_VERSION_MIN_REQUIRED >= 101100)
    
    CXAttributeFirstBaseline = 1 << NSLayoutAttributeFirstBaseline,
    CXAttributeLastBaseline = 1 << NSLayoutAttributeLastBaseline,
    
#endif
    
#if TARGET_OS_IPHONE || TARGET_OS_TV
    
    CXAttributeLeftMargin = 1 << NSLayoutAttributeLeftMargin,
    CXAttributeRightMargin = 1 << NSLayoutAttributeRightMargin,
    CXAttributeTopMargin = 1 << NSLayoutAttributeTopMargin,
    CXAttributeBottomMargin = 1 << NSLayoutAttributeBottomMargin,
    CXAttributeLeadingMargin = 1 << NSLayoutAttributeLeadingMargin,
    CXAttributeTrailingMargin = 1 << NSLayoutAttributeTrailingMargin,
    CXAttributeCenterXWithinMargins = 1 << NSLayoutAttributeCenterXWithinMargins,
    CXAttributeCenterYWithinMargins = 1 << NSLayoutAttributeCenterYWithinMargins,
    
#endif
    
};
