//
//  UIView+CXLayout.m
//  CXLayout
//
//  Created by chuxiao on 2017/1/14.
//  Copyright © 2017年 chuxiao. All rights reserved.
//

#import "UIView+CXLayout.h"


@implementation UIView (CXLayout)


//新建约束并添加
- (NSArray<__kindof CXConstraint *> *)CX_AutoLayout:(void(^)(CXLayoutManager * mgr))block{

    //关闭自动添加约束，我们要手动添加
    self.translatesAutoresizingMaskIntoConstraints = NO;
    
    //创建ConstraintMaker
    CXLayoutManager *constraintMaker = [[CXLayoutManager alloc] initWithView:self];
    constraintMaker.layoutType = CXLayoutTypeAdd;
    
    //给maker中的各种成员属性赋值，通过Block进行值的回调，此处的Block就是钩取用户的数据的钩子（参考设计模式中的“好莱坞原则”）
    block(constraintMaker);
    
    return [constraintMaker install];;
}


- (NSArray<__kindof CXConstraint *> *)CX_AutoLayoutUpdate:(void(^)(CXLayoutManager * mgr))block{
    //关闭自动添加约束，我们要手动添加
    self.translatesAutoresizingMaskIntoConstraints = NO;
    
    //创建ConstraintMaker
    CXLayoutManager *constraintMaker = [[CXLayoutManager alloc] initWithView:self];
    constraintMaker.layoutType = CXLayoutTypeUpdate;
    
    //给maker中的各种成员属性赋值，通过Block进行值的回调，此处的Block就是钩取用户的数据的钩子（参考设计模式中的“好莱坞原则”）
    block(constraintMaker);
    
    return [constraintMaker install];;
}

//寻找当前视图与参数中的视图的共同父视图，因为约束是添加在父视图上的
- (instancetype)closestCommonSuperview:(UIView *)view {
    UIView *closestCommonSuperview = nil;     //暂存父视图
    UIView *secondViewSuperview = view;
    while (!closestCommonSuperview && secondViewSuperview) {        //遍历secondView的所有父视图
        
        UIView *firstViewSuperview = self;
        while (!closestCommonSuperview && firstViewSuperview) {     //遍历当前视图的父视图
            if (secondViewSuperview == firstViewSuperview) {
                closestCommonSuperview = secondViewSuperview;       //找到了共同的父视图就结束循环
            }
            firstViewSuperview = firstViewSuperview.superview;
        }
        secondViewSuperview = secondViewSuperview.superview;
    }
    return closestCommonSuperview;                                   //返回共同的父视图
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
    
    //你也可以调用这个方法
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

- (CXViewAttribute *)mas_leftMargin {
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
