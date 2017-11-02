//
//  CXLayoutManager.m
//  CXLayout
//
//  Created by chuxiao on 2016/1/14.
//  Copyright © 2016年 chuxiao. All rights reserved.
//

#import "CXLayoutManager.h"
#import "CXViewAttribute.h"
#import "CXLayoutCommon.h"

@interface CXLayoutManager()


@property (nonatomic, strong) UIView *view;                 //要添加约束的视图
@property (nonatomic, strong) NSMutableArray *constraints;  //存储添加到View上的约束
@property (nonatomic, assign) NSLayoutRelation relation;

#pragma mark -
@property (nonatomic, assign) CGSize CX_size;
@property (nonatomic, assign) CGPoint CX_point;
@property (nonatomic, assign) CGPoint CX_origin;
@property (nonatomic, assign) CGRect CX_frame;

@end
@implementation CXLayoutManager

- (id)initWithView:(UIView *)view {
    self = [super init];
    if (!self) return nil;
    
    self.view = view;
    self.constraints = NSMutableArray.new;
    
    return self;
}


- (CXLayoutManager *)equal{
    return [self constraintMakerWithRelation:NSLayoutRelationEqual];
}

- (CXLayoutManager *)greaterThanOrEqual{
    return [self constraintMakerWithRelation:NSLayoutRelationGreaterThanOrEqual];;
}

- (CXLayoutManager *)lessThanOrEqual{
    return [self constraintMakerWithRelation:NSLayoutRelationLessThanOrEqual];;
}

- (CXLayoutManager *)constraintMakerWithRelation:(NSLayoutRelation)relation{
    self.relation = relation;
    return self;
}

- (CXConstraint *)relation:(NSLayoutRelation)relation{
    CXConstraint *constraint = [[CXConstraint alloc] initWithView:self.view relation:relation];
    
    [self.constraints addObject:constraint]; //添加进数组
    return constraint;
}



- (NSArray *)install {
    
    NSArray *constraints = self.constraints.copy;
    
    
    for (CXConstraint *constraint in constraints) {
        constraint.layoutType = self.layoutType;
        [constraint install];     //install每个约束
    }
    [self.constraints removeAllObjects];
    return constraints;
}






- (CXLayoutManager * (^)(CXViewAttribute *, CGFloat, CGFloat))left{
    return ^id(CXViewAttribute *attrSec, CGFloat multiplier, CGFloat constant){
        return [self makerWithSelfLayoutAttribute:NSLayoutAttributeLeft otherAttribute:attrSec multiplier:multiplier constant:constant];
    };
}

- (CXLayoutManager * (^)(CXViewAttribute *, CGFloat, CGFloat))top{
    return ^id(CXViewAttribute *attrSec, CGFloat multiplier, CGFloat constant){
        return [self makerWithSelfLayoutAttribute:NSLayoutAttributeTop otherAttribute:attrSec multiplier:multiplier constant:constant];
    };
}

- (CXLayoutManager * (^)(CXViewAttribute *, CGFloat, CGFloat))right{
    return ^id(CXViewAttribute *attrSec, CGFloat multiplier, CGFloat constant){
        return [self makerWithSelfLayoutAttribute:NSLayoutAttributeRight otherAttribute:attrSec multiplier:multiplier constant:constant];
    };
}

- (CXLayoutManager * (^)(CXViewAttribute *, CGFloat, CGFloat))bottom{
    return ^id(CXViewAttribute *attrSec, CGFloat multiplier, CGFloat constant){
        return [self makerWithSelfLayoutAttribute:NSLayoutAttributeBottom otherAttribute:attrSec multiplier:multiplier constant:constant];
    };
}

- (CXLayoutManager * (^)(CXViewAttribute *, CGFloat, CGFloat))leading{
    return ^id(CXViewAttribute *attrSec, CGFloat multiplier, CGFloat constant){
        return [self makerWithSelfLayoutAttribute:NSLayoutAttributeLeading otherAttribute:attrSec multiplier:multiplier constant:constant];
    };
}

- (CXLayoutManager * (^)(CXViewAttribute *, CGFloat, CGFloat))trailing{
    return ^id(CXViewAttribute *attrSec, CGFloat multiplier, CGFloat constant){
        return [self makerWithSelfLayoutAttribute:NSLayoutAttributeTrailing otherAttribute:attrSec multiplier:multiplier constant:constant];
    };
}

- (CXLayoutManager * (^)(CXViewAttribute *, CGFloat, CGFloat))width{
    return ^id(CXViewAttribute *attrSec, CGFloat multiplier, CGFloat constant){
        return [self makerWithSelfLayoutAttribute:NSLayoutAttributeWidth otherAttribute:attrSec multiplier:multiplier constant:constant];
    };
}

- (CXLayoutManager * (^)(CXViewAttribute *, CGFloat, CGFloat))height{
    return ^id(CXViewAttribute *attrSec, CGFloat multiplier, CGFloat constant){
        return [self makerWithSelfLayoutAttribute:NSLayoutAttributeHeight otherAttribute:attrSec multiplier:multiplier constant:constant];
    };
}

