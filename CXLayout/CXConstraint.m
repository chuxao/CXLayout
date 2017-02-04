//
//  CXConstraint.m
//  CXLayout
//
//  Created by chuxiao on 2016/1/14.
//  Copyright © 2016年 chuxiao. All rights reserved.
//

#import "CXConstraint.h"
#import "UIView+CXLayout.h"

@interface CXConstraint()

@property (nonatomic, strong) UIView *view;         //要添加约束的视图
@property (nonatomic, assign) UILayoutPriority layoutPriority;

@property (nonatomic, assign, readonly) NSLayoutRelation layoutRelation;
@property (nonatomic, assign) CGFloat layoutMultiplier;
@property (nonatomic, assign) NSLayoutRelation constant;

@property (nonatomic, weak) UIView *installedView;  //布局约束所添加的视图

@end

@implementation CXConstraint



- (CXConstraint *)initWithView:(UIView *)view relation:(NSLayoutRelation)relation{
    self = [super init];
    if (!self) return nil;
    
    self.view = view;
    self.layoutPriority = UILayoutPriorityRequired;        //约束等级默认为“必须的”
    self.layoutMultiplier = 1;                              //倍数默认为“1”
    self.constant = 0;
    
    return self;
}



- (CXConstraint *)constraintWithSelfLayoutAttribute:(NSLayoutAttribute)layoutAttr otherAttribute:(CXViewAttribute *)attrSec multiplier:(CGFloat)multiplier constant:(CGFloat)constant{
    
    UIView *secondView = nil;
    NSLayoutAttribute secondViewAttr = NSLayoutAttributeNotAnAttribute;

    
    if (attrSec) {
        secondView = attrSec.view;
        secondViewAttr = attrSec.layoutAttribute;
    }
    
    if (multiplier) {
        self.layoutMultiplier = multiplier;
    }
    
    if (constant) {
        self.constant = constant;
    }
    
    self.firstViewAttribute = [[CXViewAttribute alloc] initWithView:self.view layoutAttribute:layoutAttr];
    self.secondViewAttribute = [[CXViewAttribute alloc] initWithView:secondView layoutAttribute:secondViewAttr];
    
    return self;
}



- (void)install {
    
    UIView *firstLayoutItem = self.firstViewAttribute.item;
    NSLayoutAttribute firstLayoutAttribute = self.firstViewAttribute.layoutAttribute;
    
    
    UIView *secondLayoutItem = self.secondViewAttribute.item;
    NSLayoutAttribute secondLayoutAttribute = self.secondViewAttribute.layoutAttribute;
    
    
    if (self.secondViewAttribute.view){
        //寻找两个视图的公共父视图
        UIView *closestCommonSuperview = [self.firstViewAttribute.view
                                          closestCommonSuperview:self.secondViewAttribute.view];
        self.installedView = closestCommonSuperview;
    }else if (self.firstViewAttribute.layoutAttribute == NSLayoutAttributeWidth || self.firstViewAttribute.layoutAttribute == NSLayoutAttributeHeight){
        self.installedView = self.firstViewAttribute.view;
    }else{
        self.installedView = self.firstViewAttribute.view.superview;
        
        secondLayoutItem = self.installedView;
        secondLayoutAttribute = firstLayoutAttribute;
    }
    
    
    
    
    
#pragma -- Mark 使用NSLayoutConstraint添加约束
    
    // create constraints
    NSLayoutConstraint *layoutConstraint
    = [NSLayoutConstraint constraintWithItem:firstLayoutItem
                                    attribute:firstLayoutAttribute
                                    relatedBy:self.layoutRelation
                                       toItem:secondLayoutItem
                                    attribute:secondLayoutAttribute
                                   multiplier:self.layoutMultiplier
                                     constant:self.constant];
    
    layoutConstraint.priority = self.layoutPriority;
//    layoutConstraint.mas_key = self.mas_key;
    
    
    
    NSLayoutConstraint *existingConstraint = nil;
    if (self.layoutType == CXLayoutTypeUpdate) {
        existingConstraint = [self layoutConstraintSimilarTo:layoutConstraint];
    }
    
    if (existingConstraint) {
        // update constraints
        existingConstraint.constant = layoutConstraint.constant;
    } else {
        // add constraints
        [self.installedView addConstraint:layoutConstraint];
    }
}

- (NSLayoutConstraint *)layoutConstraintSimilarTo:(NSLayoutConstraint *)layoutConstraint {
    for (NSLayoutConstraint *existingConstraint in self.installedView.constraints.reverseObjectEnumerator) {
        if (![existingConstraint isKindOfClass:NSLayoutConstraint.class]) continue;
        if (existingConstraint.firstItem != layoutConstraint.firstItem) continue;
        if (existingConstraint.secondItem != layoutConstraint.secondItem) continue;
        if (existingConstraint.firstAttribute != layoutConstraint.firstAttribute) continue;
        if (existingConstraint.secondAttribute != layoutConstraint.secondAttribute) continue;
        if (existingConstraint.relation != layoutConstraint.relation) continue;
        if (existingConstraint.multiplier != layoutConstraint.multiplier) continue;
        if (existingConstraint.priority != layoutConstraint.priority) continue;
        
        return (id)existingConstraint;
    }
    return nil;
}


@end







