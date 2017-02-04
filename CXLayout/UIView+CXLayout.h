//
//  UIView+CXLayout.h
//  CXLayout
//
//  Created by chuxiao on 2016/1/14.
//  Copyright © 2016年 chuxiao. All rights reserved.
//

#import "CXLayoutManager.h"
#import "CXViewAttribute.h"


//#define aaa(format, ...)  fprintf(stderr, format, ## __VA_ARGS__)


@interface UIView (CXLayout)

@property (nonatomic, strong, readonly) CXViewAttribute *left;
@property (nonatomic, strong, readonly) CXViewAttribute *top;
@property (nonatomic, strong, readonly) CXViewAttribute *right;
@property (nonatomic, strong, readonly) CXViewAttribute *bottom;
@property (nonatomic, strong, readonly) CXViewAttribute *leading;
@property (nonatomic, strong, readonly) CXViewAttribute *trailing;
@property (nonatomic, strong, readonly) CXViewAttribute *width;
@property (nonatomic, strong, readonly) CXViewAttribute *height;
@property (nonatomic, strong, readonly) CXViewAttribute *centerX;
@property (nonatomic, strong, readonly) CXViewAttribute *centerY;
@property (nonatomic, strong, readonly) CXViewAttribute *baseline;
@property (nonatomic, strong, readonly) CXViewAttribute *(^attribute)(NSLayoutAttribute attr);

#if TARGET_OS_IPHONE || TARGET_OS_TV
@property (nonatomic, strong, readonly) CXViewAttribute *leftMargin;
@property (nonatomic, strong, readonly) CXViewAttribute *rightMargin;
@property (nonatomic, strong, readonly) CXViewAttribute *topMargin;
@property (nonatomic, strong, readonly) CXViewAttribute *bottomMargin;
@property (nonatomic, strong, readonly) CXViewAttribute *leadingMargin;
@property (nonatomic, strong, readonly) CXViewAttribute *trailingMargin;
@property (nonatomic, strong, readonly) CXViewAttribute *centerXWithinMargins;
@property (nonatomic, strong, readonly) CXViewAttribute *centerYWithinMargins;
#endif

#if (__IPHONE_OS_VERSION_MIN_REQUIRED >= 80000) || (__TV_OS_VERSION_MIN_REQUIRED >= 9000) || (__MAC_OS_X_VERSION_MIN_REQUIRED >= 101100)
@property (nonatomic, strong, readonly) CXViewAttribute *firstBaseline;
@property (nonatomic, strong, readonly) CXViewAttribute *lastBaseline;
#endif





- (NSArray<__kindof CXConstraint *> *)CX_AutoLayout:(void(^)(CXLayoutManager * mgr))block;
- (NSArray<__kindof CXConstraint *> *)CX_AutoLayoutUpdate:(void(^)(CXLayoutManager * mgr))block;

- (instancetype)closestCommonSuperview:(UIView *)view;
@end