- (CXLayoutManager * (^)(CXViewAttribute *, CGFloat, CGFloat))centerX{
    return ^id(CXViewAttribute *attrSec, CGFloat multiplier, CGFloat constant){
        return [self makerWithSelfLayoutAttribute:NSLayoutAttributeCenterX otherAttribute:attrSec multiplier:multiplier constant:constant];
    };
}

- (CXLayoutManager * (^)(CXViewAttribute *, CGFloat, CGFloat))centerY{
    return ^id(CXViewAttribute *attrSec, CGFloat multiplier, CGFloat constant){
        return [self makerWithSelfLayoutAttribute:NSLayoutAttributeCenterY otherAttribute:attrSec multiplier:multiplier constant:constant];
    };
}

- (CXLayoutManager * (^)(CXViewAttribute *, CGFloat, CGFloat))baseline{
    return ^id(CXViewAttribute *attrSec, CGFloat multiplier, CGFloat constant){
        return [self makerWithSelfLayoutAttribute:NSLayoutAttributeBaseline otherAttribute:attrSec multiplier:multiplier constant:constant];
    };
}

- (CXLayoutManager *)makerWithSelfLayoutAttribute:(NSLayoutAttribute)layoutAttr otherAttribute:(CXViewAttribute *)attrSec multiplier:(CGFloat)multiplier constant:(CGFloat)constant{
    
    CXConstraint *constraint = [[CXConstraint alloc] initWithView:self.view relation:self.relation];
    [constraint constraintWithSelfLayoutAttribute:layoutAttr otherAttribute:attrSec multiplier:multiplier constant:constant];
    [self.constraints addObject:constraint];
    return self;
}




- (CXLayoutManager * (^)(CGSize))size{
    return ^id(CGSize size){
        _CX_size = size;
        return [self addConstraintWithAttributes:CXAttributeWidth | CXAttributeHeight];
    };
}

- (CXLayoutManager * (^)(CGPoint))center{
    return ^id(CGPoint center){
        _CX_point = center;
        return [self addConstraintWithAttributes:CXAttributeCenterX | CXAttributeCenterY];
    };
}

- (CXLayoutManager * (^)(CGPoint))origin{
    return ^id(CGPoint origin){
        _CX_origin = origin;
        return [self addConstraintWithAttributes:CXAttributeLeft | CXAttributeTop];
    };
}

- (CXLayoutManager * (^)(CGRect frame))frame{
    return ^id(CGRect frame){
        _CX_frame = frame;
        return [self addConstraintWithAttributes:CXAttributeLeft | CXAttributeTop | CXAttributeWidth | CXAttributeHeight];
    };
}


- (CXLayoutManager *)addConstraintWithAttributes:(NSLayoutAttribute)attrs{
    __unused NSLayoutAttribute anyAttribute = (CXAttributeLeft | CXAttributeRight | CXAttributeTop | CXAttributeBottom | CXAttributeLeading
                                               | CXAttributeTrailing | CXAttributeWidth | CXAttributeHeight | CXAttributeCenterX
                                               | CXAttributeCenterY | CXAttributeBaseline
#if (__IPHONE_OS_VERSION_MIN_REQUIRED >= 80000) || (__TV_OS_VERSION_MIN_REQUIRED >= 9000) || (__MAC_OS_X_VERSION_MIN_REQUIRED >= 101100)
                                               | CXAttributeFirstBaseline | CXAttributeLastBaseline
#endif
#if TARGET_OS_IPHONE || TARGET_OS_TV
                                               | CXAttributeLeftMargin | CXAttributeRightMargin | CXAttributeTopMargin | CXAttributeBottomMargin
                                               | CXAttributeLeadingMargin | CXAttributeTrailingMargin | CXAttributeCenterXWithinMargins
                                               | CXAttributeCenterYWithinMargins
#endif
                                               );
    
    NSAssert((attrs & anyAttribute) != 0, @"You didn't pass any attribute to mgr.attributes(...)");
    
    if (attrs & NSLayoutAttributeLeft) self.left(CX_Center,_CX_origin.x);
    if (attrs & NSLayoutAttributeTop) self.left(CX_Center,_CX_origin.y);
    if (attrs & CXAttributeWidth) self.width(CX_Width,_CX_size.width);
    if (attrs & CXAttributeHeight) self.height(CX_Height,_CX_size.height);
    if (attrs & CXAttributeCenterX) self.centerX(CX_Center,_CX_point.x);
    if (attrs & CXAttributeCenterY) self.centerY(CX_Center,_CX_point.y);
    
#if (__IPHONE_OS_VERSION_MIN_REQUIRED >= 80000) || (__TV_OS_VERSION_MIN_REQUIRED >= 9000) || (__MAC_OS_X_VERSION_MIN_REQUIRED >= 101100)

    
#endif
    
#if TARGET_OS_IPHONE || TARGET_OS_TV
    
#endif
    
    return self;
}




@end









