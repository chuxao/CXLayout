//
//  UIView+CXLayout.m
//  CXLayout
//
//  Created by chuxiao on 2017/1/14.
//  Copyright © 2017年 chuxiao. All rights reserved.
//

#import "UIView+CXLayout.h"


@implementation UIView (CXLayout)

- (NSArray<__kindof CXConstraint *> *)CX_AutoLayout:(void(^)(CXLayoutManager * mgr))block{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    
    CXLayoutManager *constraintMaker = [[CXLayoutManager alloc] initWithView:self];
    constraintMaker.layoutType = CXLayoutTypeAdd;
    
    block(constraintMaker);
    
    return [constraintMaker install];;
}


- (NSArray<__kindof CXConstraint *> *)CX_AutoLayoutUpdate:(void(^)(CXLayoutManager * mgr))block{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    CXLayoutManager *constraintMaker = [[CXLayoutManager alloc] initWithView:self];
    constraintMaker.layoutType = CXLayoutTypeUpdate;

    block(constraintMaker);
    
    return [constraintMaker install];;
}


- (instancetype)closestCommonSuperview:(UIView *)view {
    UIView *closestCommonSuperview = nil;
    UIView *secondViewSuperview = view;
    while (!closestCommonSuperview && secondViewSuperview) {
        
        UIView *firstViewSuperview = self;
        while (!closestCommonSuperview && firstViewSuperview) {
            if (secondViewSuperview == firstViewSuperview) {
                closestCommonSuperview = secondViewSuperview;
            }
            firstViewSuperview = firstViewSuperview.superview;
        }
        secondViewSuperview = secondViewSuperview.superview;
    }
    return closestCommonSuperview;
}


#pragma mark - NSLayoutAttribute properties --- 成员属性的Get方法，创建CXViewAttribute对象
- (CXViewAttribute *)left {
    return [[CXViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeLeft];
}

- (CXViewAttribute *)top {
    return [[CXViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeTop];
}

- (CXViewAttribute *)right {
    return [[CXViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeRight];
}

- (CXViewAttribute *)bottom {
    return [[CXViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeBottom];
}

- (CXViewAttribute *)leading {
    return [[CXViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeLeading];
}

- (CXViewAttribute *)trailing {
    return [[CXViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeTrailing];
}

- (CXViewAttribute *)width {
    return [[CXViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeWidth];
}

- (CXViewAttribute *)height {
    return [[CXViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeHeight];
}

- (CXViewAttribute *)centerX {
    return [[CXViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeCenterX];
}

- (CXViewAttribute *)centerY {
    return [[CXViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeCenterY];
}

- (CXViewAttribute *)baseline {
    
    return [[CXViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeBaseline];
    
    return self.attribute(NSLayoutAttributeBaseline);
}

//创建你指定的NSLayoutAttribute，上面那些成员的初始化都可以调用下方的函数完成
- (CXViewAttribute *(^)(NSLayoutAttribute))attribute
{
    return ^(NSLayoutAttribute attr) {
        return [[CXViewAttribute alloc] initWithView:self layoutAttribute:attr];
    };
}

#if (__IPHONE_OS_VERSION_MIN_REQUIRED >= 80000) || (__TV_OS_VERSION_MIN_REQUIRED >= 9000) || (__MAC_OS_X_VERSION_MIN_REQUIRED >= 101100)

- (CXViewAttribute *)firstBaseline {
    return [[CXViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeFirstBaseline];
}
- (CXViewAttribute *)lastBaseline {
    return [[CXViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeLastBaseline];
}

#endif

#if TARGET_OS_IPHONE || TARGET_OS_TV

- (CXViewAttribute *)leftMargin {
    return [[CXViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeLeftMargin];
}

- (CXViewAttribute *)rightMargin {
    return [[CXViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeRightMargin];
}

- (CXViewAttribute *)topMargin {
    return [[CXViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeTopMargin];
}

- (CXViewAttribute *)bottomMargin {
    return [[CXViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeBottomMargin];
}

- (CXViewAttribute *)leadingMargin {
    return [[CXViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeLeadingMargin];
}

- (CXViewAttribute *)trailingMargin {
    return [[CXViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeTrailingMargin];
}

- (CXViewAttribute *)centerXWithinMargins {
    return [[CXViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeCenterXWithinMargins];
}

- (CXViewAttribute *)centerYWithinMargins {
    return [[CXViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeCenterYWithinMargins];
}

#endif






@end
