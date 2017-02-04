//
//  CXConstraint.h
//  CXLayout
//
//  Created by chuxiao on 2016/1/14.
//  Copyright © 2016年 chuxiao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CXViewAttribute.h"
#import "CXLayoutCommon.h"


@interface CXConstraint : NSObject

NS_ASSUME_NONNULL_BEGIN

/**
 *	First item/view and first attribute of the NSLayoutConstraint
 */
@property (nonatomic, strong) CXViewAttribute *firstViewAttribute;

/**
 *	Second item/view and second attribute of the NSLayoutConstraint
 */
@property (nonatomic, strong) CXViewAttribute *secondViewAttribute;

/**
 *  Whether or not to check for an existing constraint instead of adding constraint
 */
@property (nonatomic, assign) CXLayoutType layoutType;


- (CXConstraint *)initWithView:(UIView *)view relation:(NSLayoutRelation)relation;


- (CXConstraint *)constraintWithSelfLayoutAttribute:(NSLayoutAttribute)layoutAttr otherAttribute:(CXViewAttribute *)attrOther multiplier:(CGFloat)multiplier constant:(CGFloat)constant;

- (void)install;


NS_ASSUME_NONNULL_END

@end


